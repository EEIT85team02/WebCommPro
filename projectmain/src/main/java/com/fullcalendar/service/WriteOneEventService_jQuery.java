package com.fullcalendar.service;

import java.util.List;

import Student.model.StudentVO;

import com.fullcalendar.model.CalendarDAO;
import com.fullcalendar.model.CalendarDAO_interface;
import com.fullcalendar.model.CalendarVO;

public class WriteOneEventService_jQuery {
	// private StudentDAO_interface dao;
	private CalendarDAO_interface dao;
	
	public void writeOneEventService(CalendarVO calendarVO,Integer stuID) {

		/**
		 * 4. 再裝箱?
		 */
		// 假資料1
		StudentVO studentVO = new StudentVO();
		studentVO.setStu_id(stuID);		// 假的外殼 但是需要它的stuID
//		studentVO.setStuID(new Integer(1));		// 假的外殼 但是需要它的stuID
		// 假資料2
		calendarVO.setStudentVO(studentVO);		// 從jsp - servlet - service 一路過來的 帶有很多有用資訊 卻少了一項重要的stuID
		
		// 重要選項 !!!
//		calendarVO.setOrderId(null);  // 故意令orderID為null 為了可以把所有紀錄留下  (若不加上去,則只會保持最新紀錄 )


		
		
		
		
		// DAO
		dao = new CalendarDAO();
		
		// 多一個判斷 找出所有id一樣的events 如果沒有人的start是一樣的 就更新
		boolean isRepeat = false;
		List<CalendarVO> allEvents = dao.getAll();
		for(CalendarVO one:allEvents){
//			System.out.println(one.getStart()+"\t"+calendarVO.getStart()+"\t"+one.getId()+"\t"+calendarVO.getId());
//			System.out.println(one.getStart().getClass().getName()+"\t"+calendarVO.getStart().getClass().getName()+"\t"+one.getId().getClass().getName()+"\t"+calendarVO.getId().getClass().getName());
//			System.out.println(one.getStart().getTime()+"\t"+calendarVO.getStart().getTime()+"\t"+one.getId()+"\t"+calendarVO.getId());
/*			
			if((one.getStart().getTime()==(calendarVO.getStart().getTime()) && one.getId().equals(calendarVO.getId()))){
				isRepeat |= true;
			}
			*/
		}
		 
		if(!isRepeat){
			// Insert
			dao.insert(calendarVO);
		}
	}
}
