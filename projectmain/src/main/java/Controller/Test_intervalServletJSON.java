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

import Test_interval.model.Test_intervalService;
import Test_interval.model.Test_intervalVO;


import Class.model.ClassService;
import Class.model.ClassVO;
import Edu.model.*;


@WebServlet({"/Test_interval/Test_intervalServletJSON.do"})
public class Test_intervalServletJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Test_intervalServletJSON() {
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
		Test_intervalService tiSvc = null;
		String action = request.getParameter("action");
		
		/******************************** 新增資料表 ***********************/
		if ("addTi".equals(action)) {
			Map<String, String> Msgs = null;
			String class_id= null;
			Date test_startdate = null;
			Date test_enddate= null;
			try {
				Msgs = new HashMap<String, String>();
				/***************(新增)取得Test_interval-class_id表單資料***************/
				class_id = request.getParameter("class_id");
				if (class_id == null || class_id.trim().length() == 0) {
					Msgs.put("class_idMsg", "班級代號不可空白");
				}
				/***************(新增)取得Test_interval-test_startdate表單資料***************/
				test_startdate = java.sql.Date.valueOf(request.getParameter("test_startdate"));
				if (test_startdate == null || test_startdate.toString().trim().length() == 0) {
					Msgs.put("test_startdateMsg", "考試開始日期不可空白");
				}
				
				/***************(新增)取得Test_interval-test_enddate表單資料***************/
				test_enddate = java.sql.Date.valueOf(request.getParameter("test_enddate"));
				if (test_enddate == null || test_enddate.toString().trim().length() == 0) {
					Msgs.put("test_enddateMsg", "考試結束日期不可空白");
				}
				
				if (!Msgs.isEmpty()) {
					out.write("資料新增失敗");
					return;
					/***************呼叫Service方法將資料新增***********************/
				}else{
					tiSvc = new Test_intervalService();
					tiSvc.insertTi(class_id,test_startdate,test_enddate);
					tiSvc.createTestDateDetailData(class_id,test_startdate,test_enddate);
					
					out.write("資料新增成功");
					return;
				}
				
			}catch (ConstraintViolationException e) {
				e.printStackTrace();
				out.write("資料新增失敗");
				return;
			} 
			catch (SQLException e) {
				e.printStackTrace();
				out.write("資料新增失敗");
				return;
			}
		}
		/******************************** 刪除資料表 ***********************/
		if ("deleteTi".equals(action)) {
			
			try {
				// ============接收中心代號edu_id資料====================
				Integer test_interval_id =Integer.parseInt(request.getParameter("test_interval_id"));
				String class_id = request.getParameter("class_id");
				// ============呼叫方法刪除資料====================
				tiSvc = new Test_intervalService();
				tiSvc.deleteTi(test_interval_id);
				tiSvc.deleteTestDateDetailData(class_id);
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
		if ("updateTi".equals(action)) { 
			Map<String, String> Msgs = null;
			Integer test_interval_id= null;
			String class_id= null;
			Date test_startdate= null;
			Date test_enddate= null;
			
			try {
				Msgs = new HashMap<String, String>();
				/***************(修改)取得Test_interval-test_interval_id表單資料***************/
				test_interval_id =Integer.parseInt(request.getParameter("test_interval_id"));
				if (test_interval_id == null) {
					Msgs.put("test_interval_id", "考試區間代號不可空白");
				}
				/***************(修改)取得Test_interval-class_id表單資料***************/
				class_id = request.getParameter("class_id");
				if (class_id == null || class_id.trim().length() == 0) {
					Msgs.put("class_idMsg", "班級名稱不可空白");
				}
				/***************(修改)取得Test_interval-test_startdate表單資料***************/
				test_startdate = java.sql.Date.valueOf(request.getParameter("test_startdate"));
				if (test_startdate == null || test_startdate.toString().trim().length() == 0) {
					Msgs.put("test_startdateMsg", "考試開始日期不可空白");
				}
				/***************(修改)取得Test_interval-test_enddate表單資料***************/
				test_enddate = java.sql.Date.valueOf(request.getParameter("test_enddate"));
				if (test_enddate == null || test_enddate.toString().trim().length() == 0) {
					Msgs.put("test_enddateMsg", "考試結束日期不可空白");
				}
				
				if (!Msgs.isEmpty()) {
					out.write("資料更新失敗");
					return;
				}
				/*******************將資料(更新)至資料庫**********************/
				else{
					tiSvc = new Test_intervalService();
					tiSvc.updateTi(test_interval_id,class_id,test_startdate,test_enddate);
					tiSvc.deleteTestDateDetailData(class_id);
					tiSvc.createTestDateDetailData(class_id,test_startdate,test_enddate);
					out.write("資料更新成功");
					return;
				}
			} 
			catch (Exception e) {
				out.write("資料更新失敗");
				return;
			}
		}
		/******************************** 查詢全部資料表 ***********************/		
		if ("getALLTi".equals(action)) {
			try {
				// ============查詢考試區間全部資料回傳JSON字串====================
				tiSvc = new Test_intervalService();
				String jsonString = tiSvc.getAllTiToJSON();
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/********************************查詢全部資料表FOR DataTables init() ***********************/
		if ("getAllTiToJSONInitTable".equals(action)) {
			try {
				// ============查詢考試區間全部資料回傳JSON字串====================
				tiSvc = new Test_intervalService();
				String jsonString = tiSvc.getAllTiToJSONInitTable();
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/********************************查詢(確認)班級代號資料是否存在資料庫 ***********************/	
		if ("checkTiClassId".equals(action)) {
			try {
				// ============接收班級代號class_id資料====================
				String class_id =request.getParameter("class_id");
				// ============查詢班級單筆資料回傳JSON字串============
				tiSvc = new Test_intervalService();
				List<Test_intervalVO> tiVO = tiSvc.findByTiClass_id(class_id);
				System.out.println(tiVO);
				System.out.println("size======"+tiVO.size());
				if(tiVO.size()!=0){
					out.write("代號已存在");
				}else {
					out.write("代號不存在");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/******************************** 查詢單一筆資料 ***********************/	
		if ("getoneTi".equals(action)) {
			try {
				// ============接收考試區間代號test_interval_id資料====================
				Integer test_interval_id =Integer.parseInt(request.getParameter("test_interval_id"));
				// ============查詢考試區間單筆資料回傳JSON字串============
				tiSvc = new Test_intervalService();
				String jsonString = tiSvc.findByPrimaryKeyTiToJSON(test_interval_id);
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/***************************初始連結呼叫Test_intervalServletJSON轉址至Test_intervalTODataTablesJSON.jsp********************/	
		if ("initTiViewTODataTablesJSON".equals(action)) {
			try {
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Test_interval/Test_intervalTODataTablesJSON.jsp");
				successMsg.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/******************************** 結束 ***********************/		
	}
}
