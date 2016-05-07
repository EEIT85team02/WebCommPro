package StudentController;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.model.IStudentDAO;
import Student.model.Student;
import Student.model.StudentDAO;

@WebServlet("/Student/InsertStudent.do")
public class InsertStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InsertStudent() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("OK1");
			IStudentDAO stu=new StudentDAO();
			System.out.println("Ok2");
			request.setCharacterEncoding("UTF-8");
			String stu_id = request.getParameter("stu_id");
			String stu_lastname = request.getParameter("stu_lastname");
			String stu_firstname = request.getParameter("stu_firstname");
			String stu_tel = request.getParameter("stu_tel");
			String stu_mobile = request.getParameter("stu_mobile");
			String stu_email = request.getParameter("stu_email");
			String stu_add = request.getParameter("stu_add");
			Integer stu_age = Integer.parseInt(request.getParameter("stu_age"));
			String stu_sch = request.getParameter("stu_sch");
			String stu_dep = request.getParameter("stu_dep");
			String class_id = request.getParameter("class_id");
			String log_pw = request.getParameter("log_pw");
			Student stu1= new Student();
			stu1.setStu_id(stu_id);
			stu1.setStu_lastname(stu_lastname);
			stu1.setStu_firstname(stu_firstname);
			stu1.setStu_tel(stu_tel);
			stu1.setStu_mobile(stu_mobile);
			stu1.setStu_email(stu_email);
			stu1.setStu_add(stu_add);
			stu1.setStu_age(stu_age);
			stu1.setStu_sch(stu_sch);
			stu1.setStu_dep(stu_dep);
			stu1.setClass_id(class_id);
			stu1.setLog_pw(log_pw);
			stu.insert(stu1);
			System.out.println("okokokok");
			
			RequestDispatcher rd = request.getRequestDispatcher("/Student/StudentformOK.jsp");
			rd.forward(request, response);
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
