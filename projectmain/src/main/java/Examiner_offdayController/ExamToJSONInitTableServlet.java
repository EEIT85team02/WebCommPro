package Examiner_offdayController;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import Edu.model.EduService;
import Examiner_offday.model.Examiner_offdayService;
import Stu_additional.model.Stu_additionalService;



@WebServlet("/Examiner_offday/ExamToJSONInitTableServlet")
public class ExamToJSONInitTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ExamToJSONInitTableServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Examiner_offdayService examSvc = new Examiner_offdayService();
		try {
			String jsonString=examSvc.getAllExamToJSONInitTable();
			out.write(jsonString);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
