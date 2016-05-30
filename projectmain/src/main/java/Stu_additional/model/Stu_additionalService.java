package Stu_additional.model;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;

import Student.model.StudentVO;


public class Stu_additionalService {
	private IStu_additionalDAO dao;

	public Stu_additionalService() {
		dao = new Stu_additionalDAO();
	}
	public List<Stu_additionalVO> getAll() throws SQLException {
		return dao.getAll();
	}
	
	public String getOneStu(Integer stu_add_id) throws SQLException {	
		List stusc=new LinkedList();
		Stu_additionalVO stu_addVO=dao.findByStu_id(stu_add_id);
			Map map = new HashMap();
			map.put("stu_id",stu_addVO.getStudentVO().getStu_id());
			map.put("Test_startdate",stu_addVO.getTest_startdate());
			map.put("Test_hour_id",stu_addVO.getTest_hour_id());
			map.put("Stu_applytime(",stu_addVO.getStu_applytime());
			map.put("Emp_id",stu_addVO.getEmp_id());
			map.put("Confirm_time",stu_addVO.getConfirm_time());
			map.put("Member_statusVO",stu_addVO.getMem_stas());
			stusc.add(map);
		String jsonString = JSONValue.toJSONString(stusc);
		return jsonString;
		
	}
	
	
	
	public String getOneStu_add(Integer stu_id) throws SQLException {	
		List stusc=new LinkedList();
		Stu_additionalVO stu_addVO=dao.findByPrimaryKey2(stu_id);
			Map map = new HashMap();
			map.put("stu_id",stu_addVO.getStudentVO());
			map.put("Test_startdate",stu_addVO.getTest_startdate());
			map.put("Test_hour_id",stu_addVO.getTest_hour_id());
			map.put("Stu_applytime(",stu_addVO.getStu_applytime());
			map.put("Emp_id",stu_addVO.getEmp_id());
			map.put("Confirm_time",stu_addVO.getConfirm_time());
			map.put("Member_statusVO",stu_addVO.getMem_stas());
			stusc.add(map);
		String jsonString = JSONValue.toJSONString(stusc);
		return jsonString;
		
	}
}
