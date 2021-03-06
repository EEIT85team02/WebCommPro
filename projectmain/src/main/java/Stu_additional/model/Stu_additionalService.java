package Stu_additional.model;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
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
import SendMail.model.EncryptService;
import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentVO;
import Talk.model.TalkVO;
import Test_period.model.Test_periodVO;


public class Stu_additionalService {
	private IStu_additionalDAO dao;
	private IStudentDAO dao2;

	public Stu_additionalService() {
		dao = new Stu_additionalDAO();
		dao2 = new StudentDAO() ;
	}
	
	public void insert(Timestamp test_start, Timestamp test_end,
			Timestamp stu_applytime,Timestamp confirm_time,Integer stu_id,Integer sta_id,String emp_id,String title ) throws SQLException {
		
		Stu_additionalVO stuaddvo = new Stu_additionalVO();
		
	
		stuaddvo.setTest_start(test_start);
		stuaddvo.setTest_end(test_end);
		stuaddvo.setStu_applytime(stu_applytime);
		stuaddvo.setConfirm_time(confirm_time);
		stuaddvo.setTitle(title);
		
		StudentVO stuVO = new StudentVO();
		stuVO.setStu_id(stu_id);
		stuaddvo.setStudentVO(stuVO);
		Member_statusVO memVO = new Member_statusVO();
		memVO.setSta_id(sta_id);
		stuaddvo.setMember_statusVO(memVO);
		EmployeeVO empVO = new EmployeeVO();
		empVO.setEmp_id(emp_id);
		stuaddvo.setEmployeeVO(empVO);
		

		
		System.out.println("stu_id:"+stu_id);
		System.out.println("sta_id:"+sta_id);
		System.out.println("emp_id:"+emp_id);
		System.out.println("test_start:"+test_start);
		System.out.println("test_end:"+test_end);
		System.out.println("stu_applytime:"+stu_applytime);
		System.out.println("confirm_time:"+confirm_time);
		System.out.println("title:"+title);
		
		dao.insert(stuaddvo);
	}
	
	public void updateStum(Integer stu_id,Integer stu_group,String stu_note1,Integer stu_seatno,
			String stu_name,String stu_sch,Integer stu_sex,Integer stu_age,String stu_email,
			Integer stu_pre,Double stu_implement,Timestamp stu_testtime,Double stu_interview,

			Double stu_total,Timestamp stu_workdate,Double stu_except,Integer stu_final,

			String stu_note2,byte[] pub_key,byte[] pri_key,byte[] cipher_text,byte[] log_pw,
			String class_id) throws SQLException {

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
		stuVO.setPub_key(pub_key);
		stuVO.setPri_key(pri_key);
		stuVO.setCipher_text(cipher_text);
		stuVO.setLog_pw(log_pw);
		ClassVO classVO = new ClassVO();
		classVO.setClass_id(class_id);
		stuVO.setClassVO(classVO);
		dao.update(stuVO);
	}
	
