package com.fullcalendar.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.model.StudentVO;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/CalendarEventTokensFromDBServlet")
public class CalendarEventTokensFromDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CalendarEventTokensFromDBServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		// 告訴Gson 我們要的格式 必須配合 Hibernate的ORM技術
		Gson gson = new GsonBuilder().setExclusionStrategies(
				new ExclusionStrategy() {

					@Override
					public boolean shouldSkipField(FieldAttributes f) {
						return false;
					}

					@Override
					public boolean shouldSkipClass(Class<?> clazz) {

						return (clazz == StudentVO.class);
					}

				})
				.setPrettyPrinting()
				.create();
		// 也可以在create()之前先.serializeNulls
//		<h1>stuName:${sessionScope.userId}</h1>
//		<h1>stuNumber:${sessionScope.stuID}</h1>
//		Integer stuID = new Integer(request.getParameter("stuID").toString());
		
		Integer stuID = new Integer(request.getSession().getAttribute("stu_id").toString());
		
//		out.write(gson.toJson(new ListOthersEventsService()
//		.ListAllEvents(stuID)));
//		Integer stuID = new Integer("2");
		String str;
		try {
			str = gson.toJson(new ListLatestEventsService().listTokens((stuID)));
			str = str.replaceAll("\"overlap\": 0,",  "\"overlap\": false,").replaceAll("\"overlap\": 1,",  "\"overlap\": true,");
			out.write(str);
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
