package com.fullcalendar.service;

import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.SQLException;

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


@WebServlet("/Calendar2DBServlet_jQuery")
public class Calendar2DBServlet_jQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Calendar2DBServlet_jQuery() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Integer stuID = new Integer(request.getSession().getAttribute("stu_id").toString());
		
		
		/**
		 * 0. 設定json格式
		 */
		
//		Gson很方便 可以事先設定內容格式
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
				.registerTypeAdapter(CalendarVO.class,  new JsonSerializer<CalendarVO>(){
					@Override
					public JsonElement serialize(CalendarVO calendarVO, Type typeOfSrc,
							JsonSerializationContext context) {
						JsonObject result = new JsonObject();
						result.add("orderId", new JsonPrimitive(calendarVO.getOrderId()));
						result.add("id", new JsonPrimitive(calendarVO.getId()));
						result.add("start", new JsonPrimitive(calendarVO.getStart().getTime()));
						result.add("end", new JsonPrimitive(calendarVO.getEnd().getTime()));
						result.add("color", new JsonPrimitive(calendarVO.getColor()));
						result.add("title", new JsonPrimitive(calendarVO.getTitle()));
						result.add("editable", new JsonPrimitive(calendarVO.getEditable()));
						result.add("overlap", new JsonPrimitive(calendarVO.getOverlap()));
//						result.add("duration", new JsonPrimitive("01:00"));	// 設定寫死在javascript【createExternalEvents】內
						return result;
					}
					
					
					
				})
//				.setDateFormat("yyyy-MM-dd'T'HH:mm:ssZ")// 我的時間格式 從fullcalendar撈出來的沒這麼多
				.setDateFormat("yyyy-MM-dd'T'HH:mm")	// ●●●請參考: http://stackoverflow.com/questions/14796195/gson-unparseable-date
				.setPrettyPrinting()
				.create();
		
		
		/**
		 * 1. 拆箱
		 */
		// 先把request內的json讀出來 變成字串
		String str = request.getReader().readLine();
		// 重要! 因為寫回DB需要型態為Integer
		str = str.replaceAll("\"overlap\":true,","\"overlap\": 1,").replaceAll( "\"overlap\":false,","\"overlap\": 0,");
//		str = str.replaceAll("\"editable\":true,","\"editable\": 1,").replaceAll( "\"editable\":false,","\"editable\": 0,");
		// 強制在calendar內的日期事件為不可選取
		str = str.replaceAll("\"editable\":true,","\"editable\": 0,").replaceAll( "\"editable\":false,","\"editable\": 0,");
//		System.out.println("●jsonTemp:\n"+str);
		/**
		 *  前端使用jQuery 技術 串送格式為 FormDate 的資料
		 *  後端使用getReader() 以及 readLine() 把整個事件的資訊在包成VO
		 */
		
		/**
		 * 2. 裝箱
		 */
		// 把json包成java物件
		CalendarVO calendarVO = gson.fromJson(str,CalendarVO.class);
		
		String title = calendarVO.getTitle();
		//Integer stuID = new Integer(request.getSession().getAttribute("stu_id").toString());  
		/**
		 * 3. 呼叫service
		 */
		
		// 呼叫service 
		new WriteOneEventService_jQuery().writeOneEventService(calendarVO, stuID);
			
		System.out.println("sruId:"+stuID);
			request.getSession().setAttribute("reservation", true);
			System.out.println("reservation:"+request.getAttribute("reservation"));
			try {
				new CalendarService().createStu_additionalDetailData(stuID, title);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
}
