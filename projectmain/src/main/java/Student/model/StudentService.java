package Student.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;

import Mail_template.model.Mail_templateDAO;


public class StudentService {
	private static IStudentDAO dao;

	public StudentService() {
		dao = new StudentDAO();
	}
	public List<StudentVO> getAll() throws SQLException {
		return dao.getAll();
	}
	public String getOneStu(String stu_id) throws SQLException {	
		List stusc=new LinkedList();
		StudentVO stuVO=dao.findByPrimaryKey(stu_id);
			Map map = new HashMap();
			map.put("stu_id",stuVO.getStu_id());
			map.put("stu_name",stuVO.getStu_name());
			map.put("stu_implement",stuVO.getStu_implement());
			map.put("stu_interview",stuVO.getStu_interview());
			map.put("stu_group",stuVO.getStu_group());
			map.put("stu_note1",stuVO.getStu_note1());
			map.put("stu_age",stuVO.getStu_age());
			map.put("stu_sch",stuVO.getStu_sch());
			map.put("stu_sex",stuVO.getStu_sex());
			map.put("stu_email",stuVO.getStu_email());
			map.put("stu_pre",stuVO.getStu_pre());
			map.put("stu_testtime",stuVO.getStu_testtime());
			map.put("stu_total",stuVO.getStu_total());
			map.put("stu_workdate",stuVO.getStu_workdate());
			map.put("stu_except",stuVO.getStu_except());
			map.put("stu_final",stuVO.getStu_final());
			map.put("stu_note2",stuVO.getStu_note2());
			map.put("stu_seatno",stuVO.getStu_seatno());
			stusc.add(map);
		String jsonString = JSONValue.toJSONString(stusc);
		return jsonString;
		
	}

	public StudentVO upscore(Integer stu_group,String stu_note1,String stu_id,String stu_name,Integer stu_age,String stu_sch,String stu_sex,String stu_email,String stu_pre,String stu_testtime,String stu_total,String stu_workdate,Integer stu_except,String stu_final,String stu_note2,Double stu_implement,Double stu_interview,Integer stu_seatno,String log_pw) throws SQLException {

		StudentVO stuVO = new StudentVO();

		stuVO.setStu_group(stu_group);			
		stuVO.setStu_note1(stu_note1);
		stuVO.setStu_age(stu_age);			
		stuVO.setStu_sch(stu_sch);
		stuVO.setStu_sex(stu_sex);			
		stuVO.setStu_email(stu_email);
		stuVO.setStu_pre(stu_pre);			
		stuVO.setStu_testtime(stu_testtime);
		stuVO.setStu_id(stu_total);			
		stuVO.setStu_name(stu_workdate);
		stuVO.setStu_except(stu_except);			
		stuVO.setStu_final(stu_final);
		stuVO.setStu_note2(stu_note2);
		stuVO.setStu_id(stu_id);			
		stuVO.setStu_name(stu_name);
		stuVO.setStu_implement(stu_implement);			
		stuVO.setStu_interview(stu_interview);
		stuVO.setStu_seatno(stu_seatno);
		stuVO.setLog_pw(log_pw);
		
		dao.update(stuVO);
		
		return stuVO;
		}

	public String getAllScoreJSON() throws SQLException{
		List stusc=new LinkedList();
		List<StudentVO> list=dao.getAll();	
		for(StudentVO stuVO :list){
			Map map = new HashMap();
			map.put("stu_id",stuVO.getStu_id());
			map.put("stu_name",stuVO.getStu_name());
			map.put("stu_implement",stuVO.getStu_implement());
			map.put("stu_interview",stuVO.getStu_interview());
			map.put("stu_group",stuVO.getStu_group());
			map.put("stu_note1",stuVO.getStu_note1());
			map.put("stu_age",stuVO.getStu_age());
			map.put("stu_sch",stuVO.getStu_sch());
			map.put("stu_sex",stuVO.getStu_sex());
			map.put("stu_email",stuVO.getStu_email());
			map.put("stu_pre",stuVO.getStu_pre());
			map.put("stu_testtime",stuVO.getStu_testtime());
			map.put("stu_total",stuVO.getStu_total());
			map.put("stu_workdate",stuVO.getStu_workdate());
			map.put("stu_except",stuVO.getStu_except());
			map.put("stu_final",stuVO.getStu_final());
			map.put("stu_note2",stuVO.getStu_note2());
			stusc.add(map);
		}
		String jsonString = JSONValue.toJSONString(stusc);
		return jsonString;
	}
	
	public static String getAllStudentInformationByClass(String class_id,String textNumber) throws SQLException {

		
		Mail_templateDAO mtSvc =new Mail_templateDAO();//new Mail_templateDAO
		String mailText = mtSvc.findByPrimaryKey(Integer.parseInt(textNumber)).getMail_text(); //抓Mail_template裡面真正的文字
		List<StudentVO> list= dao.getAllStudentByClass(class_id);//依照class抓取學生
		System.out.println("list====="+list);
		
		//將所需的資料先用map包起來再用list裝起來
		List  l1 = new LinkedList();
		for(int i=0,max=list.size();i<max;i++){
			StudentVO aa=(StudentVO) list.get(i);
			System.out.println(aa);
			 Map m1 = new HashMap();       
			 m1.put("stu_id",aa.getStu_id());   
			 m1.put("stu_name", aa.getStu_name()); 				 
			 m1.put("stu_email", aa.getStu_email());					 
			 m1.put("mailText", mailText);
//			 m1.put("class_id", aa.getClass());
			 l1.add(m1);					
		}



		 String jsonString = JSONValue.toJSONString(l1); //list轉成 JSON String                  
		
		return jsonString;
	}	
	
	
}
