package Class.model;

import java.sql.SQLException;
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
			clas.add(map);
		}
		jsonString = JSONValue.toJSONString(clas);
		return jsonString;
	}
	
	
}
