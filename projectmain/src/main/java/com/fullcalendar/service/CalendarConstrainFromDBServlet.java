package com.fullcalendar.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentVO;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/CalendarConstrainFromDBServlet")
public class CalendarConstrainFromDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IStudentDAO dao = new StudentDAO();



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
				.setDateFormat("yyyy-MM-dd")//因為constrain 不能太清確的格式!!
				.setPrettyPrinting()
				.create();
		// 也可以在create()之前先.serializeNulls
//		<h1>stuName:${sessionScope.userId}</h1>
//		<h1>stuNumber:${sessionScope.stuID}</h1>
//		Integer stuID = new Integer(request.getParameter("stuID").toString());
		System.out.println(request.getSession().getAttribute("stu_id").toString());
		Integer stuID = new Integer(request.getSession().getAttribute("stu_id").toString());
		String str;
		try {
			str = gson.toJson(new ListLatestEventsService().listConstrains(stuID));
			str = str.replaceAll("\"overlap\": 0,",  "\"overlap\": false,").replaceAll("\"overlap\": 1,",  "\"overlap\": true,");
			out.write(str);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		out.write("[{\"id\": \"constrainTest\",\"start\": \"May 17, 2016 12:00:00 PM\",\"end\": \"May 18, 2016 12:00:00 PM\",\"rendering\":\"background\",\"color\":\"green\"},{\"title\": \"測試用!\",\"start\": \"May 17, 2016 12:00:00 PM\",\"end\": \"May 14, 2016 1:00:00 PM\",\"color\": \"green\",\"constrain\": \"constrainTest\"}]");
//		out.write("[{\"id\":\"1\",\"start\": \"2016-05-12\",\"end\": \"2016-05-22\",\"overlap\":0,\"rendering\":\"background\",\"color\":\"black\"},{\"title\": \"測試用!\",\"start\": \"May 20, 2016 00:00:00 AM\",\"end\": \"May 20, 2016 01:00:00 AM\",\"color\": \"black\",\"constrain\": \"constrainTest\",\"droppable\":\"1\",\"selectable\":\"1\",\"editable\":\"1\"}]");
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
