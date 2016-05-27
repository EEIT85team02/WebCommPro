package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.exception.ConstraintViolationException;


import org.json.JSONArray;

import com.microsoft.sqlserver.jdbc.SQLServerException;

import Class.model.ClassService;
import Class.model.ClassVO;
import Edu.model.EduService;



@WebServlet("/Class/ClassServletJSON.do")
public class ClassServletJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ClassServletJSON() {
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
		ClassService classSvc = null;
		String action = request.getParameter("action");

		/******************************** 新增資料表 ***********************/
		if ("addClass".equals(action)) {
			Map<String, String> Msgs = null;
			String class_id= null;
			String class_name= null;
			String class_contact= null;
			String class_teach= null;
			Integer edu_id= null;
			try {
				Msgs = new HashMap<String, String>();
				/***************(新增)取得Class-class_id表單資料***************/
				class_id = request.getParameter("class_id");
				if (class_id == null || class_id.trim().length() == 0) {
					Msgs.put("class_idMsg", "班級代號不可空白");
				}
				if (class_id.trim().length() >10) {
					Msgs.put("class_idMsg", "班級代號中英文長度不可大於10碼");
				}
				/***************(新增)取得Class-class_name表單資料***************/
				class_name = request.getParameter("class_name");
				if (class_name == null || class_name.trim().length() == 0) {
					Msgs.put("class_nameMsg", "班級名稱不可空白");
				}
				if (class_name.trim().length() >30) {
					Msgs.put("class_nameMsg", "班級名稱中英文長度不可大於30碼");
				}
				/***************(新增)取得Class-class_contact表單資料***************/
				class_contact = request.getParameter("class_contact");
				if (class_contact == null || class_contact.trim().length() == 0) {
					Msgs.put("class_contactMsg", "班級聯絡人不可空白");
				}
				if ( class_contact.trim().length() >10) {
					Msgs.put("class_contactMsg", "班級聯絡人長度不可大於10碼");
				}
				/***************(新增)取得Class-class_teach表單資料***************/
				class_teach = request.getParameter("class_teach");
				if (class_teach == null || class_teach.trim().length() == 0) {
					Msgs.put("class_teachMsg", "導師不可空白");
				}
				if (class_teach.trim().length() > 10) {
					Msgs.put("class_teachMsg", "導師中英文長度不可大於10碼");
				}
				/***************(新增)取得Class-edu_id表單資料***************/
				edu_id = Integer.parseInt(request.getParameter("edu_id"));
				if (edu_id == null) {
					Msgs.put("edu_idMsg", "中心代號不可空白");
				}
				if (!Msgs.isEmpty()) {
					out.write("資料新增失敗");
					return;
					/***************呼叫Service方法將資料新增***********************/
				}else{
					classSvc = new ClassService();
					classSvc.insertClass(class_id,class_name,class_contact,class_teach,edu_id);
					out.write("資料新增成功");
					return;
				}
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/******************************** 多筆刪除資料表 ***********************/
		if ("deleteClassMulti".equals(action)) {
			
			try {
				// ============接收中心代號edu_id資料====================
				String class_idJSON =request.getParameter("class_id");
				//System.out.println("class_idJSON========="+class_idJSON);
				// ============呼叫方法刪除資料====================
				classSvc = new ClassService();
				classSvc.deleteClassMulti(class_idJSON);
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
		if ("deleteClass".equals(action)) {
			
			try {
				// ============接收班級代號class_id資料====================
				String class_id =request.getParameter("class_id");
				// ============呼叫方法刪除資料====================
				classSvc = new ClassService();
				classSvc.deleteClass(class_id);
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
		if ("updateClass".equals(action)) { 
			Map<String, String> Msgs = null;
			String class_id= null;
			String class_name= null;
			String class_contact= null;
			String class_teach= null;
			Integer edu_id= null;
			try {
				Msgs = new HashMap<String, String>();
				/***************(修改)取得Class-class_id表單資料***************/
				class_id =request.getParameter("class_id");
				if (class_id == null || class_id.trim().length() == 0) {
					Msgs.put("class_idMsg", "班級代號不可空白");
				}
				if (class_id.trim().length() >10) {
					Msgs.put("class_idMsg", "班級代號中英文長度不可大於10碼");
				}
				/***************(修改)取得Class-class_name表單資料***************/
				class_name = request.getParameter("class_name");
				if (class_name == null || class_name.trim().length() == 0) {
					Msgs.put("class_nameMsg", "班級名稱不可空白");
				}
				if (class_name.trim().length() >30) {
					Msgs.put("class_nameMsg", "班級名稱中英文長度不可大於30碼");
				}
				/***************(修改)取得Class-class_contact表單資料***************/
				class_contact = request.getParameter("class_contact");
				if (class_contact == null || class_contact.trim().length() == 0) {
					Msgs.put("class_contactMsg", "班級聯絡人不可空白");
				}
				if (class_contact.trim().length() >10) {
					Msgs.put("class_contactMsg", "班級聯絡人中英文長度不可大於10碼");
				}
				/***************(修改)取得Class-class_teach表單資料***************/
				class_teach = request.getParameter("class_teach");
				if (class_teach == null || class_teach.trim().length() == 0) {
					Msgs.put("class_teachMsg", "班級導師不可空白");
				}
				if ( class_teach.trim().length() >10) {
					Msgs.put("class_teachMsg", "班級導師長度不可大於10碼");
				}
				/***************(修改)取得Class-edu_id表單資料***************/
				edu_id = Integer.parseInt(request.getParameter("edu_id"));
				if (edu_id == null ) {
					Msgs.put("edu_idMsg", "中心代號不可空白");
				}
				if (!Msgs.isEmpty()) {
					out.write("資料更新失敗");
					return;
				}
				/*******************將資料(更新)至資料庫**********************/
				else{
					classSvc = new ClassService();
					classSvc.updateClass(class_id,class_name,class_contact,class_teach,edu_id);
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
		if ("getALLClass".equals(action)) {
			try {
				// ============查詢班級全部資料回傳JSON字串====================
				classSvc = new ClassService();
				String jsonString = classSvc.getAllClassToJSON();
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/********************************查詢全部資料表FOR DataTables init() ***********************/
		if ("getAllClassToJSONInitTable".equals(action)) {
			try {
				// ============查詢班級全部資料回傳JSON字串====================
				classSvc = new ClassService();
				String jsonString = classSvc.getAllClassToJSONInitTable();
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
		/******************************** 查詢單一筆資料 ***********************/	
		if ("checkClassId".equals(action)) {
			try {
				// ============接收班級代號class_id資料====================
				String class_id =request.getParameter("class_id");
				// ============查詢班級單筆資料回傳JSON字串============
				classSvc = new ClassService();
				ClassVO classVO = classSvc.findByPrimaryKeyClass(class_id);
				System.out.println(classVO);
				if(classVO != null){
					out.write("代號已存在");
				}else {
					out.write("代號不存在");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/******************************** 查詢(確認)班級代號資料是否存在資料庫 ***********************/	
		if ("getoneClass".equals(action)) {
			String jsonString =null;
			try {
				// ============接收班級代號class_id資料====================
				String class_id =request.getParameter("class_id");
				// ============查詢班級單筆資料回傳JSON字串============
				classSvc = new ClassService();
				jsonString = classSvc.findByPrimaryKeyClassToJSON(class_id);
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/***************************初始連結呼叫ClassServletJSON轉址至ClassViewTODataTablesJSON.jsp********************/	
		if ("initClassViewTODataTablesJSON".equals(action)) {
			try {
				// ============轉到班級ClassViewTODataTablesJSON====================
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Class/ClassViewTODataTablesJSON.jsp");
				successMsg.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/******************************** 結束 ***********************/		
	}
}
