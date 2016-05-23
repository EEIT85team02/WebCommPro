package Edu.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;




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
		private static final String GET_ALL_STMT_TOJSON = 
				"SELECT edu_id, edu_name FROM Edu";
		Connection conn = null;
		public void getConnection() throws SQLException {
			String connUrl = "jdbc:sqlserver://localhost:1433;DatabaseName=demo";
			String userId="sa";
			String userPwd="sa123456";
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
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
		
		//-------------------------------
		public String getAllToJSON(){
			PreparedStatement pstmt;
			List edus=null;
			String jsonString=null;
			try{
			pstmt = conn.prepareStatement(GET_ALL_STMT_TOJSON);
			edus = new LinkedList();
			ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					Map<String,String> map = new HashMap<String,String>();
					map.put("edu_id",rs.getString(1));
					map.put("edu_name",rs.getString(2));
					edus.add(map);
					}
				jsonString = JSONValue.toJSONString(edus);
			}
			catch(SQLException e){
			
			}
			return jsonString;
		}
		
		
		
		
		
		

		public void closeConn() throws SQLException {
			if (conn != null)
				conn.close();
		}
		
		//main method
		public static void main(String[] args) {
			IEduJDBCDAO dao=new EduJDBCDAO();
			try {
				dao.getConnection();
// insert
//				edu1.setEdu_name("Jean Tsao");
//				edu1.setEdu_add("taipei");
//				edu1.setEdu_tel("0999852963");
//				edu1.setEdu_contact("潔哥");
//				int count1 = dao.insert(edu1);
//				System.out.println("insert " + count1 + " rows");
				String jsonString = dao.getAllToJSON();
				System.out.println(jsonString);
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
			
}
