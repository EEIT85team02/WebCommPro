package com.fullcalendar.service;

import java.sql.SQLException;
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

import Class.model.ClassVO;
import Edu.model.EduVO;
import Student.model.StudentVO;

public class CalendarService {
	private CalendarDAO_interface dao;

	public CalendarService() {
		dao= new CalendarDAO();
	}
	
	
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
	
}
