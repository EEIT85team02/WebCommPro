package StudentController;

import java.io.IOException;
import java.sql.SQLException;
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


public class UpStuScore extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
         if ("score".equals(action)) {
			
			StudentService StuSvc = new StudentService();
			List<StudentVO> stuVO = null;
			try {
				stuVO = StuSvc.getAll();
		
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	
			req.setAttribute("studentVO", stuVO);
			
			RequestDispatcher rd = req.getRequestDispatcher("/Score/showscore.jsp");
			rd.forward(req, res);
		}
		
		if ("updatepage".equals(action)) {
			String stu_id = req.getParameter("stu_id");
			StudentService StuSvc = new StudentService();
			StudentVO stuVO = null;
			try {
				stuVO = StuSvc.getOneStu(stu_id);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	
			req.setAttribute("studentVO", stuVO);
			
			RequestDispatcher rd = req.getRequestDispatcher("/Score/showscore.jsp");
			rd.forward(req, res);
		}
		
		if ("update".equals(action)) {
			String stu_id = req.getParameter("stu_id");
			String stu_name = req.getParameter("stu_name");
			String stu_group = req.getParameter("stu_group");
			String stu_age = req.getParameter("stu_age");
		    String stu_email = req.getParameter("stu_email");
			String stu_note1 = req.getParameter("stu_note1");
			String stu_sch = req.getParameter("stu_sch");
		    String stu_sex = req.getParameter("stu_sex");
			String stu_pre = req.getParameter("stu_pre");
			Double stu_implement = Double.parseDouble(req.getParameter("stu_implement"));
			String stu_testtime = req.getParameter("stu_testtime");
			Double stu_interview = Double.parseDouble(req.getParameter("stu_interview"));
		    String stu_total = req.getParameter("stu_total");
			String stu_workdate = req.getParameter("stu_workdate");
			String stu_except = req.getParameter("stu_except");
		    String stu_final = req.getParameter("stu_final");
		    String stu_note2 = req.getParameter("stu_note2");
			 
			
			StudentVO stuVO = new StudentVO();
			stuVO.setStu_group(stu_group);
			stuVO.setStu_note1(stu_note1);
			stuVO.setStu_id(stu_id);
			stuVO.setStu_name(stu_name);
			stuVO.setStu_age(stu_age);
			stuVO.setStu_sch(stu_sch);
			stuVO.setStu_sex(stu_sex);
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

			
			
			StudentService StuSvc = new StudentService();
			try {
				stuVO = StuSvc.upscore(stu_group,stu_note1,stu_id,stu_name,stu_age,stu_sch,stu_sex,stu_email,stu_pre,stu_implement,stu_testtime,stu_interview,stu_total,stu_workdate,stu_except,stu_final,stu_note2);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			req.setAttribute("studentVO", stuVO);

			RequestDispatcher rd = req.getRequestDispatcher("/Score/showscore.jsp");
			rd.forward(req, res);
		}

	}

}
