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
import org.hibernate.exception.ConstraintViolationException;
import Edu.model.*;
import Class.model.*;


@WebServlet("/Class/ClassServlet.do")
public class ClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ClassServlet() {
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
		if ("addClass".equals(action)) {
				ClassVO cla=null;
				EduVO edu=null;
				Map<String, String> errorMsgs = null;
				String class_id=null;
				String class_name=null;
				String class_contact=null;
				String class_teach=null;
				Integer edu_id=null;
			try {
				errorMsgs = new HashMap<String, String>();
				cla = new ClassVO();
				
				/***************(新增)取得Class-class_id表單資料***************/
				class_id =request.getParameter("class_id").trim();
				if (class_id == null || class_id.trim().length() == 0) {
					errorMsgs.put("class_idMsg", "班級代號不可空白");
				}
				if ( class_id.trim().length() > 10) {
					errorMsgs.put("class_idMsg", "班級代號中英文長度不可大於10碼");
				}
				cla.setClass_id(class_id);
				
				/***************(新增)取得Class-class_name表單資料***************/
				class_name = request.getParameter("class_name").trim();
				if (class_name == null || class_name.trim().length() == 0) {
					errorMsgs.put("class_nameMsg", "班級名稱不可空白");
				}
				if (class_name.trim().length() > 30) {
					errorMsgs.put("class_nameMsg", "班級名稱中英文長度不可大於30碼");
				}
				cla.setClass_name(class_name);
				
				/***************(新增)取得Class-class_contact表單資料***************/
				class_contact = request.getParameter("class_contact").trim();
				if (class_contact == null || class_contact.trim().length() == 0) {
					errorMsgs.put("class_contactMsg", "聯絡人不可空白");
				}
				if (class_contact.trim().length() > 10) {
					errorMsgs.put("class_contactMsg", "聯絡人中英文長度不可大於10碼");
				}
				cla.setClass_contact(class_contact);
				
				/***************(新增)取得Class-class_teach表單資料***************/
				class_teach = request.getParameter("class_teach").trim();
				if (class_teach == null || class_teach.trim().length() == 0) {
					errorMsgs.put("class_teachMsg", "導師不可空白");
				}
				if (class_teach.trim().length() > 10) {
					errorMsgs.put("class_teachMsg", "導師中英文長度不可大於10碼");
				}
				cla.setClass_teach(class_teach);
				
				
				/***************(新增)取得Class-edu_id表單資料***************/
					edu_id= Integer.parseInt(request.getParameter("edu_id").trim());
				if (edu_id == null ) {
					errorMsgs.put("edu_idMsg", "教育代號不可空白");
				}
				edu = new EduVO();
				edu.setEdu_id(edu_id);
				cla.setEduVO(edu);
				
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("errorMsgs", errorMsgs);
					request.setAttribute("ClassVO",cla);
					RequestDispatcher failureMsg = request
							.getRequestDispatcher("/Class/ClassInsertFrom.jsp");
					failureMsg.forward(request, response);
					return;
				}
				/***************呼叫Service方法將資料新增***********************/
				ClassService classSvc = new ClassService();
				classSvc.insertClass(class_id,class_name,  class_contact,
						class_teach, edu_id);
				
				/*****************查詢班級全部資料************************/
				List<ClassVO> classVO = classSvc.getAllClass();
				request.setAttribute("classVO", classVO);
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Class/ClassView.jsp");
				successMsg.forward(request, response);
				return;	
				
			} catch(NumberFormatException e){
				System.out.println("輸入錯誤");
				errorMsgs.put("edu_idMsg", "教育中心不可空白或形態不符");
				request.setAttribute("errorMsgs", errorMsgs);
				request.setAttribute("classVO", cla);
				RequestDispatcher failureMsg = request
						.getRequestDispatcher("/Class/ClassInsertFrom.jsp");
				failureMsg.forward(request, response);
				return;
			}
			catch(ServerException e){
				System.out.println("資料庫錯誤sql");
				errorMsgs.put("edu_idMsg", "教育代號外來鍵不存在");
				request.setAttribute("errorMsgs", errorMsgs);
				request.setAttribute("classVO", cla);
				RequestDispatcher failureMsg = request
						.getRequestDispatcher("/Class/ClassInsertFrom.jsp");
				failureMsg.forward(request, response);
				return;
			}
			catch(ConstraintViolationException e){
				System.out.println("資料庫錯誤hibernate");
				errorMsgs.put("edu_idMsg", "教育代號外來鍵不存在");
				request.setAttribute("errorMsgs", errorMsgs);
				request.setAttribute("classVO", cla);
				RequestDispatcher failureMsg = request
						.getRequestDispatcher("/Class/ClassInsertFrom.jsp");
				failureMsg.forward(request, response);
				return;
			}
			
