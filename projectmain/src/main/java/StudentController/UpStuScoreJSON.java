package StudentController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.model.StudentService;
import Student.model.StudentVO;

@WebServlet("/Score/upscoreJSON.do")
public class UpStuScoreJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpStuScoreJSON() {
        super();
        
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}



	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setHeader("Access-Control-Allow-Origin", "*");
		res.setHeader("content-type", "text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
        PrintWriter out = res.getWriter();
        
		String action = req.getParameter("action");
		 

		if ("getAllScore".equals(action)) {
			
				 StudentService stuSvc = new StudentService();
				try {
					String jsonString = stuSvc.getAllScoreJSON();
					//out.print(jsonString);
					out.write(jsonString);
					//System.out.println(jsonString);
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
				
			}
		if("getPkId".equals(action)){
			Integer stu_id = Integer.parseInt(req.getParameter("stu_id"));
			StudentService stuSvc = new StudentService();
			try {
				String jsonString = stuSvc.getOneStu(stu_id);
				out.write(jsonString);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		  }
		if("upscore".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String stuseat = req.getParameter("stu_seatno");
			Integer stu_seatno=0;
			String stusex = req.getParameter("stu_sex");
			Integer stu_sex=0;
			String stupre = req.getParameter("sty_pre");
			Integer stu_pre=0;
			String stufinal = req.getParameter("stu_final");
			Integer stu_final=0;
			String stutesttime = req.getParameter("stu_testtime");
			java.sql.Date stu_testtime = null;
			String stutotal = req.getParameter("stu_total");
			Double stu_total = 0.0;
			String stuworkdate = req.getParameter("stu_workdate");
			java.sql.Date stu_workdate = null;
			String stuexcept = req.getParameter("stu_except");
			Double stu_except = 0.0;
			String stugroup = req.getParameter("stu_group");
			Integer stu_group = 0;
			String stuage = req.getParameter("stu_age");
			Integer stu_age = 0;
			String stu_note1 = req.getParameter("stu_note1");
			Integer stu_id = Integer.parseInt(req.getParameter("stu_id"));
			String stu_name = req.getParameter("stu_name");
			String stu_sch = req.getParameter("stu_sch");
			if( stusex ==null || stusex.length() == 0){
				stu_sex=0;
			}else{
				stu_sex = Integer.parseInt(stusex);
			}
			String stu_email = req.getParameter("stu_email");
			if( stupre ==null || stupre.length() == 0){
				stu_pre=0;
			}else{
				stu_pre = Integer.parseInt(stupre);
			}
			if( stutotal == null || stutotal.length() == 0){
				stu_total = null;
			}else{
				stu_total = Double.parseDouble(req.getParameter("stu_total"));
			}
			String stutt[] =req.getParameter("stu_testtime").split("-");
			 GregorianCalendar stuttgc = new GregorianCalendar(Integer.parseInt(stutt[0]),Integer.parseInt(stutt[1])-1,Integer.parseInt(stutt[2]));
			 stuttgc.getTime().getTime();
//			for(String aa:stutt){
//				System.out.println("aa==========="+aa);
//			}
//			System.out.println(new java.sql.Date(new Long());
//			java.sql.Date stu_testtime = new java.sql.Date(new Long(req.getParameter("stu_testtime")));
			if( stutesttime == null || stutesttime.length() == 0){
				stu_testtime = null;
			}else{
				stu_testtime = new java.sql.Date(new Long(stuttgc.getTime().getTime()));
			}
			String stuwd[] =req.getParameter("stu_workdate").split("-");
			 GregorianCalendar stuwdgc = new GregorianCalendar(Integer.parseInt(stuwd[0]),Integer.parseInt(stuwd[1])-1,Integer.parseInt(stuwd[2]));
			 stuwdgc.getTime().getTime();
			if( stuworkdate == null || stuworkdate.length() == 0){
				stu_workdate = null;
			}else{
				stu_workdate = new java.sql.Date(new Long(stuwdgc.getTime().getTime()));
			}
//			java.sql.Date stu_workdate =new java.sql.Date(new Long(req.getParameter("stu_workdate")));
//			Double	stu_except = Double.parseDouble(req.getParameter("stu_except"));
			if( stuexcept == null || stuexcept.length() == 0){
				stu_except = null;
			}else{
				stu_except = Double.parseDouble(req.getParameter("stu_except"));
			}
			if( stugroup == null || stugroup.length() == 0){
				stu_group = 0;
			}else{
				stu_group = Integer.parseInt(req.getParameter("stu_group"));;
			}
			if( stuage == null || stuage.length() == 0){
				stu_age = 0;
			}else{
				stu_age = Integer.parseInt(req.getParameter("stu_age"));
			}
			if( stuseat == null || stuseat.length() == 0){
				stu_seatno=0;
			}else{
				stu_seatno = Integer.parseInt(stuseat);
			}
			
			if( stufinal == null || stufinal.length() == 0){
				stu_final=0;
			}else{
				stu_final = Integer.parseInt(stufinal);
			}
			String stu_note2 = req.getParameter("stu_note2");
			Double stu_implement = Double.parseDouble(req.getParameter("stu_implement"));
			if(stu_implement < 0 || stu_implement >100){
				errorMsgs.add("請填0到100之間的數字");
			}
			Double stu_interview = Double.parseDouble(req.getParameter("stu_interview"));
			if(stu_interview < 0 || stu_interview >100){
				errorMsgs.add("請填0到100之間的數字");
			}
			String class_id = req.getParameter("class_id");
			byte[] pub_key = req.getParameter("pub_key").getBytes("UTF-8");
			byte[] pri_key =req.getParameter("pri_key").getBytes("UTF-8");
			byte[] cipher_text = req.getParameter("cipher_text").getBytes("UTF-8");
			byte[] log_pw = req.getParameter("log_pw").getBytes("UTF-8");
			if (!errorMsgs.isEmpty()) {
				out.write("資料更新失敗");
			}else{
			StudentService stuSvc = new StudentService();
			try {
				stuSvc.upscore(stu_group,stu_note1,stu_id,stu_name,stu_age,stu_sch,stu_sex,stu_email,stu_pre,stu_testtime,stu_total,stu_workdate,stu_except,stu_final,stu_note2,stu_implement, stu_interview,stu_seatno,class_id,pub_key,pri_key,cipher_text,log_pw);
				out.write("資料更新成功");

			} catch (SQLException e) {
				out.write("資料更新失敗");
				e.printStackTrace();
			}
		}
	  }

	}
}

