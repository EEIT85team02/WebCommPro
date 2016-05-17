package Sign_list.model;

import java.sql.SQLException;
import java.util.List;

public interface ISign_listDAO {
	public void insert(Sign_listVO slVO);
	//public void update(Sign_listVO slVO);
	//public void delete(String emp_id);
	public Sign_listVO findByPrimaryKey(String emp_id);
	//public List<Sign_listVO> getAllSl();
}
