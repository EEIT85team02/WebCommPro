package Stu_additional.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import Member_status.model.Member_statusVO;
import Student.model.StudentVO;

public class Stu_additionalVO implements Serializable{
	private String test_startdate ;
	private Integer test_hour_id ;
	private String stu_applytime;
	private String emp_id ; 
	private String confirm_time ; 
	private String class_id ;
	private String log_pw ;
    
	private StudentVO studentVO;
	
	public StudentVO getStudentVO() {
		return studentVO;
	}
	public void setStudentVO(StudentVO studentVO) {
		this.studentVO = studentVO;
	}
	private Member_statusVO member_statusVO;

	public Member_statusVO getMember_statusVO() {
		return member_statusVO;
	}
	public void setMember_statusVO(Member_statusVO member_statusVO) {
		this.member_statusVO = member_statusVO;
	}
	public String getTest_startdate() {
		return test_startdate;
	}
	public void setTest_startdate(String test_startdate) {
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
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getConfirm_time() {
		return confirm_time;
	}
	public void setConfirm_time(String confirm_time) {
		this.confirm_time = confirm_time;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getLog_pw() {
		return log_pw;
	}
	public void setLog_pw(String log_pw) {
		this.log_pw = log_pw;
	}
}
