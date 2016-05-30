package Stu_additional.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.util.HashSet;
import java.util.Set;

import Member_status.model.Member_statusVO;
import Student.model.StudentVO;

public class Stu_additionalVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer stu_add_id ;
	private Date test_startdate ;
	private Integer test_hour_id ;
	private String stu_applytime;
	private Integer sta_id;
	private String emp_id ;
	private Time confirm_time ; 
	private StudentVO studentVO;
	private Set<Member_statusVO> Mem_stas;
	
	
	public Integer getStu_add_id() {
		return stu_add_id;
	}
	public void setStu_add_id(Integer stu_add_id) {
		this.stu_add_id = stu_add_id;
	}
	public Date getTest_startdate() {
		return test_startdate;
	}
	public void setTest_startdate(Date test_startdate) {
		this.test_startdate = test_startdate;
	}
	public Integer getTest_hour_id() {
		return test_hour_id;
	}
	public void setTest_hour_id(Integer test_hour_id) {
		this.test_hour_id = test_hour_id;
	}
	public String getStu_applytime() {
		return stu_applytime;
	}
	public void setStu_applytime(String stu_applytime) {
		this.stu_applytime = stu_applytime;
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
	public Time getConfirm_time() {
		return confirm_time;
	}
	public void setConfirm_time(Time confirm_time) {
		this.confirm_time = confirm_time;
	}
	public StudentVO getStudentVO() {
		return studentVO;
	}
	public void setStudentVO(StudentVO studentVO) {
		this.studentVO = studentVO;
	}
	public Set<Member_statusVO> getMem_stas() {
		return Mem_stas;
	}
	public void setMem_stas(Set<Member_statusVO> mem_stas) {
		Mem_stas = mem_stas;
	}



}
