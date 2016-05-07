package Edu.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;





public class EduJndiDAO implements IEduJndiDAO {
	private static final String INSERT_STMT = 
			"insert into edu(edu_name, edu_add, edu_tel, edu_contact)  values(?, ?, ?, ?)";
		private static final String UPDATE_STMT = 
			"UPDATE Edu SET edu_id=?, edu_name=?, edu_add=?, edu_tel=?,edu_contact=? WHERE edu_id =?";
		private static final String DELETE_STMT = 
			"DELETE FROM Edu WHERE edu_id=?";
		private static final String GET_ONE_STMT = 
			"SELECT edu_id, edu_name, edu_add, edu_tel, edu_contact FROM Edu WHERE edu_id=?";
		private static final String GET_ALL_STMT = 
			"SELECT edu_id, edu_name, edu_add,edu_tel, edu_contact FROM Edu ORDER BY edu_id";

		Connection conn = null;
		private DataSource ds = null;
		public EduJndiDAO() throws SQLException,NamingException {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/sysdesign");

		}

		public int insert(Edu edu) throws SQLException {
			conn = ds.getConnection();
			int updateCount = 0;
			PreparedStatement pstmt = conn.prepareStatement(INSERT_STMT);
			pstmt.setString(1, edu.getEdu_name());
			pstmt.setString(2, edu.getEdu_add());
			pstmt.setString(3, edu.getEdu_tel());
			pstmt.setString(4, edu.getEdu_contact());
	
			updateCount = pstmt.executeUpdate();
			return updateCount;
		}

		public int update(Edu edu) throws SQLException {
			conn = ds.getConnection();
			int updateCount = 0;
			PreparedStatement pstmt = conn.prepareStatement(UPDATE_STMT);
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
			conn = ds.getConnection();
			int updateCount = 0;
			PreparedStatement pstmt = conn.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, edu_id);
			updateCount = pstmt.executeUpdate();
			return updateCount;
		}

		public Edu findByPrimaryKey(Integer edu_id) throws SQLException {
			Edu edu = null;
			conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, edu_id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				edu = new Edu();
				edu.setEdu_id(rs.getInt("edu_id"));
				edu.setEdu_name(rs.getString("edu_name"));
				edu.setEdu_add(rs.getString("edu_add"));
				edu.setEdu_tel(rs.getString("edu_tel"));
				edu.setEdu_contact(rs.getString("edu_contact"));
			}
			return edu;
		}

		public List<Edu> getAll() throws SQLException {
			conn = ds.getConnection();
			Edu edu = null;
			List<Edu> edus = new ArrayList<Edu>();
			PreparedStatement pstmt = conn.prepareStatement(GET_ALL_STMT);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				edu = new Edu();
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

	
}
