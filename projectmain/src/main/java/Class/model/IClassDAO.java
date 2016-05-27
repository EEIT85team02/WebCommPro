package Class.model;

import java.sql.SQLException;
import java.util.List;



public interface IClassDAO {
	public void insert(ClassVO cla) throws SQLException;
	public void update(ClassVO cla) throws SQLException;
	public void delete(String class_id) throws SQLException;
	public ClassVO findByPrimaryKey(String class_id) throws SQLException;
//	public String CheckClassId(String class_id) throws SQLException;
	public List<ClassVO> getAll() throws SQLException;
	public List<ClassVO> getAllClass() throws SQLException;
}
