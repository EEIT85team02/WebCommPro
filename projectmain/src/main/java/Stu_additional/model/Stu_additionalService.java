package Stu_additional.model;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;

import Class.model.ClassVO;
import Employee.model.EmployeeVO;
import Member_status.model.Member_statusVO;
import Student.model.StudentVO;
import Test_period.model.Test_periodVO;


public class Stu_additionalService {
	private IStu_additionalDAO dao;

	public Stu_additionalService() {
		dao = new Stu_additionalDAO();
	}
	public List<Stu_additionalVO> getAll() throws SQLException {
		return dao.getAll();
	}
	public Stu_additionalVO upstatuscancel(Integer stu_id,Integer stu_add_id,Date test_startdate,Integer test_hour_id,String stu_applytime,Integer sta_id,String emp_id,Time confirm_time) throws SQLException {

		Stu_additionalVO stuaddVO = new Stu_additionalVO();

		stuaddVO.setStu_add_id(stu_add_id);			
		stuaddVO.setTest_startdate(test_startdate);
		stuaddVO.setStu_applytime(stu_applytime);			
		stuaddVO.setConfirm_time(confirm_time);
				
		StudentVO stuvo = new StudentVO();
		stuvo.setStu_id(stu_id);
		stuaddVO.setStudentVO(stuvo);
		
		Member_statusVO memvo = new Member_statusVO();
		memvo.setSta_id(3);
		stuaddVO.setMember_statusVO(memvo);
		
		Test_periodVO tpvo = new Test_periodVO();
		tpvo.setTest_hour_id(test_hour_id);
		stuaddVO.setTest_periodVO(tpvo);
		
		EmployeeVO empvo = new EmployeeVO();
		empvo.setEmp_id(emp_id);
		stuaddVO.setEmployeeVO(empvo);
		
		dao.update(stuaddVO);
		
		return stuaddVO;
		}
	public Stu_additionalVO upstatusok(Integer stu_id,Integer stu_add_id,Date test_startdate,Integer test_hour_id,String stu_applytime,Integer sta_id,String emp_id,Time confirm_time) throws SQLException {

		Stu_additionalVO stuaddVO = new Stu_additionalVO();

		stuaddVO.setStu_add_id(stu_add_id);			
		stuaddVO.setTest_startdate(test_startdate);
		stuaddVO.setStu_applytime(stu_applytime);			
		stuaddVO.setConfirm_time(confirm_time);
				
		StudentVO stuvo = new StudentVO();
		stuvo.setStu_id(stu_id);
		stuaddVO.setStudentVO(stuvo);
		
		Member_statusVO memvo = new Member_statusVO();
		memvo.setSta_id(2);
		stuaddVO.setMember_statusVO(memvo);
		
		Test_periodVO tpvo = new Test_periodVO();
		tpvo.setTest_hour_id(test_hour_id);
		stuaddVO.setTest_periodVO(tpvo);
		
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
			map.put("test_startdate",stuaddVO.getTest_startdate().toString());
			map.put("test_hour_id",stuaddVO.getTest_periodVO().getTest_hour_id().toString());
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
			map.put("sta_name",stu_addList.get(0).getMember_statusVO().getSta_name().toString());
			map.put("class_id",stu_addList.get(0).getStudentVO().getClassVO().getClass_name());
			stusc.add(map);
		String jsonString = JSONValue.toJSONString(stusc);
		return jsonString;
		
	}
}
