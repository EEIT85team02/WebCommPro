package Class.model;

import java.sql.SQLException;
import java.util.List;



public interface IClassDAO {
	public void insert(Class cla) throws SQLException;
	public void update(Class cla) throws SQLException;
	public void delete(String class_id) throws SQLException;
	public Class findByPrimaryKey(String class_id) throws SQLException;
	public List<Class> getAll() throws SQLException;
}
