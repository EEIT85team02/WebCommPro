package Test_Date.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Test_DateVO implements Serializable{//班級考試日期時段
	private Integer test_date_id;//考試日期時段代號
	private	String	class_id;//班級代號
	private	java.sql.Timestamp	test_startdate;//考試日期
	private	Integer	test_hour_id;//考試時段代號
	private	Integer	test_people;//可報名人數/時段
	private Integer exam_people ;//已報名人數default(0)
	public Integer getTest_date_id() {
		return test_date_id;
	}
	public void setTest_date_id(Integer test_date_id) {
		this.test_date_id = test_date_id;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public java.sql.Timestamp getTest_startdate() {
		return test_startdate;
	}
	public void setTest_startdate(java.sql.Timestamp test_startdate) {
		this.test_startdate = test_startdate;
	}
	public Integer getTest_hour_id() {
		return test_hour_id;
	}
	public void setTest_hour_id(Integer test_hour_id) {
		this.test_hour_id = test_hour_id;
	}
	public Integer getTest_people() {
		return test_people;
	}
	public void setTest_people(Integer test_people) {
		this.test_people = test_people;
	}
	public Integer getExam_people() {
		return exam_people;
	}
	public void setExam_people(Integer exam_people) {
		this.exam_people = exam_people;
	}
	public Test_DateVO(Integer test_date_id, String class_id,
			Timestamp test_startdate, Integer test_hour_id, Integer test_people,
			Integer exam_people) {
		super();
		this.test_date_id = test_date_id;
		this.class_id = class_id;
		this.test_startdate = test_startdate;
		this.test_hour_id = test_hour_id;
		this.test_people = test_people;
		this.exam_people = exam_people;
	}
	public Test_DateVO() {
		super();
	}
	
}
