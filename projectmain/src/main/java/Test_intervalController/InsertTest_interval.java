package Test_intervalController;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Test_interval.model.ITest_intervalDAO;
import Test_interval.model.Test_interval;
import Test_interval.model.Test_intervalDAO;
import Edu.model.Edu;
import Edu.model.EduDAO;
import Edu.model.IEduDAO;


@WebServlet("/Test_interval/InsertTest_interval.do")
public class InsertTest_interval extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertTest_interval() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("OK1");
			ITest_intervalDAO tes= new Test_intervalDAO(); 
			System.out.println("Ok2");
			request.setCharacterEncoding("UTF-8");
			String class_id = request.getParameter("class_id");
			java.sql.Timestamp test_startdate = java.sql.Timestamp.valueOf(request.getParameter("test_startdate"));
			java.sql.Date test_enddate = java.sql.Date.valueOf(request.getParameter("test_enddate"));
			Integer test_hour_id = Integer.parseInt(request.getParameter("test_hour_id"));
			Test_interval tes1= new Test_interval();
			tes1.setClass_id(class_id);
			tes1.setTest_startdate(test_startdate);
			tes1.setTest_enddate(test_enddate);
			tes1.setTest_hour_id(test_hour_id);
			tes.insert(tes1);
			System.out.println("okokokok");
			
			RequestDispatcher rd = request.getRequestDispatcher("/Test_interval/Test_intervalformOK.jsp");
			rd.forward(request, response);
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		} 	
	}

}
