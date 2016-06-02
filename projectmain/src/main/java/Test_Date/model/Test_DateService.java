package Test_Date.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.simple.JSONValue;
import Test_period.model.Test_periodVO;
import Class.model.ClassVO;


public class Test_DateService {
	private ITest_DateDAO dao;

	public Test_DateService() {
		dao= new Test_DateDAO();
	}
	
	
	public void insertTd(String class_id,java.sql.Date	test_date, Integer	test_people,
			Integer exam_people, Integer test_hour_id) throws SQLException {
		Test_DateVO tdVO = new Test_DateVO();
		tdVO.setTest_date(test_date);
		tdVO.setTest_people(test_people);
		tdVO.setExam_people(exam_people);
		
		ClassVO cla = new ClassVO();
		cla.setClass_id(class_id);
		tdVO.setClaVO(cla);
		
		Test_periodVO tpVO = new Test_periodVO();
		tpVO.setTest_hour_id(test_hour_id);
		tdVO.setTpVO(tpVO);
		
		dao.insert(tdVO);
	}
	
	public void updateTd(Integer test_date_id,String class_id,java.sql.Date	test_date, Integer	test_people,
			Integer exam_people, Integer test_hour_id) throws SQLException {
		Test_DateVO tdVO = new Test_DateVO();
		tdVO.setTest_date_id(test_date_id);
		tdVO.setTest_date(test_date);
		tdVO.setTest_people(test_people);
		tdVO.setExam_people(exam_people);
		
		ClassVO cla = new ClassVO();
		cla.setClass_id(class_id);
		tdVO.setClaVO(cla);
		
		Test_periodVO tpVO = new Test_periodVO();
		tpVO.setTest_hour_id(test_hour_id);
		tdVO.setTpVO(tpVO);
		
		dao.update(tdVO);
	}
	public void deleteTd(Integer test_date_id) throws SQLException{
		 dao.delete(test_date_id);
	}
	//多筆刪除
	public void deleteTdMulti(String test_date_idJSON) throws SQLException{
		JSONArray ja = new JSONArray(test_date_idJSON);//將字串再轉回JSON
		for(int i=0,max=ja.length();i< max;i++){
			String jsonIndex = ja.getString(i);
			Integer test_date_id = Integer.parseInt(jsonIndex);
			System.out.println("test_date_id======"+test_date_id);
			dao.delete(test_date_id);
		}
	}
	//查詢一筆資料
	public Test_DateVO findByPrimaryKeyTd(Integer test_date_id) throws SQLException{
		return dao.findByPrimaryKey(test_date_id);
	}
	//查詢全部資料
	public List<Test_DateVO> getAllTd() throws SQLException{
		return dao.getAll();
	}
	//查詢全部資料
	public List<Test_DateVO> getAllTdClassId(String class_id) throws SQLException{
			return dao.getAllClassId(class_id);
	}
	
	
	//取得全部資料轉JSON -MAP對應
	public String getAllTdToJSON() throws SQLException{
		List tds=new LinkedList();
		List<Test_DateVO> list=dao.getAll();
		String jsonString= null;
		for(Test_DateVO tdVO :list){
			Map<String,String> map = new HashMap<String,String>();
			map.put("test_date_id",tdVO.getTest_date_id().toString());
			map.put("class_id",tdVO.getClaVO().getClass_id());
			map.put("class_name",tdVO.getClaVO().getClass_name());
			map.put("test_date",tdVO.getTest_date().toString());
			map.put("test_people",tdVO.getTest_people().toString());
			map.put("exam_people",tdVO.getExam_people().toString());
			map.put("test_hour_id",tdVO.getTpVO().getTest_hour_id().toString());
			map.put("test_starthour",tdVO.getTpVO().getTest_starthour().toString());
			map.put("test_endhour",tdVO.getTpVO().getTest_endhour().toString());
			tds.add(map);
		}
		jsonString = JSONValue.toJSONString(tds);
		return jsonString;
	}
	//取得全部資料轉JSON -資料LIST對應MAP(產生datatables資料)
	public String getAllTdToJSONInitTable() throws SQLException{
		List<Test_DateVO> list=dao.getAll();
		List<List<String>> tdVO = new LinkedList<List<String>>();
		String jsonValue = null;
		for(Test_DateVO a :list){
			List<String> detailTest_DateVO = new ArrayList<String>();
			detailTest_DateVO.add(a.getTest_date_id().toString());
			detailTest_DateVO.add(a.getClaVO().getClass_id());
			detailTest_DateVO.add(a.getClaVO().getClass_name());
			detailTest_DateVO.add(a.getTest_date().toString());
			detailTest_DateVO.add(a.getTest_people().toString());
			detailTest_DateVO.add(a.getExam_people().toString());
			detailTest_DateVO.add(a.getTpVO().getTest_hour_id().toString());
			detailTest_DateVO.add(a.getTpVO().getTest_starthour().toString());
			detailTest_DateVO.add(a.getTpVO().getTest_endhour().toString());
			tdVO.add(detailTest_DateVO);
		}
		Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
		mapJSON.put("data",tdVO);
		jsonValue = JSONValue.toJSONString(mapJSON);
		return jsonValue;
	}
	//取得單筆資料轉JSON -MAP對應
	public String findByPrimaryKeyTdToJSON(Integer test_date_id) throws SQLException{
		List tds=new LinkedList();
		Test_DateVO tdVO=dao.findByPrimaryKey(test_date_id);
		String jsonString= null;
			Map<String,String> map = new HashMap<String,String>();
			map.put("test_date_id",tdVO.getTest_date_id().toString());
			map.put("class_id",tdVO.getClaVO().getClass_id());
			map.put("class_name",tdVO.getClaVO().getClass_name());
			map.put("test_date",tdVO.getTest_date().toString());
			map.put("test_people",tdVO.getTest_people().toString());
			map.put("exam_people",tdVO.getExam_people().toString());
			map.put("test_hour_id",tdVO.getTpVO().getTest_hour_id().toString());
			map.put("test_starthour",tdVO.getTpVO().getTest_starthour().toString());
			map.put("test_endhour",tdVO.getTpVO().getTest_endhour().toString());
			
			tds.add(map);
			jsonString = JSONValue.toJSONString(tds);
			return jsonString;
	}
	
	
}
