package view_examiner.model;

import java.sql.Timestamp;

public class view_examiner {//檢視主考官
	private	int	emp_id;//員工代號
	private	java.sql.Timestamp	off_stardate;//請假開始日期
	private	java.sql.Timestamp	off_enddate;//請假結束日期
	private	int	off_day;//請假天數
	private	int	emp_id2;//職務代理人
	private	int	dep_id;//部門編號
	private	int	sp_id;//權限代號（員工權限表select權限為主考官join主考官請假表）
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
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
	public int getOff_day() {
		return off_day;
	}
	public void setOff_day(int off_day) {
		this.off_day = off_day;
	}
	public int getEmp_id2() {
		return emp_id2;
	}
	public void setEmp_id2(int emp_id2) {
		this.emp_id2 = emp_id2;
	}
	public int getDep_id() {
		return dep_id;
	}
	public void setDep_id(int dep_id) {
		this.dep_id = dep_id;
	}
	public int getSp_id() {
		return sp_id;
	}
	public void setSp_id(int sp_id) {
		this.sp_id = sp_id;
	}
	public view_examiner(int emp_id, Timestamp off_stardate,
			Timestamp off_enddate, int off_day, int emp_id2, int dep_id,
			int sp_id) {
		super();
		this.emp_id = emp_id;
		this.off_stardate = off_stardate;
		this.off_enddate = off_enddate;
		this.off_day = off_day;
		this.emp_id2 = emp_id2;
		this.dep_id = dep_id;
		this.sp_id = sp_id;
	}
	public view_examiner() {
		super();
	}
}
