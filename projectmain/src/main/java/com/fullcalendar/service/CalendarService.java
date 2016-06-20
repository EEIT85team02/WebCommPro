package com.fullcalendar.service;


import java.sql.SQLException;
import java.sql.Timestamp;

import java.util.List;



import com.fullcalendar.model.CalendarDAO;
import com.fullcalendar.model.CalendarDAO_interface;
import com.fullcalendar.model.CalendarVO;
import Stu_additional.model.Stu_additionalService;
import Student.model.StudentVO;

public class CalendarService {
	private CalendarDAO_interface dao;

	public CalendarService() {
		dao= new CalendarDAO();
	}
	
	//新增Calendar資料
	public void insertCalendar(String id,String title,java.util.Date start,java.util.Date end,String color,Integer stu_id,
			Integer editable,Integer overlap,String rendering,String constraint ) throws SQLException {
		CalendarVO calendar = new CalendarVO();
		calendar.setId(id);
		calendar.setTitle(title);
		calendar.setStart(start);
		calendar.setEnd(end);
		calendar.setColor(color);
		StudentVO stu = new StudentVO();
		stu.setStu_id(stu_id);
		calendar.setStudentVO(stu);
		calendar.setEditable(editable);
		calendar.setOverlap(overlap);
		calendar.setRendering(rendering);
		calendar.setConstraint(constraint);
		
		dao.insert(calendar);
	}
	
	//新增產生stu_additional資料
	public void createStu_additionalDetailData(Integer stu_id,String title) throws SQLException{
		List<CalendarVO> list = null;
		list = dao.findStu_additionalDetailData(stu_id, title);
		for(CalendarVO aa :list){
			long test_startValue = aa.getStart().getTime();
			long test_endValue = aa.getEnd().getTime();
			java.sql.Timestamp test_start = new Timestamp(test_startValue);
			java.sql.Timestamp test_end = new Timestamp(test_endValue);
			
			java.sql.Timestamp stu_applytime = new java.sql.Timestamp(new java.util.Date().getTime());
			java.sql.Timestamp confirm_time = new java.sql.Timestamp(new java.util.Date().getTime());
			
			Integer sta_id = 2;
			String	emp_id="0000";
			Stu_additionalService stuaddSrc =new Stu_additionalService();
			stuaddSrc.insert(test_start, test_end, stu_applytime, confirm_time, stu_id, sta_id, emp_id, title);
		}
		System.out.println("stu_addition資料已產生完成");
		
	}
	//方法結束
	public static void main(String[] args){
		CalendarService src = new CalendarService();
		try {
			src.createStu_additionalDetailData(8,"Java");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	} 
	
	
	
}
