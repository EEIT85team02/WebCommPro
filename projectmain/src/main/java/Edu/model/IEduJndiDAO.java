package Edu.model;

import java.sql.SQLException;
import java.util.List;



public interface IEduJndiDAO {
	public int insert(EduVO edu) throws SQLException;
	public int update(EduVO edu) throws SQLException;
	public int delete(Integer edu_id) throws SQLException;
	public EduVO findByPrimaryKey(Integer edu_id) throws SQLException;
	public List<EduVO> getAll() throws SQLException;
	public void closeConn() throws SQLException;
}
