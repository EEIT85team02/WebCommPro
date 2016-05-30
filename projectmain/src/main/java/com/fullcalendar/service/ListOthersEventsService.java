package com.fullcalendar.service;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import Student.model.IStudentDAO;
import Student.model.StudentDAO;

import com.fullcalendar.model.CalendarDAO;
import com.fullcalendar.model.CalendarDAO_interface;
import com.fullcalendar.model.CalendarVO;

public class ListOthersEventsService {
	// 1. 計算一旦當某一天已經預訂滿額(2人) 時
	// 2. 檢查同一天中, 不能存在兩個同id的event
	// 要設定為overlap:false
	IStudentDAO dao;
	Set<CalendarVO> events;
	Set<Integer> eventidset;
	
	
	
	
	public List<CalendarVO> ListAllEvents(String stuid){
		CalendarDAO_interface  daoc = new CalendarDAO(); 
		// 取得不重複的stuID
		 List<CalendarVO> allEvents = daoc.getAll();
		 Set<String> stuIDList = new LinkedHashSet<String>();
		for(CalendarVO eachEvent:allEvents){
			stuIDList.add(eachEvent.getStudentVO().getStu_id());
		}
		// 排除某個stuID
		stuIDList.remove(stuid);
		// 用這個stuIDList去call ListOthersEventsService
		List<CalendarVO> someoneEvents;
		List<CalendarVO> allOthersEvents = new ArrayList<CalendarVO>(); 
		for(Integer stuID:stuIDList){
			someoneEvents = listOthersEventsService(stuID);	// 取得某人最新 List
			for(CalendarVO someoneEvent:someoneEvents){
				someoneEvent.setId(0);
				someoneEvent.setTitle("已預定");
				someoneEvent.setColor("#3a87ad");
				someoneEvent.setEditable(new Integer(0));
				someoneEvent.setOverlap(new Integer(0));
//				someoneEvent.setConstraint("1");
				allOthersEvents.add(someoneEvent);			// 在逐一拆開來放進另一個List
			}
		}
		System.out.println("共有幾種不同已經預定日期的人"+stuIDList.size());
		
//		return daoc.getAll();
		return allOthersEvents;
	}
	
	
	public List<CalendarVO> listOthersEventsService(Integer stuID){
		// 先判斷共有多少人已經有預定
		// 排除掉stuID
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
	
	/*
	public static void main(String args[]){
		 
//		System.out.println(new ListOthersEventsService().ListOthersEventsService(new Integer(1)).get(0).getTitle());
//		System.out.println(new ListOthersEventsService().ListAllEvents().get(0).getTitle());
		System.out.println(new ListOthersEventsService().ListAllEvents(new Integer(1)).size());
		List<CalendarVO> allevents = new ListOthersEventsService().ListAllEvents(new Integer(1));
		for(CalendarVO oneEvent:allevents)
		System.out.println(oneEvent.getTitle()+"\t"+oneEvent.getOrderId());
	}
	 */

}
