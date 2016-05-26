package Student.model;

import java.sql.SQLException;
import java.util.List;



public interface IStudentDAO {
	public void insert(StudentVO stu) throws SQLException;
	public void update(StudentVO stu) throws SQLException;
	public void delete(String class_id) throws SQLException;
	public StudentVO findByPrimaryKey(String stu_id) throws SQLException;
	public List<StudentVO> getAll() throws SQLException;
	public List<String> getAllGmail() throws SQLException;
	public List<String> getAllNonGmail() throws SQLException;
	public List<String> getAllClass() throws SQLException;
	public List<StudentVO> getAllStudentByClass(String class_id);	
}
