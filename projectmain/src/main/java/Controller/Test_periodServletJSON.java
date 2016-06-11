package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Time;
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

import Class.model.ClassService;
import Test_period.model.Test_periodService;




@WebServlet("/Test_period/Test_periodServletJSON.do")
public class Test_periodServletJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Test_periodServletJSON() {
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
		Test_periodService tpSvc = null;
		String action = request.getParameter("action");

		/******************************** 新增資料表 ***********************/
		if ("addTp".equals(action)) {
			Map<String, String> Msgs = null;
			Integer test_hour_id= null;
			Time test_starthour= null;
			Time test_endhour= null;
			try {
				Msgs = new HashMap<String, String>();
				/***************(新增)取得Test_period-test_starthourMsg表單資料***************/
				test_starthour = java.sql.Time.valueOf(request.getParameter("test_starthour"));
				if (test_endhour == null) {
					Msgs.put("test_starthourMsg", "開始時間不可空白");
				}
				if (test_endhour.toString().trim().length() >10) {
					Msgs.put("test_starthourMsg", "開始時間長度不可大於10碼");
				}
				/***************(新增)取得Test_period-test_endhourMsg表單資料***************/
				test_endhour = java.sql.Time.valueOf(request.getParameter("test_endhour"));
				if (test_endhour == null) {
					Msgs.put("test_endhourMsg", "結束時間不可空白");
				}
				if (test_endhour.toString().trim().length() >10) {
					Msgs.put("test_endhourMsg", "結束時間長度不可大於10碼");
				}
				
				if (!Msgs.isEmpty()) {
					out.write("資料新增失敗");
					return;
					/***************呼叫Service方法將資料新增***********************/
				}else{
					tpSvc = new Test_periodService();
					tpSvc.insertTp(test_starthour,test_endhour);
					out.write("資料新增成功");
					return;
				}
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/******************************** 多筆刪除資料表 ***********************/
		if ("deleteTpMulti".equals(action)) {
			
			try {
				// ============接收中心代號edu_id資料====================
				String test_hour_idJSON =request.getParameter("test_hour_id");
				//System.out.println("test_hour_idJSON========="+test_hour_idJSON);
				// ============呼叫方法刪除資料====================
				tpSvc = new Test_periodService();
				tpSvc.deleteTpMulti(test_hour_idJSON);
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
		/******************************** 刪除資料表 ***********************/
		if ("deleteTp".equals(action)) {
			
			try {
				// ============接收中心代號test_hour_id資料====================
				Integer test_hour_id =Integer.parseInt(request.getParameter("test_hour_id"));
				// ============呼叫方法刪除資料====================
				tpSvc = new Test_periodService();
				tpSvc.deleteTp(test_hour_id);
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
		if ("updateTp".equals(action)) { 
			Map<String, String> Msgs = null;
			Integer test_hour_id= null;
			Time test_starthour= null;
			Time test_endhour= null;
			try {
				Msgs = new HashMap<String, String>();
				/***************(修改)取得Test_period-test_hour_id表單資料***************/
				test_hour_id =Integer.parseInt(request.getParameter("test_hour_id"));
				if (test_hour_id == null) {
					Msgs.put("test_hour_id", "時段代號不可空白");
				}
				/***************(修改)取得Test_period-test_starthour表單資料***************/
				test_starthour = java.sql.Time.valueOf(request.getParameter("test_starthour"));
				if (test_starthour == null || test_starthour.toString().trim().length() == 0) {
					Msgs.put("test_starthourMsg", "開始時間不可空白");
				}
				if (test_starthour.toString().trim().length() >10) {
					Msgs.put("test_starthourMsg", "開始時間長度不可大於10碼");
				}
				/***************(修改)取得Test_period-test_endhour表單資料***************/
				test_endhour = java.sql.Time.valueOf(request.getParameter("test_endhour"));
				if (test_endhour == null || test_endhour.toString().trim().length() == 0) {
					Msgs.put("test_endhourMsg", "結束時間不可空白");
				}
				if (test_endhour.toString().trim().length() >10) {
					Msgs.put("test_endhourMsg", "結束時間長度不可大於10碼");
				}
				
				if (!Msgs.isEmpty()) {
					out.write("資料更新失敗");
					return;
				}
				/*******************將資料(更新)至資料庫**********************/
				else{
					tpSvc = new Test_periodService();
					tpSvc.updateTp(test_hour_id,test_starthour,test_endhour);
					out.write("資料更新成功");
					return;
				}
			} 
			catch (Exception e) {
				out.write("資料更新失敗");
				return;
			}
		}
		/******************************** 查詢全部資料表JSON ***********************/		
		if ("getALLTp".equals(action)) {
			try {
				// ============查詢教育中心全部資料回傳JSON字串====================
				tpSvc = new Test_periodService();
				String jsonString = tpSvc.getAllTpToJSON();
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	
		/******************************** 查詢單一筆資料JSON ***********************/	
		if ("getoneTp".equals(action)) {
			try {
				// ============接收中心代號test_hour_id資料====================
				Integer test_hour_id =Integer.parseInt(request.getParameter("test_hour_id"));
				// ============查詢教育中心單筆資料回傳JSON字串============
				tpSvc = new Test_periodService();
				String jsonString = tpSvc.findByPrimaryKeyTpToJSON(test_hour_id);
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/***************************初始連結呼叫Test_periodServletJSON轉址至Test_periodTODataTablesJSON.jsp********************/	
		if ("initTpViewTODataTablesJSON".equals(action)) {
			try {
				
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Test_period/Test_periodTODataTablesJSON.jsp");
				successMsg.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/******************************** 結束 ***********************/		
	}
}
