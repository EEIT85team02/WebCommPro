package Sign_list.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONValue;

import Class.model.ClassVO;
import Edu.model.EduVO;
import Employee.model.EmployeeVO;


public class Sign_listService {
	private ISign_listDAO dao;

	public Sign_listService() {
		dao= new Sign_listDAO();
	}
	
	public void insertSl(Integer sl_id,String sl_name) throws SQLException {
		Sign_listVO slVO = new Sign_listVO();
		slVO.setSl_id(sl_id);
		slVO.setSl_name(sl_name);
		
		dao.insert(slVO);
	}
	
	public void updateSl(Integer sl_id,String sl_name) throws SQLException {
		Sign_listVO slVO = new Sign_listVO();
		slVO.setSl_id(sl_id);
		slVO.setSl_name(sl_name);
		
		dao.update(slVO);
	}
	public void deleteSl(Integer sl_id) throws SQLException{
		dao.delete(sl_id);
	}
	public Sign_listVO findByPrimaryKeySl(Integer sl_id) throws SQLException{
		return dao.findByPrimaryKey(sl_id);
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
			map.put("sl_id",slVO.getSl_id().toString());
			map.put("sl_name",slVO.getSl_name());
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
			detailSlVO.add(a.getSl_id().toString());
			detailSlVO.add(a.getSl_name());
			slVO.add(detailSlVO);
		}
		Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
		mapJSON.put("data",slVO);
		jsonValue = JSONValue.toJSONString(mapJSON);
		return jsonValue;
	}
	
	public String findByPrimaryKeySlToJSON(Integer sl_id) throws SQLException{
		List sls=new LinkedList();
		Sign_listVO slVO=dao.findByPrimaryKey(sl_id);
		String jsonString= null;
			Map<String,String> map = new HashMap<String,String>();
			map.put("sl_id",slVO.getSl_id().toString());
			map.put("sl_name",slVO.getSl_name());
			sls.add(map);
			jsonString = JSONValue.toJSONString(sls);
			return jsonString;
	}
	
	
	
	
	public Set<EmployeeVO> getEmpBySl_idSl(Integer sl_id){
		return dao.getEmpBySl_id(sl_id);
	}

	
}
