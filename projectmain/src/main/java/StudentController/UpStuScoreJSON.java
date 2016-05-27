package StudentController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.model.StudentService;
import Student.model.StudentVO;

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
					out.write(jsonString);
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
			//System.out.println(req.getParameter("stu_except"));
			
			String stuex = req.getParameter("stu_except");
			String stuseat = req.getParameter("stu_seatno");
			Integer stu_except=0;
			Integer stu_seatno=0;
			Integer stu_group = Integer.parseInt(req.getParameter("stu_group"));
			String stu_note1 = req.getParameter("stu_note1");
			Integer stu_id = Integer.parseInt(req.getParameter("stu_id"));
			String stu_name = req.getParameter("stu_name");
			Integer stu_age = Integer.parseInt(req.getParameter("stu_age"));
			String stu_sch = req.getParameter("stu_sch");
			Integer stu_sex = Integer.parseInt(req.getParameter("stu_sex"));
			String stu_email = req.getParameter("stu_email");
			Integer stu_pre = Integer.parseInt(req.getParameter("stu_pre"));
			Date stu_testtime =  java.sql.Date.valueOf(req.getParameter("stu_testtime"));
			Double stu_total = Double.parseDouble(req.getParameter("stu_total"));
			Date stu_workdate = java.sql.Date.valueOf(req.getParameter("stu_workdate"));
			if( stuex == null || stuex.length() == 0){
				stu_except=0;
			}else{
				stu_except = Integer.parseInt(stuex);
			}
			if( stuseat ==null || stuseat.length() == 0){
				stu_seatno=0;
			}else{
				stu_seatno = Integer.parseInt(stuseat);
			}
			
			Integer stu_final = Integer.parseInt(req.getParameter("stu_final"));
			String stu_note2 = req.getParameter("stu_note2");
			Double stu_implement = Double.parseDouble(req.getParameter("stu_implement"));
			Double stu_interview = Double.parseDouble(req.getParameter("stu_interview"));
			String log_pw = req.getParameter("log_pw");
			String class_id = req.getParameter("class_id");
			StudentService stuSvc = new StudentService();
			try {
				stuSvc.upscore(stu_group,stu_note1,stu_id,stu_name,stu_age,stu_sch,stu_sex,stu_email,stu_pre,stu_testtime,stu_total,stu_workdate,stu_except,stu_final,stu_note2,stu_implement, stu_interview,stu_seatno,log_pw,class_id);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
	  }

	}


