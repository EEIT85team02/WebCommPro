package com.fullcalendar.model;

import java.sql.SQLException;
import java.util.List;


public interface CalendarDAO_interface {
	public void insert(CalendarVO calendarVO);
    public void update(CalendarVO calendarVO);
    public void delete(Integer orderId);
    public CalendarVO findByPrimaryKey(Integer orderId);
    public List<CalendarVO> getAll();
    public List<CalendarVO> findLastUpdateEventsByStudentId(Integer id);
    public List<CalendarVO> findStu_additionalDetailData(Integer stu_id,String title) throws SQLException;
}
