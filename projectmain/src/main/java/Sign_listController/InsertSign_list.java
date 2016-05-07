package Sign_listController;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import Sign_list.model.*;

@WebServlet("/Sign_list/InsertSign_list.do")
public class InsertSign_list extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getOneSign_list".equals(action)) { // 來自Sign_listform.jsp的請求(查詢權限代號)

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("sl_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入權限代號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Sign_list/Sign_listform.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer sl_id = null;
				try {
					sl_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("權限代號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Sign_list/Sign_listform.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				Sign_listService slSvc = new Sign_listService();
				Sign_listVO sig = slSvc.getOneSl(sl_id);
				if (sig == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Sign_list/Sign_listform.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("sig", sig); // 資料庫取出的sig(VO)物件,存入req
				String url = "/Sign_list/Sign_listOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 Sign_listOne.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Sign_list/Sign_listform.jsp");
				failureView.forward(req, res);
			}
		}
		
		
//		if ("getOne_For_Update".equals(action)) { // 來自Sign_listform.jsp的請求(修改)
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			try {
//				/***************************1.接收請求參數****************************************/
//				Integer sl_id = new Integer(req.getParameter("sl_id"));
//				
//				/***************************2.開始查詢資料****************************************/
//				Sign_listService slSvc = new Sign_listService();
//				Sign_listVO sig = slSvc.getOneSl(sl_id);
//								
//				/***************************3.查詢完成,準備轉交(Send the Success view)************/
//				req.setAttribute("sig", sig);         // 資料庫取出的sig(VO)物件,存入req
//				String url = "/emp/update_emp_input.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
//				successView.forward(req, res);
//
//				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/listAllEmp.jsp");
//				failureView.forward(req, res);
//			}
//		}
//		
//		

        if ("addSign_list".equals(action)) { // 來自Sign_listform.jsp的請求(新增)
        	
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				Integer sl_id = new Integer(req.getParameter("sl_id"));
				String sl_name = req.getParameter("sl_name").trim();
				
				Sign_listVO sig = new Sign_listVO();
				sig.setSl_id(sl_id);
				sig.setSl_name(sl_name);
				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("sig", sig); // 含有輸入格式錯誤的sig(VO)物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Sign_list/Sign_listform.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				Sign_listService slSvc = new Sign_listService();
				sig = slSvc.addSign_list(sl_id, sl_name);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/Sign_list/Sign_listform.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交Sign_listform.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Sign_list/Sign_listform.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("deleteSign_list".equals(action)) { // 來自Sign_listform.jsp(刪除)

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer sl_id = new Integer(req.getParameter("sl_id"));
				
				/***************************2.開始刪除資料***************************************/
				Sign_listService slSvc = new Sign_listService();
				slSvc.deleteSign_list(sl_id);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/Sign_list/Sign_listform.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Sign_list/Sign_listform.jsp");
				failureView.forward(req, res);
			}
		}
	}
}