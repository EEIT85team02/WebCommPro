package Stu_additional.model;

import java.sql.SQLException;
import java.util.List;


public class Stu_additionalService {
	private IStu_additionalDAO dao;

	public Stu_additionalService() {
		dao = new Stu_additionalDAO();
	}
	public List<Stu_additionalVO> getAll() throws SQLException {
		return dao.getAll();
	}
}
