package Test_period.model;

import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.JSONArray;
import org.json.simple.JSONValue;


public class Test_periodService {
	private ITest_periodDAO dao;

	public Test_periodService() {
		dao= new Test_periodDAO();
	}
	
	
	public void insertTp( Time test_starthour, Time test_endhour) throws SQLException {
		Test_periodVO tpVO = new Test_periodVO();
		tpVO.setTest_starthour(test_starthour);
		tpVO.setTest_endhour(test_endhour);
		dao.insert(tpVO);
	}
	
	public void updateTp(Integer test_hour_id,Time test_starthour, Time test_endhour) throws SQLException {
		Test_periodVO tpVO = new Test_periodVO();
		tpVO.setTest_hour_id(test_hour_id);
		tpVO.setTest_starthour(test_starthour);
		tpVO.setTest_endhour(test_endhour);
		
		dao.update(tpVO);
	}
	public void deleteTp(Integer test_hour_id) throws SQLException{
		dao.delete(test_hour_id);
	}
	
	public void deleteTpMulti(String test_hour_idJSON) throws SQLException{
		JSONArray ja = new JSONArray(test_hour_idJSON);//將字串再轉回JSON
		for(int i=0,max=ja.length();i< max;i++){
			String jsonIndex = ja.getString(i);
			Integer test_hour_id = Integer.parseInt(jsonIndex);
			System.out.println("test_hour_id======"+test_hour_id);
			dao.delete(test_hour_id);
		}
	}
	
	
	public Test_periodVO findByPrimaryKey(Integer test_hour_id) throws SQLException{
		return dao.findByPrimaryKey(test_hour_id);
	}
	public List<Test_periodVO> getAllTp() throws SQLException{
		return dao.getAll();
	}
	public String getAllTpToJSON() throws SQLException{
		List mails=new LinkedList();
		List<Test_periodVO> list=dao.getAll();
		String jsonString= null;
		for(Test_periodVO tpVO :list){
			Map<String,String> map = new HashMap<String,String>();
			map.put("test_hour_id",tpVO.getTest_hour_id().toString());
			map.put("test_starthour",tpVO.getTest_starthour().toString());
			map.put("test_endhour",tpVO.getTest_endhour().toString());
			mails.add(map);
		}
		jsonString = JSONValue.toJSONString(mails);
		return jsonString;
	}
	
	public String getAllTpToJSONInitTable() throws SQLException{
		List<Test_periodVO> list=dao.getAll();
		List<List<String>> tpVO = new LinkedList<List<String>>();
		String jsonValue = null;
		for(Test_periodVO a :list){
			List<String> detailTpVO = new ArrayList<String>();
			detailTpVO.add(a.getTest_hour_id().toString());
			detailTpVO.add(a.getTest_starthour().toString());
			detailTpVO.add(a.getTest_endhour().toString());
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
			map.put("test_starthour",tpVO.getTest_starthour().toString());
			map.put("test_endhour",tpVO.getTest_endhour().toString());
			tps.add(map);
			jsonString = JSONValue.toJSONString(tps);
			return jsonString;
	}

}
