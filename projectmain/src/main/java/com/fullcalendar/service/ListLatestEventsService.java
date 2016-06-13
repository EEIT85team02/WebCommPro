package com.fullcalendar.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import Stu_additional.model.Stu_additionalVO;
import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentVO;

import com.fullcalendar.model.CalendarDAO;
import com.fullcalendar.model.CalendarDAO_interface;
import com.fullcalendar.model.CalendarVO;

public class ListLatestEventsService {
	IStudentDAO dao;
	CalendarDAO_interface daoC;
	Set<CalendarVO> events;
	Set<String> eventidset;

	public List<CalendarVO> listLatestEvents(Integer stuID) throws SQLException {
		// 取得dao
		dao = new StudentDAO();
		// 同一人的所有事件紀錄
		events = dao.findByPrimaryKey(stuID).getCalendarVO();
		// 取出事件種類 【不重複】
		eventidset = new LinkedHashSet<String>();
		for (CalendarVO one : events) {
			eventidset.add(one.getId());
		}

		List<CalendarVO> latestList = new ArrayList<CalendarVO>();
		// 先作弊一下 不要濾出最新的
		for (CalendarVO one : events) {
//			System.out.println("內容:\n" + one.getOrderId().toString());
			// 因為只要列出限制條件的部份而已
			if (one.getRendering() == null && one.getStart() != null){
				// 因為已經放下的 所以不能更動了
				one.setEditable(new Integer("0"));
				latestList.add(one);
			}
		}
		return latestList;
	}
	public List<CalendarVO> listConstrains(Integer stuID) throws SQLException {
		
		// 取得dao
		dao = new StudentDAO();
		// 同一人的所有事件紀錄
		events = dao.findByPrimaryKey(stuID).getCalendarVO();
		// 準備另一個容器
		List<CalendarVO> latestList = new ArrayList<CalendarVO>();
		// 準備淘汰不適合者

		for(CalendarVO one:events){
			// 因為只要列出限制條件的部份而已
			if(one.getRendering()!=null && one.getRendering().equals("background")){
//				one.setConstraint(""+stuID);
				latestList.add(one);
			}
		}
			return latestList;
	}
	public List<CalendarVO> listOthersEvents(Integer stuID) throws SQLException {
		// 取得dao
		dao = new StudentDAO();
		List<StudentVO> otherStudentVOs = new ArrayList<StudentVO>();
		List<StudentVO> allStudentVOs = dao.getAll();
		for (StudentVO oneStudentVO : allStudentVOs) {
			if (oneStudentVO.getStu_id().equals(stuID)) {
				continue;// exclude myself
			}
			otherStudentVOs.add(oneStudentVO);
		}

		List<CalendarVO> othersCalendarVOs = new ArrayList<CalendarVO>();
		for (StudentVO one : otherStudentVOs) {
			Set<CalendarVO> someoneCalendar = one.getCalendarVO();
			for (CalendarVO oneCalendar : someoneCalendar) {
				if (oneCalendar.getStart() != null
						&& oneCalendar.getTitle() != null) {
					// 因為是別人的 所以用黑色區隔開來
					oneCalendar.setColor("black");
					// 因為是別人的 所以不能更動了
					oneCalendar.setEditable(new Integer("0"));
//					oneCalendar.setOverlap(new Integer("0"));
					othersCalendarVOs.add(oneCalendar);
				}
			}
		}
		return othersCalendarVOs;
	}
	public List<CalendarVO> listTokens(Integer stuID) throws SQLException{
		// 先判斷共有多少人已經有預定
		// 排除掉stuID
		// 取得dao
//		dao = new StudentDAO();
		// 同一人的所有事件紀錄
//		events = dao.findByPrimaryKey(stuID).getCalendarVO();
		// 取出事件種類 【不重複】-- 現在用Title來區分
		// 取得dao
				dao = new StudentDAO();
				// 同一人的所有事件紀錄
				events = dao.findByPrimaryKey(stuID).getCalendarVO();
		
		
		
		List<CalendarVO> calendarVO_Out = new ArrayList<CalendarVO>();
		
//		CalendarDAO_interface daoC = new CalendarDAO();
//		List<CalendarVO> calendarVOs = daoC.getAll();
		for(CalendarVO calendarVO:events){
			if(calendarVO.getTitle()!=null && calendarVO.getStart()==null){
//				{
//				calendarVO.setColor("black");
//				calendarVO.setTitle("●");
				
				// 重要設定 必須在生出token時就已經給好constrain
				calendarVO.setConstraint(""+stuID);
				calendarVO_Out.add(calendarVO);
//				System.out.println("calendarVO.getId()\n"+calendarVO.getId());
			}
				
		}
		return calendarVO_Out;
	}
	public List<CalendarVO> listAllEvents(){
		daoC = new CalendarDAO();
		List<CalendarVO> allEvents = daoC.getAll();
		List<CalendarVO> newallEvents = new ArrayList<CalendarVO>();
		for(CalendarVO newEvent:allEvents){
			// 必須是事件 不是限制式
			if(newEvent.getTitle()!=null && newEvent.getStart()!=null){
				System.out.println("●修改前開始時間:\n"+newEvent.getStart());
				System.out.println("●修改前結束時間:\n"+newEvent.getEnd());
//				Calendar calStart = Calendar.getInstance();
				Calendar calEnd = Calendar.getInstance();
//				calStart.setTime(newEvent.getStart());
				calEnd.setTime(newEvent.getEnd());
//				cal.setTime(newEvent.getStart());
//				cal.add(Calendar.DATE, 1);// 加上一天
//				calStart.add(Calendar.HOUR, 12);// 加上
//				calEnd.add(Calendar.DATE, 1);			// end加上一天
				calEnd.add(Calendar.HOUR, 60);			// end加上一天
//				newEvent.setStart(calStart.getTime());	// 放回去start
				newEvent.setEnd(calEnd.getTime());		// 放回去end
				newallEvents.add(newEvent);
				System.out.println("●修改後開始時間:\n"+newEvent.getStart());
				System.out.println("●修改後結束時間:\n"+newEvent.getEnd());
			}
		}
		return newallEvents;
	}
	public static void main(String args[]){
//		new ListLatestEventsService().listAllEvents();
		
	}
}
