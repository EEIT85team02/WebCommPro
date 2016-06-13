package Controller;

import java.io.IOException;
import java.rmi.ServerException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Edu.model.*;


@WebServlet("/Edu/EduServlet.do")
public class EduServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public EduServlet() {
		super();

	}
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			doPost(request,response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		/******************************** 新增資料表 ***********************/
		if ("addEdu".equals(action)) {
			Map<String, String> errorMsgs = null;
			String edu_name= null;
			String edu_add= null;
			String edu_tel= null;
			String edu_contact= null;
			EduVO edu= null;
			try {
				errorMsgs = new HashMap<String, String>();
				edu = new EduVO();
				/***************(新增)取得Edu-edu_name表單資料***************/
				edu_name = request.getParameter("edu_name");
				if (edu_name == null || edu_name.trim().length() == 0) {
					errorMsgs.put("edu_nameMsg", "中心名稱不可空白");
				}
				if (edu_name.trim().length() >30) {
					errorMsgs.put("edu_nameMsg", "中心名稱中英文長度不可大於30碼");
				}
				edu.setEdu_name(edu_name);
				/***************(新增)取得Edu-edu_add表單資料***************/
				edu_add = request.getParameter("edu_add");
				if (edu_add == null || edu_add.trim().length() == 0) {
					errorMsgs.put("edu_addMsg", "中心地址不可空白");
				}
				if (edu_add.trim().length() >30) {
					errorMsgs.put("edu_addMsg", "中心地址中英文長度不可大於30碼");
				}
				edu.setEdu_add(edu_add);
				/***************(新增)取得Edu-edu_tel表單資料***************/
				edu_tel = request.getParameter("edu_tel");
				if (edu_tel == null || edu_tel.trim().length() == 0) {
					errorMsgs.put("edu_telMsg", "中心電話不可空白");
				}
				if ( edu_tel.trim().length() >15) {
					errorMsgs.put("edu_telMsg", "中心電話長度不可大於15碼");
				}
				edu.setEdu_tel(edu_tel);
				/***************(新增)取得Edu-edu_contact表單資料***************/
				edu_contact = request.getParameter("edu_contact");
				if (edu_contact == null || edu_contact.trim().length() == 0) {
					errorMsgs.put("edu_contactMsg", "聯絡人不可空白");
				}
				if (edu_contact.trim().length() > 10) {
					errorMsgs.put("edu_contactMsg", "聯絡人中英文長度不可大於30碼");
				}
				edu.setEdu_contact(edu_contact);
				
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("errorMsgs", errorMsgs);
					request.setAttribute("eduVO",edu);
					RequestDispatcher failureMsg = request
							.getRequestDispatcher("/Edu/EduInsertFrom.jsp");
					failureMsg.forward(request, response);
					return;
				}
				/***************呼叫Service方法將資料新增***********************/
				EduService eduSvc = new EduService();
				eduSvc.insertEdu(edu_name,edu_add,edu_tel,edu_contact);
				
				/*****************查詢教育中心全部資料************************/
				List<EduVO> eduVO= eduSvc.getAllEdu();
				request.setAttribute("eduVO", eduVO);
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Edu/EduView.jsp");
				successMsg.forward(request, response);
				return;
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/******************************** 刪除資料表 ***********************/
		if ("deleteEdu".equals(action)) {
			
			try {
				// ============接收中心代號edu_id資料====================
				Integer edu_id =Integer.parseInt(request.getParameter("edu_id"));
				// ============呼叫方法刪除資料====================
				EduService eduSvc = new EduService();
				eduSvc.deleteEdu(edu_id);
				/*****************查詢教育中心全部資料************************/
				List<EduVO> eduVO = eduSvc.getAllEdu();
				request.setAttribute("eduVO", eduVO);
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Edu/EduView.jsp");
				successMsg.forward(request, response);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/******************************** 更新資料表 ***********************/	
		if ("updateEdu".equals(action)) { 
			Map<String, String> errorMsgs = null;
			Integer edu_id= null;
			String edu_name= null;
			String edu_add= null;
			String edu_tel= null;
			String edu_contact= null;
			EduVO edu= null;
			try {
				errorMsgs = new HashMap<String, String>();
				edu = new EduVO();
				/***************(修改)取得Edu-edu_id表單資料***************/
				edu_id =Integer.parseInt(request.getParameter("edu_id"));
				if (edu_id == null) {
					errorMsgs.put("edu_id", "中心代號不可空白");
				}
				edu.setEdu_id(edu_id);
				/***************(修改)取得Edu-edu_name表單資料***************/
				edu_name = request.getParameter("edu_name");
				if (edu_name == null || edu_name.trim().length() == 0) {
					errorMsgs.put("edu_nameMsg", "中心名稱不可空白");
				}
				if (edu_name.trim().length() >30) {
					errorMsgs.put("edu_nameMsg", "中心名稱中英文長度不可大於30碼");
				}
				edu.setEdu_name(edu_name);
				/***************(修改)取得Edu-edu_add表單資料***************/
				edu_add = request.getParameter("edu_add");
				if (edu_add == null || edu_add.trim().length() == 0) {
					errorMsgs.put("edu_addMsg", "中心地址不可空白");
				}
				if (edu_add.trim().length() >30) {
					errorMsgs.put("edu_addMsg", "中心地址中英文長度不可大於30碼");
				}
				edu.setEdu_add(edu_add);
				/***************(修改)取得Edu-edu_tel表單資料***************/
				edu_tel = request.getParameter("edu_tel");
				if (edu_tel == null || edu_tel.trim().length() == 0) {
					errorMsgs.put("edu_telMsg", "中心電話不可空白");
				}
				if ( edu_tel.trim().length() >15) {
					errorMsgs.put("edu_telMsg", "中心電話長度不可大於15碼");
				}
				edu.setEdu_tel(edu_tel);
				/***************(修改)取得Edu-edu_contact表單資料***************/
				edu_contact = request.getParameter("edu_contact");
				if (edu_contact == null || edu_contact.trim().length() == 0) {
					errorMsgs.put("edu_contactMsg", "聯絡人不可空白");
				}
				if (edu_contact.trim().length() > 10) {
					errorMsgs.put("edu_contactMsg", "聯絡人中英文長度不可大於30碼");
				}
				edu.setEdu_contact(edu_contact);
				
				
				
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("errorMsgs", errorMsgs);
					request.setAttribute("eduVO", edu);
					RequestDispatcher failureMsg = request
							.getRequestDispatcher("/Edu/EduUpdateFrom.jsp");
					failureMsg.forward(request, response);
					return;
				}
				/*******************將資料(更新)至資料庫**********************/
				EduService eduSvc = new EduService();
				eduSvc.updateEdu(edu_id,edu_name,edu_add,edu_tel,edu_contact);
				
				/*****************查詢教育中心全部資料************************/
				List<EduVO> eduVO = eduSvc.getAllEdu();
				request.setAttribute("eduVO", eduVO);
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Edu/EduView.jsp");
				successMsg.forward(request, response);
				return;

				
			} 
			catch (ServerException e) {
				e.printStackTrace();
				System.out.println("資料庫錯誤");
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		/******************************** 查詢全部資料表 ***********************/		
		if ("getALLEdu".equals(action)) {
			try {
				// ============查詢教育中心全部資料====================
				EduService eduSvc = new EduService();
				System.out.println("KO");
				List<EduVO> eduVO = eduSvc.getAllEdu();
				request.setAttribute("eduVO", eduVO);
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Edu/EduView.jsp");
				successMsg.forward(request, response);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
		/******************************** 查詢單一筆資料 ***********************/	
		if ("getoneEdu".equals(action)) {
			try {
				// ============接收中心代號edu_id資料====================
				Integer edu_id =Integer.parseInt(request.getParameter("edu_id"));
				EduService eduSvc = new EduService();
				EduVO eduVO = eduSvc.findByPrimaryKeyEdu(edu_id);
				request.setAttribute("eduVO", eduVO);
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Edu/EduUpdateFrom.jsp");
				successMsg.forward(request, response);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		/******************************** 結束 ***********************/		
	}
}
