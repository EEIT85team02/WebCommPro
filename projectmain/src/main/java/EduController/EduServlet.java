package EduController;

import java.io.IOException;
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

import Edu.model.Edu;
import Edu.model.EduDAO;
import Edu.model.IEduDAO;

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
		Map<String, String> errorMsgs = null;
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		/******************************** 新增資料表 ***********************/
		if ("addEdu".equals(action)) {
			try {
				errorMsgs = new HashMap<String, String>();
				/********************建立資料庫連線******************/
				IEduDAO edu = new EduDAO();
				System.out.println("連線成功");
				/***************(新增)取得Edu-form表單資料***************/
				String edu_name = request.getParameter("edu_name");
				String edu_add = request.getParameter("edu_add");
				String edu_tel = request.getParameter("edu_tel");
				String edu_contact = request.getParameter("edu_contact");
				/*******************檢查Edu-form表單資料*******************/
				if (edu_name == null || edu_name.trim().length() == 0) {
					errorMsgs.put("edu_nameMsg", "中心名稱不可空白");
				}
				if (edu_add == null || edu_add.trim().length() == 0) {
					errorMsgs.put("edu_addMsg", "中心地址不可空白");
				}
				if (edu_tel == null || edu_tel.trim().length() == 0) {
					errorMsgs.put("edu_telMsg", "中心電話不可空白");
				}
				if (edu_contact == null || edu_contact.trim().length() == 0) {
					errorMsgs.put("edu_contactMsg", "聯絡人不可空白");
				}
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("errorMsgs", errorMsgs);
					RequestDispatcher failureMsg = request
							.getRequestDispatcher("/Edu/EduView.jsp");
					failureMsg.forward(request, response);
					return;
				}
				/*******************將資料(新增)至資料庫**********************/
				Edu edu1 = new Edu();
				edu1.setEdu_name(edu_name);
				edu1.setEdu_add(edu_add);
				edu1.setEdu_tel(edu_tel);
				edu1.setEdu_contact(edu_contact);
				edu.insert(edu1);
				/*****************查詢教育中心全部資料************************/
				List<Edu> eduVO = edu.getAll();
				request.setAttribute("eduVO", eduVO);
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Edu/EduView.jsp");
				successMsg.forward(request, response);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/******************************** 刪除資料表 ***********************/
		if ("deleteEdu".equals(action)) {
			try {
				/********************建立資料庫連線******************/
				IEduDAO edu = new EduDAO();
				System.out.println("連線成功");
				// ============接收中心代號edu_id資料====================
				Integer edu_id =Integer.parseInt(request.getParameter("edu_id"));
				// ============呼叫方法刪除資料====================
				edu.delete(edu_id);
				/*****************查詢教育中心全部資料************************/
				List<Edu> eduVO = edu.getAll();
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
			try {
				errorMsgs = new HashMap<String, String>();
				/********************建立資料庫連線******************/
				IEduDAO edu = new EduDAO();
				System.out.println("連線成功");
				/***************(更新)取得Edu-form表單資料***************/
				Integer edu_id =Integer.parseInt(request.getParameter("edu_id"));
				String edu_name = request.getParameter("edu_name");
				String edu_add = request.getParameter("edu_add");
				String edu_tel = request.getParameter("edu_tel");
				String edu_contact = request.getParameter("edu_contact");
				Edu edu1 = new Edu();
				edu1.setEdu_id(edu_id);
				edu1.setEdu_name(edu_name);
				edu1.setEdu_add(edu_add);
				edu1.setEdu_tel(edu_tel);
				edu1.setEdu_contact(edu_contact);
				/*******************檢查Edu-form表單資料*******************/
				if (edu_id == null) {
					errorMsgs.put("edu_idMsg", "中心代號不可空白");
				}
				if (edu_name == null || edu_name.trim().length() == 0) {
					errorMsgs.put("edu_nameMsg", "中心名稱不可空白");
				}
				if (edu_add == null || edu_add.trim().length() == 0) {
					errorMsgs.put("edu_addMsg", "中心地址不可空白");
				}
				if (edu_tel == null || edu_tel.trim().length() == 0) {
					errorMsgs.put("edu_telMsg", "中心電話不可空白");
				}
				if (edu_contact == null || edu_contact.trim().length() == 0) {
					errorMsgs.put("edu_contactMsg", "聯絡人不可空白");
				}
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("errorMsgs", errorMsgs);
					request.setAttribute("eduVO", edu1);
					RequestDispatcher failureMsg = request
							.getRequestDispatcher("/Edu/EduUpdateFrom.jsp");
					failureMsg.forward(request, response);
					return;
				}
				/*******************將資料(更新)至資料庫**********************/
				edu.update(edu1);
				/*****************查詢教育中心全部資料************************/
				List<Edu> eduVO = edu.getAll();
				request.setAttribute("eduVO", eduVO);
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Edu/EduView.jsp");
				successMsg.forward(request, response);
				return;

				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		/******************************** 查詢全部資料表 ***********************/		
		if ("getALLEdu".equals(action)) {
			try {
				// ===================建立資料庫連線===================
				System.out.println("OK1");
				IEduDAO edu = new EduDAO();
				System.out.println("Ok2");
				// ============查詢教育中心全部資料====================
				List<Edu> eduVO = edu.getAll();
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
				// ===================建立資料庫連線===================
				System.out.println("OK1");
				IEduDAO edu = new EduDAO();
				System.out.println("Ok2");
				// ============接收中心代號edu_id資料====================
				Integer edu_id =Integer.parseInt(request.getParameter("edu_id"));
				Edu eduVO = edu.findByPrimaryKey(edu_id);
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
