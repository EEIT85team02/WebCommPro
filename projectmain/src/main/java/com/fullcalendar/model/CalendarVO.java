package com.fullcalendar.model;

import Student.model.StudentVO;

public class CalendarVO {
	 	private Integer orderId;
		private String id;
	    private String title;
	    private java.util.Date start;
	    private java.util.Date end;
	    private String color;
	    private StudentVO studentVO;
	    private Integer editable;
	    private Integer overlap;
	    private String rendering;
	    private String constraint;
		public Integer getOrderId() {
			return orderId;
		}
		public void setOrderId(Integer orderId) {
			this.orderId = orderId;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public java.util.Date getStart() {
			return start;
		}
		public void setStart(java.util.Date start) {
			this.start = start;
		}
		public java.util.Date getEnd() {
			return end;
		}
		public void setEnd(java.util.Date end) {
			this.end = end;
		}
		public String getColor() {
			return color;
		}
		public void setColor(String color) {
			this.color = color;
		}
		public StudentVO getStudentVO() {
			return studentVO;
		}
		public void setStudentVO(StudentVO studentVO) {
			this.studentVO = studentVO;
		}
		public Integer getEditable() {
			return editable;
		}
		public void setEditable(Integer editable) {
			this.editable = editable;
		}
		public Integer getOverlap() {
			return overlap;
		}
		public void setOverlap(Integer overlap) {
			this.overlap = overlap;
		}
		public String getRendering() {
			return rendering;
		}
		public void setRendering(String rendering) {
			this.rendering = rendering;
		}
		public String getConstraint() {
			return constraint;
		}
		public void setConstraint(String constraint) {
			this.constraint = constraint;
		}
		
	    
	  			    	    		 
}
