package Examiner_offdayController;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Examiner_offday.model.Examiner_offdayVO;
import Examiner_offday.model.Examiner_offdayDAO;
import Examiner_offday.model.IExaminer_offdayDAO;


@WebServlet("/Examiner_offday/InsertExaminer_offday.do")
public class InsertExaminer_offday extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertExaminer_offday() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("OK1");
			IExaminer_offdayDAO edu= new Examiner_offdayDAO(); 
			System.out.println("Ok2");
			request.setCharacterEncoding("UTF-8");
			String emp_id = request.getParameter("emp_id");
			java.sql.Timestamp off_stardate = java.sql.Timestamp.valueOf(request.getParameter("off_stardate"));
			java.sql.Timestamp off_enddate =  java.sql.Timestamp.valueOf(request.getParameter("off_enddate"));
			Integer off_day = Integer.parseInt(request.getParameter("off_day"));
			String emp_job_id = request.getParameter("emp_job_id");
			Examiner_offdayVO edu1= new Examiner_offdayVO();
			edu1.setEmp_id(emp_id);
			edu1.setOff_stardate(off_stardate);
			edu1.setOff_enddate(off_enddate);
			edu1.setOff_day(off_day);
			edu1.setEmp_job_id(emp_job_id);
			edu.insert(edu1);
			System.out.println("okokokok");
			
			RequestDispatcher rd = request.getRequestDispatcher("/Examiner_offday/Examiner_offdayformOK.jsp");
			rd.forward(request, response);
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		} 	
	}

}
