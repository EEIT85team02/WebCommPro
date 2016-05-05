package Employee.model;

import java.sql.SQLException;
import java.util.List;



public interface IEmployeeDAO {
	public void insert(Employee emp) throws SQLException;
	public void update(Employee emp) throws SQLException;
	public void delete(String class_id) throws SQLException;
	public Employee findByPrimaryKey(String class_id) throws SQLException;
	public List<Employee> getAll() throws SQLException;
}
