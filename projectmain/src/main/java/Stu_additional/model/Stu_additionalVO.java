package Stu_additional.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import Employee.model.EmployeeVO;
import Member_status.model.Member_statusVO;
import Student.model.StudentVO;
import Test_period.model.Test_periodVO;

public class Stu_additionalVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer stu_add_id ;
	private Date test_startdate ;
	private String stu_applytime;
	private Integer sta_id;
	private Time confirm_time ; 
	private StudentVO studentVO;
	private Member_statusVO Member_statusVO;
	private EmployeeVO EmployeeVO;
	private Test_periodVO Test_periodVO;
	
	
	public EmployeeVO getEmployeeVO() {
		return EmployeeVO;
	}
	public void setEmployeeVO(EmployeeVO employeeVO) {
		EmployeeVO = employeeVO;
	}
	public Test_periodVO getTest_periodVO() {
		return Test_periodVO;
	}
	public void setTest_periodVO(Test_periodVO test_periodVO) {
		Test_periodVO = test_periodVO;
	}
	
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
	public String getStu_applytime() {
		return stu_applytime;
	}
	public void setStu_applytime(String stu_applytime) {
		this.stu_applytime = stu_applytime;
	}
	public Member_statusVO getMember_statusVO() {
		return Member_statusVO;
	}
	public void setMember_statusVO(Member_statusVO member_statusVO) {
		Member_statusVO = member_statusVO;
	}
	public Integer getSta_id() {
		return sta_id;
	}
	public void setSta_id(Integer sta_id) {
		this.sta_id = sta_id;
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

}
