package Examiner_offday.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;

import Student.model.StudentVO;

public class ExamierVoToDatatableJSONService {

	
public static String getDatatableJSON(String emp_id){
	//用empid抓主考官請假VO
	SelectExamierOffdayInformationService seoi=new SelectExamierOffdayInformationService();

	Examiner_offdayVO eo=seoi.SelectExamierVOByEmpId(emp_id);
	
	List<List<String>> Examiner_offdayVO = new LinkedList<List<String>>();
	String jsonValue = null;


		List<String> detailExaminer_offdayVO = new ArrayList<String>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy 年 MM 月 dd 日");
		detailExaminer_offdayVO.add(eo.getEmp_id());
		detailExaminer_offdayVO.add(eo.getEmp_job_id());
		detailExaminer_offdayVO.add(eo.getOff_day().toString());
		detailExaminer_offdayVO.add(sdf.format(eo.getOff_stardate()));
		detailExaminer_offdayVO.add(sdf.format(eo.getOff_enddate()));
		Examiner_offdayVO.add(detailExaminer_offdayVO);
		Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
		mapJSON.put("data",Examiner_offdayVO);
		jsonValue = JSONValue.toJSONString(mapJSON);
		return jsonValue;


}
	
	
	public static void main(String[] args) {
		System.out.println(getDatatableJSON("7006"));

	}

}
