package Stu_additional.model;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;

import Class.model.ClassVO;

import Employee.model.EmployeeVO;
import Member_status.model.Member_statusVO;

import Edu.model.EduVO;

import Student.model.StudentVO;
import Test_period.model.Test_periodVO;


public class Stu_additionalService {
	private IStu_additionalDAO dao;

	public Stu_additionalService() {
		dao = new Stu_additionalDAO();
	}
	
	public void updateStum(Integer stu_id,Integer stu_group,String stu_note1,Integer stu_seatno,
			String stu_name,String stu_sch,Integer stu_sex,Integer stu_age,String stu_email,
			Integer stu_pre,Double stu_implement,Date stu_testtime,Double stu_interview,
			Double stu_total,Date stu_workdate,Double stu_except,Integer stu_final,
			String stu_note2,byte[] log_pw,ClassVO class_id) throws SQLException {
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
		stuVO.setClassVO(class_id);
		
		dao.update(stuVO);
	}
	
	public List<Stu_additionalVO> getAll() throws SQLException {
		return dao.getAll();
	}
	public Stu_additionalVO upstatuscancel(Integer stu_id,Integer stu_add_id,Date test_start,Date test_end,String stu_applytime,Integer sta_id,String emp_id,Time confirm_time) throws SQLException {

		Stu_additionalVO stuaddVO = new Stu_additionalVO();

		stuaddVO.setStu_add_id(stu_add_id);			
		stuaddVO.setTest_start(test_start);
		stuaddVO.setTest_end(test_end);
		stuaddVO.setStu_applytime(stu_applytime);			
		stuaddVO.setConfirm_time(confirm_time);
				
		StudentVO stuvo = new StudentVO();
		stuvo.setStu_id(stu_id);
		stuaddVO.setStudentVO(stuvo);
		
		Member_statusVO memvo = new Member_statusVO();
		memvo.setSta_id(3);
		stuaddVO.setMember_statusVO(memvo);
		
		EmployeeVO empvo = new EmployeeVO();
		empvo.setEmp_id(emp_id);
		stuaddVO.setEmployeeVO(empvo);
		
		dao.update(stuaddVO);
		
		return stuaddVO;
		}
	public Stu_additionalVO upstatusok(Integer stu_id,Integer stu_add_id,Date test_start,Date test_end,String stu_applytime,Integer sta_id,String emp_id,Time confirm_time) throws SQLException {

		Stu_additionalVO stuaddVO = new Stu_additionalVO();

		stuaddVO.setStu_add_id(stu_add_id);			
		stuaddVO.setTest_start(test_start);
		stuaddVO.setTest_end(test_end);
		stuaddVO.setStu_applytime(stu_applytime);			
		stuaddVO.setConfirm_time(confirm_time);
				
		StudentVO stuvo = new StudentVO();
		stuvo.setStu_id(stu_id);
		stuaddVO.setStudentVO(stuvo);
		
		Member_statusVO memvo = new Member_statusVO();
		memvo.setSta_id(2);
		stuaddVO.setMember_statusVO(memvo);
		
		EmployeeVO empvo = new EmployeeVO();
		empvo.setEmp_id(emp_id);
		stuaddVO.setEmployeeVO(empvo);
		
		dao.update(stuaddVO);
		
		return stuaddVO;
		}
	public String getOneStuadd(Integer stu_add_id) throws SQLException {	
		List stuaddsc=new LinkedList();
		Stu_additionalVO stuaddVO=dao.findByPrimaryKey(stu_add_id);

			Map map = new HashMap();
			map.put("stu_add_id",stuaddVO.getStu_add_id().toString());
			map.put("stu_id",stuaddVO.getStudentVO().getStu_id().toString());
			map.put("test_start",stuaddVO.getTest_start().toString());
			map.put("test_end",stuaddVO.getTest_end().toString());
			map.put("stu_applytime",stuaddVO.getStu_applytime().toString());
			map.put("sta_id",stuaddVO.getMember_statusVO().getSta_id().toString());
			map.put("emp_id",stuaddVO.getEmployeeVO().getEmp_id().toString());
			map.put("confirm_time",stuaddVO.getConfirm_time().toString());	
			stuaddsc.add(map);
		String jsonString = JSONValue.toJSONString(stuaddsc);
		return jsonString;
		
	}
	
	public String getStuByStu_id(Integer stu_id) throws SQLException {	
		List stusc=new LinkedList();
		List<Stu_additionalVO> stu_addList =dao.findByStu_id(stu_id);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		
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
			java.util.Date stu_testtime = stu_addList.get(0).getStudentVO().getStu_testtime();
			map.put("stu_testtime",sdf.format(stu_testtime));
			map.put("stu_total",stu_addList.get(0).getStudentVO().getStu_total().toString());
			java.util.Date stu_workdate = stu_addList.get(0).getStudentVO().getStu_workdate();
			map.put("stu_workdate",sdf.format(stu_workdate));
			map.put("stu_except",stu_addList.get(0).getStudentVO().getStu_except().toString());
			map.put("stu_final",stu_addList.get(0).getStudentVO().getStu_final().toString());
			map.put("stu_note2",stu_addList.get(0).getStudentVO().getStu_note2().toString());
			map.put("stu_seatno",stu_addList.get(0).getStudentVO().getStu_seatno().toString());
			map.put("test_start",stu_addList.get(0).getTest_start().toString());
			map.put("test_end",stu_addList.get(0).getTest_end().toString());
			map.put("stu_applytime",stu_addList.get(0).getStu_applytime().toString());
			map.put("emp_id",stu_addList.get(0).getEmployeeVO().getEmp_name().toString());
			map.put("confirm_time",stu_addList.get(0).getConfirm_time().toString());
			map.put("member_statusVO",stu_addList.get(0).getMember_statusVO().getSta_name().toString());
			map.put("class_id",stu_addList.get(0).getStudentVO().getClassVO().getClass_id());
			map.put("class_name",stu_addList.get(0).getStudentVO().getClassVO().getClass_name());
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
