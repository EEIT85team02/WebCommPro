package Member_status.model;

import java.sql.SQLException;
import java.util.List;



public interface IMember_statusDAO {
	public void insert(Member_status mem) throws SQLException;
	public void update(Member_status mem) throws SQLException;
	public void delete(Integer sta_id) throws SQLException;
	public Member_status findByPrimaryKey(Integer sta_id) throws SQLException;
	public List<Member_status> getAll() throws SQLException;
}
