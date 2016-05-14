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
	public StudentVO getOneStu(String stu_id) throws SQLException {
		return dao.findByPrimaryKey(stu_id);
	}
	public StudentVO upscore(String stu_id,String stu_name,Double stu_implement,Double stu_interview,String stu_group,String stu_age,String stu_email) throws SQLException {

		StudentVO stuVO = new StudentVO();

		stuVO.setStu_id(stu_id);
		stuVO.setStu_name(stu_name);
		stuVO.setStu_implement(stu_implement);
		stuVO.setStu_interview(stu_interview);
		stuVO.setStu_group(stu_group);
		stuVO.setStu_age(stu_age);
		stuVO.setStu_email(stu_email);

		dao.update(stuVO);
	

		return dao.findByPrimaryKey(stu_id);
	}
}
