package Employee.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import Stu_additional.model.Stu_additionalVO;



public interface IEmployeeDAO {
	public void insert(EmployeeVO emp) throws SQLException;
	public void update(EmployeeVO emp) throws SQLException;
	public void delete(String class_id) throws SQLException;
	public EmployeeVO findByPrimaryKey(String class_id) throws SQLException;
	public List<EmployeeVO> getAll() throws SQLException;
	public Set<Stu_additionalVO> getEmpByEmp_id(String emp_id) throws SQLException;
}
