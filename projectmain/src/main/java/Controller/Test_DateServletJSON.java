package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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

import Test_Date.model.Test_DateService;
import Test_interval.model.Test_intervalService;

import com.microsoft.sqlserver.jdbc.SQLServerException;

import Edu.model.*;


@WebServlet({"/Test_Date/Test_DateServletJSON.do"})
public class Test_DateServletJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Test_DateServletJSON() {
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
		Test_DateService tdSvc = null;
		String action = request.getParameter("action");

		/******************************** 新增資料表 ***********************/
		if ("addTd".equals(action)) {
			Map<String, String> Msgs = null;
			String class_id= null;
			java.sql.Date test_date= null;
			Integer	test_people= 0;
			Integer exam_people = 0;
			Integer test_hour_id = 0;
			try {
				Msgs = new HashMap<String, String>();
				/***************(新增)取得Test_Date-class_id表單資料***************/
				class_id = request.getParameter("class_id");
				if (class_id == null || class_id.trim().length() == 0) {
					Msgs.put("class_idMsg", "班級名稱不可空白");
				}
				/***************(新增)取得Test_Date-test_date表單資料***************/
				test_date = java.sql.Date.valueOf(request.getParameter("test_date"));
				if (test_date == null || test_date.toString().trim().length() == 0) {
					Msgs.put("test_dateMsg", "考試日期不可空白");
				}
				
				/***************(新增)取得Test_Date-test_people表單資料***************/
				test_people = Integer.parseInt(request.getParameter("test_people"));
				if (test_people == null || test_people.toString().trim().length() == 0) {
					Msgs.put("test_peopleMsg", "考試報名人數不可空白");
				}
				/***************(新增)取得Test_Date-exam_people表單資料***************/
				exam_people = Integer.parseInt(request.getParameter("exam_people"));
				if (exam_people == null || exam_people.toString().trim().length() == 0) {
					Msgs.put("exam_peopleMsg", "考試報名人數不可空白");
				}
				/***************(新增)取得Test_Date-test_hour_id表單資料***************/
				test_hour_id = Integer.parseInt(request.getParameter("test_hour_id"));
				if (test_hour_id == null || test_hour_id.toString().trim().length() == 0) {
					Msgs.put("test_hour_idMsg", "時段代號不可空白");
				}
				
				if (!Msgs.isEmpty()) {
					out.write("資料新增失敗");
					return;
					/***************呼叫Service方法將資料新增***********************/
				}else{
					tdSvc = new Test_DateService();
					tdSvc.insertTd(class_id,test_date,test_people,exam_people,test_hour_id);
					out.write("資料新增成功");
					return;
				}
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/******************************** 刪除資料表 ***********************/
		if ("deleteTd".equals(action)) {
			
			try {
				// ============接收考試日期代號test_date_id資料====================
				Integer test_date_id =Integer.parseInt(request.getParameter("test_date_id"));
				// ============呼叫方法刪除資料====================
				tdSvc = new Test_DateService();
				tdSvc.deleteTd(test_date_id);
				out.write("資料刪除成功");
				return;
			}catch (ConstraintViolationException e) {
				e.printStackTrace();
				out.write("資料刪除失敗");
				return;
			}
			catch (SQLException e) {
				e.printStackTrace();
				out.write("資料刪除失敗");
				return;
			}
		}
		/******************************** 更新資料表 ***********************/	
		if ("updateTd".equals(action)) { 
			Map<String, String> Msgs = null;
			Integer	test_date_id= 0;
			String class_id= null;
			java.sql.Date test_date= null;
			Integer	test_people= 0;
			Integer exam_people = 0;
			Integer test_hour_id = 0;
			try {
				Msgs = new HashMap<String, String>();
				/***************(更新)取得Test_Date-class_id表單資料***************/
				test_date_id = Integer.parseInt(request.getParameter("test_date_id"));
				if (test_date_id == null || test_date_id.toString().trim().length() == 0) {
					Msgs.put("test_date_idMsg", "考試日期不可空白");
				}
				/***************(更新)取得Test_Date-class_id表單資料***************/
				class_id = request.getParameter("class_id");
				if (class_id == null || class_id.trim().length() == 0) {
					Msgs.put("class_idMsg", "班級名稱不可空白");
				}
				/***************(更新)取得Test_Date-test_date表單資料***************/
				test_date = java.sql.Date.valueOf(request.getParameter("test_date"));
				if (test_date == null || test_date.toString().trim().length() == 0) {
					Msgs.put("test_dateMsg", "考試日期不可空白");
				}
				
				/***************(更新)取得Test_Date-test_people表單資料***************/
				test_people = Integer.parseInt(request.getParameter("test_people"));
				if (test_people == null || test_people.toString().trim().length() == 0) {
					Msgs.put("test_peopleMsg", "考試報名人數不可空白");
				}
				/***************(更新)取得Test_Date-exam_people表單資料***************/
				exam_people = Integer.parseInt(request.getParameter("exam_people"));
				if (exam_people == null || exam_people.toString().trim().length() == 0) {
					Msgs.put("exam_peopleMsg", "考試報名人數不可空白");
				}
				/***************(更新增)取得Test_Date-test_hour_id表單資料***************/
				test_hour_id = Integer.parseInt(request.getParameter("test_hour_id"));
				if (test_hour_id == null || test_hour_id.toString().trim().length() == 0) {
					Msgs.put("test_hour_idMsg", "時段代號不可空白");
				}
				
				if (!Msgs.isEmpty()) {
					out.write("資料更新失敗");
					return;
				}
				/*******************將資料(更新)至資料庫**********************/
				else{
					tdSvc = new Test_DateService();
					tdSvc.updateTd(test_date_id,class_id,test_date,test_people,exam_people,test_hour_id);
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
		if ("getALLTd".equals(action)) {
			try {
				// ============查詢考試區間全部資料回傳JSON字串====================
				tdSvc = new Test_DateService();
				String jsonString = tdSvc.getAllTdToJSON();
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/********************************查詢全部資料表FOR DataTables init() ***********************/
		if ("getAllTdToJSONInitTable".equals(action)) {
			try {
				// ============查詢考試區間全部資料回傳JSON字串====================
				tdSvc = new Test_DateService();
				String jsonString = tdSvc.getAllTdToJSONInitTable();
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
		/******************************** 查詢單一筆資料 ***********************/	
		if ("getoneTd".equals(action)) {
			try {
				// ============接收考試區間代號test_interval_id資料====================
				Integer test_date_id =Integer.parseInt(request.getParameter("test_date_id"));
				// ============查詢考試區間單筆資料回傳JSON字串============
				tdSvc = new Test_DateService();
				String jsonString = tdSvc.findByPrimaryKeyTdToJSON(test_date_id);
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/***************************初始連結呼叫Test_DateServletJSON轉址至Test_intervalTODataTablesJSON.jsp********************/	
		if ("initTdViewTODataTablesJSON".equals(action)) {
			try {
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Test_Date/Test_DateTODataTablesJSON.jsp");
				successMsg.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/******************************** 結束 ***********************/		
	}
}
