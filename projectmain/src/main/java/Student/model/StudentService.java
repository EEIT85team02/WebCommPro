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
	public StudentVO upscore(String stu_group,String stu_note1,String stu_id,String stu_name,String stu_age,String stu_sch,String stu_sex,String stu_email,String stu_pre,Double stu_implement,String stu_testtime,Double stu_interview,String stu_total,String stu_workdate,String stu_except,String stu_final,String stu_note2) throws SQLException {

		StudentVO stuVO = new StudentVO();

		stuVO.setStu_group(stu_group);
		stuVO.setStu_note1(stu_note1);
		stuVO.setStu_id(stu_id);
		stuVO.setStu_name(stu_name);
		stuVO.setStu_age(stu_age);
		stuVO.setStu_sch(stu_sch);
		stuVO.setStu_sex(stu_sex);
		stuVO.setStu_email(stu_email);
		stuVO.setStu_pre(stu_pre);
		stuVO.setStu_implement(stu_implement);
		stuVO.setStu_testtime(stu_testtime);			
		stuVO.setStu_interview(stu_interview);
		stuVO.setStu_total(stu_total);
		stuVO.setStu_workdate(stu_workdate);
		stuVO.setStu_except(stu_except);
		stuVO.setStu_final(stu_final);
		stuVO.setStu_note2(stu_note2);

		dao.update(stuVO);
		
		return stuVO;
		
	}
}
