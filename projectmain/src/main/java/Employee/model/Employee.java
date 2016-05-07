package Employee.model;

import java.io.Serializable;

public class Employee implements Serializable{//員工
	private	String	emp_id;//員工代號
	private	String	emp_lastname;//姓
	private	String  emp_firstname;//名
	private	Integer	dep_id;//部門編號
	private	String	dep_name;//部門名稱
	private	String	emp_mail;//mail
	private	Integer	sl_id;//權限代號
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_lastname() {
		return emp_lastname;
	}
	public void setEmp_lastname(String emp_lastname) {
		this.emp_lastname = emp_lastname;
	}
	public String getEmp_firstname() {
		return emp_firstname;
	}
	public void setEmp_firstname(String emp_firstname) {
		this.emp_firstname = emp_firstname;
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
	public Integer getSl_id() {
		return sl_id;
	}
	public void setSl_id(Integer sl_id) {
		this.sl_id = sl_id;
	}
	public Employee(String emp_id, String emp_lastname, String emp_firstname,
			Integer dep_id, String dep_name, String emp_mail, Integer sl_id) {
		super();
		this.emp_id = emp_id;
		this.emp_lastname = emp_lastname;
		this.emp_firstname = emp_firstname;
		this.dep_id = dep_id;
		this.dep_name = dep_name;
		this.emp_mail = emp_mail;
		this.sl_id = sl_id;
	}
	public Employee() {
		super();
	}
	
}
