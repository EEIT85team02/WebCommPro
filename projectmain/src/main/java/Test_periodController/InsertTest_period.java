package Test_periodController;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Test_period.model.ITest_periodDAO;
import Test_period.model.Test_period;
import Test_period.model.Test_periodDAO;



@WebServlet("/Test_period/InsertTest_period.do")
public class InsertTest_period extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public InsertTest_period() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("OK1");
			ITest_periodDAO tes= new Test_periodDAO(); 
			System.out.println("Ok2");
			request.setCharacterEncoding("UTF-8");
			Integer test_hour_id = Integer.parseInt(request.getParameter("test_hour_id"));
			java.sql.Time test_hour = java.sql.Time.valueOf(request.getParameter("test_hour"));
			
			Test_period tes1= new Test_period();
			tes1.setTest_hour_id(test_hour_id);
			tes1.setTest_hour(test_hour);
			
			tes.insert(tes1);
			System.out.println("okokokok");
			
			RequestDispatcher rd = request.getRequestDispatcher("/Test_period/Test_periodformOK.jsp");
			rd.forward(request, response);
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}

}
