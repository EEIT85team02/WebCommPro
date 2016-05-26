package Sign_list.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONValue;

import Edu.model.EduVO;


public class Sign_listService {
	private ISign_listDAO dao;

	public Sign_listService() {
		dao= new Sign_listDAO();
	}
	
	public void updateSl(String emp_id,String emp_name, String emp_mail,
			String dep_name, Integer sl_id) throws SQLException {
		Sign_listVO slVO = new Sign_listVO();
		slVO.setEmp_id(emp_id);
		slVO.setEmp_name(emp_name);
		slVO.setEmp_mail(emp_mail);
		slVO.setDep_name(dep_name);
		slVO.setSl_id(sl_id);
		
		dao.update(slVO);
	}
	
	public void updatedelSl(String emp_id,String emp_name, String emp_mail,
			String dep_name, Integer sl_id) throws SQLException {
		Sign_listVO slVO = new Sign_listVO();
		slVO.setEmp_id(emp_id);
		slVO.setEmp_name(emp_name);
		slVO.setEmp_mail(emp_mail);
		slVO.setDep_name(dep_name);
		slVO.setSl_id(0);
		
		dao.update(slVO);
	}

	public Sign_listVO findByPrimaryKeySl(String emp_id) throws SQLException{
		return dao.findByPrimaryKey(emp_id);
	}
	public List<Sign_listVO> getAllSl() throws SQLException{
		return dao.getAllSl();
	}
	public String getAllSlToJSON() throws SQLException{
		List sls=new LinkedList();
		List<Sign_listVO> list=dao.getAllSl();
		String jsonString= null;
		for(Sign_listVO slVO :list){
			Map<String,String> map = new HashMap<String,String>();
			map.put("emp_id",slVO.getEmp_id());
			map.put("emp_name",slVO.getEmp_name());
			map.put("emp_mail",slVO.getEmp_mail());
			map.put("dep_name",slVO.getDep_name());
			map.put("sl_id",slVO.getSl_id().toString());
			sls.add(map);
		}
		jsonString = JSONValue.toJSONString(sls);
		return jsonString;
	}
	
	public String getAllSlToJSONInitTable() throws SQLException{
		List<Sign_listVO> list=dao.getAllSl();
		List<List<String>> slVO = new LinkedList<List<String>>();
		String jsonValue = null;
		for(Sign_listVO a :list){
			List<String> detailSlVO = new ArrayList<String>();
			detailSlVO.add(a.getEmp_id());
			detailSlVO.add(a.getEmp_name());
			detailSlVO.add(a.getEmp_mail());
			detailSlVO.add(a.getDep_name());
			detailSlVO.add(a.getSl_id().toString());
			slVO.add(detailSlVO);
		}
		Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
		mapJSON.put("data",slVO);
		jsonValue = JSONValue.toJSONString(mapJSON);
		return jsonValue;
	}
	
	public String findByPrimaryKeySlToJSON(String emp_id) throws SQLException{
		List sls=new LinkedList();
		Sign_listVO slVO=dao.findByPrimaryKey(emp_id);
		String jsonString= null;
			Map<String,String> map = new HashMap<String,String>();
			map.put("emp_id",slVO.getEmp_id());
			map.put("emp_name",slVO.getEmp_name());
			map.put("emp_mail",slVO.getEmp_mail());
			map.put("dep_name",slVO.getDep_name());
			map.put("sl_id",slVO.getSl_id().toString());
			sls.add(map);
			jsonString = JSONValue.toJSONString(sls);
			return jsonString;
	}

	
}
