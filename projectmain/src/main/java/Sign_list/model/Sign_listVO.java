package Sign_list.model;

import java.util.HashSet;
import java.util.Set;

import Class.model.ClassVO;
import Employee.model.EmployeeVO;

public class Sign_listVO {
	private Integer sl_id;
	private String sl_name;
	private Set<EmployeeVO> empVO = new HashSet<EmployeeVO>();
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
	public Set<EmployeeVO> getEmpVO() {
		return empVO;
	}
	public void setEmpVO(Set<EmployeeVO> empVO) {
		this.empVO = empVO;
	}
	public Sign_listVO(Integer sl_id, String sl_name, Set<EmployeeVO> empVO) {
		super();
		this.sl_id = sl_id;
		this.sl_name = sl_name;
		this.empVO = empVO;
	}
	public Sign_listVO() {
		super();
	}
	
	
}
