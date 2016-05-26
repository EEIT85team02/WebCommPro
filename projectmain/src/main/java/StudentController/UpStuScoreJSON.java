package StudentController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

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
			String stu_id = req.getParameter("stu_id");
			StudentService stuSvc = new StudentService();
			try {
				String jsonString = stuSvc.getOneStu(stu_id);
				out.write(jsonString);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		  }
		if("upscore".equals(action)){
			Integer stu_group = Integer.parseInt(req.getParameter("stu_group"));
			String stu_note1 = req.getParameter("stu_note1");
			String stu_id = req.getParameter("stu_id");
			String stu_name = req.getParameter("stu_name");
			Integer stu_age = Integer.parseInt(req.getParameter("stu_age"));
			String stu_sch = req.getParameter("stu_sch");
			String stu_sex = req.getParameter("stu_sex");
			String stu_email = req.getParameter("stu_email");
			String stu_pre = req.getParameter("stu_pre");
			String stu_testtime = req.getParameter("stu_testtime");
			String stu_total = req.getParameter("stu_total");
			String stu_workdate = req.getParameter("stu_workdate");
			Integer stu_except = Integer.parseInt(req.getParameter("stu_except"));
			String stu_final = req.getParameter("stu_final");
			String stu_note2 = req.getParameter("stu_note2");
			Double stu_implement = Double.parseDouble(req.getParameter("stu_implement"));
			Double stu_interview = Double.parseDouble(req.getParameter("stu_interview"));
			StudentService stuSvc = new StudentService();
			try {
				stuSvc.upscore(stu_group,stu_note1,stu_id,stu_name,stu_age,stu_sch,stu_sex,stu_email,stu_pre,stu_testtime,stu_total,stu_workdate,stu_except,stu_final,stu_note2,stu_implement, stu_interview);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
	  }
	}


