package com.fullcalendar.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Calendar2DBServlet_additional
 */
@WebServlet("/Calendar2DBServlet_additional")
public class Calendar2DBServlet_additional extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		Integer stuID = new Integer(request.getParameter("stuID"));
		String title = request.getParameter("subject");
		new WriteOneEventService_jQuery().updateOneEventService(stuID, title);
//		updateOneEventService(Integer stuID, String title)
	}

}
