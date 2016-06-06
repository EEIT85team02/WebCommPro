package Examiner_offday.model;

import java.sql.SQLException;
import java.util.List;



public interface IExaminer_offdayDAO {
	public void insert(Examiner_offdayVO exa) throws SQLException;
	public void update(Examiner_offdayVO exa) throws SQLException;
	public void delete(String emp_id) throws SQLException;
	public Examiner_offdayVO findByPrimaryKey(String emp_id) throws SQLException;
	public List<Examiner_offdayVO> getAll() throws SQLException;
}
