package Test_period.model;

import java.sql.SQLException;
import java.util.List;



public interface ITest_periodDAO {
	public void insert(Test_period tes) throws SQLException;
	public void update(Test_period tes) throws SQLException;
	public void delete(Integer test_hour_id) throws SQLException;
	public Test_period findByPrimaryKey(Integer test_hour_id) throws SQLException;
	public List<Test_period> getAll() throws SQLException;
}