	public List<Stu_additionalVO> getAll() throws SQLException {
		return dao.getAll();
	}
	public Stu_additionalVO upstatuscancel(Integer stu_id,Integer stu_add_id,Timestamp test_start,Timestamp test_end,Timestamp stu_applytime,Integer sta_id,String emp_id,Timestamp confirm_time,String title) throws SQLException {

		Stu_additionalVO stuaddVO = new Stu_additionalVO();

		stuaddVO.setStu_add_id(stu_add_id);			
		stuaddVO.setTest_start(test_start);
		stuaddVO.setTest_end(test_end);
		stuaddVO.setStu_applytime(stu_applytime);			
		stuaddVO.setConfirm_time(confirm_time);
		stuaddVO.setTitle(title);
				
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
	public Stu_additionalVO upstatusok(Integer stu_id,Integer stu_add_id,Timestamp test_start,Timestamp test_end,Timestamp stu_applytime,Integer sta_id,String emp_id,Timestamp confirm_time,String title) throws SQLException {

		Stu_additionalVO stuaddVO = new Stu_additionalVO();

		stuaddVO.setStu_add_id(stu_add_id);			
		stuaddVO.setTest_start(test_start);
		stuaddVO.setTest_end(test_end);
		stuaddVO.setStu_applytime(stu_applytime);			
		stuaddVO.setConfirm_time(confirm_time);
		stuaddVO.setTitle(title);
				
		StudentVO stuvo = new StudentVO();
		stuvo.setStu_id(stu_id);
		stuaddVO.setStudentVO(stuvo);
		
		Member_statusVO memvo = new Member_statusVO();
		memvo.setSta_id(1);
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
			map.put("title",stuaddVO.getTitle());
			stuaddsc.add(map);
		String jsonString = JSONValue.toJSONString(stuaddsc);
		return jsonString;
		
	}
	
	public String getStu_addByStu_id(Integer stu_id) throws SQLException {	
		List stusc=new LinkedList();
		List<Stu_additionalVO> stu_addList =dao.findByStu_id(stu_id);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
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
			java.util.Date test_start = stu_addList.get(0).getTest_start();
			map.put("test_start",sdf.format(test_start));
			java.util.Date test_end = stu_addList.get(0).getTest_end();
			map.put("test_end",sdf.format(test_end));
			java.util.Date stu_applytime = stu_addList.get(0).getStu_applytime();
			map.put("stu_applytime",sdf.format(stu_applytime));
			map.put("sta_id",stu_addList.get(0).getMember_statusVO().getSta_id().toString());
			map.put("emp_id",stu_addList.get(0).getEmployeeVO().getEmp_name().toString());
			java.util.Date confirm_time = stu_addList.get(0).getConfirm_time();
			map.put("confirm_time",sdf.format(confirm_time));
			map.put("member_statusVO",stu_addList.get(0).getMember_statusVO().getSta_name().toString());
			map.put("class_id",stu_addList.get(0).getStudentVO().getClassVO().getClass_id());

			map.put("class_name",stu_addList.get(0).getStudentVO().getClassVO().getClass_name());
			EncryptService es=new EncryptService();
			
			//將byte[]都先使用base64編碼
			map.put("pub_key",es.Base64Encrypt(stu_addList.get(0).getStudentVO().getPub_key()));
			map.put("pri_key",es.Base64Encrypt(stu_addList.get(0).getStudentVO().getPri_key()));
			map.put("cipher_text",es.Base64Encrypt(stu_addList.get(0).getStudentVO().getCipher_text()));
			map.put("log_pw",es.Base64Encrypt(stu_addList.get(0).getStudentVO().getLog_pw()));
			
//			map.put("pub_key",es.Base64Encrypt(stu_addList.get(0).getStudentVO().getPub_key()));
//			map.put("pri_key",es.Base64Encrypt(stu_addList.get(0).getStudentVO().getPri_key()));
//			map.put("cipher_text",es.Base64Encrypt(stu_addList.get(0).getStudentVO().getCipher_text()));
//			map.put("log_pw",es.Base64Encrypt(stu_addList.get(0).getStudentVO().getLog_pw()));

			stusc.add(map);
		String jsonString = JSONValue.toJSONString(stusc);
		return jsonString;
		
	}
	
	public String getStuByStu_id(Integer stu_id) throws SQLException {
		
		List stusc=new LinkedList();
		System.out.println("-----------stu_id:"+stu_id);
		StudentVO stu_List = dao2.findByPrimaryKey(stu_id);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("-----------*****"+stu_List);
			Map<String,String> map = new HashMap<String,String>();
			map.put("stu_id",stu_List.getStu_id().toString());
			map.put("stu_name",stu_List.getStu_name().toString());
			map.put("stu_group",stu_List.getStu_group().toString());
			map.put("stu_age",stu_List.getStu_age().toString());
			map.put("stu_sch",stu_List.getStu_sch().toString());
			map.put("stu_sex",stu_List.getStu_sex().toString());
			map.put("stu_email",stu_List.getStu_email().toString());
			
			java.util.Date stu_workdate = stu_List.getStu_workdate();
			map.put("stu_workdate",sdf.format(stu_workdate));

			map.put("stu_seatno",stu_List.getStu_seatno().toString());
			map.put("class_id",stu_List.getClassVO().getClass_id());
			map.put("class_name",stu_List.getClassVO().getClass_name());
		

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
