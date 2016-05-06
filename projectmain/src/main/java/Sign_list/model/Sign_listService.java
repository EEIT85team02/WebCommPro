package Sign_list.model;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.annotation.WebServlet;


public class Sign_listService {

	private ISign_listDAO dao;

	public Sign_listService() {
		dao = new Sign_listDAO();
	}
	
	public Sign_listVO addSign_list(Integer sl_id, String sl_name) throws SQLException{
		Sign_listVO sig = new Sign_listVO();
		sig.setSl_id(sl_id);
		sig.setSl_name(sl_name);
		dao.insert(sig);
		return sig;
	}
	
	
	public Sign_listVO updateSign_list(Integer sl_id, String sl_name) throws SQLException{
		Sign_listVO sig = new Sign_listVO();
		sig.setSl_id(sl_id);
		sig.setSl_name(sl_name);
		dao.update(sig);
		return dao.findByPrimaryKey(sl_id);
	}
	
	public void deleteSign_list(Integer sl_id) throws SQLException{
		dao.delete(sl_id);
	}
	
	public Sign_listVO getOneSl(Integer sl_id) throws SQLException{
		return dao.findByPrimaryKey(sl_id);
	}
	
	public List<Sign_listVO> getAll() throws SQLException {
		return dao.getAll();
	}
}
