package com.fullcalendar.service;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentVO;

import com.fullcalendar.model.CalendarVO;

public class ListAllEventsService {
	IStudentDAO dao;		
	List<CalendarVO> latestList;
	List<CalendarVO> latestCalendarVO;
	StudentVO studentVO;
	Set<Integer> eventNum;
	Set<CalendarVO> events;
//	listAllEvents(new Integer(1))
	
	
	/**
	 * 因為gson的關係 要先濾掉CalendarVO 這個屬性
	 * @param stuID
	 * @return
	 */
	public List<CalendarVO> listAllEvents(Integer stuID){
		
	dao = new StudentDAO();
	latestList= new ArrayList<CalendarVO>();
	eventNum = new LinkedHashSet<Integer>();	// 準備用來裝載事項種類的集合
	studentVO = dao.findByPrimaryKey(stuID);	// 取得指定的人 -- stuID=integer(1) 為已知
	events = studentVO.getCalendarVO();			// 取得各種屬性 
	
		// 將stuID=1這個人的所有歷史紀錄都給滾出來
		for(CalendarVO one:events){
			// 先找出總共有幾個事項可以選擇
			eventNum.add(one.getId());
		}
	
		// 濾出最新的事件們
		for(Integer ithEventNum:eventNum){					// 逐eventID種類過濾
			CalendarVO latestone = null;					// 準備擺放位置
			int a =0;										// 準備比較新舊
			for(CalendarVO ithEvent:events){
				if(ithEvent.getId().equals(ithEventNum)){	// 相同eventID
					if(a==0){								// 
						a=ithEvent.getOrderId().intValue();	// 轉型
						latestone = ithEvent;
					}else{
						latestone = a >= ithEvent.getOrderId().intValue()? latestone:ithEvent;
					}
				}
			}
			latestList.add(latestone);
		}
	
		// 把最新的events打包成CalendarVO 
		latestCalendarVO = new ArrayList<CalendarVO>();
		for(CalendarVO one:latestList){
			/**
			 * 先拆箱
			 */
			Integer orderId = new Integer(one.getOrderId());
			Integer id = new Integer(one.getId());
			String title = ""+one.getTitle();
			java.util.Date start = one.getStart();
			java.util.Date end = one.getEnd();
			String color = ""+one.getColor();

			/**
			 * 再裝箱
			 */
			// 以CalendarVO 為單位打包
			CalendarVO tempVO = new CalendarVO();
			tempVO.setOrderId(orderId);
			tempVO.setId(id);
			tempVO.setTitle(title);
			tempVO.setStart(start);
			tempVO.setEnd(end);
			tempVO.setColor(color);
		
			// 以CalendarVO 的List打包
			latestCalendarVO.add(tempVO);	
		}
			return latestCalendarVO;
	}
	
	}

