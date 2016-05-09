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
import Student.model.StudentVO;
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
			String stu_group = request.getParameter("stu_group");
			String stu_note1 = request.getParameter("stu_note1");
			String stu_name = request.getParameter("stu_name");
			String stu_age = request.getParameter("stu_age");
			String stu_sex = request.getParameter("stu_sex");
			String stu_email = request.getParameter("stu_email");
			String stu_pre = request.getParameter("stu_pre");
			String stu_implement = request.getParameter("stu_implement");
			String stu_testtime = request.getParameter("stu_testtime");
			String stu_interview = request.getParameter("stu_interview");
			String stu_total = request.getParameter("stu_total");
			String stu_workdate = request.getParameter("stu_workdate");
			String stu_except = request.getParameter("stu_except");
			String stu_final = request.getParameter("stu_final");
			String stu_note2 = request.getParameter("stu_note2");
			StudentVO stu1= new StudentVO();
			stu1.setStu_id(stu_id);
			stu1.setStu_group(stu_group);
			stu1.setStu_note1(stu_note1);
			stu1.setStu_name(stu_name);
			stu1.setStu_age(stu_age);
			stu1.setStu_sex(stu_sex);
			stu1.setStu_email(stu_email);
			stu1.setStu_pre(stu_pre);
			stu1.setStu_implement(stu_implement);
			stu1.setStu_testtime(stu_testtime);
			stu1.setStu_interview(stu_interview);
			stu1.setStu_total(stu_total);
			stu1.setStu_workdate(stu_workdate);
			stu1.setStu_except(stu_except);
			stu1.setStu_final(stu_final);
			stu1.setStu_note2(stu_note2);
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
