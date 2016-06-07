package Examiner_offday.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONValue;

import Employee.model.EmployeeDAO;
import Employee.model.EmployeeVO;
import Student.model.StudentVO;

public class ExamierVoToDatatableJSONService {

	
public static String getDatatableJSON(String emp_id){
	//用empid抓主考官請假VO


	
	List<List<String>> Examiner_offdayVO = new LinkedList<List<String>>();
	String jsonValue = null;

	EmployeeDAO dao = new EmployeeDAO();
	
	
	EmployeeVO employeevo = dao.findByPrimaryKey(emp_id);

	
	
		
		List<String> detailExaminer_offdayVO = new ArrayList<String>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy 年 MM 月 dd 日");

		Set<Examiner_offdayVO> set2 = employeevo.getExamVO();
		for (Examiner_offdayVO exofVO : set2) {

				
		detailExaminer_offdayVO.add(exofVO.getEmpVO().getEmp_id());
		detailExaminer_offdayVO.add(exofVO.getExam_id().toString());
		detailExaminer_offdayVO.add(sdf.format(exofVO.getOff_startdate()));
		detailExaminer_offdayVO.add(sdf.format(exofVO.getOff_enddate()));
		detailExaminer_offdayVO.add(exofVO.getOff_day().toString());
		detailExaminer_offdayVO.add(exofVO.getEmp_job_id());
		Examiner_offdayVO.add(detailExaminer_offdayVO);
		}
		Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
		mapJSON.put("data",Examiner_offdayVO);
		jsonValue = JSONValue.toJSONString(mapJSON);
		return jsonValue;


}
	
	
	public static void main(String[] args) {
		System.out.println(getDatatableJSON("7006"));

	}

}
