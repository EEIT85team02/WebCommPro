package Student.model;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONValue;

import Class.model.ClassVO;
import Mail_template.model.Mail_templateDAO;
import Stu_additional.model.Stu_additionalVO;


public class StudentService {
	private static IStudentDAO dao;

	public StudentService() {
		dao = new StudentDAO();
	}
	public List<StudentVO> getAll() throws SQLException {
		
		return dao.getAll();
	}
	public String getOneSta(Integer stu_id) throws SQLException {	
		List memsc=new LinkedList();
		StudentVO stuVO=dao.findByPrimaryKey(stu_id);	
		Set<Stu_additionalVO> set = dao.getStuByStu_id(stu_id);	
		for(Stu_additionalVO stuaddVO:set){
			Map map = new HashMap();
			map.put("stu_name",stuVO.getStu_name());
			map.put("stu_email",stuVO.getStu_email());
			map.put("stu_id",stuVO.getStu_id());
			map.put("stu_applytime",stuaddVO.getStu_applytime());
			map.put("sta_name",stuaddVO.getMember_statusVO().getSta_name());
			memsc.add(map);

//		System.out.println(stuaddVO.getMember_statusVO().getSta_name());
//		System.out.println(stuVO.getStu_name());
		}

           
		String jsonString = JSONValue.toJSONString(memsc);
	    return jsonString;
	}	
	public String getOneEmailStu(Integer stu_id) throws SQLException {	
		List stusc=new LinkedList();
		StudentVO stu=dao.findByPrimaryKey(stu_id);
		Set<Stu_additionalVO> set = stu.getStu_additionalVO();
        for(Stu_additionalVO stuadd:set){
			Map map = new HashMap();
			map.put("stu_name",stu.getStu_name().toString());
			map.put("stu_email",stu.getStu_email().toString());
			map.put("stu_applytime",stuadd.getStu_applytime().toString());
			stusc.add(map);
		}
	 
		String jsonString = JSONValue.toJSONString(stusc);
		return jsonString;
		}
	public String getOneStu(Integer stu_id) throws SQLException {	
		List stusc=new LinkedList();
		StudentVO stuVO=dao.findByPrimaryKey(stu_id);

			Map map = new HashMap();
			map.put("stu_id",stuVO.getStu_id().toString());
			map.put("stu_name",stuVO.getStu_name().toString());
			map.put("stu_implement",stuVO.getStu_implement().toString());
			map.put("stu_interview",stuVO.getStu_interview().toString());
			map.put("stu_group",stuVO.getStu_group().toString());
			map.put("stu_note1",stuVO.getStu_note1().toString());
			map.put("stu_age",stuVO.getStu_age().toString());
			map.put("stu_sch",stuVO.getStu_sch().toString());
			map.put("stu_sex",stuVO.getStu_sex().toString());
			map.put("stu_email",stuVO.getStu_email().toString());
			map.put("stu_pre",stuVO.getStu_pre().toString());
			map.put("stu_testtime",stuVO.getStu_testtime().toString());
			map.put("stu_total",stuVO.getStu_total().toString());
			map.put("stu_workdate",stuVO.getStu_workdate().toString());
			map.put("stu_except",stuVO.getStu_except().toString());
			map.put("stu_final",stuVO.getStu_final().toString());
			map.put("stu_note2",stuVO.getStu_note2().toString());
			map.put("stu_seatno",stuVO.getStu_seatno().toString());
			map.put("class_id",stuVO.getClassVO().getClass_id().toString());
			map.put("pub_key",stuVO.getPub_key()==null?stuVO.getPub_key():stuVO.getPub_key().toString());
			map.put("pri_key",stuVO.getPri_key()==null?stuVO.getPri_key():stuVO.getPri_key().toString());
			map.put("cipher_text",stuVO.getCipher_text()==null?stuVO.getCipher_text():stuVO.getCipher_text().toString());
			map.put("log_pw",stuVO.getLog_pw()==null?stuVO.getLog_pw():stuVO.getLog_pw().toString());
			stusc.add(map);
		String jsonString = JSONValue.toJSONString(stusc);
		//System.out.println(jsonString);
		return jsonString;
		}
	

