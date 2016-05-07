package Member_test.model;


import java.io.Serializable;
import java.sql.Timestamp;

public class Member_test implements Serializable{//考生考試資料(有點擊連結進系統的學員)
	private	String	stu_id;//學員代號
	private	java.sql.Timestamp	test_startdate;//考試日期
	private	Integer	test_hour_id;//考試時段代號
	private	java.sql.Timestamp	mem_applytime;//預約報名時間
	private	Double	mem_implement;//上機考
	private	Double	mem_interview;//面試成績
	private	Integer	sta_id;//狀況代號
	private	String	emp_id;//員工代號(主考官)
	private java.sql.Timestamp mem_checktime ;//主考官確認時間
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
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
	public java.sql.Timestamp getMem_applytime() {
		return mem_applytime;
	}
	public void setMem_applytime(java.sql.Timestamp mem_applytime) {
		this.mem_applytime = mem_applytime;
	}
	public Double getMem_implement() {
		return mem_implement;
	}
	public void setMem_implement(Double mem_implement) {
		this.mem_implement = mem_implement;
	}
	public Double getMem_interview() {
		return mem_interview;
	}
	public void setMem_interview(Double mem_interview) {
		this.mem_interview = mem_interview;
	}
	public Integer getSta_id() {
		return sta_id;
	}
	public void setSta_id(Integer sta_id) {
		this.sta_id = sta_id;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public java.sql.Timestamp getMem_checktime() {
		return mem_checktime;
	}
	public void setMem_checktime(java.sql.Timestamp mem_checktime) {
		this.mem_checktime = mem_checktime;
	}
	public Member_test(String stu_id, Timestamp test_startdate, Integer test_hour_id,
			Timestamp mem_applytime, Double mem_implement,
			Double mem_interview, Integer sta_id, String emp_id, Timestamp mem_checktime) {
		super();
		this.stu_id = stu_id;
		this.test_startdate = test_startdate;
		this.test_hour_id = test_hour_id;
		this.mem_applytime = mem_applytime;
		this.mem_implement = mem_implement;
		this.mem_interview = mem_interview;
		this.sta_id = sta_id;
		this.emp_id = emp_id;
		this.mem_checktime = mem_checktime;
	}
	public Member_test() {
		super();
	}
	
}
