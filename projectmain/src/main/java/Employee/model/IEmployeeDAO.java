package Employee.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import Stu_additional.model.Stu_additionalVO;
import Class.model.ClassVO;



public interface IEmployeeDAO {


//	public void insert(EmployeeVO empVO) throws SQLException;
	public void update(EmployeeVO empVO) throws SQLException;
//	public void delete(String emp_id) throws SQLException;
	public EmployeeVO findByPrimaryKey(String emp_id) throws SQLException;
	public List<EmployeeVO> getAllEmp() throws SQLException;
//	public List<EmployeeVO> getAllEmployee() throws SQLException;
	public Set<Stu_additionalVO> getEmpByEmp_id(String emp_id) throws SQLException;
	public EmployeeVO getEmployeeByEmail(String emp_mail);

}
