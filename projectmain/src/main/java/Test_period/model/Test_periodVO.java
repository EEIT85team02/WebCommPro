package Test_period.model;

import java.io.Serializable;
import java.sql.Time;

public class Test_periodVO implements Serializable{//考試時段
	private Integer test_hour_id;//考試時段代號
	private	java.sql.Time	test_hour;//考試時段
	public Integer getTest_hour_id() {
		return test_hour_id;
	}
	public void setTest_hour_id(Integer test_hour_id) {
		this.test_hour_id = test_hour_id;
	}
	public java.sql.Time getTest_hour() {
		return test_hour;
	}
	public void setTest_hour(java.sql.Time test_hour) {
		this.test_hour = test_hour;
	}
	public Test_periodVO(Integer test_hour_id, Time test_hour) {
		super();
		this.test_hour_id = test_hour_id;
		this.test_hour = test_hour;
	}
	public Test_periodVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
