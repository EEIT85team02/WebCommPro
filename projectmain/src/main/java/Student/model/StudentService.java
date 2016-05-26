package Student.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;


public class StudentService {
	private IStudentDAO dao;

	public StudentService() {
		dao = new StudentDAO();
	}
	public List<StudentVO> getAll() throws SQLException {
		return dao.getAll();
	}
	public String getOneStu(String stu_id) throws SQLException {	
		List stusc=new LinkedList();
		StudentVO stuVO=dao.findByPrimaryKey(stu_id);
			Map map = new HashMap();
			map.put("stu_id",stuVO.getStu_id());
			map.put("stu_name",stuVO.getStu_name());
			map.put("stu_implement",stuVO.getStu_implement());
			map.put("stu_interview",stuVO.getStu_interview());
			stusc.add(map);
		String jsonString = JSONValue.toJSONString(stusc);
		return jsonString;
		
	}
	public StudentVO upscore(Integer stu_group,String stu_note1,String stu_id,String stu_name,Integer stu_age,String stu_sch,String stu_sex,String stu_email,String stu_pre,String stu_testtime,String stu_total,String stu_workdate,Integer stu_except,String stu_final,String stu_note2,Double stu_implement,Double stu_interview) throws SQLException {

		StudentVO stuVO = new StudentVO();

		stuVO.setStu_group(stu_group);			
		stuVO.setStu_note1(stu_note1);
		stuVO.setStu_age(stu_age);			
		stuVO.setStu_sch(stu_sch);
		stuVO.setStu_sex(stu_sex);			
		stuVO.setStu_email(stu_email);
		stuVO.setStu_pre(stu_pre);			
		stuVO.setStu_testtime(stu_testtime);
		stuVO.setStu_id(stu_total);			
		stuVO.setStu_name(stu_workdate);
		stuVO.setStu_except(stu_except);			
		stuVO.setStu_final(stu_final);
		stuVO.setStu_note2(stu_note2);
		stuVO.setStu_id(stu_id);			
		stuVO.setStu_name(stu_name);
		stuVO.setStu_implement(stu_implement);			
		stuVO.setStu_interview(stu_interview);

		dao.update(stuVO);
		
		return stuVO;
		
	}
	public String getAllScoreJSON() throws SQLException{
		List stusc=new LinkedList();
		List<StudentVO> list=dao.getAll();	
		for(StudentVO stuVO :list){
			Map map = new HashMap();
			map.put("stu_id",stuVO.getStu_id());
			map.put("stu_name",stuVO.getStu_name());
			map.put("stu_implement",stuVO.getStu_implement());
			map.put("stu_interview",stuVO.getStu_interview());
			stusc.add(map);
		}
		String jsonString = JSONValue.toJSONString(stusc);
		return jsonString;
	}
}
