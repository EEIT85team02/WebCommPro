package Examiner_offday.model;

import java.sql.SQLException;
import java.util.List;



public interface IExaminer_offdayDAO {
	public void update(Examiner_offdayVO examVO) throws SQLException;
	public Examiner_offdayVO findByPrimaryKey(Integer exam_id) throws SQLException;
	public List<Examiner_offdayVO> getAll() throws SQLException;
}
