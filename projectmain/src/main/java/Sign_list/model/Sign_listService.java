package Sign_list.model;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.annotation.WebServlet;


public class Sign_listService {

	private ISign_listDAO dao;

	public Sign_listService() {
		dao = new xxSign_listDAO();
	}
	
	public Sign_listVO insertSign_list(String emp_id, Integer sl_id){
		Sign_listVO slVO = new Sign_listVO();
		slVO.setSl_id(sl_id);
		dao.insert(slVO);
		return dao.findByPrimaryKey(emp_id);
	}

	public Sign_listVO getOneSl(String emp_id){
		return dao.findByPrimaryKey(emp_id);
	}
	
	
}
