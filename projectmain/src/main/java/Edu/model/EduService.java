package Edu.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONValue;

import Class.model.ClassVO;

public class EduService {
	private IEduDAO dao;

	public EduService() {
		dao= new EduDAO();
	}
	
	
	public void insertEdu( String edu_name, String edu_add,
			String edu_tel, String edu_contact) throws SQLException {
		EduVO edu = new EduVO();
		edu.setEdu_name(edu_name);
		edu.setEdu_add(edu_add);
		edu.setEdu_tel(edu_tel);
		edu.setEdu_contact(edu_contact);
		dao.insert(edu);
	}
	
	public void updateEdu(Integer edu_id,String edu_name, String edu_add,
			String edu_tel, String edu_contact) throws SQLException {
		EduVO edu = new EduVO();
		edu.setEdu_id(edu_id);
		edu.setEdu_name(edu_name);
		edu.setEdu_add(edu_add);
		edu.setEdu_tel(edu_tel);
		edu.setEdu_contact(edu_contact);
		
		dao.update(edu);
	}
	public void deleteEdu(Integer edu_id) throws SQLException{
		dao.delete(edu_id);
	}
	public EduVO findByPrimaryKeyEdu(Integer edu_id) throws SQLException{
		return dao.findByPrimaryKey(edu_id);
	}
	public List<EduVO> getAllEdu() throws SQLException{
		return dao.getAll();
	}
	public String getAllEduToJSON() throws SQLException{
		List edus=new LinkedList();
		List<EduVO> list=dao.getAll();
		String jsonString= null;
		for(EduVO eduVO :list){
			Map<String,String> map = new HashMap<String,String>();
			map.put("edu_id",eduVO.getEdu_id().toString());
			map.put("edu_name",eduVO.getEdu_name());
			map.put("edu_add",eduVO.getEdu_add());
			map.put("edu_tel",eduVO.getEdu_tel());
			map.put("edu_contact",eduVO.getEdu_contact());
			edus.add(map);
		}
		jsonString = JSONValue.toJSONString(edus);
		return jsonString;
	}
	
	public String findByPrimaryKeyEduToJSON(Integer edu_id) throws SQLException{
		List edus=new LinkedList();
		EduVO eduVO=dao.findByPrimaryKey(edu_id);
		String jsonString= null;
			Map<String,String> map = new HashMap<String,String>();
			map.put("edu_id",eduVO.getEdu_id().toString());
			map.put("edu_name",eduVO.getEdu_name());
			map.put("edu_add",eduVO.getEdu_add());
			map.put("edu_tel",eduVO.getEdu_tel());
			map.put("edu_contact",eduVO.getEdu_contact());
			edus.add(map);
			jsonString = JSONValue.toJSONString(edus);
			return jsonString;
	}
	
	public Set<ClassVO> getClasByEdu_idEdu(Integer edu_id){
		return dao.getClasByEdu_id(edu_id);
	}
	
	
	
}
