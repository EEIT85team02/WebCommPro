package Member_status.model;

import java.sql.SQLException;
import java.util.List;

public class Member_statusService {
	private IMember_statusDAO dao;

	public Member_statusService() {
		dao = new Member_statusDAO();
	}
	
	public List<Member_statusVO> getAll() throws SQLException {
		return dao.getAll();
	}
	public List<Member_statusVO> getStatusWAIT() throws SQLException {
		return dao.getStatusWAIT();
	}
	public List<Member_statusVO> getStatusOK() throws SQLException {
		return dao.getStatusOK();
	}
	public List<Member_statusVO> getStatusNO() throws SQLException {
		return dao.getStatusNO();
	}
	public List<Member_statusVO> getStatusNEVER() throws SQLException {
		return dao.getStatusNEVER();
	}
	public List<Member_statusVO> getStatusYES() throws SQLException {
		return dao.getStatusYES();
	}
	public List<Member_statusVO> getStatusWAITING() throws SQLException {
		return dao.getStatusWAITING();
	}
}
