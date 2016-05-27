package Test_interval.model;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONValue;

import Class.model.ClassVO;

public class Test_intervalService {
	private ITest_intervalDAO dao;

	public Test_intervalService() {
		dao= new Test_intervalDAO();
	}
	
	
	public void insertTi( String class_id, Date test_startdate,
			Date test_enddate) throws SQLException {
		Test_intervalVO tiVO = new Test_intervalVO();
		tiVO.setClass_id(class_id);
		tiVO.setTest_startdate(test_startdate);
		tiVO.setTest_enddate(test_enddate);
		dao.insert(tiVO);
	}
	
	public void updateTi(Integer test_interval_id,String class_id, Date test_startdate,
			Date test_enddate) throws SQLException {
		Test_intervalVO tiVO = new Test_intervalVO();
		tiVO.setTest_interval_id(test_interval_id);
		tiVO.setClass_id(class_id);
		tiVO.setTest_startdate(test_startdate);
		tiVO.setTest_enddate(test_enddate);
		
		dao.update(tiVO);
	}
//	public void deleteTi(Integer test_interval_id) throws SQLException{
//		dao.delete(test_interval_id);
//	}
	public Test_intervalVO findByPrimaryKeyTi(Integer test_interval_id) throws SQLException{
		return dao.findByPrimaryKey(test_interval_id);
	}
	public List<Test_intervalVO> getAllTi() throws SQLException{
		return dao.getAllTi();
	}
	public String getAllTiToJSON() throws SQLException{
		List tis=new LinkedList();
		List<Test_intervalVO> list=dao.getAllTi();
		String jsonString= null;
		for(Test_intervalVO tiVO :list){
			Map<String,String> map = new HashMap<String,String>();
			map.put("test_interval_id",tiVO.getTest_interval_id().toString());
			map.put("class_id",tiVO.getClass_id());
			map.put("test_startdate",tiVO.getTest_startdate().toString());
			map.put("test_enddate",tiVO.getTest_enddate().toString());
			tis.add(map);
		}
		jsonString = JSONValue.toJSONString(tis);
		return jsonString;
	}
	
	public String getAllTiToJSONInitTable() throws SQLException{
		List<Test_intervalVO> list=dao.getAllTi();
		List<List<String>> tiVO = new LinkedList<List<String>>();
		String jsonValue = null;
		for(Test_intervalVO a :list){
			List<String> detailTiVO = new ArrayList<String>();
			detailTiVO.add(a.getTest_interval_id().toString());
			detailTiVO.add(a.getClass_id());
			detailTiVO.add(a.getTest_startdate().toString());
			detailTiVO.add(a.getTest_enddate().toString());
			tiVO.add(detailTiVO);
		}
		Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
		mapJSON.put("data",tiVO);
		jsonValue = JSONValue.toJSONString(mapJSON);
		return jsonValue;
	}
	
	public String findByPrimaryKeyTiToJSON(Integer test_interval_id) throws SQLException{
		List tis=new LinkedList();
		Test_intervalVO tiVO=dao.findByPrimaryKey(test_interval_id);
		String jsonString= null;
			Map<String,String> map = new HashMap<String,String>();
			map.put("test_interval_id",tiVO.getTest_interval_id().toString());
			map.put("class_id",tiVO.getClass_id());
			map.put("test_startdate",tiVO.getTest_startdate().toString());
			map.put("test_enddate",tiVO.getTest_enddate().toString());
			tis.add(map);
			jsonString = JSONValue.toJSONString(tis);
			return jsonString;
	}
	
	
	
}
