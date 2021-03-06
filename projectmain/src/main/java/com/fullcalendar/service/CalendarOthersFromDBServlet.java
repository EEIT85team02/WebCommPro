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

@WebServlet("/CalendarOthersFromDBServlet")
public class CalendarOthersFromDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IStudentDAO dao = new StudentDAO();
//	private boolean isBookable = true;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		// 告訴Gson 我們要的格式 必須配合 Hibernate的ORM技術
		Gson gson = new GsonBuilder()
				.setExclusionStrategies(new ExclusionStrategy() {

					@Override
					public boolean shouldSkipField(FieldAttributes f) {
						return false;
					}

					@Override
					public boolean shouldSkipClass(Class<?> clazz) {

						return (clazz == StudentVO.class);
					}

				})
				//
				.setPrettyPrinting().create();
		Integer stuID = new Integer(request.getSession().getAttribute("stu_id")
				.toString());
		/**
		 * -- 如果還已額滿 就設定overlap = false
		 */

		// if(isBookable){
		// out.write(gson.toJson(new
		// ListLatestEventsService().listOthersEvents((stuID))));
		// }else{
		// out.write(gson.toJson(new
		// ListLatestEventsService().listOthersEvents((stuID))).replaceAll("\"overlap\": 0,",
		// "\"overlap\": false,"));// ●●●●●●●!! 重要 再加一個條件判斷 當數量額滿時
		// 就將此日的overlap給關閉
		// }

		String str;
		try {
			/**
			 * 方法改良 將重心壓到資料庫的引擎
			 */
			// str = gson.toJson(new
			// ListLatestEventsService().listOthersEvents((stuID))); // 舊方法
			str = gson.toJson(new ListLatestEventsService()
					.listOthersEventsTest((stuID))); // 新方法

			out.write(str.replaceAll("\"overlap\": 0,", "\"overlap\": false,")
					.replaceAll("\"overlap\": 1,", "\"overlap\": true,"));
			// out.write(str.replaceAll("\"overlap\": 0,",
			// "\"overlap\": false,")); // 只是把資料庫的 0 換成false 1換成true
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
