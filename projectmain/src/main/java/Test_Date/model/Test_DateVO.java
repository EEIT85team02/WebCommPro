package Test_Date.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import Class.model.ClassVO;
import Test_period.model.Test_periodVO;

public class Test_DateVO implements Serializable{//班級考試日期時段
	private Integer test_date_id;//考試日期時段代號
	private	java.sql.Date	test_date;//考試日期
	private	Integer	test_people;//可報名人數/時段
	private Integer exam_people ;//已報名人數default(0)
	private	Test_periodVO tpVO;//考試時段代號test_hour_id
	private	ClassVO claVO; //class_id班級代號
	
	public Integer getTest_date_id() {
		return test_date_id;
	}


	public void setTest_date_id(Integer test_date_id) {
		this.test_date_id = test_date_id;
	}


	public java.sql.Date getTest_date() {
		return test_date;
	}


	public void setTest_date(java.sql.Date test_date) {
		this.test_date = test_date;
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




	public Test_periodVO getTpVO() {
		return tpVO;
	}


	public void setTpVO(Test_periodVO tpVO) {
		this.tpVO = tpVO;
	}


	public ClassVO getClaVO() {
		return claVO;
	}




	public void setClaVO(ClassVO claVO) {
		this.claVO = claVO;
	}

	public Test_DateVO(Integer test_date_id, Date test_date,
			Integer test_people, Integer exam_people, Test_periodVO tpVO,
			ClassVO claVO) {
		super();
		this.test_date_id = test_date_id;
		this.test_date = test_date;
		this.test_people = test_people;
		this.exam_people = exam_people;
		this.tpVO = tpVO;
		this.claVO = claVO;
	}

	public Test_DateVO() {
		super();
	}
	
}
