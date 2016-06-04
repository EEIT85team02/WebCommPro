package StudentController;

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

import Edu.model.EduService;
import Mail_template.model.Mail_templateService;
import Stu_additional.model.IStu_additionalDAO;
import Stu_additional.model.Stu_additionalDAO;
import Stu_additional.model.Stu_additionalService;
import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentService;
import Student.model.StudentVO;

/**
 * Servlet implementation class StudentProfileServlet
 */
@WebServlet({"/StudentProfileServlet","/Student_maintain/StudentProfileServlet"})
public class StudentProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public StudentProfileServlet() {
    	
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
//		String action ="stu_add";
		System.out.println(request.getParameter("stu_id"));
		
		try {
			//Integer stu_id = 4;
			System.out.println("------1------");
			
			
	
			if("stu_add".equals(action)){
				Integer stu_id = Integer.parseInt(request.getParameter("stu_id"));
				System.out.println(stu_id);
				System.out.println("------2------");
				Stu_additionalService stu_AllSvc = new Stu_additionalService() ;
				System.out.println(stu_id);
				String stu_AllListJSON = stu_AllSvc.getStuByStu_id(stu_id);
				//String stu_AllListJSON = stu_AllSvc.getStuByStu_add_id(stu_add_id);
				
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(stu_AllListJSON);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/***************************初始連結呼叫StudentProfileServlet轉址至StumTODataTablesJSON.jsp********************/	
		if ("initStumTODataTablesJSON".equals(action)) {
			try {
				// ============轉到教育中心EduViewJSON====================
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Student_maintain/StumTODataTablesJSON.jsp");
				successMsg.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/***************************更新表格(student_addtional)******************************************/

		PrintWriter out = response.getWriter();
		if ("updateStum".equals(action)) { 
			System.out.println("222222");
			Map<String, String> Msgs = null;
			List stums =new LinkedList();
			String jsonString = null;
			Integer stu_id = null;
			Integer stu_group = null; 
			String stu_note1 = null;
			Integer stu_seatno = null;
			String stu_name = null;
			String stu_sch = null; 
			Integer stu_sex = null; 
			Integer stu_age = null;
			String stu_email = null;
			Integer stu_pre = null;
			Double stu_implement = null;
			Date stu_testtime = null;
			Double stu_interview = null;
			Double stu_total = null;
			Date stu_workdate = null;
			Double stu_except = null;
			Integer stu_final = null;
			String stu_note2 = null;
			String log_pw = null;
			String class_id = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			try {
				Msgs = new HashMap<String, String>();
				System.out.println("----------------------------------------");
				stu_id = Integer.parseInt(request.getParameter("stu_id"));
				System.out.println(stu_id);
				stu_group = Integer.parseInt(request.getParameter("stu_group"));
				System.out.println(stu_group);
				stu_note1 = request.getParameter(stu_note1);
				System.out.println(stu_note1);
				stu_seatno = Integer.parseInt(request.getParameter("stu_seatno"));
				System.out.println(stu_seatno);
				stu_name = request.getParameter("stu_name");
				System.out.println(stu_name);
				stu_sch = request.getParameter("stu_sch");
				System.out.println(stu_sch);
				stu_sex = Integer.parseInt(request.getParameter("stu_sex"));
				System.out.println(stu_sex);
				stu_age = Integer.parseInt(request.getParameter("stu_age"));
				System.out.println(stu_age);
				stu_email = request.getParameter("stu_email");
				System.out.println(stu_email);
				stu_pre = Integer.parseInt(request.getParameter("stu_pre"));
				System.out.println(stu_pre);
				stu_implement =Double.valueOf(request.getParameter("stu_implement"));
				System.out.println(stu_implement);
//				String stu_testtime1 = sdf.format(request.getParameter("stu_testtime"));
//				stu_testtime = Date.valueOf(stu_testtime1);
//				
//				System.out.println("aaa"+stu_testtime);
				stu_interview = Double.valueOf(request.getParameter("stu_interview"));
				System.out.println(stu_interview);
				stu_total = Double.valueOf(request.getParameter("stu_total"));
				System.out.println(stu_total);
//				stu_workdate = Date.valueOf(request.getParameter("stu_workdate"));
//				System.out.println(stu_workdate);
				stu_except =Double.valueOf(request.getParameter("stu_except"));
				System.out.println(stu_except);
				stu_final = Integer.parseInt(request.getParameter("stu_final"));
				System.out.println(stu_final);
				stu_note2 = request.getParameter("stu_note2");
				System.out.println(stu_note2);
				log_pw = request.getParameter("log_pw");
				System.out.println(log_pw);
				class_id = request.getParameter("class_id");
				System.out.println(class_id);
				
				
				if (!Msgs.isEmpty()) {
					out.write("資料更新失敗");
					return;
				}
				/*******************將資料(更新)至資料庫**********************/
				else{
					Stu_additionalService stu_add = new Stu_additionalService();
					stu_add.updateStum(stu_id,stu_group,stu_note1,stu_seatno,
							stu_name,stu_sch,stu_sex,stu_age,stu_email,
							stu_pre,stu_implement,stu_testtime,stu_interview,
							stu_total,stu_workdate,stu_except,stu_final,
							stu_note2,log_pw,class_id);
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
