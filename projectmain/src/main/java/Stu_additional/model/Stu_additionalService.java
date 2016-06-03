package Stu_additional.model;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;

import Class.model.ClassVO;
import Edu.model.EduVO;
import Student.model.StudentVO;


public class Stu_additionalService {
	private IStu_additionalDAO dao;

	public Stu_additionalService() {
		dao = new Stu_additionalDAO();
	}
	
	public void updateStum(Integer stu_id,Integer stu_group,String stu_note1,Integer stu_seatno,
			String stu_name,String stu_sch,Integer stu_sex,Integer stu_age,String stu_email,
			Integer stu_pre,Double stu_implement,Date stu_testtime,Double stu_interview,
			Double stu_total,Date stu_workdate,Double stu_except,Integer stu_final,
			String stu_note2,String log_pw,String class_id) throws SQLException {
		StudentVO stuVO = new StudentVO();
		stuVO.setStu_id(stu_id);
		stuVO.setStu_group(stu_group);
		stuVO.setStu_note1(stu_note1);
		stuVO.setStu_seatno(stu_seatno);
		stuVO.setStu_name(stu_name);
		stuVO.setStu_sch(stu_sch);
		stuVO.setStu_sex(stu_sex);
		stuVO.setStu_age(stu_age);
		stuVO.setStu_email(stu_email);
		stuVO.setStu_pre(stu_pre);
		stuVO.setStu_implement(stu_implement);
		stuVO.setStu_testtime(stu_testtime);
		stuVO.setStu_interview(stu_interview);
		stuVO.setStu_total(stu_total);
		stuVO.setStu_workdate(stu_workdate);
		stuVO.setStu_except(stu_except);
		stuVO.setStu_final(stu_final);
		stuVO.setStu_note2(stu_note2);
		stuVO.setLog_pw(log_pw);
		stuVO.setClass_id(class_id);
		
		dao.update(stuVO);
	}
	
	public List<Stu_additionalVO> getAll() throws SQLException {
		return dao.getAll();
	}
	
	public String getStuByStu_id(Integer stu_id) throws SQLException {	
		List stusc=new LinkedList();
		List<Stu_additionalVO> stu_addList =dao.findByStu_id(stu_id);
		System.out.println("-----------*****"+stu_addList);
			Map<String,String> map = new HashMap<String,String>();
			map.put("stu_add_id",stu_addList.get(0).getStu_add_id().toString());
			map.put("stu_id",stu_addList.get(0).getStudentVO().getStu_id().toString());
			map.put("stu_name",stu_addList.get(0).getStudentVO().getStu_name().toString());
			map.put("stu_implement",stu_addList.get(0).getStudentVO().getStu_implement().toString());
			map.put("stu_interview",stu_addList.get(0).getStudentVO().getStu_interview().toString());
			map.put("stu_group",stu_addList.get(0).getStudentVO().getStu_group().toString());
			map.put("stu_note1",stu_addList.get(0).getStudentVO().getStu_note1().toString());
			map.put("stu_age",stu_addList.get(0).getStudentVO().getStu_age().toString());
			map.put("stu_sch",stu_addList.get(0).getStudentVO().getStu_sch().toString());
			map.put("stu_sex",stu_addList.get(0).getStudentVO().getStu_sex().toString());
			map.put("stu_email",stu_addList.get(0).getStudentVO().getStu_email().toString());
			map.put("stu_pre",stu_addList.get(0).getStudentVO().getStu_pre().toString());
			map.put("stu_testtime",stu_addList.get(0).getStudentVO().getStu_testtime().toString());
			map.put("stu_total",stu_addList.get(0).getStudentVO().getStu_total().toString());
			map.put("stu_workdate",stu_addList.get(0).getStudentVO().getStu_workdate().toString());
			map.put("stu_except",stu_addList.get(0).getStudentVO().getStu_except().toString());
			map.put("stu_final",stu_addList.get(0).getStudentVO().getStu_final().toString());
			map.put("stu_note2",stu_addList.get(0).getStudentVO().getStu_note2().toString());
			map.put("stu_seatno",stu_addList.get(0).getStudentVO().getStu_seatno().toString());
			map.put("test_startdate",stu_addList.get(0).getTest_startdate().toString());
			map.put("test_hour_id",stu_addList.get(0).getTest_periodVO().getTest_starthour().toString()+"-"
								  +stu_addList.get(0).getTest_periodVO().getTest_endhour().toString());
			map.put("stu_applytime",stu_addList.get(0).getStu_applytime().toString());
			map.put("emp_id",stu_addList.get(0).getEmployeeVO().getEmp_name().toString());
			map.put("confirm_time",stu_addList.get(0).getConfirm_time().toString());
			map.put("member_statusVO",stu_addList.get(0).getMember_statusVO().getSta_name().toString());
			map.put("class_id",stu_addList.get(0).getStudentVO().getClassVO().getClass_name());
			stusc.add(map);
		String jsonString = JSONValue.toJSONString(stusc);
		return jsonString;
		
	}
	
	public String getAllStumToJSONInitTable() throws SQLException{
		List<Stu_additionalVO> list=dao.getAll();
		List<List<String>> stu_add = new LinkedList<List<String>>();
		String jsonValue = null;
		for(Stu_additionalVO a :list){
			List<String> detailStu_add = new ArrayList<String>();
			detailStu_add.add(a.getStudentVO().getStu_id().toString());
			detailStu_add.add(a.getStudentVO().getStu_name());
			detailStu_add.add(a.getStudentVO().getClassVO().getClass_id());
			detailStu_add.add(a.getStudentVO().getClassVO().getClass_name());
			detailStu_add.add(a.getStudentVO().getStu_email());
			stu_add.add(detailStu_add);
		}
		Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
		mapJSON.put("data",stu_add);
		jsonValue = JSONValue.toJSONString(mapJSON);
		return jsonValue;
	}
}
