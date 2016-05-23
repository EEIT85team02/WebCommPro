package Sign_list.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Sign_listDAO implements ISign_listDAO {
	
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=project";
	String userid = "sa";
	String passwd = "P@ssw0rd";

	private static final String INSERT_STMT =
		      "UPDATE employee set emp_lastname=?, emp_firstname=?, emp_mail=?, dep_name=?, sl_id=? where emp_id=?";
	private static final String GET_ALL_STMT =
		      "SELECT emp_id,emp_lastname,emp_firstname,emp_mail,dep_name,sl_id FROM employee order by emp_id";
	private static final String GET_ONE_STMT =
		      "SELECT emp_id,emp_lastname,emp_firstname,emp_mail,dep_name,sl_id FROM employee where emp_id = ?";
	private static final String DELETE =
		      "DELETE FROM employee where emp_id = ?";
	private static final String UPDATE =
		      "UPDATE employee set sl_id=? where emp_id=?";

	@Override
	public void insert(Sign_listVO slVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, slVO.getEmp_lastname());
			pstmt.setString(2, slVO.getEmp_firstname());
			pstmt.setString(3, slVO.getEmp_mail());
			pstmt.setString(4, slVO.getDep_name());
			pstmt.setInt(5, slVO.getSl_id());
			pstmt.setString(6, slVO.getEmp_id());

			pstmt.executeUpdate();

			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(Sign_listVO slVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, slVO.getSl_id());
			pstmt.setString(2, slVO.getEmp_id());

			pstmt.executeUpdate();

			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(String emp_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, emp_id);

			pstmt.executeUpdate();

			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public Sign_listVO findByPrimaryKey(String emp_id) {

		Sign_listVO slVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, emp_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				slVO = new Sign_listVO();
				slVO.setEmp_id(rs.getString("emp_id"));
				slVO.setEmp_lastname(rs.getString("emp_lastname"));
				slVO.setEmp_firstname(rs.getString("emp_firstname"));
				slVO.setEmp_mail(rs.getString("emp_mail"));
				slVO.setDep_name(rs.getString("dep_name"));
				slVO.setSl_id(rs.getInt("sl_id"));
			}

			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return slVO;
	}

	@Override
	public List<Sign_listVO> getAllSl() {
		List<Sign_listVO> list = new ArrayList<Sign_listVO>();
		Sign_listVO slVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				slVO = new Sign_listVO();
				slVO.setEmp_id(rs.getString("emp_id"));
				slVO.setEmp_lastname(rs.getString("emp_lastname"));
				slVO.setEmp_firstname(rs.getString("emp_firstname"));
				slVO.setEmp_mail(rs.getString("emp_mail"));
				slVO.setDep_name(rs.getString("dep_name"));
				slVO.setSl_id(rs.getInt("sl_id"));
				list.add(slVO); // Store the row in the list
			}

			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

}