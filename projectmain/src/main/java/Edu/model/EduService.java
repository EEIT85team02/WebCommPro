package Edu.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

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
	public Set<ClassVO> getClasByEdu_idEdu(Integer edu_id){
		return dao.getClasByEdu_id(edu_id);
	}
	
	
}
