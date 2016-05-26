package com.fullcalendar.model;

import java.util.List;


public interface CalendarDAO_interface {
	public void insert(CalendarVO calendarVO);
    public void update(CalendarVO calendarVO);
    public void delete(Integer orderId);
    public CalendarVO findByPrimaryKey(Integer orderId);
    public List<CalendarVO> getAll();
    public List<CalendarVO> findLastUpdateEventsByStudentId(Integer id);
}
