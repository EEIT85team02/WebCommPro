package com.fullcalendar.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.model.StudentVO;

import com.fullcalendar.model.CalendarVO;

@WebServlet("/Calendar2DBServlet")
public class Calendar2DBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Calendar2DBServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		

		
		
		// 一整個過程中我們都假設已知此人stuId 故此行沒有意義
		// calendarVO.getStudentVO().getStuID();
		
		
		
		/*
		 * 1. 拆箱
		 */
		// 抽出真實資料	使用傳遞parameter方式
//		Integer orderId = new Integer(request.getParameter("orderId").toString());			// 故意不放上orderID 為了可以把所有紀錄留下( 若加上去,則只會保持最新紀錄 )
		Integer id = new Integer(request.getParameter("id").toString());
		String title = request.getParameter("title").toString();
		java.util.Date start = new java.util.Date(new Long(request.getParameter("start")));
		java.util.Date end = new java.util.Date(new Long(request.getParameter("end")));
		String color = request.getParameter("color").toString();
		Integer stuID = new Integer(request.getParameter("stuID").toString());
		
		
		/*
		 * 2. 裝箱
		 */
		 
		// 假資料1
		StudentVO studentVO = new StudentVO();
		studentVO.setStu_id(stuID);				// stuID 為必要!!!
		
		// 假資料2
		CalendarVO calendarVO = new CalendarVO();
//		calendarVO.setOrderId(orderId);			// 故意不放上orderID 為了可以把所有紀錄留下( 若加上去,則只會保持最新紀錄 )
		calendarVO.setId(id);
		calendarVO.setTitle(title);
		calendarVO.setStart(start);
		calendarVO.setEnd(end);
		calendarVO.setColor(color);
		calendarVO.setStudentVO(studentVO);
		
		
		/**
		 * 4. 呼叫service
		 */		
		
		// 使用傳遞parameter方式
		new WriteOneEventService().writeOneEvent(id, title, start, end, color, stuID);
	}
}
