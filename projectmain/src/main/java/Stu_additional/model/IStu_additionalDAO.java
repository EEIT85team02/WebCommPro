package Stu_additional.model;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;
import java.util.Set;

import Student.model.StudentVO;

public interface IStu_additionalDAO {
	
	public void insert(Stu_additionalVO stu_add) throws SQLException;
	public void update(Stu_additionalVO stu_add) throws SQLException;
	public void delete(Integer stu_id) throws SQLException;
	public Stu_additionalVO findByPrimaryKey(Integer stu_add_id) throws SQLException;
	public Stu_additionalVO findByStu_id(Integer stu_add_id) throws SQLException;
	public List<Stu_additionalVO> getAll() throws SQLException;
	public Stu_additionalVO findByPrimaryKey2(Integer stu_id);
	
}
