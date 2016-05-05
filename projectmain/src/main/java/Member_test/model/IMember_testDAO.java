package Member_test.model;

import java.sql.SQLException;
import java.util.List;



public interface IMember_testDAO {
	public void insert(Member_test mem) throws SQLException;
	public void update(Member_test mem) throws SQLException;
	public void delete(String stu_id) throws SQLException;
	public Member_test findByPrimaryKey(String stu_id) throws SQLException;
	public List<Member_test> getAll() throws SQLException;
}
