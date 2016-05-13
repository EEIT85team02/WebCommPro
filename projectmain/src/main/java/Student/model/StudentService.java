package Student.model;

import java.sql.SQLException;
import java.util.List;

public class StudentService {
	private IStudentDAO dao;

	public StudentService() {
		dao = new StudentDAO();
	}
	public List<StudentVO> getAll() throws SQLException {
		return dao.getAll();
	}
	public StudentVO upscore(String stu_id,String stu_name,Double stu_implement,Double stu_interview) throws SQLException {

		StudentVO stu = new StudentVO();

		stu.setStu_id(stu_id);
		stu.setStu_name(stu_name);
		stu.setStu_implement(stu_implement);
		stu.setStu_interview(stu_interview);

		dao.update(stu);
	

		return stu;
	}
}
