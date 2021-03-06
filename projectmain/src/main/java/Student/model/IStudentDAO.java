package Student.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import com.fullcalendar.model.CalendarVO;

import Stu_additional.model.Stu_additionalVO;
import Class.model.ClassVO;




public interface IStudentDAO {
	public void insert(StudentVO stu) throws SQLException;
	public void update(StudentVO stu) throws SQLException;
	public void delete(String class_id) throws SQLException;
	public StudentVO findByPrimaryKey(Integer stu_id) throws SQLException;
	public List<StudentVO> getAll() throws SQLException;
	public List<String> getAllGmail() throws SQLException;
	public List<String> getAllNonGmail() throws SQLException;
	public List<String> getAllClass() throws SQLException;
	public List<StudentVO> getAllStudentByClass(String class_id);	
	public Set<Stu_additionalVO> getStuByStu_id(Integer stu_id) throws SQLException;
	public StudentVO getStudentByEmail(String stu_email);
	public List<StudentVO> getAllCalendarStudentVOs();
	public StudentVO findStu_AddByStu_id(Integer stu_id);



}
