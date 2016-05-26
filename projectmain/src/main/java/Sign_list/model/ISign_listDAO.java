package Sign_list.model;

import java.sql.SQLException;
import java.util.List;



public interface ISign_listDAO {
	public void update(Sign_listVO slVO) throws SQLException;
	public void delete(String emp_id) throws SQLException;
	public Sign_listVO findByPrimaryKey(String emp_id) throws SQLException;
	public List<Sign_listVO> getAllSl() throws SQLException;
}
