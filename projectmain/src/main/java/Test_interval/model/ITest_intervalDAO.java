package Test_interval.model;

import java.sql.SQLException;
import java.util.List;



public interface ITest_intervalDAO {
	public void insert(Test_intervalVO tiVO) throws SQLException;
	public void update(Test_intervalVO tiVO) throws SQLException;
	public void delete(Integer test_interval_id) throws SQLException;
	public Test_intervalVO findByPrimaryKey(Integer test_interval_id) throws SQLException;
	//驗證CLASS_ID是否存在資料表
	public List<Test_intervalVO> findByTiClass_id(String class_id)throws SQLException;
	public List<Test_intervalVO> getAll() throws SQLException;
}
