package com.fullcalendar.model;

import java.util.List;


public interface CalendarDAO_interface {
	public void insert(CalendarVO calendarVO);
    public void update(CalendarVO calendarVO);
    public void delete(Integer orderId);
    public CalendarVO findByPrimaryKey(Integer orderId);
    public List<CalendarVO> getAll();
    /**
     * 非傳統CRUD
     * @return
     */
    public List<CalendarVO> getEventsToken(Integer stuID);
    public List<CalendarVO> getAllOthersEvents(Integer stuID);//通用
    public List<CalendarVO> getAllEventsForAdm();//給考官year calendar用的
    public List<CalendarVO> getLatestEvents(Integer stuID);
    public List<CalendarVO> getConstrains(Integer stuID);
	public List<CalendarVO> findStu_additionalDetailData(Integer stu_id,String title);
}
