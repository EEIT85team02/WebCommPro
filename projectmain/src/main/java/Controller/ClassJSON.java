package Controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Edu.model.EduJDBCDAO;
import Edu.model.IEduJDBCDAO;


@WebServlet("/ClassJSON")
public class ClassJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ClassJSON() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		IEduJDBCDAO dao=new EduJDBCDAO();
		String jsonString= null;
	try{
		dao.getConnection();
		out.println("OK");
		jsonString = dao.getAllToJSON();
		out.println(jsonString);
		}catch (SQLException e) {
			out.println("Error:" + e.getMessage());
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
