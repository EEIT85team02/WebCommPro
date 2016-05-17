package Sign_listController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

/**
 * Servlet implementation class EmployeeList
 */
@WebServlet("/Sign_list/EmployeeList")
public class EmployeeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public EmployeeList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=project";

		String query = "select emp_lastname,emp_firstname,emp_mail,dep_name from employee where emp_id=?";
		String categoryID = request.getParameter("emp_id");

		try{
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			//conn = DriverManager.getConnection(url, "sa", "sa123456");
			conn = DriverManager.getConnection(url, "sa", "P@ssw0rd");
			stmt = conn.prepareStatement(query);
			 stmt.setString(1,categoryID);
			 rs = stmt.executeQuery();
			
			 
			 
			 List  l1 = new LinkedList();
			 while (rs.next()) {
				 Map m1 = new HashMap();       
				 m1.put("emp_lastname",rs.getString(1));   
				 m1.put("emp_firstname", rs.getString(2)); 
				 m1.put("emp_mail",rs.getString(3)); 
				 m1.put("dep_name", rs.getString(4));
				 l1.add(m1);
			 }
			 String jsonString = JSONValue.toJSONString(l1);                    
			 out.println(jsonString);
		}catch (SQLException e) {
			out.println("Error:" + e.getMessage());
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
