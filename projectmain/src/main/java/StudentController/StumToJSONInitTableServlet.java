package StudentController;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import Edu.model.EduService;
import Stu_additional.model.Stu_additionalService;



@WebServlet("/Student_maintain/StumToJSONInitTableServlet")
public class StumToJSONInitTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public StumToJSONInitTableServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Stu_additionalService stumSvc = new Stu_additionalService();
		try {
			String jsonString=stumSvc.getAllStumToJSONInitTable();
			out.write(jsonString);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
