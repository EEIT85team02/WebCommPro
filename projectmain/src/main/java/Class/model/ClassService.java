package Class.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONValue;

import Class.model.ClassVO;
import Edu.model.EduVO;

public class ClassService {
	private IClassDAO dao;

	public ClassService() {
		dao= new ClassDAO();
	}
	
	
	public void insertClass(String class_id,String class_name, String class_contact,
			String class_teach, Integer edu_id) throws SQLException {
		ClassVO cla = new ClassVO();
		cla.setClass_id(class_id);
		cla.setClass_name(class_name);
		cla.setClass_contact(class_contact);
		cla.setClass_teach(class_teach);
		
		EduVO edu = new EduVO();
		edu.setEdu_id(edu_id);
		cla.setEduVO(edu);
		dao.insert(cla);
	}
	
	public void updateClass(String class_id, String class_name, String class_contact,
			String class_teach, Integer edu_id) throws SQLException {
		ClassVO cla = new ClassVO();
		cla.setClass_id(class_id);
		cla.setClass_name(class_name);
		cla.setClass_contact(class_contact);
		cla.setClass_teach(class_teach);
		
		EduVO edu = new EduVO();
		edu.setEdu_id(edu_id);
		cla.setEduVO(edu);
		
		dao.update(cla);
	}
	public void deleteClass(String class_id) throws SQLException{
		 dao.delete(class_id);
	}
	public ClassVO findByPrimaryKeyClass(String class_id) throws SQLException{
		return dao.findByPrimaryKey(class_id);
	}
	public List<ClassVO> getAllClass() throws SQLException{
		return dao.getAll();
	}
	
	public String getAllClassToJSON() throws SQLException{
		List clas=new LinkedList();
		List<ClassVO> list=dao.getAll();
		String jsonString= null;
		for(ClassVO classVO :list){
			Map<String,String> map = new HashMap<String,String>();
			map.put("class_id",classVO.getClass_id());
			map.put("class_name",classVO.getClass_name());
			map.put("class_contact",classVO.getClass_contact());
			map.put("class_teach",classVO.getClass_teach());
			
			map.put("edu_id",classVO.getEduVO().getEdu_id().toString());
			map.put("edu_name",classVO.getEduVO().getEdu_name());
			clas.add(map);
		}
		jsonString = JSONValue.toJSONString(clas);
		return jsonString;
	}
	
	public String getAllClassToJSONInitTable() throws SQLException{
		List<ClassVO> list=dao.getAll();
		List<List<String>> classVO = new LinkedList<List<String>>();
		String jsonValue = null;
		for(ClassVO a :list){
			List<String> detailClassVO = new ArrayList<String>();
			detailClassVO.add(a.getClass_id());
			detailClassVO.add(a.getClass_name());
			detailClassVO.add(a.getClass_contact());
			detailClassVO.add(a.getClass_teach());
			detailClassVO.add(a.getEduVO().getEdu_id().toString());
			detailClassVO.add(a.getEduVO().getEdu_name() );
			classVO.add(detailClassVO);
		}
		Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
		mapJSON.put("data",classVO);
		jsonValue = JSONValue.toJSONString(mapJSON);
		return jsonValue;
	}
	
	public String findByPrimaryKeyClassToJSON(String class_id) throws SQLException{
		List cals=new LinkedList();
		ClassVO classVO=dao.findByPrimaryKey(class_id);
		String jsonString= null;
			Map<String,String> map = new HashMap<String,String>();
			map.put("class_id",classVO.getClass_id());
			map.put("class_name",classVO.getClass_name());
			map.put("class_contact",classVO.getClass_contact());
			map.put("class_teach",classVO.getClass_teach());
			map.put("edu_id",classVO.getEduVO().getEdu_id().toString());
			map.put("edu_name",classVO.getEduVO().getEdu_name());
			cals.add(map);
			jsonString = JSONValue.toJSONString(cals);
			return jsonString;
	}
	
	
}
