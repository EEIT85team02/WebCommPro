package Sign_list.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import Class.model.ClassVO;
import Edu.model.EduVO;
import Employee.model.EmployeeVO;



public interface ISign_listDAO {
	public void insert(Sign_listVO slVO) throws SQLException;
	public void update(Sign_listVO slVO) throws SQLException;
	public void delete(Integer sl_id) throws SQLException;
	public Sign_listVO findByPrimaryKey(Integer sl_id) throws SQLException;
	public List<Sign_listVO> getAllSl() throws SQLException;
	public Set<EmployeeVO> getEmpBySl_id(Integer sl_id);
}
