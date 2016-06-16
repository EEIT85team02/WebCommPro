package com.fullcalendar.service;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.JSONArray;
import org.json.simple.JSONValue;

import com.fullcalendar.model.CalendarDAO;
import com.fullcalendar.model.CalendarDAO_interface;
import com.fullcalendar.model.CalendarVO;

import Class.model.ClassService;
import Class.model.ClassVO;
import Edu.model.EduVO;
import Employee.model.EmployeeVO;
import Member_status.model.Member_statusVO;
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
	
	//新增產生tu_additional資料
	public void createStu_additionalDetailData(Integer stu_id,String title) throws SQLException{
		List<CalendarVO> list = null;
		list = dao.findStu_additionalDetailData(stu_id, title);
		for(CalendarVO aa :list){
			java.util.Date test_start = aa.getStart();
			java.util.Date test_end = aa.getEnd();
			java.sql.Date stu_applytime = new java.sql.Date(new java.util.Date().getTime());
			Integer stu_idValue = aa.getStudentVO().getStu_id();
			Integer  sta_id = 2;
			String	emp_id="0000";
			Stu_additionalService stuaddSrc =new Stu_additionalService();
			stuaddSrc.insert();
			
		}
		
		
	}
	//方法結束
	
	
	
	
}
