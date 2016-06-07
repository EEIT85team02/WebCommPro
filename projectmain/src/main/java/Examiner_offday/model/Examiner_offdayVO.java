package Examiner_offday.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import Employee.model.EmployeeVO;

public class Examiner_offdayVO implements Serializable{//主考官請假表
	private Integer exam_id;//請假單單號
	private	Date off_startdate;//請假開始日期
	private	Date off_enddate;//請假結束日期
	private	Integer	off_day;//要寫判斷式 請假天數
	private String	emp_job_id;//職務代理人
	private EmployeeVO empVO;   //代表員工代號emp_id(Employee)
	
	
	public Integer getExam_id() {
		return exam_id;
	}
	public void setExam_id(Integer exam_id) {
		this.exam_id = exam_id;
	}
	public Date getOff_startdate() {
		return off_startdate;
	}
	public void setOff_startdate(Date off_startdate) {
		this.off_startdate = off_startdate;
	}
	public Date getOff_enddate() {
		return off_enddate;
	}
	public void setOff_enddate(Date off_enddate) {
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
	
	public EmployeeVO getEmpVO() {
		return empVO;
	}
	public void setEmpVO(EmployeeVO empVO) {
		this.empVO = empVO;
	}
	public Examiner_offdayVO(Integer exam_id,Date off_startdate,Date off_enddate, 
			Integer off_day, String emp_job_id, EmployeeVO empVO) {
		super();
		this.exam_id = exam_id;
		this.off_startdate = off_startdate;
		this.off_enddate = off_enddate;
		this.off_day = off_day;
		this.emp_job_id = emp_job_id;
		this.empVO = empVO;
	}
	public Examiner_offdayVO() {
		super();
	}
	
}