			catch (SQLException e) {
				e.printStackTrace();
				System.out.println("資料庫錯誤1");
				
			}
			
		}
		/******************************** 刪除資料表 ***********************/
		if ("deleteClass".equals(action)) {
			String class_id=null;
			Map<String, String> errorMsgs = null;
			try {
				// ============接收班級代號class_id資料====================
				class_id =request.getParameter("class_id");
				// ============呼叫方法刪除資料====================
				ClassService classSvc = new ClassService();
				classSvc.deleteClass(class_id);
				/*****************查詢班級全部資料************************/
				List<ClassVO> classVO = classSvc.getAllClass();
				request.setAttribute("classVO", classVO);
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Class/ClassView.jsp");
				successMsg.forward(request, response);
				return;
			}
			catch (ConstraintViolationException e) {
				System.out.println("hibernate 因資料已被使用中，外部連結學生檔有資料");
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/******************************** 更新資料表 ***********************/	
		if ("updateClass".equals(action)) { 
			ClassVO cla=null;
			EduVO edu=null;
			Map<String, String> errorMsgs = null;
			String class_id=null;
			String class_name=null;
			String class_contact=null;
			String class_teach=null;
			Integer edu_id=null;
			try {
				errorMsgs = new HashMap<String, String>();
				cla = new ClassVO();
				
				/***************(修改)取得Class-class_id表單資料***************/
				class_id =request.getParameter("class_id").trim();
				if (class_id == null || class_id.trim().length() == 0) {
					errorMsgs.put("class_idMsg", "班級代號不可空白");
				}
				if ( class_id.trim().length() > 10) {
					errorMsgs.put("class_idMsg", "班級代號中英文長度不可大於10碼");
				}
				cla.setClass_id(class_id);
				
				/***************(修改)取得Class-class_name表單資料***************/
				class_name = request.getParameter("class_name").trim();
				if (class_name == null || class_name.trim().length() == 0) {
					errorMsgs.put("class_nameMsg", "班級名稱不可空白");
				}
				if (class_name.trim().length() > 30) {
					errorMsgs.put("class_nameMsg", "班級名稱中英文長度不可大於30碼");
				}
				cla.setClass_name(class_name);
				
				/***************(修改)取得Class-class_contact表單資料***************/
				class_contact = request.getParameter("class_contact").trim();
				if (class_contact == null || class_contact.trim().length() == 0) {
					errorMsgs.put("class_contactMsg", "聯絡人不可空白");
				}
				if (class_contact.trim().length() > 10) {
					errorMsgs.put("class_contactMsg", "聯絡人中英文長度不可大於10碼");
				}
				cla.setClass_contact(class_contact);
				
				/***************(修改)取得Class-class_teach表單資料***************/
				class_teach = request.getParameter("class_teach").trim();
				if (class_teach == null || class_teach.trim().length() == 0) {
					errorMsgs.put("class_teachMsg", "導師不可空白");
				}
				if (class_teach.trim().length() > 10) {
					errorMsgs.put("class_teachMsg", "導師中英文長度不可大於10碼");
				}
				cla.setClass_teach(class_teach);
				
				
				/***************(修改)取得Class-edu_id表單資料***************/
					edu_id= Integer.parseInt(request.getParameter("edu_id").trim());
				if (edu_id == null ) {
					errorMsgs.put("edu_idMsg", "教育代號不可空白");
				}
				edu = new EduVO();
				edu.setEdu_id(edu_id);
				cla.setEduVO(edu);
				
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("errorMsgs", errorMsgs);
					request.setAttribute("classVO", cla);
					RequestDispatcher failureMsg = request
							.getRequestDispatcher("/Class/ClassUpdateFrom.jsp");
					failureMsg.forward(request, response);
					return;
				}
				/*******************將資料(更新)至資料庫**********************/
				ClassService classSvc = new ClassService();
				classSvc.updateClass(class_id,class_name,class_contact,class_teach,edu_id);
				
				/*****************查詢班級全部資料************************/
				List<ClassVO> classVO = classSvc.getAllClass();
				request.setAttribute("classVO", classVO);
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Class/ClassView.jsp");
				successMsg.forward(request, response);
				return;

				
			} catch(NumberFormatException e){
				System.out.println("輸入錯誤");
				errorMsgs.put("edu_idMsg", "教育中心不可空白或形態不符");
				request.setAttribute("errorMsgs", errorMsgs);
				request.setAttribute("classVO", cla);
				RequestDispatcher failureMsg = request
						.getRequestDispatcher("/Class/ClassUpdateFrom.jsp");
				failureMsg.forward(request, response);
				return;
			}
			catch(ServerException e){
				System.out.println("資料庫錯誤sql");
				errorMsgs.put("edu_idMsg", "教育代號外來鍵不存在");
				request.setAttribute("errorMsgs", errorMsgs);
				request.setAttribute("classVO", cla);
				RequestDispatcher failureMsg = request
						.getRequestDispatcher("/Class/ClassUpdateFrom.jsp");
				failureMsg.forward(request, response);
				return;
			}
			catch(ConstraintViolationException e){
				System.out.println("資料庫錯誤hibernate");
				errorMsgs.put("edu_idMsg", "教育代號外來鍵不存在");
				request.setAttribute("errorMsgs", errorMsgs);
				request.setAttribute("classVO", cla);
				RequestDispatcher failureMsg = request
						.getRequestDispatcher("/Class/ClassUpdateFrom.jsp");
				failureMsg.forward(request, response);
				return;
			}
			
			catch (Exception e) {
				e.printStackTrace();
				System.out.println("資料庫錯誤");
			} 
		}
		/******************************** 查詢全部資料表 ***********************/		
		if ("getALLClass".equals(action)) {
			try {
				// ============查詢班級全部資料====================
				ClassService classSvc = new ClassService();
				System.out.println("KO");
				List<ClassVO> classVO = classSvc.getAllClass();
				request.setAttribute("classVO", classVO);
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Class/ClassView.jsp");
				successMsg.forward(request, response);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
		/******************************** 查詢單一筆資料 ***********************/	
		if ("getoneClass".equals(action)) {
			ClassVO cla=null;
			
			try {
				// ============接收班級代號class_id資料====================
				String class_id =request.getParameter("class_id");
				ClassService classSvc = new ClassService();
				cla = classSvc.findByPrimaryKeyClass(class_id);
				request.setAttribute("classVO",cla);
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Class/ClassUpdateFrom.jsp");
				successMsg.forward(request, response);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		/******************************** 結束 ***********************/		
	}
}
