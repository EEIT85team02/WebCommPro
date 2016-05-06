package Student.model;

import java.sql.SQLException;
import java.util.List;



public interface IStudentDAO {
	public void insert(Student stu) throws SQLException;
	public void update(Student stu) throws SQLException;
	public void delete(String class_id) throws SQLException;
	public Student findByPrimaryKey(String class_id) throws SQLException;
	public List<Student> getAll() throws SQLException;
	public List<String> getAllGmail() throws SQLException;
	public List<String> getAllNonGmail() throws SQLException;	
}
