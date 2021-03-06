package Controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Class.model.ClassService;
import Edu.model.EduJDBCDAO;
import Edu.model.EduService;
import Edu.model.IEduJDBCDAO;


@WebServlet("/Class/ClassToJSONInitTableServlet")
public class ClassToJSONInitTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ClassToJSONInitTableServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		ClassService claSvc = new ClassService();
		try {
			String jsonString=claSvc.getAllClassToJSONInitTable();
			out.println(jsonString);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
