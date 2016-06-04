package Test_period.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import Stu_additional.model.Stu_additionalVO;



public interface ITest_periodDAO {
	public void insert(Test_periodVO tpVO) throws SQLException;
	public void update(Test_periodVO tpVO) throws SQLException;
	public void delete(Integer test_hour_id) throws SQLException;
	public Test_periodVO findByPrimaryKey(Integer test_hour_id) throws SQLException;
	public List<Test_periodVO> getAllTp() throws SQLException;
}