	public String getOneStuAll(Integer stu_id) throws SQLException {	
		List stusc=new LinkedList();
		Stu_additionalVO stu_addVO=(Stu_additionalVO) dao.getStuByStu_id(stu_id);
			Map<String,String> map = new HashMap<String,String>();
			map.put("stu_id",stu_addVO.getStudentVO().getStu_id().toString());
			map.put("Test_start",stu_addVO.getTest_start().toString());
			map.put("Test_end",stu_addVO.getTest_end().toString());
			map.put("Stu_applytime(",stu_addVO.getStu_applytime().toString());
			map.put("Emp_id",stu_addVO.getEmployeeVO().getEmp_name());
			map.put("Confirm_time",stu_addVO.getConfirm_time().toString());
			map.put("Member_statusVO",stu_addVO.getMember_statusVO().toString());
			stusc.add(map);
		String jsonString = JSONValue.toJSONString(stusc);
		return jsonString;
		
	}

	public StudentVO upscore(Integer stu_group,String stu_note1,Integer stu_id,String stu_name,Integer stu_age,
							String stu_sch,Integer stu_sex,String stu_email,Integer stu_pre,java.sql.Date stu_testtime,
							Double stu_total,java.sql.Date stu_workdate,Double stu_except,Integer stu_final,String stu_note2,
							Double stu_implement,Double stu_interview,Integer stu_seatno, String class_id,byte[] pub_key,
							byte[] pri_key,byte[] cipher_text,byte[] log_pw) throws SQLException {

		StudentVO stuVO = new StudentVO();

		stuVO.setStu_group(stu_group);			
		stuVO.setStu_note1(stu_note1);
		stuVO.setStu_age(stu_age);			
		stuVO.setStu_sch(stu_sch);
		stuVO.setStu_sex(stu_sex);			
		stuVO.setStu_email(stu_email);
		stuVO.setStu_pre(stu_pre);			
		stuVO.setStu_testtime(stu_testtime);
		stuVO.setStu_total(stu_total);			
		stuVO.setStu_workdate(stu_workdate);
		stuVO.setStu_except(stu_except);			
		stuVO.setStu_final(stu_final);
		stuVO.setStu_note2(stu_note2);
		stuVO.setStu_id(stu_id);			
		stuVO.setStu_name(stu_name);
		stuVO.setStu_implement(stu_implement);			
		stuVO.setStu_interview(stu_interview);
		stuVO.setStu_seatno(stu_seatno);
		stuVO.setPub_key(pub_key);			
		stuVO.setPri_key(pri_key);
		stuVO.setCipher_text(cipher_text);
		stuVO.setLog_pw(log_pw);
		
		ClassVO clavo = new ClassVO();
		clavo.setClass_id(class_id);
		stuVO.setClassVO(clavo);
		
		dao.update(stuVO);
		
		return stuVO;
		}

//	public String getAllScoreJSON() throws SQLException{
//		List stusc=new LinkedList();
//		List<StudentVO> list=dao.getAll();	
//		for(StudentVO stuVO :list){
//			Map map = new HashMap();
//			map.put("stu_id",stuVO.getStu_id().toString());
//			map.put("stu_name",stuVO.getStu_name().toString());
//			map.put("stu_implement",stuVO.getStu_implement().toString());
//			map.put("stu_interview",stuVO.getStu_interview().toString());
//			map.put("stu_group",stuVO.getStu_group().toString());
//			map.put("stu_note1",stuVO.getStu_note1().toString());
//			map.put("stu_age",stuVO.getStu_age().toString());
//			map.put("stu_sch",stuVO.getStu_sch().toString());
//			map.put("stu_sex",stuVO.getStu_sex().toString());
//			map.put("stu_email",stuVO.getStu_email().toString());
//			map.put("stu_pre",stuVO.getStu_pre().toString());			
//			map.put("stu_testtime",stuVO.getStu_testtime().toString());
//			map.put("stu_total",stuVO.getStu_total().toString());
//			map.put("stu_workdate",stuVO.getStu_workdate().toString());
//			map.put("stu_except",stuVO.getStu_except().toString());
//			map.put("stu_final",stuVO.getStu_final().toString());
//			map.put("stu_note2",stuVO.getStu_note2().toString());
//			map.put("class_id",stuVO.getClassVO().getClass_id().toString());
//			map.put("stu_seatno",stuVO.getStu_seatno().toString());
//			map.put("pub_key",stuVO.getPub_key()==null?stuVO.getPub_key():stuVO.getPub_key().toString());
//			map.put("pri_key",stuVO.getPri_key()==null?stuVO.getPri_key():stuVO.getPri_key().toString());
//			map.put("cipher_text",stuVO.getCipher_text()==null?stuVO.getCipher_text():stuVO.getCipher_text().toString());
//			map.put("log_pw",stuVO.getLog_pw()==null?stuVO.getLog_pw():stuVO.getLog_pw().toString());
//			stusc.add(map);
//		}
//		
//		String jsonString = JSONValue.toJSONString(stusc);
//		return jsonString;
//	}
	public String getAllScoreJSON() throws SQLException{
		List stusc=new LinkedList();
		List<StudentVO> list=dao.getAll();	
		for(StudentVO stuVO :list){
			List stuVOg = new LinkedList();
			stuVOg.add(stuVO.getStu_id().toString());
			stuVOg.add(stuVO.getStu_name().toString());
			stuVOg.add(stuVO.getStu_implement().toString());
			stuVOg.add(stuVO.getStu_interview().toString());
			stuVOg.add("<button type='button' class='btn-info' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+stuVO.getStu_id().toString()+" >修改</button>");
			stusc.add(stuVOg);
		}
		Map map = new HashMap();
		map.put("data", stusc);
		String jsonString = JSONValue.toJSONString(map);
		return jsonString;
	}
	
	public String getAllStudentToJSONInitTable(List<StudentVO> list,String textNumber) throws SQLException{
		Mail_templateDAO mtSvc =new Mail_templateDAO();//new Mail_templateDAO
		String mail_name = mtSvc.findByPrimaryKey(Integer.parseInt(textNumber)).getMail_name(); //抓Mail_template裡面真正的文字
	
		StudentDAO dao=new StudentDAO();

		List<List<String>> stuVO = new LinkedList<List<String>>();
		String jsonValue = null;
		int count=0;//為了設value的值
		for(StudentVO a :list){
			List<String> detailStuVO = new ArrayList<String>();
			detailStuVO.add("<input type='checkbox' name='checkboxname' value='"+count+"'>");
			count++;
			detailStuVO.add(a.getStu_name().toString());
			detailStuVO.add(a.getStu_age().toString());
			detailStuVO.add(a.getStu_sch());
			detailStuVO.add(a.getStu_email());
			detailStuVO.add(mail_name);
			stuVO.add(detailStuVO);
		}
		Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
		mapJSON.put("data",stuVO);
		jsonValue = JSONValue.toJSONString(mapJSON);
		return jsonValue;
	}
	public static String getAllStudentInformationByClass1(String class_id,String textNumber) throws SQLException {
		StudentService ss=new StudentService();
		Mail_templateDAO mtSvc =new Mail_templateDAO();//new Mail_templateDAO
		String mail_name = mtSvc.findByPrimaryKey(Integer.parseInt(textNumber)).getMail_name(); //抓Mail_template裡面真正的文字
		List<StudentVO> list= dao.getAllStudentByClass(class_id);//依照class抓取學生
		
		
		
		String jsonString =ss.getAllStudentToJSONInitTable(list,textNumber);
		System.out.println("jsonString====="+jsonString);
		//將所需的資料先用map包起來再用list裝起來
//		List  l1 = new LinkedList();
//		for(int i=0,max=list.size();i<max;i++){
//			StudentVO aa=(StudentVO) list.get(i);
//			System.out.println(aa);
//			 Map m1 = new HashMap();       
//			 m1.put("stu_name", aa.getStu_name()); 				 
//			 m1.put("stu_age",aa.getStu_age());   
//			 m1.put("stu_sch",aa.getStu_sch());   
//			 m1.put("stu_email", aa.getStu_email());					 
//			 m1.put("class_id",aa.getClass_id());   
//			 m1.put("mail_name", mail_name);
//			 m1.put("class_id", aa.getClass());
//			 l1.add(m1);					
//		}



//		 String jsonString = JSONValue.toJSONString(l1); //list轉成 JSON String                  
		
		return jsonString;
	}	
	public static String getAllStudentInformationByClass(String class_id,String textNumber) throws SQLException {

		Mail_templateDAO mtSvc =new Mail_templateDAO();//new Mail_templateDAO
		String mail_name = mtSvc.findByPrimaryKey(Integer.parseInt(textNumber)).getMail_name(); //抓Mail_template裡面真正的文字
		List<StudentVO> list= dao.getAllStudentByClass(class_id);//依照class抓取學生
		
		
		


		//將所需的資料先用map包起來再用list裝起來
		List  l1 = new LinkedList();
		for(int i=0,max=list.size();i<max;i++){
			StudentVO aa=(StudentVO) list.get(i);
			System.out.println(aa);
			 Map m1 = new HashMap();       
			 m1.put("stu_name", aa.getStu_name()); 				 
			 m1.put("stu_age",aa.getStu_age());   
			 m1.put("stu_sch",aa.getStu_sch());   
			 m1.put("stu_email", aa.getStu_email());					 
			 m1.put("mail_name", mail_name);

			 l1.add(m1);					
		}



		 String jsonString = JSONValue.toJSONString(l1); //list轉成 JSON String                  
		
		return jsonString;
	}		
	
}



	
