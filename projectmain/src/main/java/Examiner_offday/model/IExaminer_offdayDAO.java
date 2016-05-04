package Examiner_offday.model;

import java.sql.SQLException;
import java.util.List;



public interface IExaminer_offdayDAO {
	public void insert(Examiner_offday exa) throws SQLException;
	public void update(Examiner_offday exa) throws SQLException;
	public void delete(String emp_id) throws SQLException;
	public Examiner_offday findByPrimaryKey(String emp_id) throws SQLException;
	public List<Examiner_offday> getAll() throws SQLException;
}
