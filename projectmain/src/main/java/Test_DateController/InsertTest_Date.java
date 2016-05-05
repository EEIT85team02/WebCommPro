package Test_DateController;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Test_Date.model.ITest_DateDAO;
import Test_Date.model.Test_Date;
import Test_Date.model.Test_DateDAO;


@WebServlet("/Test_Date/InsertTest_Date.do")
public class InsertTest_Date extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertTest_Date() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("OK1");
			ITest_DateDAO tes= new Test_DateDAO(); 
			System.out.println("Ok2");
			request.setCharacterEncoding("UTF-8");
			String class_id = request.getParameter("class_id");
			java.sql.Timestamp test_startdate =java.sql.Timestamp.valueOf(request.getParameter("test_startdate"));
			Integer test_hour_id = Integer.parseInt(request.getParameter("test_hour_id"));
			Test_Date tes1= new Test_Date();
			tes1.setClass_id(class_id);
			tes1.setTest_startdate(test_startdate);
			tes1.setTest_hour_id(test_hour_id);
			tes.insert(tes1);
			System.out.println("okokokok");
			
			RequestDispatcher rd = request.getRequestDispatcher("/Test_Date/Test_DateformOK.jsp");
			rd.forward(request, response);
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		} 	
	}

}
