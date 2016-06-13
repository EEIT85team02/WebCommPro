package com.fullcalendar.service;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet("/CalendarAllFromDBServlet")
public class CalendarAllFromDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IStudentDAO dao = new StudentDAO();
	private boolean isBookable = true;


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
//				.registerTypeAdapter(Boolean.class,  new TypeAdapter<Boolean>(){
//
//					@Override
//					public void write(JsonWriter out, Boolean value)
//							throws IOException {
////						if(value.equals(new Integer("1"))){
////							out.value(true);
////						}
////						if(value.equals(new Integer("0"))){
////							out.value(false);
////						}
//						   if (value == null) {
//							      out.nullValue();
//							    } else {
//							      out.value(value);
//							    }
//					}
//
//					@Override
//					public Boolean read(JsonReader in) throws IOException {
////						return null;
//						  JsonToken peek = in.peek();
//						    switch (peek) {
//						    case BOOLEAN:
//						      return in.nextBoolean();
//						    case NULL:
//						      in.nextNull();
//						      return null;
//						    case NUMBER:
//						      return in.nextInt() != 0;
//						    case STRING:
//						      return Boolean.parseBoolean(in.nextString());
//						    default:
//						      throw new IllegalStateException("Expected BOOLEAN or NUMBER but was " + peek);
//						    }
//					}
//					
//				})
//				.setDateFormat("yyyy-MM-dd")//因為constrain 不能太清確的格式!!
//				.setDateFormat("yyyy-MM-dd'T'HH:mm:ss")//因為前端套件要用這種格式的樣子
				.setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")//因為前端套件要用這種格式的樣子
				.setPrettyPrinting()
				.create();
		// 也可以在create()之前先.serializeNulls
//		<h1>stuName:${sessionScope.userId}</h1>
//		<h1>stuNumber:${sessionScope.stuID}</h1>
//		Integer stuID = new Integer(request.getParameter("stuID").toString());
//		Integer stuID = new Integer(request.getSession().getAttribute("stuID").toString());
//		out.write(gson.toJson(new ListOthersEventsService()
//		.ListAllEvents(stuID)));
//		stuID = new Integer("4");
		
		// -- 如果還已額滿 就設定overlap = false
		/*
		if(isBookable){
			out.write(gson.toJson(new ListLatestEventsService().listOthersEvents((stuID))));
		}else{
			out.write(gson.toJson(new ListLatestEventsService().listOthersEvents((stuID))).replaceAll("\"overlap\": 0,",  "\"overlap\": false,"));// ●●●●●●●!! 重要 再加一個條件判斷 當數量額滿時 就將此日的overlap給關閉
			
		}
		*/
		String str = gson.toJson(new ListLatestEventsService().listAllEvents());
//		out.write(str.replaceAll("\"overlap\": 0,",  "\"overlap\": false,"));
		/**
		 * 因為資料庫和前台所需要的格式不符
		 */
		// overlap : int -> boolean 
		str = str.replaceAll("\"overlap\": 0,",  "\"overlap\": false,").replaceAll("\"overlap\": 1,",  "\"overlap\": true,");
		// start   :
		str = str.replaceAll("\"start\":", "\"startDate\": ").replaceAll("\"end\":","\"endDate\":");
//		str = str.replaceAll("\"start\":", "\"startDate\": new Date(").replaceAll("\"end\":","\"endDate\": new Date(");
//		str = str.replaceAll("Z\",", "Z\"),");
		// 只是把資料庫的 0 換成false 1換成true
		out.write(str);
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
