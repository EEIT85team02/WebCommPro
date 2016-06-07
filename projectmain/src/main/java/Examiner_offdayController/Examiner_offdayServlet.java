package Examiner_offdayController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.google.gson.Gson;
import com.microsoft.sqlserver.jdbc.SQLServerException;

import Class.model.ClassVO;
import Edu.model.EduService;
import Examiner_offday.model.Examiner_offdayService;
import Mail_template.model.Mail_templateService;
import Stu_additional.model.IStu_additionalDAO;
import Stu_additional.model.Stu_additionalDAO;
import Stu_additional.model.Stu_additionalService;
import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentService;
import Student.model.StudentVO;


@WebServlet("/Examiner_offdayServlet")
public class Examiner_offdayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public Examiner_offdayServlet() {
    	
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		System.out.println(request.getParameter("exam_id"));
		
		try {
			
			System.out.println("------1------");

			if("getoneExam".equals(action)){
				Integer exam_id = Integer.valueOf(request.getParameter("exam_id"));
				System.out.println(exam_id);
				System.out.println("------2------");
				Examiner_offdayService examSvc = new Examiner_offdayService() ;
				System.out.println(exam_id);
				String exam_AllListJSON = examSvc.findByPrimaryKeyExamToJSON(exam_id);
				
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(exam_AllListJSON);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/***************************初始連結呼叫Examiner_offdayServlet轉址至ExamTODataTablesJSON.jsp********************/	
		if ("initExamTODataTablesJSON".equals(action)) {
			try {
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Examiner_offday/ExamTODataTablesJSON.jsp");
				successMsg.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/***************************更新表格(examiner_offday)******************************************/

		PrintWriter out = response.getWriter();
		if ("updateExam".equals(action)) { 
			System.out.println("222222");
			Map<String, String> Msgs = null;
			List exams =new LinkedList();
			String jsonString = null;
			Integer exam_id = null;
			Date off_startdate = null;
			Date off_enddate = null; 
			Integer off_day = null;
			String emp_job_id = null;
			String emp_id = null; 
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			try {
				Msgs = new HashMap<String, String>();
				System.out.println("----------------------------------------");
				exam_id = Integer.parseInt(request.getParameter("exam_id"));
				System.out.println(exam_id);
				off_startdate = Date.valueOf(request.getParameter("off_startdate"));
				System.out.println(off_startdate);
				off_enddate = Date.valueOf(request.getParameter("off_enddate"));
				System.out.println(off_enddate);
				off_day = Integer.parseInt(request.getParameter("off_day"));
				System.out.println(off_day);
				emp_job_id = request.getParameter("emp_job_id");
				System.out.println(emp_job_id);
				emp_id = request.getParameter("emp_id");
				System.out.println(emp_id);
				
				if (!Msgs.isEmpty()) {
					out.write("資料更新失敗");
					return;
				}
				/*******************將資料(更新)至資料庫**********************/
				else{
					Examiner_offdayService examSvc = new Examiner_offdayService();
					examSvc.updateExam(exam_id,off_startdate,off_enddate,off_day,
							emp_job_id,emp_id);
					out.write("資料更新成功");
					return;
				}
			} 
			catch (SQLServerException e) {
				out.write("資料更新失敗");
				return;
			}
			catch (Exception e) {
				out.write("資料更新失敗");
				return;
			}
		}
		

	}
	

}
