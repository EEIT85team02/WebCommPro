package Employee.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import Examiner_offday.model.Examiner_offdayVO;
import Sign_list.model.Sign_listVO;
import Stu_additional.model.Stu_additionalVO;

public class EmployeeVO implements Serializable{//員工
	private	String	emp_id;//員工代號
	private	String	emp_name;//姓名
	private	Integer	dep_id;//部門編號
	private	String	dep_name;//部門名稱
	private	String	emp_mail;//mail
	private Sign_listVO slVO;   //代表代號sl_id(sign_list) 
	private Set<Stu_additionalVO> Stu_additionalVO = new HashSet<Stu_additionalVO>();
	private Set<Examiner_offdayVO> examVO = new HashSet<Examiner_offdayVO>();
	
	
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public Integer getDep_id() {
		return dep_id;
	}
	public void setDep_id(Integer dep_id) {
		this.dep_id = dep_id;
	}
	public String getDep_name() {
		return dep_name;
	}
	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}
	public String getEmp_mail() {
		return emp_mail;
	}
	public void setEmp_mail(String emp_mail) {
		this.emp_mail = emp_mail;
	}
	public Set<Stu_additionalVO> getStu_additionalVO() {
		return Stu_additionalVO;
	}
	public void setStu_additionalVO(Set<Stu_additionalVO> stu_additionalVO) {
		Stu_additionalVO = stu_additionalVO;
	}


	public Sign_listVO getSlVO() {
		return slVO;
	}

	public void setSlVO(Sign_listVO slVO) {
		this.slVO = slVO;
	}

	public Set<Examiner_offdayVO> getExamVO() {
		return examVO;
	}
	public void setExamVO(Set<Examiner_offdayVO> examVO) {
		this.examVO = examVO;
	}
	public EmployeeVO(String emp_id, String emp_name, String emp_mail,
			String dep_name, Sign_listVO slVO) {
		super();
		this.emp_id = emp_id;
		this.emp_name = emp_name;
		this.emp_mail = emp_mail;
		this.dep_name = dep_name;
		this.slVO = slVO;
		
	}
	
	public EmployeeVO() {
		super();
	}
	
	
}
