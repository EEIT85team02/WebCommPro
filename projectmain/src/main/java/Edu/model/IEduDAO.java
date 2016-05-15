package Edu.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import Class.model.ClassVO;



public interface IEduDAO {
	public void insert(EduVO edu) throws SQLException;
	public void update(EduVO edu) throws SQLException;
	public void delete(Integer edu_id) throws SQLException;
	public EduVO findByPrimaryKey(Integer edu_id) throws SQLException;
	public List<EduVO> getAll() throws SQLException;
	public Set<ClassVO> getClasByEdu_id(Integer edu_id);
	
}
