package StudentController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.google.gson.Gson;

import Stu_additional.model.IStu_additionalDAO;
import Stu_additional.model.Stu_additionalDAO;
import Stu_additional.model.Stu_additionalService;
import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentService;
import Student.model.StudentVO;

/**
 * Servlet implementation class StudentProfileServlet
 */
@WebServlet("/StudentProfileServlet")
public class StudentProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public StudentProfileServlet() {
    	
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		request.setCharacterEncoding("UTF-8");
			
			//Integer stu_id = Integer.parseInt(request.getParameter("stu_id"));
			Integer stu_id =4;
			System.out.println("------1------");
			System.out.println(stu_id);
			StudentService stuSvc = new StudentService() ;
			String stuListJSON = stuSvc.getOneStuAll(stu_id);
			
			
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write(stuListJSON);
			
			System.out.println("------2------");
			
			Stu_additionalService stu_AllSvc = new Stu_additionalService() ;
			System.out.println(stu_id);
			String stu_AllListJSON = stu_AllSvc.getOneStu_add(stu_id);
			
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.write(stu_AllListJSON);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
