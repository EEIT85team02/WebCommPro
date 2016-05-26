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
		
//		if ("updatepage".equals(action)) {
//			String stu_id = req.getParameter("stu_id");
//			StudentService StuSvc = new StudentService();
//			StudentVO stuVO = null;
//			try {
//				stuVO = StuSvc.getOneStu(stu_id);
//			} catch (SQLException e) {
//				
//				e.printStackTrace();
//			}
//	
//			req.setAttribute("studentVO", stuVO);
//			
//			RequestDispatcher rd = req.getRequestDispatcher("/Score/showscore.jsp");
//			rd.forward(req, res);
//		}
//		
//		if ("update".equals(action)) {
//			Double stu_implement = Double.parseDouble(req.getParameter("stu_implement"));
//			Double stu_interview = Double.parseDouble(req.getParameter("stu_interview"));
//	
//			StudentVO stuVO = new StudentVO();
//
//			stuVO.setStu_implement(stu_implement);			
//			stuVO.setStu_interview(stu_interview);
//		
//			StudentService StuSvc = new StudentService();
//			try {
//				stuVO = StuSvc.upscore(stu_implement,stu_interview);
//			} catch (SQLException e) {
//				
//				e.printStackTrace();
//			}
//			req.setAttribute("studentVO", stuVO);
//
//			RequestDispatcher rd = req.getRequestDispatcher("/Score/showscore.jsp");
//			rd.forward(req, res);
//		}

	}

}
