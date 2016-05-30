package com.fullcalendar.service;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import Student.model.IStudentDAO;
import Student.model.StudentDAO;

import com.fullcalendar.model.CalendarVO;

public class ListLatestEventsService {
	IStudentDAO dao;
	Set<CalendarVO> events;
	Set<Integer> eventidset;

	public List<CalendarVO> listLatestEvents(Integer stuID) {
		// 取得dao
		dao = new StudentDAO();
		// 同一人的所有事件紀錄
		events = dao.findByPrimaryKey(stuID).getCalendarVO();
		// 取出事件種類 【不重複】
		eventidset = new LinkedHashSet<Integer>();
		for (CalendarVO one : events) {
			eventidset.add(one.getId());
		}

		// 準備計算出某人最新的所有事件
		List<CalendarVO> latestList = new ArrayList<CalendarVO>();
		for (Integer oneid : eventidset) {
			CalendarVO latestone = null;
			int a = 0;
			for (CalendarVO one : events) {
				// 固定某事件不變
				if (one.getId().equals(oneid)) {
					int orderId = one.getOrderId().intValue();
					if (a == 0) {
						// 判斷誰是最新的事件
						a = orderId;// a沒值 先賦值
						// a=one.getOrderId().intValue();//a沒值 先賦值
						latestone = one;
					} else {
						latestone = a >= orderId ? latestone : one;// 比較a與相同事件之間的大小
																	// 只留比較大的!
					}
				}
			}
			latestList.add(latestone);
		}
		return latestList;
	}

}
