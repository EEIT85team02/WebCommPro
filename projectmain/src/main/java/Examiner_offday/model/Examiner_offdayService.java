package Examiner_offday.model;

import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.JSONArray;
import org.json.simple.JSONValue;

import Class.model.ClassDAO;
import Class.model.ClassVO;
import Class.model.IClassDAO;
import Employee.model.EmployeeVO;
import Sign_list.model.Sign_listVO;
import Stu_additional.model.Stu_additionalVO;

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
			List as=new LinkedList();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			Map<Object,Object> map2 = new HashMap<Object,Object>();
			List<Examiner_offdayVO> examVO = dao.findByEmpForExamier(exam_id);
			String jsonString= null;
				Map<Object,Object> map = new HashMap<Object,Object>();
				map.put("exam_id",examVO.get(0).getExam_id().toString());
				map.put("off_startdate",examVO.get(0).getOff_startdate().toString());
				map.put("off_enddate",examVO.get(0).getOff_enddate().toString());
				map.put("off_day",examVO.get(0).getOff_day().toString());
				map.put("emp_job_id",examVO.get(0).getEmp_job_id());
				map.put("emp_id",examVO.get(0).getEmpVO().getEmp_id());
				map.put("emp_name",examVO.get(0).getEmpVO().getEmp_name());
				map.put("emp_mail",examVO.get(0).getEmpVO().getEmp_mail());
				map.put("dep_name",examVO.get(0).getEmpVO().getDep_name());
				Set<Stu_additionalVO> stu_addVO = examVO.get(0).getEmpVO().getStu_additionalVO();
				for(Stu_additionalVO a :stu_addVO){
					Map<String,String> map1 = new HashMap<String,String>();
					map1.put("stu_id",a.getStudentVO().getStu_id().toString());
					map1.put("stu_name",a.getStudentVO().getStu_name());
					java.util.Date test_start = a.getTest_start();
					map1.put("test_start",sdf.format(test_start));
					java.util.Date test_end = a.getTest_end();
					map1.put("test_end",sdf.format(test_end));
					as.add(map1);
					map.put("key",as);
					
				}
//				map.put("stu_id",examVO.getEmpVO().getStu_additionalVO().iterator().next().getStudentVO().getStu_id().toString());
//				map.put("stu_name",examVO.getEmpVO().getStu_additionalVO().iterator().next().getStudentVO().getStu_name());
//				map.put("test_start",examVO.getEmpVO().getStu_additionalVO().iterator().next().getTest_start().toString());
//				map.put("test_end",examVO.getEmpVO().getStu_additionalVO().iterator().next().getTest_end().toString());

				exams.add(map);
				
				
				jsonString = JSONValue.toJSONString(exams);
				return jsonString;
		}
}
