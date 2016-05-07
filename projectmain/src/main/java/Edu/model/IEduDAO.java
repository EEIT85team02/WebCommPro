package Edu.model;

import java.sql.SQLException;
import java.util.List;



public interface IEduDAO {
	public void insert(Edu edu) throws SQLException;
	public void update(Edu edu) throws SQLException;
	public void delete(Integer edu_id) throws SQLException;
	public Edu findByPrimaryKey(Integer edu_id) throws SQLException;
	public List<Edu> getAll() throws SQLException;
}
