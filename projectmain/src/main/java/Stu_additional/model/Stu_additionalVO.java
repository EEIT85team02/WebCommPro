package Stu_additional.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import Employee.model.EmployeeVO;
import Member_status.model.Member_statusVO;
import Student.model.StudentVO;

public class Stu_additionalVO implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer stu_add_id ;
	private Timestamp test_start;
	private Timestamp test_end;

	private Timestamp stu_applytime;
	private Timestamp confirm_time ; 

	private StudentVO studentVO;
	private Member_statusVO Member_statusVO;
	private EmployeeVO EmployeeVO;
	private String title;

	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public EmployeeVO getEmployeeVO() {
		return EmployeeVO;
	}
	public void setEmployeeVO(EmployeeVO employeeVO) {
		EmployeeVO = employeeVO;

	}	

	public Integer getStu_add_id() {
		return stu_add_id;
	}
	public void setStu_add_id(Integer stu_add_id) {
		this.stu_add_id = stu_add_id;
	}	
	public Timestamp getTest_start() {
		return test_start;
	}
	public void setTest_start(Timestamp test_start) {
		this.test_start = test_start;
	}
	public Timestamp getTest_end() {
		return test_end;
	}
	public void setTest_end(Timestamp test_end) {
		this.test_end = test_end;
	}
	public Timestamp getStu_applytime() {
		return stu_applytime;
	}
	public void setStu_applytime(Timestamp stu_applytime) {
		this.stu_applytime = stu_applytime;
	}
	public Member_statusVO getMember_statusVO() {
		return Member_statusVO;
	}
	public void setMember_statusVO(Member_statusVO member_statusVO) {
		Member_statusVO = member_statusVO;
	}
	public Timestamp getConfirm_time() {
		return confirm_time;
	}
	public void setConfirm_time(Timestamp confirm_time) {
		this.confirm_time = confirm_time;
	}
	public StudentVO getStudentVO() {
		return studentVO;
	}
	public void setStudentVO(StudentVO studentVO) {
		this.studentVO = studentVO;
	}

}
