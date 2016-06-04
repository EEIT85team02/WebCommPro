package Test_interval.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import Class.model.ClassVO;

public class Test_intervalVO implements Serializable{//考試時段資料表
	private Integer test_interval_id ;// 考試日期代號
	
	private	java.sql.Date test_startdate;//考試開始日期
	private	java.sql.Date test_enddate;//考試結束日期
	private	ClassVO claVO;   //class_id班級代號

	public Integer getTest_interval_id() {
		return test_interval_id;
	}


	public void setTest_interval_id(Integer test_interval_id) {
		this.test_interval_id = test_interval_id;
	}


	


	public java.sql.Date getTest_startdate() {
		return test_startdate;
	}


	public void setTest_startdate(java.sql.Date test_startdate) {
		this.test_startdate = test_startdate;
	}


	public java.sql.Date getTest_enddate() {
		return test_enddate;
	}


	public void setTest_enddate(java.sql.Date test_enddate) {
		this.test_enddate = test_enddate;
	}


	public ClassVO getClaVO() {
		return claVO;
	}


	public void setClaVO(ClassVO claVO) {
		this.claVO = claVO;
	}


	public Test_intervalVO(Integer test_interval_id, Date test_startdate,
			Date test_enddate, ClassVO claVO) {
		super();
		this.test_interval_id = test_interval_id;
		this.test_startdate = test_startdate;
		this.test_enddate = test_enddate;
		this.claVO = claVO;
	}


	public Test_intervalVO() {
		super();
		
	}
	
}
