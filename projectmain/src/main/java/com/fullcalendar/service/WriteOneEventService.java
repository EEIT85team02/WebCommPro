package com.fullcalendar.service;

import Student.model.StudentVO;

import com.fullcalendar.model.CalendarDAO;
import com.fullcalendar.model.CalendarDAO_interface;
import com.fullcalendar.model.CalendarVO;

public class WriteOneEventService {
	// private StudentDAO_interface dao;
	private CalendarDAO_interface dao;

	public void writeOneEvent(Integer id, String title, java.util.Date start, java.util.Date end, String color, Integer stuID) {

		/**
		 * 5.再一次裝箱
		 */
		// 假資料1
		StudentVO studentVO = new StudentVO();
		studentVO.setStu_id(stuID); // stuID 為必要!!!

		// 假資料2
		CalendarVO calendarVO = new CalendarVO();
		// calendarVO.setOrderId(orderId); // 故意不放上orderID 為了可以把所有紀錄留下(
		// 若加上去,則只會保持最新紀錄 )
		calendarVO.setId(id);
		calendarVO.setTitle(title);
		calendarVO.setStart(start);
		calendarVO.setEnd(end);
		calendarVO.setColor(color);
		calendarVO.setStudentVO(studentVO);

		// DAO
		dao = new CalendarDAO();
		// Insert
		dao.insert(calendarVO);

		// dao = new CalendarDAO();
		// return new CalendarDAO().findLastUpdateEventsByStudentId(orderId);
		// return dao.findLastUpdateEventsByStudentId(studentId);
		// Set<Integer> eventidset = new LinkedHashSet<Integer>();
		// List<CalendarVO> latestList = new ArrayList<CalendarVO>();
		// StudentVO studentVO = new StudentVO();

		/*
		 * dao = new StudentDAO(); Set<CalendarVO> set = new
		 * HashSet<CalendarVO>();
		 */
		/**
		 * Calendar(多方)
		 */

		/*
		 * CalendarVO event = new CalendarVO();
		 * event.setOrderId(orderId);//若資料庫已經存在此calendar 則會update
		 * event.setId(id); event.setTitle(title); event.setStart(start);
		 * event.setEnd(end); event.setColor(color); // 應該是這邊沒有把student資訊完整輸入
		 * 
		 * // Integer stuID = studentVO.getStuID(); String stuName =
		 * studentVO.getStuName(); Integer stuAge = studentVO.getStuAge();
		 * Integer stuGender = studentVO.getStuGender(); String stuSchool =
		 * studentVO.getStuSchool(); Integer stuTeam = studentVO.getStuTeam();
		 * Integer stuSeatNo = studentVO.getStuSeatNo(); String stuEmail =
		 * studentVO.getStuEmail(); Integer stuIsExamPC =
		 * studentVO.getStuIsExamPC(); Double stuScorePC =
		 * studentVO.getStuScorePC(); java.util.Date stuDatePC =
		 * studentVO.getStuDatePC(); Double stuScoreIn =
		 * studentVO.getStuScoreIn(); Double stuScoreSum =
		 * studentVO.getStuScoreSum(); java.util.Date stuDateHire =
		 * studentVO.getStuDateHire(); Double stuSalary =
		 * studentVO.getStuSalary(); Integer stuFinalR =
		 * studentVO.getStuFinalR(); String stuNote = studentVO.getStuNote();
		 * String stuMajor = studentVO.getStuMajor(); Integer stuSession =
		 * studentVO.getStuSession();
		 */

		/**
		 * Student(一方)
		 */
		/*
		 * studentVO.setStuAge(stuAge); studentVO.setStuDateHire(stuDateHire);
		 * studentVO.setStuDatePC(stuDatePC); studentVO.setStuEmail(stuEmail);
		 * studentVO.setStuFinalR(stuFinalR); studentVO.setStuGender(stuGender);
		 * studentVO.setStuID(stuID); studentVO.setStuIsExamPC(stuIsExamPC);
		 * studentVO.setStuMajor(stuMajor); studentVO.setStuName(stuName);
		 * studentVO.setStuNote(stuNote); studentVO.setStuSalary(stuSalary);
		 * studentVO.setStuSchool(stuSchool);
		 * studentVO.setStuScoreIn(stuScoreIn);
		 * studentVO.setStuScorePC(stuScorePC);
		 * studentVO.setStuScoreSum(stuScoreSum);
		 * studentVO.setStuSeatNo(stuSeatNo);
		 * studentVO.setStuSession(stuSession); studentVO.setStuTeam(stuTeam);
		 * studentVO.setCalendarVO(set);
		 * 
		 * 
		 * event.setStudentVO(studentVO); set.add(event);
		 * 
		 * 
		 * dao.update(studentVO);
		 */
	}
}
