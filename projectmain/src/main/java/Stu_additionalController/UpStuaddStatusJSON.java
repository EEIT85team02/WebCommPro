package Stu_additionalController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
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
			Timestamp test_start = Timestamp.valueOf(req.getParameter("test_start"));
			Timestamp test_end = Timestamp.valueOf(req.getParameter("test_end"));	
			Timestamp stu_applytime = Timestamp.valueOf(req.getParameter("stu_applytime"));
			Integer sta_id = Integer.parseInt(req.getParameter("sta_id"));	
			String emp_id = "0000";	
	
			String title = req.getParameter("title");	

//			Time confirm_time = new java.sql.Time(new java.util.Date(req.getParameter("confirm_time")).getTime());	
	
			Timestamp confirm_time = new java.sql.Timestamp(new java.util.Date().getTime());
			Stu_additionalService stuaddSvc = new Stu_additionalService();
			try {
				stuaddSvc.upstatuscancel(stu_id,stu_add_id,test_start,test_end,stu_applytime,sta_id,emp_id,confirm_time,title);
				out.write("資料更新成功");

			} catch (SQLException e) {
				out.write("資料更新失敗");
				e.printStackTrace();
			}
		
	  }
		if("upstatusok".equals(action)){

			Integer stu_id = Integer.parseInt(req.getParameter("stu_id"));
			Integer stu_add_id = new Integer(req.getParameter("stu_add_id"));				
			Timestamp test_start = Timestamp.valueOf(req.getParameter("test_start"));
			Timestamp test_end = Timestamp.valueOf(req.getParameter("test_end"));	
			Timestamp stu_applytime = Timestamp.valueOf(req.getParameter("stu_applytime"));
			Integer sta_id = Integer.parseInt(req.getParameter("sta_id"));	
			String emp_id = req.getParameter("emp_id");	
			String title = req.getParameter("title");	
//			Timestamp confirm_time = Timestamp.valueOf(req.getParameter("confirm_time"));
//			String emp_id = "7001";
			Timestamp confirm_time = new java.sql.Timestamp(new java.util.Date().getTime());
			
			Stu_additionalService stuaddSvc = new Stu_additionalService();
			try {
				stuaddSvc.upstatusok(stu_id,stu_add_id,test_start,test_end,stu_applytime,sta_id,emp_id,confirm_time,title);
				out.write("資料更新成功");

			} catch (SQLException e) {
				out.write("資料更新失敗");
				e.printStackTrace();
			}
		
	  }
	}

}
