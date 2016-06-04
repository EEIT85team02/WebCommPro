package Stu_additionalController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.GregorianCalendar;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Stu_additional.model.Stu_additionalService;
import Student.model.StudentService;


@WebServlet("/Status/UpStuaddStatusJSON.do")
public class UpStuaddStatusJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpStuaddStatusJSON() {
        super();
        
    }


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setHeader("Access-Control-Allow-Origin", "*");
		res.setHeader("content-type", "text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
        PrintWriter out = res.getWriter();
        
		String action = req.getParameter("action");
		
		if("getStuAddId".equals(action)){
			Integer stu_add_id = Integer.parseInt(req.getParameter("stu_add_id"));
			Stu_additionalService stuaddSvc = new Stu_additionalService();
			try {
				String jsonString = stuaddSvc.getOneStuadd(stu_add_id);
				out.write(jsonString);
//				System.out.println(jsonString);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		  }
		if("upstatuscancel".equals(action)){

			Integer stu_id = Integer.parseInt(req.getParameter("stu_id"));
			Integer stu_add_id = new Integer(req.getParameter("stu_add_id"));				
			String teststart = req.getParameter("test_start");
			java.sql.Date test_start = null;
			String tests[] =req.getParameter("test_start").split("-");
			 GregorianCalendar teststgc = new GregorianCalendar(Integer.parseInt(tests[0]),Integer.parseInt(tests[1])-1,Integer.parseInt(tests[2]));
			 teststgc.getTime().getTime();
			if( teststart == null || teststart.length() == 0){
				test_start = null;
			}else{
				test_start = new java.sql.Date(new Long(teststgc.getTime().getTime()));
			}
			String testend = req.getParameter("test_end");
			java.sql.Date test_end = null;
			String teste[] =req.getParameter("test_start").split("-");
			 GregorianCalendar testegc = new GregorianCalendar(Integer.parseInt(teste[0]),Integer.parseInt(teste[1])-1,Integer.parseInt(teste[2]));
			 testegc.getTime().getTime();
			if( testend == null || testend.length() == 0){
				test_end = null;
			}else{
				test_end = new java.sql.Date(new Long(testegc.getTime().getTime()));
			}
			String stu_applytime = req.getParameter("stu_applytime");
			Integer sta_id = Integer.parseInt(req.getParameter("sta_id"));	
			String emp_id = req.getParameter("emp_id");	
			Time confirm_time = java.sql.Time.valueOf(req.getParameter("confirm_time"));	
			
			Stu_additionalService stuaddSvc = new Stu_additionalService();
			try {
				stuaddSvc.upstatuscancel(stu_id,stu_add_id,test_start,test_end,stu_applytime,sta_id,emp_id,confirm_time);
				out.write("資料更新成功");

			} catch (SQLException e) {
				out.write("資料更新失敗");
				e.printStackTrace();
			}
		
	  }
		if("upstatusok".equals(action)){

			Integer stu_id = Integer.parseInt(req.getParameter("stu_id"));
			Integer stu_add_id = new Integer(req.getParameter("stu_add_id"));				
			String teststart = req.getParameter("test_start");
			java.sql.Date test_start = null;
			String tests[] =req.getParameter("test_start").split("-");
			 GregorianCalendar teststgc = new GregorianCalendar(Integer.parseInt(tests[0]),Integer.parseInt(tests[1])-1,Integer.parseInt(tests[2]));
			 teststgc.getTime().getTime();
			if( teststart == null || teststart.length() == 0){
				test_start = null;
			}else{
				test_start = new java.sql.Date(new Long(teststgc.getTime().getTime()));
			}
			String testend = req.getParameter("test_end");
			java.sql.Date test_end = null;
			String teste[] =req.getParameter("test_start").split("-");
			 GregorianCalendar testegc = new GregorianCalendar(Integer.parseInt(teste[0]),Integer.parseInt(teste[1])-1,Integer.parseInt(teste[2]));
			 testegc.getTime().getTime();
			if( testend == null || testend.length() == 0){
				test_end = null;
			}else{
				test_end = new java.sql.Date(new Long(testegc.getTime().getTime()));
			}
			String stu_applytime = req.getParameter("stu_applytime");
			Integer sta_id = Integer.parseInt(req.getParameter("sta_id"));	
			String emp_id = req.getParameter("emp_id");	
			Time confirm_time = java.sql.Time.valueOf(req.getParameter("confirm_time"));	
			
			Stu_additionalService stuaddSvc = new Stu_additionalService();
			try {
				stuaddSvc.upstatusok(stu_id,stu_add_id,test_start,test_end,stu_applytime,sta_id,emp_id,confirm_time);
				out.write("資料更新成功");

			} catch (SQLException e) {
				out.write("資料更新失敗");
				e.printStackTrace();
			}
		
	  }
	}

}
