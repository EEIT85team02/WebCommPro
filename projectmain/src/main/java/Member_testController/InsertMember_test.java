package Member_testController;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Edu.model.Edu;
import Edu.model.EduDAO;
import Edu.model.IEduDAO;
import Member_test.model.IMember_testDAO;
import Member_test.model.Member_test;
import Member_test.model.Member_testDAO;


@WebServlet("/Member_test/InsertMember_test.do")
public class InsertMember_test extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertMember_test() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("OK1");
			IMember_testDAO edu= new Member_testDAO(); 
			System.out.println("Ok2");
			request.setCharacterEncoding("UTF-8");
			String stu_id = request.getParameter("stu_id");
			java.sql.Timestamp test_startdate = java.sql.Timestamp.valueOf(request.getParameter("test_startdate"));
			Integer test_hour_id = Integer.parseInt(request.getParameter("test_hour_id"));
			java.sql.Timestamp mem_applytime = java.sql.Timestamp.valueOf(request.getParameter("mem_applytime"));
			Double mem_implement =Double.parseDouble(request.getParameter("mem_implement"));
			Double mem_interview = Double.parseDouble(request.getParameter("mem_interview"));
			String emp_id = request.getParameter("emp_id");
			Member_test edu1= new Member_test();
			edu1.setStu_id(stu_id);
			edu1.setTest_startdate(test_startdate);
			edu1.setTest_hour_id(test_hour_id);
			edu1.setMem_applytime(mem_applytime);
			edu1.setMem_implement(mem_implement);
			edu1.setMem_interview(mem_interview);
			edu1.setEmp_id(emp_id);
			edu.insert(edu1);
			System.out.println("okokokok");
			
			RequestDispatcher rd = request.getRequestDispatcher("/Member_test/Member_testformOK.jsp");
			rd.forward(request, response);
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		} 	
	}

}
