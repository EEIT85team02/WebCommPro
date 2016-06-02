package Test_Date.model;

import java.sql.SQLException;
import java.util.List;



public interface ITest_DateDAO {
	public void insert(Test_DateVO tes) throws SQLException;
	public void update(Test_DateVO tes) throws SQLException;
	public void delete(Integer test_date_id) throws SQLException;
	public Test_DateVO findByPrimaryKey(Integer test_date_id) throws SQLException;
	public List<Test_DateVO> getAll() throws SQLException;
	public List<Test_DateVO> getAllClassId(String class_id) throws SQLException;
}
