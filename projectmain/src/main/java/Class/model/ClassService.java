package Class.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

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
	
	
}
