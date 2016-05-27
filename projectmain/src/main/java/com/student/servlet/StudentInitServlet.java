package com.student.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentInitServlet
 */
@WebServlet("/02_uploadCSV/StudentInitServlet.do")
public class StudentInitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public StudentInitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/***************************初始連結呼叫StudentInitServlet轉址至uploadCSV.jsp********************/	
		String action = request.getParameter("action");
		if ("initStuViewTODataTablesJSON".equals(action)) {
			try {
				
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/02_uploadCSV/uploadCSV.jsp");
				successMsg.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/******************************** 結束 ***********************/
	}

}
