package Examiner_offday.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Examiner_offday implements Serializable{//主考官請假表
	private String	emp_id;  //員工代號
	private	java.sql.Timestamp	off_stardate;//請假開始日期
	private	java.sql.Timestamp	off_enddate;//請假結束日期
	private	Integer	off_day;//要寫判斷式 請假天數
	private String	emp_job_id;//職務代理人
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public java.sql.Timestamp getOff_stardate() {
		return off_stardate;
	}
	public void setOff_stardate(java.sql.Timestamp off_stardate) {
		this.off_stardate = off_stardate;
	}
	public java.sql.Timestamp getOff_enddate() {
		return off_enddate;
	}
	public void setOff_enddate(java.sql.Timestamp off_enddate) {
		this.off_enddate = off_enddate;
	}
	public Integer getOff_day() {
		return off_day;
	}
	public void setOff_day(Integer off_day) {
		this.off_day = off_day;
	}
	public String getEmp_job_id() {
		return emp_job_id;
	}
	public void setEmp_job_id(String emp_job_id) {
		this.emp_job_id = emp_job_id;
	}
	public Examiner_offday(String emp_id, Timestamp off_stardate,
			Timestamp off_enddate, Integer off_day, String emp_job_id) {
		super();
		this.emp_id = emp_id;
		this.off_stardate = off_stardate;
		this.off_enddate = off_enddate;
		this.off_day = off_day;
		this.emp_job_id = emp_job_id;
	}
	public Examiner_offday() {
		super();
	}
	
	
}
