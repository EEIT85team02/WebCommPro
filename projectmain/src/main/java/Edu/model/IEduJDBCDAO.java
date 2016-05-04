package Edu.model;

import java.sql.SQLException;
import java.util.List;



public interface IEduJDBCDAO {
	public int insert(Edu edu) throws SQLException;
	public int update(Edu edu) throws SQLException;
	public int delete(Integer edu_id) throws SQLException;
	public Edu findByPrimaryKey(Integer edu_id) throws SQLException;
	public List<Edu> getAll() throws SQLException;
	public void closeConn() throws SQLException;
	public void getConnection()throws SQLException;
}
