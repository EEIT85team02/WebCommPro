package Examiner_offday.model;

import java.sql.Date;
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
import Employee.model.EmployeeVO;
import Sign_list.model.Sign_listVO;

public class Examiner_offdayService {
		private IExaminer_offdayDAO dao;

		public Examiner_offdayService() {
			dao= new Examiner_offdayDAO();
		}
		
		public void updateExam(Integer exam_id, Date off_startdate, Date off_enddate, 
				Integer off_day, String emp_job_id, String emp_id) throws SQLException {
			Examiner_offdayVO examVO = new Examiner_offdayVO();
			examVO.setExam_id(exam_id);
			examVO.setOff_startdate(off_startdate);
			examVO.setOff_enddate(off_enddate);
			examVO.setOff_day(off_day);
			examVO.setEmp_job_id(emp_job_id);
			
			EmployeeVO empVO = new EmployeeVO();
			empVO.setEmp_id(emp_id);
			examVO.setEmpVO(empVO);
			
			dao.update(examVO);
		}
		
		public Examiner_offdayVO findByPrimaryKeyExam(Integer exam_id) throws SQLException{
			return dao.findByPrimaryKey(exam_id);
		}
		public List<Examiner_offdayVO> getAllExam() throws SQLException{
			return dao.getAll();
		}
		//取得全部資料轉JSON -MAP對應
		public String getAllExamToJSON() throws SQLException{
			List exams=new LinkedList();
			List<Examiner_offdayVO> list=dao.getAll();
			String jsonString= null;
			for(Examiner_offdayVO examVO :list){
				Map<String,String> map = new HashMap<String,String>();
				map.put("exam_id",examVO.getExam_id().toString());
				map.put("off_startdate",examVO.getOff_startdate().toString());
				map.put("off_enddate",examVO.getOff_enddate().toString());
				map.put("off_day",examVO.getOff_day().toString());
				map.put("emp_job_id",examVO.getEmp_job_id());
				
				map.put("emp_id",examVO.getEmpVO().getEmp_id().toString());
				map.put("emp_name",examVO.getEmpVO().getEmp_name());
				map.put("emp_mail",examVO.getEmpVO().getEmp_mail());
				map.put("dep_name",examVO.getEmpVO().getDep_name());
				exams.add(map);
			}
			jsonString = JSONValue.toJSONString(exams);
			return jsonString;
		}
		//取得全部資料轉JSON -資料LIST對應MAP
		public String getAllExamToJSONInitTable() throws SQLException{
			List<Examiner_offdayVO> list=dao.getAll();
			List<List<String>> examVO = new LinkedList<List<String>>();
			String jsonValue = null;
			for(Examiner_offdayVO a :list){
				List<String> detailExamVO = new ArrayList<String>();
				detailExamVO.add(a.getExam_id().toString());
				detailExamVO.add(a.getEmpVO().getEmp_id());
				detailExamVO.add(a.getEmpVO().getEmp_name());
				detailExamVO.add(a.getOff_startdate().toString());
				detailExamVO.add(a.getOff_enddate().toString());
				detailExamVO.add(a.getOff_day().toString());
				detailExamVO.add(a.getEmp_job_id());
				detailExamVO.add(a.getEmp_job_id());
				examVO.add(detailExamVO);
			}
			Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
			mapJSON.put("data",examVO);
			jsonValue = JSONValue.toJSONString(mapJSON);
			return jsonValue;
		}
		//取得單筆資料轉JSON -MAP對應
		public String findByPrimaryKeyExamToJSON(Integer exam_id) throws SQLException{
			List exams=new LinkedList();
			Examiner_offdayVO examVO=dao.findByPrimaryKey(exam_id);
			String jsonString= null;
				Map<String,String> map = new HashMap<String,String>();
				map.put("exam_id",examVO.getExam_id().toString());
				map.put("off_stardate",examVO.getOff_startdate().toString());
				map.put("off_enddate",examVO.getOff_enddate().toString());
				map.put("off_day",examVO.getOff_day().toString());
				map.put("emp_job_id",examVO.getEmp_job_id());
				map.put("emp_id",examVO.getEmpVO().getEmp_id());
				map.put("emp_name",examVO.getEmpVO().getEmp_name());
				map.put("emp_mail",examVO.getEmpVO().getEmp_mail());
				map.put("dep_name",examVO.getEmpVO().getDep_name());
				
				
				exams.add(map);
				jsonString = JSONValue.toJSONString(exams);
				return jsonString;
		}
}
