package Edu.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;




public  class EduJDBCDAO implements IEduJDBCDAO {
	private static final String INSERT_STMT = 
			"insert into edu(edu_name, edu_add, edu_tel, edu_contact)  values (?, ?, ?, ?)";
		private static final String UPDATE_STMT = 
			"UPDATE Edu SET edu_id=?, edu_name=?, edu_add=?, edu_tel=?,edu_contact=? WHERE edu_id =?";
		private static final String DELETE_STMT = 
			"DELETE FROM Edu WHERE edu_id=?";
		private static final String GET_ONE_STMT = 
			"SELECT edu_id, edu_name, edu_add, edu_tel, edu_contact FROM Edu WHERE edu_id=?";
		private static final String GET_ALL_STMT = 
			"SELECT edu_id, edu_name, edu_add,edu_tel, edu_contact FROM Edu ORDER BY edu_id";

		Connection conn = null;
		public void getConnection() throws SQLException {
			String connUrl = "jdbc:db2://75.126.155.153:50000/SQLDB";
			String userId="user14422";
			String userPwd="3hzL7wE3j2bx";
			conn = DriverManager.getConnection(connUrl,userId,userPwd);

		}

		public int insert(EduVO edu) throws SQLException {
			int updateCount = 0;
			PreparedStatement pstmt = conn.prepareStatement(INSERT_STMT);
			pstmt.setString(1, edu.getEdu_name());
			pstmt.setString(2, edu.getEdu_add());
			pstmt.setString(3, edu.getEdu_tel());
			pstmt.setString(4, edu.getEdu_contact());
			updateCount = pstmt.executeUpdate();
			return updateCount;
		}

		public int update(EduVO edu) throws SQLException {
			PreparedStatement pstmt = conn.prepareStatement(UPDATE_STMT);
			int updateCount = 0;
			pstmt.setInt(1, edu.getEdu_id());
			pstmt.setString(2, edu.getEdu_name());
			pstmt.setString(3, edu.getEdu_add());
			pstmt.setString(4, edu.getEdu_tel());
			pstmt.setString(5, edu.getEdu_contact());
			pstmt.setInt(6, edu.getEdu_id());
			updateCount = pstmt.executeUpdate();
			return updateCount;
		}

		public int delete(Integer edu_id) throws SQLException {
			PreparedStatement pstmt = conn.prepareStatement(DELETE_STMT);
			int updateCount = 0;
			pstmt.setInt(1, edu_id);
			updateCount = pstmt.executeUpdate();
			return updateCount;
		}

		public EduVO findByPrimaryKey(Integer edu_id) throws SQLException {
			EduVO edu = null;
			PreparedStatement pstmt = conn.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, edu_id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				edu = new EduVO();
				edu.setEdu_id(rs.getInt("edu_id"));
				edu.setEdu_name(rs.getString("edu_name"));
				edu.setEdu_add(rs.getString("edu_add"));
				edu.setEdu_tel(rs.getString("edu_tel"));
				edu.setEdu_contact(rs.getString("edu_contact"));
			}
			return edu;
		}

		public List<EduVO> getAll() throws SQLException {
			PreparedStatement pstmt = conn.prepareStatement(GET_ALL_STMT);
			EduVO edu = null;
			List<EduVO> edus = new ArrayList<EduVO>();
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				edu = new EduVO();
				edu.setEdu_id(rs.getInt("edu_id"));
				edu.setEdu_name(rs.getString("edu_name"));
				edu.setEdu_add(rs.getString("edu_add"));
				edu.setEdu_tel(rs.getString("edu_tel"));
				edu.setEdu_contact(rs.getString("edu_contact"));
				edus.add(edu);
			}
			return edus;
		}

		public void closeConn() throws SQLException {
			if (conn != null)
				conn.close();
		}
		
		//main method
		public static void main(String[] args) {
			EduVO edu1 = new EduVO();
			IEduJDBCDAO dao=new EduJDBCDAO();
			try {
				dao.getConnection();

				// insert
				edu1.setEdu_name("Jean Tsao");
				edu1.setEdu_add("taipei");
				edu1.setEdu_tel("0999852963");
				edu1.setEdu_contact("潔哥");
				int count1 = dao.insert(edu1);
				System.out.println("insert " + count1 + " rows");
				

			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
			
}
