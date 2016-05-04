package Sign_list.model;

import java.sql.SQLException;
import java.util.List;



public interface ISign_listDAO {
	public void insert(Sign_list sig) throws SQLException;
	public void update(Sign_list sig) throws SQLException;
	public void delete(Integer sl_id) throws SQLException;
	public Sign_list findByPrimaryKey(Integer sl_id) throws SQLException;
	public List<Sign_list> getAll() throws SQLException;
}
