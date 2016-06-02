package Test_period.model;

import java.io.Serializable;
import java.sql.Time;
import java.util.HashSet;
import java.util.Set;
import Test_Date.model.Test_DateVO;
import Class.model.ClassVO;
import Stu_additional.model.Stu_additionalVO;
import Student.model.StudentVO;


public class Test_periodVO implements Serializable{//考試時段資料表
	private Integer test_hour_id;//考試時段代號
	private	java.sql.Time	test_starthour   ;//考試開始時間
	private	java.sql.Time	test_endhour    ;//考試結束時間
	private Set<Test_DateVO> tds = new HashSet<Test_DateVO>();
	private Set<Stu_additionalVO> Stu_additionalVO = new HashSet<Stu_additionalVO>();	

	
	public Integer getTest_hour_id() {
		return test_hour_id;
	}

	public void setTest_hour_id(Integer test_hour_id) {
		this.test_hour_id = test_hour_id;
	}

	public java.sql.Time getTest_starthour() {
		return test_starthour;
	}

	public void setTest_starthour(java.sql.Time test_starthour) {
		this.test_starthour = test_starthour;
	}

	public java.sql.Time getTest_endhour() {
		return test_endhour;
	}

	public void setTest_endhour(java.sql.Time test_endhour) {
		this.test_endhour = test_endhour;
	}

	
	public Set<Test_DateVO> getTds() {
		return tds;
	}
	public void setTds(Set<Test_DateVO> tds) {
		this.tds = tds;
	}
	
	public Test_periodVO(Integer test_hour_id, Time test_starthour,
			Time test_endhour, Set<Test_DateVO> tds) {
		super();
		this.test_hour_id = test_hour_id;
		this.test_starthour = test_starthour;
		this.test_endhour = test_endhour;
		this.tds = tds;


	public Set<Stu_additionalVO> getStu_additionalVO() {
		return Stu_additionalVO;
	}

	public void setStu_additionalVO(Set<Stu_additionalVO> stu_additionalVO) {
		Stu_additionalVO = stu_additionalVO;
	}

	public Test_periodVO() {
		super();
	}

	
	
	
}
