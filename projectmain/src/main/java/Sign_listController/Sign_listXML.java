package Sign_listController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

@WebServlet("/Sign_list/Sign_listXML")
public class Sign_listXML extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Sign_listXML() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=project";

		String query = "select sl_id, sl_name from Sign_list where sl_id<>0";

		try {
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			conn = DriverManager.getConnection(url, "sa", "P@ssw0rd");
			stmt = conn.prepareStatement(query);

			Document document = new Document();
			rs = stmt.executeQuery();

			Element root = new Element("Sign_lists");
			document.addContent(root);
			while (rs.next()) {
				Element e = new Element("Sign_list");
				root.addContent(e);

				e.addContent(new Element("sl_id").setText(rs.getString(1)));
				e.addContent(new Element("sl_name").setText(rs.getString(2)));

			}
			response.setContentType("text/xml;charset=UTF-8");

			Format format = Format.getPrettyFormat();
			format.setIndent("    ");

			XMLOutputter xml = new XMLOutputter();
			out.write(xml.outputString(document));
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
