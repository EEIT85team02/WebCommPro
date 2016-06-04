package Member_status.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONValue;

import Edu.model.EduVO;
import Stu_additional.model.Stu_additionalVO;

public class Member_statusService {
	private IMember_statusDAO dao;

	public Member_statusService() {
		dao = new Member_statusDAO();
	}
	
	public List<Member_statusVO> getAll() throws SQLException {
		return dao.getAll();
	}
	
	public String getStatusOK() throws SQLException {
		List memsc = new LinkedList();
		List<Member_statusVO> list = dao.getStatusOK();
		for(Member_statusVO memVO : list){
			
			Set<Stu_additionalVO> set = memVO.getStu_additionalVO();
			for(Stu_additionalVO stuVO:set){
			Map map = new HashMap();
			map.put("stu_name",stuVO.getStudentVO().getStu_name());
			map.put("stu_email",stuVO.getStudentVO().getStu_email());
			map.put("stu_id",stuVO.getStudentVO().getStu_id());
			map.put("stu_applytime",stuVO.getStu_applytime());
			map.put("sta_name",stuVO.getMember_statusVO().getSta_name());
			map.put("stu_add_id",stuVO.getStu_add_id());
			memsc.add(map);
			}
		}
		String jsonString = JSONValue.toJSONString(memsc);
		return jsonString;
	}
	public String getStatusNO() throws SQLException {
		List memsc = new LinkedList();
		List<Member_statusVO> list = dao.getStatusNO();
		for(Member_statusVO memVO : list){
			
			Set<Stu_additionalVO> set = memVO.getStu_additionalVO();
			for(Stu_additionalVO stuVO:set){
			Map map = new HashMap();
			map.put("stu_name",stuVO.getStudentVO().getStu_name());
			map.put("stu_email",stuVO.getStudentVO().getStu_email());
			map.put("stu_id",stuVO.getStudentVO().getStu_id());
			map.put("stu_applytime",stuVO.getStu_applytime());
			map.put("sta_name",stuVO.getMember_statusVO().getSta_name());
			map.put("stu_add_id",stuVO.getStu_add_id());
			memsc.add(map);
			}
		}
		String jsonString = JSONValue.toJSONString(memsc);
		return jsonString;
	}
	public String getStatusNEVER() throws SQLException {
		List memsc = new LinkedList();
		List<Member_statusVO> list = dao.getStatusNEVER();
		for(Member_statusVO memVO : list){
			
			Set<Stu_additionalVO> set = memVO.getStu_additionalVO();
			for(Stu_additionalVO stuVO:set){
			Map map = new HashMap();
			map.put("stu_name",stuVO.getStudentVO().getStu_name());
			map.put("stu_email",stuVO.getStudentVO().getStu_email());
			map.put("stu_id",stuVO.getStudentVO().getStu_id());
			map.put("stu_applytime",stuVO.getStu_applytime());
			map.put("sta_name",stuVO.getMember_statusVO().getSta_name());
			memsc.add(map);
			}
		}
		String jsonString = JSONValue.toJSONString(memsc);
		return jsonString;
	}
	public String getStatusYES() throws SQLException {
		List memsc = new LinkedList();
		List<Member_statusVO> list = dao.getStatusYES();
		for(Member_statusVO memVO : list){
			
			Set<Stu_additionalVO> set = memVO.getStu_additionalVO();
			for(Stu_additionalVO stuVO:set){
			Map map = new HashMap();
			map.put("stu_name",stuVO.getStudentVO().getStu_name());
			map.put("stu_email",stuVO.getStudentVO().getStu_email());
			map.put("stu_id",stuVO.getStudentVO().getStu_id());
			map.put("stu_applytime",stuVO.getStu_applytime());
			map.put("sta_name",stuVO.getMember_statusVO().getSta_name());
			memsc.add(map);
			}
		}
		String jsonString = JSONValue.toJSONString(memsc);
		return jsonString;
	}
	
}
