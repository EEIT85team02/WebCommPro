package Test_period.model;

import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONValue;


public class Test_periodService {
	private ITest_periodDAO dao;

	public Test_periodService() {
		dao= new Test_periodDAO();
	}
	
	
	public void insertTp( Time test_hour) throws SQLException {
		Test_periodVO tpVO = new Test_periodVO();
		tpVO.setTest_hour(test_hour);
		dao.insert(tpVO);
	}
	
	public void updateTp(Integer test_hour_id,Time test_hour) throws SQLException {
		Test_periodVO tpVO = new Test_periodVO();
		tpVO.setTest_hour_id(test_hour_id);
		tpVO.setTest_hour(test_hour);
		
		dao.update(tpVO);
	}
	public void deleteTp(Integer test_hour_id) throws SQLException{
		dao.delete(test_hour_id);
	}
	public Test_periodVO findByPrimaryKeyMail(Integer test_hour_id) throws SQLException{
		return dao.findByPrimaryKey(test_hour_id);
	}
	public List<Test_periodVO> getAllTp() throws SQLException{
		return dao.getAllTp();
	}
	public String getAllTpToJSON() throws SQLException{
		List mails=new LinkedList();
		List<Test_periodVO> list=dao.getAllTp();
		String jsonString= null;
		for(Test_periodVO tpVO :list){
			Map<String,String> map = new HashMap<String,String>();
			map.put("test_hour_id",tpVO.getTest_hour_id().toString());
			map.put("test_hour",tpVO.getTest_hour().toString());
			mails.add(map);
		}
		jsonString = JSONValue.toJSONString(mails);
		return jsonString;
	}
	
	public String getAllTpToJSONInitTable() throws SQLException{
		List<Test_periodVO> list=dao.getAllTp();
		List<List<String>> tpVO = new LinkedList<List<String>>();
		String jsonValue = null;
		for(Test_periodVO a :list){
			List<String> detailTpVO = new ArrayList<String>();
			detailTpVO.add(a.getTest_hour_id().toString());
			detailTpVO.add(a.getTest_hour().toString());
			tpVO.add(detailTpVO);
		}
		Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
		mapJSON.put("data",tpVO);
		jsonValue = JSONValue.toJSONString(mapJSON);
		return jsonValue;
	}
	
	public String findByPrimaryKeyTpToJSON(Integer test_hour_id) throws SQLException{
		List tps=new LinkedList();
		Test_periodVO tpVO=dao.findByPrimaryKey(test_hour_id);
		String jsonString= null;
			Map<String,String> map = new HashMap<String,String>();
			map.put("test_hour_id",tpVO.getTest_hour_id().toString());
			map.put("test_hour",tpVO.getTest_hour().toString());
			tps.add(map);
			jsonString = JSONValue.toJSONString(tps);
			return jsonString;
	}

}
