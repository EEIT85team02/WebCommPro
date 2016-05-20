package Member_status.model;

import java.sql.SQLException;
import java.util.List;



public interface IMember_statusDAO {
	public void insert(Member_statusVO mem) throws SQLException;
	public void update(Member_statusVO mem) throws SQLException;
	public void delete(Integer sta_id) throws SQLException;
	public Member_statusVO findByPrimaryKey(Integer sta_id) throws SQLException;
	public List<Member_statusVO> getAll() throws SQLException;
	public List<Member_statusVO> getStatusOK() throws SQLException;
	public List<Member_statusVO> getStatusWAIT() throws SQLException;
	public List<Member_statusVO> getStatusCANCEL() throws SQLException;
	public List<Member_statusVO> getStatusNEVER() throws SQLException;
}
