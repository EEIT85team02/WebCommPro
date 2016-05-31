package Employee.model;

import java.sql.SQLException;
import java.util.List;

import Class.model.ClassVO;



public interface IEmployeeDAO {
//	public void insert(EmployeeVO empVO) throws SQLException;
	public void update(EmployeeVO empVO) throws SQLException;
//	public void delete(String emp_id) throws SQLException;
	public EmployeeVO findByPrimaryKey(String emp_id) throws SQLException;
	public List<EmployeeVO> getAllEmp() throws SQLException;
//	public List<EmployeeVO> getAllEmployee() throws SQLException;
}
