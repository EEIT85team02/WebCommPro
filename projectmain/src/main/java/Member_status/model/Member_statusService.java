package Member_status.model;

import java.sql.SQLException;
import java.util.List;

public class Member_statusService {
	private IMember_statusDAO dao;

	public Member_statusService() {
		dao = new Member_statusDAO();
	}
	public List<Member_statusVO> getStatusOK() throws SQLException {
		return dao.getStatusOK();
	}
	public List<Member_statusVO> getStatusWAIT() throws SQLException {
		return dao.getStatusWAIT();
	}
	public List<Member_statusVO> getStatusCANCEL() throws SQLException {
		return dao.getStatusCANCEL();
	}
	public List<Member_statusVO> getStatusNEVER() throws SQLException {
		return dao.getStatusNEVER();
	}
}
