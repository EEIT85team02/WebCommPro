package Employee.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.simple.JSONValue;

import Class.model.ClassDAO;
import Class.model.ClassVO;
import Class.model.IClassDAO;
import Sign_list.model.Sign_listVO;

public class EmployeeService {
		private IEmployeeDAO dao;

		public EmployeeService() {
			dao= new EmployeeDAO();
		}
		
		
//		public void insertEmp(String emp_id,String emp_name, String emp_mail,
//				String dep_name, Integer sl_id) throws SQLException {
//			EmployeeVO empVO = new EmployeeVO();
//			empVO.setEmp_id(emp_id);
//			empVO.setEmp_name(emp_name);
//			empVO.setEmp_mail(emp_mail);
//			empVO.setDep_name(dep_name);
//			
//			Sign_listVO slVO = new Sign_listVO();
//			slVO.setSl_id(sl_id);
//			empVO.setSlVO(slVO);
//			dao.insert(empVO);
//		}
		
		public void updateEmp(String emp_id, String emp_name, String emp_mail,
				String dep_name, Integer sl_id) throws SQLException {
			EmployeeVO empVO = new EmployeeVO();
			empVO.setEmp_id(emp_id);
			empVO.setEmp_name(emp_name);
			empVO.setEmp_mail(emp_mail);
			empVO.setDep_name(dep_name);
			
			Sign_listVO slVO = new Sign_listVO();
			slVO.setSl_id(sl_id);
			empVO.setSlVO(slVO);
			
			dao.update(empVO);
		}
		
		public void updateEmpdel(String emp_id, String emp_name, String emp_mail,
				String dep_name, Integer sl_id) throws SQLException {
			EmployeeVO empVO = new EmployeeVO();
			empVO.setEmp_id(emp_id);
			empVO.setEmp_name(emp_name);
			empVO.setEmp_mail(emp_mail);
			empVO.setDep_name(dep_name);
			
			Sign_listVO slVO = new Sign_listVO();
			slVO.setSl_id(0);
			empVO.setSlVO(slVO);
			
			dao.update(empVO);
		}
		
		
//		public void deleteEmp(String emp_id) throws SQLException{
//			 dao.delete(emp_id);
//		}
		
//		public void updateEmpdelMulti(String emp_idJSON) throws SQLException{
//			JSONArray ja = new JSONArray(emp_idJSON);//將字串再轉回JSON
//			for(int i=0,max=ja.length();i< max;i++){
//				String emp_id = ja.getString(i);
//				System.out.println("emp_id======"+emp_id);
//				dao.update(emp_id);
//			}
//		}
		
		public EmployeeVO findByPrimaryKeyEmp(String emp_id) throws SQLException{
			return dao.findByPrimaryKey(emp_id);
		}
		public List<EmployeeVO> getAllEmp() throws SQLException{
			return dao.getAllEmp();
		}
		//取得全部資料轉JSON -MAP對應
		public String getAllEmpToJSON() throws SQLException{
			List emps=new LinkedList();
			List<EmployeeVO> list=dao.getAllEmp();
			String jsonString= null;
			for(EmployeeVO empVO :list){
				Map<String,String> map = new HashMap<String,String>();
				map.put("emp_id",empVO.getEmp_id());
				map.put("emp_name",empVO.getEmp_name());
				map.put("emp_mail",empVO.getEmp_mail());
				map.put("dep_name",empVO.getDep_name());
				
				map.put("sl_id",empVO.getSlVO().getSl_id().toString());
				map.put("sl_name",empVO.getSlVO().getSl_name());
				emps.add(map);
			}
			jsonString = JSONValue.toJSONString(emps);
			return jsonString;
		}
		//取得全部資料轉JSON -資料LIST對應MAP
		public String getAllEmpToJSONInitTable() throws SQLException{
			List<EmployeeVO> list=dao.getAllEmp();
			List<List<String>> empVO = new LinkedList<List<String>>();
			String jsonValue = null;
			for(EmployeeVO a :list){
				List<String> detailEmpVO = new ArrayList<String>();
				detailEmpVO.add(a.getEmp_id());
				detailEmpVO.add(a.getEmp_name());
				detailEmpVO.add(a.getEmp_mail());
				detailEmpVO.add(a.getDep_name());
				detailEmpVO.add(a.getSlVO().getSl_id().toString());
				detailEmpVO.add(a.getSlVO().getSl_name() );
				empVO.add(detailEmpVO);
			}
			Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
			mapJSON.put("data",empVO);
			jsonValue = JSONValue.toJSONString(mapJSON);
			return jsonValue;
		}
		//取得單筆資料轉JSON -MAP對應
		public String findByPrimaryKeyEmpToJSON(String emp_id) throws SQLException{
			List emps=new LinkedList();
			EmployeeVO empVO=dao.findByPrimaryKey(emp_id);
			String jsonString= null;
				Map<String,String> map = new HashMap<String,String>();
				map.put("emp_id",empVO.getEmp_id());
				map.put("emp_name",empVO.getEmp_name());
				map.put("emp_mail",empVO.getEmp_mail());
				map.put("dep_name",empVO.getDep_name());
				map.put("sl_id",empVO.getSlVO().getSl_id().toString());
				map.put("sl_name",empVO.getSlVO().getSl_name());
				emps.add(map);
				jsonString = JSONValue.toJSONString(emps);
				return jsonString;
		}
}
