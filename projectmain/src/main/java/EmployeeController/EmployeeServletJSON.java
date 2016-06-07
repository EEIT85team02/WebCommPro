package EmployeeController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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

import org.hibernate.exception.ConstraintViolationException;

import Employee.model.EmployeeService;
import Employee.model.EmployeeVO;
import Sign_list.model.Sign_listService;

import com.microsoft.sqlserver.jdbc.SQLServerException;



@WebServlet({"/Employee/EmployeeServletJSON.do","/Examiner_offday/EmployeeServletJSON.do"})
public class EmployeeServletJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public EmployeeServletJSON() {
		super();

	}
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			doPost(request,response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		EmployeeService empSvc = null;
		String action = request.getParameter("action");
		
		/******************************** 多筆刪除資料表 ***********************/
//		if ("updateEmpdelMulti".equals(action)) {
//			
//			try {
//				// ============接收代號emp_id資料====================
//				String emp_idJSON =request.getParameter("emp_id");
//				//System.out.println("class_idJSON========="+class_idJSON);
//				// ============呼叫方法刪除資料====================
//				empSvc = new EmployeeService();
//				empSvc.updateEmpdelMulti(emp_idJSON);
//				out.write("資料刪除成功");
//				return;
//			}catch (ConstraintViolationException e) {
//				e.printStackTrace();
//				out.write("資料刪除失敗");
//				return;
//			}
//			catch (SQLException e) {
//				e.printStackTrace();
//				out.write("資料刪除失敗");
//				return;
//			}
//		}
		/********************** 更新(刪除權限代號設定-->sl_id=0)資料表 ********************/	
		if ("updateEmpdel".equals(action)) { 
			Map<String, String> Msgs = null;
			List sls =new LinkedList();
			String jsonString = null;
			String emp_id= null;
			String emp_name= null;
			String emp_mail= null;
			String dep_name= null;
			Integer sl_id= null;
			try {
				Msgs = new HashMap<String, String>();
				/***************(修改)取得Sign_list-emp_id表單資料***************/
				emp_id =request.getParameter("emp_id");
				if (emp_id == null) {
					Msgs.put("emp_id", "員工代號不可空白");
				}
				/***************(修改)取得Sign_list-emp_name表單資料***************/
				emp_name = request.getParameter("emp_name");
				if (emp_name == null || emp_name.trim().length() == 0) {
					Msgs.put("emp_nameMsg", "員工名稱不可空白");
				}
				if (emp_name.trim().length() >20) {
					Msgs.put("edu_nameMsg", "員工名稱中英文長度不可大於20碼");
				}
				/***************(修改)取得Sign_list-emp_mail表單資料***************/
				emp_mail = request.getParameter("emp_mail");
				if (emp_mail == null || emp_mail.trim().length() == 0) {
					Msgs.put("emp_mailMsg", "Email不可空白");
				}
				if (emp_mail.trim().length() >30) {
					Msgs.put("emp_mailMsg", "Email中英文長度不可大於30碼");
				}
				/***************(修改)取得Sign_list-dep_name表單資料***************/
				dep_name = request.getParameter("dep_name");
				if (dep_name == null || dep_name.trim().length() == 0) {
					Msgs.put("dep_nameMsg", "部門名稱不可空白");
				}
				if ( dep_name.trim().length() >30) {
					Msgs.put("dep_nameMsg", "部門名稱長度不可大於30碼");
				}
				/***************(修改)取得Sign_list-sl_id表單資料***************/
				sl_id =Integer.parseInt(request.getParameter("sl_id"));
				if (sl_id == null) {
					Msgs.put("sl_idMsg", "權限設定不可空白");
				}
				
				if (!Msgs.isEmpty()) {
					out.write("資料更新失敗");
					return;
				}
				/*******************將資料(更新)至資料庫**********************/
				else{
					empSvc = new EmployeeService();
					empSvc.updateEmpdel(emp_id,emp_name,emp_mail,dep_name,sl_id);
					
					out.write("資料刪除成功");
					return;
				}
			} 
			catch (SQLServerException e) {
				out.write("資料刪除失敗");
				return;
			}
			catch (Exception e) {
				out.write("資料刪除失敗");
				return;
			}
		}
		/******************************** 更新資料表 ***********************/	
		if ("updateEmp".equals(action)) { 
			Map<String, String> Msgs = null;
			List emps =new LinkedList();
			String jsonString = null;
			String emp_id= null;
			String emp_name= null;
			String emp_mail= null;
			String dep_name= null;
			Integer sl_id= null;
			try {
				Msgs = new HashMap<String, String>();
				/***************(修改)取得Employee-emp_id表單資料***************/
				emp_id =request.getParameter("emp_id");
				if (emp_id == null) {
					Msgs.put("emp_id", "員工代號不可空白");
				}
				/***************(修改)取得Employee-emp_name表單資料***************/
				emp_name = request.getParameter("emp_name");
				if (emp_name == null || emp_name.trim().length() == 0) {
					Msgs.put("emp_nameMsg", "員工名稱不可空白");
				}
				if (emp_name.trim().length() >20) {
					Msgs.put("edu_nameMsg", "員工名稱中英文長度不可大於20碼");
				}
				/***************(修改)取得Employee-emp_mail表單資料***************/
				emp_mail = request.getParameter("emp_mail");
				if (emp_mail == null || emp_mail.trim().length() == 0) {
					Msgs.put("emp_mailMsg", "Email不可空白");
				}
				if (emp_mail.trim().length() >30) {
					Msgs.put("emp_mailMsg", "Email中英文長度不可大於30碼");
				}
				/***************(修改)取得Employee-dep_name表單資料***************/
				dep_name = request.getParameter("dep_name");
				if (dep_name == null || dep_name.trim().length() == 0) {
					Msgs.put("dep_nameMsg", "部門名稱不可空白");
				}
				if ( dep_name.trim().length() >30) {
					Msgs.put("dep_nameMsg", "部門名稱長度不可大於30碼");
				}
				/***************(修改)取得Employee-sl_id表單資料***************/
				sl_id =Integer.parseInt(request.getParameter("sl_id"));
				if (sl_id == null) {
					Msgs.put("sl_idMsg", "權限設定不可空白");
				}
				
				if (!Msgs.isEmpty()) {
					out.write("資料更新失敗");
					return;
				}
				/*******************將資料(更新)至資料庫**********************/
				else{
					empSvc = new EmployeeService();
					empSvc.updateEmp(emp_id,emp_name,emp_mail,dep_name,sl_id);
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
		/******************************** 查詢全部資料表 ***********************/		
		if ("getALLEmp".equals(action)) {
			try {
				// ============查詢員工全部資料回傳JSON字串====================
				empSvc = new EmployeeService();
				String jsonString = empSvc.getAllEmpToJSON();
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
		/******************************** 查詢單一筆資料 ***********************/	
		if ("checkEmpId".equals(action)) {
			try {
				// ============接收員工代號emp_id資料====================
				String emp_id =request.getParameter("emp_id");
				// ============查詢員工單筆資料回傳JSON字串============
				empSvc = new EmployeeService();
				EmployeeVO empVO = empSvc.findByPrimaryKeyEmp(emp_id);
				System.out.println(empVO);
				if(empVO != null){
					out.write("代號已存在");
				}else {
					out.write("代號不存在");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/******************************** 查詢(確認)員工代號資料是否存在資料庫 ***********************/	
		if ("getoneEmp".equals(action)) {
			String jsonString =null;
			try {
				// ============接收員工代號emp_id資料====================
				String emp_id =request.getParameter("emp_id");
				// ============查詢班級單筆資料回傳JSON字串============
				empSvc = new EmployeeService();
				jsonString = empSvc.findByPrimaryKeyEmpToJSON(emp_id);
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/***************************初始連結呼叫EmployeeServletJSON轉址至EmployeeTODataTablesJSON.jsp********************/	
		if ("initEmpViewTODataTablesJSON".equals(action)) {
			try {
				// ============轉到員工EmployeeTODataTablesJSON====================
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Employee/EmployeeTODataTablesJSON.jsp");
				successMsg.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/******************************** 結束 ***********************/		
	}
}
