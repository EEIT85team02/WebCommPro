package com.fullcalendar.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.model.StudentVO;

import com.fullcalendar.model.CalendarVO;
import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

@WebServlet("/CalendarEventTokensFromDBServlet")
public class CalendarEventTokensFromDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CalendarEventTokensFromDBServlet() {
		super();
	}

	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Integer stuID = new Integer(request.getSession().getAttribute("stu_id")
				.toString());
		// 準備日期格式工具
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");

		
		
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
				.registerTypeAdapter(CalendarVO.class,  new JsonSerializer<CalendarVO>(){
					@Override
					public JsonElement serialize(CalendarVO calendarVO, Type typeOfSrc,
							JsonSerializationContext context) {
						JsonObject result = new JsonObject();
						result.add("constraint", new JsonPrimitive(stuID.toString()));
						result.add("orderId", new JsonPrimitive(calendarVO.getOrderId()));
						result.add("id", new JsonPrimitive(calendarVO.getId()));
						result.add("title", new JsonPrimitive(calendarVO.getTitle()));
						result.add("start", new JsonPrimitive(sdf.format(calendarVO.getStart())));
						result.add("color", new JsonPrimitive(calendarVO.getColor()));
						result.add("editable", new JsonPrimitive((calendarVO.getEditable().equals(new Integer("1"))?true:false)));
						result.add("overlap", new JsonPrimitive((calendarVO.getOverlap().equals(new Integer("1"))?true:false)));
						// 寫死在javascript內
//						result.add("duration", new JsonPrimitive("01:00"));
						// 只有限制式需要
//						result.add("rendering", new JsonPrimitive(calendarVO.getRendering()));
						return result;
					}
				})
				.setDateFormat("HH:mm").setPrettyPrinting()
				.create();

		String str;
		try {
			// 舊方法
			// str = gson.toJson(new
			// ListLatestEventsService().listTokens((stuID))); 
			
			// 新方法
			str = gson.toJson(new ListLatestEventsService()
					.listTokensTest((stuID))); 
			
			
			/*
			 *	以 Gson 方式寫 【比較有系統性】	 
			 * 
			 * 
			 * 
				str = str.replaceAll("\"overlap\": 0,", "\"overlap\": false,")
					.replaceAll("\"overlap\": \"1\",", "\"overlap\": true,")
					.replaceAll("\"overlap\": \"0\",", "\"overlap\": true,")
					.replaceAll("\"overlap\": 1,", "\"overlap\": true,")
					.replaceAll("\"start\":", "\"time\": ")
					.replaceAll("\"time\": ").replaceAll("\"end\":","\"duration\":");
			*
			*
			*/
			

			out.write(str);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
