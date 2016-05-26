package Member_status.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONValue;

import Stu_additional.model.Stu_additionalVO;

public class Member_statusService {
	private IMember_statusDAO dao;

	public Member_statusService() {
		dao = new Member_statusDAO();
	}
	
	public List<Member_statusVO> getAll() throws SQLException {
		return dao.getAll();
	}
	public String getStatusWAIT() throws SQLException {
		List memsc = new LinkedList();
		List<Member_statusVO> list = dao.getStatusWAIT();
		for(Member_statusVO memVO : list){
			
			Set<Stu_additionalVO> set = memVO.getStus();
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
	public List<Member_statusVO> getStatusOK() throws SQLException {
		return dao.getStatusOK();
	}
	public List<Member_statusVO> getStatusNO() throws SQLException {
		return dao.getStatusNO();
	}
	public List<Member_statusVO> getStatusNEVER() throws SQLException {
		return dao.getStatusNEVER();
	}
	public List<Member_statusVO> getStatusYES() throws SQLException {
		return dao.getStatusYES();
	}
	public List<Member_statusVO> getStatusWAITING() throws SQLException {
		return dao.getStatusWAITING();
	}
}
