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
}
