package Sign_list.model;

public class Sign_listVO {
	private String emp_id ; 	//員工編號(employee)	  
	private String emp_name ;	//員工姓名(employee)
	private String emp_mail;    //員工email(employee)
	private Integer dep_id;     //部門編號(employee)
	private String dep_name;    //部門名稱(employee)
	private Integer sl_id;      //權限代號(sign_list)
	private String sl_name;     //權限名稱(sign_list)
	
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

	public String getEmp_mail() {
		return emp_mail;
	}

	public void setEmp_mail(String emp_mail) {
		this.emp_mail = emp_mail;
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

	public Integer getSl_id() {
		return sl_id;
	}

	public void setSl_id(Integer sl_id) {
		this.sl_id = sl_id;
	}

	public String getSl_name() {
		return sl_name;
	}

	public void setSl_name(String sl_name) {
		this.sl_name = sl_name;
	}

	public Sign_listVO() {
		super();
	}
	
}
