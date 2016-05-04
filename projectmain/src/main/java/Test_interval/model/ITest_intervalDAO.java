package Test_interval.model;

import java.sql.SQLException;
import java.util.List;



public interface ITest_intervalDAO {
	public void insert(Test_interval tes) throws SQLException;
	public void update(Test_interval tes) throws SQLException;
	public void delete(Integer test_interval_id) throws SQLException;
	public Test_interval findByPrimaryKey(Integer test_interval_id) throws SQLException;
	public List<Test_interval> getAll() throws SQLException;
}
