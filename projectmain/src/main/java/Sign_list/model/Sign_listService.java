package Sign_list.model;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.annotation.WebServlet;


public class Sign_listService {

	private ISign_listDAO dao;

	public Sign_listService() {
		dao = new Sign_listDAO();
	}

	public Sign_listVO insertSl(String emp_id, String emp_lastname, String emp_firstname,
			String emp_mail, String dep_name, Integer sl_id) {

		Sign_listVO slVO = new Sign_listVO();

		slVO.setEmp_id(emp_id);
		slVO.setEmp_lastname(emp_lastname);
		slVO.setEmp_firstname(emp_firstname);
		slVO.setEmp_mail(emp_mail);
		slVO.setDep_name(dep_name);
		slVO.setSl_id(sl_id);
		dao.insert(slVO);

		return dao.findByPrimaryKey(emp_id);
	}

	
	public Sign_listVO updateSl(String emp_id, String emp_lastname, String emp_firstname,
			String emp_mail, String dep_name, Integer sl_id) {

		Sign_listVO slVO = new Sign_listVO();

		slVO.setEmp_id(emp_id);
		slVO.setEmp_lastname(emp_lastname);
		slVO.setEmp_firstname(emp_firstname);
		slVO.setEmp_mail(emp_mail);
		slVO.setDep_name(dep_name);
		slVO.setSl_id(sl_id);
		dao.update(slVO);

		return dao.findByPrimaryKey(emp_id);
	}

	public void deleteSl(String emp_id) {
		dao.delete(emp_id);
	}

	public Sign_listVO getOneSl(String emp_id) {
		return dao.findByPrimaryKey(emp_id);
	}

	public List<Sign_listVO> getAllSl() {
		return dao.getAllSl();
	}
}
