package EmployeeController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.DriverPropertyInfo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.Properties;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

@WebServlet("/Employee/Sign_listAuto")
public class Sign_listAuto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Sign_listAuto() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=demo";
		String query = "select emp_id from employee where sl_id=0 and emp_id like ?";
		String keyword = request.getParameter("keyword");
		keyword = keyword + "%";
		try {
			DriverManager.registerDriver(new Driver() {
				
				@Override
				public boolean jdbcCompliant() {
					// TODO Auto-generated method stub
					return false;
				}
				
				@Override
				public DriverPropertyInfo[] getPropertyInfo(String url, Properties info)
						throws SQLException {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public Logger getParentLogger() throws SQLFeatureNotSupportedException {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public int getMinorVersion() {
					// TODO Auto-generated method stub
					return 0;
				}
				
				@Override
				public int getMajorVersion() {
					// TODO Auto-generated method stub
					return 0;
				}
				
				@Override
				public Connection connect(String url, Properties info) throws SQLException {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public boolean acceptsURL(String url) throws SQLException {
					// TODO Auto-generated method stub
					return false;
				}
			});
			conn = DriverManager.getConnection(url, "sa", "sa123456");

			stmt = conn.prepareStatement(query);
			stmt.setString(1, keyword);

			rs = stmt.executeQuery();
			JSONArray list = new JSONArray();
			while (rs.next()) {
				list.add(rs.getString(1));
			}
			out.print(list);
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
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
