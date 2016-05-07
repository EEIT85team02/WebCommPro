package Test_Date.model;

import java.sql.SQLException;
import java.util.List;



public interface ITest_DateDAO {
	public void insert(Test_Date tes) throws SQLException;
	public void update(Test_Date tes) throws SQLException;
	public void delete(Integer test_date_id) throws SQLException;
	public Test_Date findByPrimaryKey(Integer test_date_id) throws SQLException;
	public List<Test_Date> getAll() throws SQLException;
}
