package com.fullcalendar.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Set;

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
	
	// 01.自己已定
	public List<CalendarVO> listLatestEvents(Integer stuID) throws SQLException {
		daoC = new CalendarDAO();
		List<CalendarVO> calendarVO_Out = new ArrayList<CalendarVO>();
		calendarVO_Out = daoC.getLatestEvents(stuID);
		return calendarVO_Out;
	}

	// 02.限制	【綠色background】
	public List<CalendarVO> listConstrains(Integer stuID) throws SQLException {
		daoC = new CalendarDAO();
		List<CalendarVO> calendarVO_Out = new ArrayList<CalendarVO>();
		calendarVO_Out = daoC.getConstrains(stuID);
		return calendarVO_Out;
	}

	
	// 03.別人已定
	/**
	 * 將重心壓到資料庫引擎
	 */
	// .舊版
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
				if (oneCalendar.getEnd() != null
						&& oneCalendar.getTitle() != null) {
					// 因為是別人的 所以用黑色區隔開來
					oneCalendar.setColor("black");
					// 因為是別人的 所以不能更動了
					oneCalendar.setEditable(new Integer("0"));
					// oneCalendar.setOverlap(new Integer("0"));
					othersCalendarVOs.add(oneCalendar);
				}
			}
		}
		return othersCalendarVOs;
	}

	// .新版
	public List<CalendarVO> listOthersEventsTest(Integer stuID)
			throws SQLException {

		CalendarDAO_interface daoC = new CalendarDAO();
		List<CalendarVO> allEvents = daoC.getAllOthersEvents(stuID);
		for (int i = 0, size = allEvents.size(); i < size; i++) {
			CalendarVO one = allEvents.get(i);
			if (one.getStudentVO().getStu_id().equals(stuID)) {
				allEvents.remove(one);
			} else {
				one.setColor("black");
				one.setEditable(new Integer("0"));
				one.setOverlap(new Integer("0"));
			}
		}
		return allEvents;
	}

	// 04.自己未定
	/**
	 * 將重心壓到資料庫引擎
	 */
	// .舊版
	public List<CalendarVO> listTokens(Integer stuID) throws SQLException {
		// 取得dao
		dao = new StudentDAO();
		// 同一人的所有事件紀錄
		events = dao.findByPrimaryKey(stuID).getCalendarVO();
		List<CalendarVO> calendarVO_Out = new ArrayList<CalendarVO>();
		for (CalendarVO calendarVO : events) {
			if (calendarVO.getTitle() != null && calendarVO.getStart() == null) {
				switch (calendarVO.getTitle()) {
				case "Java":
					calendarVO.setStart(new java.util.GregorianCalendar(2016,
							6, 6, 9, 0).getTime());
					;
					// calendarVO.setEnd(new
					// java.util.GregorianCalendar(2016,6,6,10,0).getTime());;
					break;
				case "JavaScript":
					calendarVO.setStart(new java.util.GregorianCalendar(2016,
							6, 6, 10, 0).getTime());
					;
					// calendarVO.setEnd(new
					// java.util.GregorianCalendar(2016,6,6,11,0).getTime());;
					break;
				case "SQL":
					calendarVO.setStart(new java.util.GregorianCalendar(2016,
							6, 6, 11, 0).getTime());
					;
					// calendarVO.setEnd(new
					// java.util.GregorianCalendar(2016,6,6,12,0).getTime());;
					break;

				}
				// 重要設定 必須在生出token時就已經給好constrain
				calendarVO.setConstraint("" + stuID);
				calendarVO_Out.add(calendarVO);
			}

		}
		return calendarVO_Out;
	}

	// .新版
	public List<CalendarVO> listTokensTest(Integer stuID) throws SQLException {
		daoC = new CalendarDAO();
		// 取得dao
//		dao = new StudentDAO();
		// 同一人的所有事件紀錄
//		events = dao.findByPrimaryKey(stuID).getCalendarVO();
		List<CalendarVO> calendarVO_Out = new ArrayList<CalendarVO>();
//		for (CalendarVO calendarVO : events) {
//			if (calendarVO.getTitle() != null && calendarVO.getEnd() == null) {// 一開始先給定開始時間
																				// 待確定後才給結束時間
			//
			// switch(calendarVO.getTitle()){
			// case "Java":
			// calendarVO.setStart(new
			// java.util.GregorianCalendar(2016,6,6,9,0).getTime());;
			// // calendarVO.setEnd(new
			// java.util.GregorianCalendar(2016,6,6,10,0).getTime());;
			// break;
			// case "JavaScript":
			// calendarVO.setStart(new
			// java.util.GregorianCalendar(2016,6,6,10,0).getTime());;
			// // calendarVO.setEnd(new
			// java.util.GregorianCalendar(2016,6,6,11,0).getTime());;
			// break;
			// case "SQL":
			// calendarVO.setStart(new
			// java.util.GregorianCalendar(2016,6,6,11,0).getTime());;
			// // calendarVO.setEnd(new
			// java.util.GregorianCalendar(2016,6,6,12,0).getTime());;
			// break;
			//
			// }
				// 重要設定 必須在生出token時就已經給好constrain
//				calendarVO.setConstraint("" + stuID);
//				calendarVO_Out.add(calendarVO);
//			}

//		}
		
		
		
//				calendarVO.setConstraint("" + stuID);
		calendarVO_Out = daoC.getEventsToken(stuID);
		
		
		return calendarVO_Out;
	}

	
	// 05. 所有已定事件 		【專門做給bootstrap year calendar】
	public List<CalendarVO> listAllEvents() {
		daoC = new CalendarDAO();
		List<CalendarVO> allEvents = daoC.getAllEventsForAdm();
		for (int i = 0; i < allEvents.size(); i++) {
			CalendarVO one = allEvents.get(i);
			Calendar calStart = Calendar.getInstance();
			calStart.setTime(one.getStart());
			calStart.add(Calendar.DATE, -1);
			one.setStart(calStart.getTime());
		}
		return allEvents;
	}

	
	
	
	public static void main(String args[]) {
		// new ListLatestEventsService().listAllEvents();

	}
}
