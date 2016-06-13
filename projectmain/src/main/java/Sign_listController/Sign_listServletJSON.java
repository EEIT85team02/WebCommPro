package Sign_listController;

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

import Sign_list.model.Sign_listService;



@WebServlet({"/Sign_list/Sign_listServletJSON.do","/Employee/Sign_listServletJSON.do"})
public class Sign_listServletJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Sign_listServletJSON() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Sign_listService slSvc = null;
		String action = request.getParameter("action");

		/******************************** 新增資料表 ***********************/
		if ("addSl".equals(action)) {
			Map<String, String> Msgs = null;
			Integer sl_id= null;
			String sl_name= null;
			try {
				Msgs = new HashMap<String, String>();
				/***************(新增)取得Sign_list-sl_id表單資料***************/
				sl_id =Integer.parseInt(request.getParameter("sl_id"));
				if (sl_id == null) {
					Msgs.put("sl_id", "權限代號不可空白");
				}
				/***************(新增)取得Sign_list-sl_name表單資料***************/
				sl_name = request.getParameter("sl_name");
				if (sl_name == null || sl_name.trim().length() == 0) {
					Msgs.put("sl_nameMsg", "中心名稱不可空白");
				}
				if (sl_name.trim().length() >20) {
					Msgs.put("sl_nameMsg", "權限名稱中英文長度不可大於20碼");
				}
				
				if (!Msgs.isEmpty()) {
					out.write("資料新增失敗");
					return;
					/***************呼叫Service方法將資料新增***********************/
				}else{
					slSvc = new Sign_listService();
					slSvc.insertSl(sl_id,sl_name);
					out.write("資料新增成功");
					return;
				}
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/******************************** 刪除資料表 ***********************/
		if ("deleteSl".equals(action)) {
			
			try {
				// ============接收權限代號sl_id資料====================
				Integer sl_id =Integer.parseInt(request.getParameter("sl_id"));
				// ============呼叫方法刪除資料====================
				slSvc = new Sign_listService();
				slSvc.deleteSl(sl_id);
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
		if ("updateSl".equals(action)) { 
			Map<String, String> Msgs = null;
			Integer sl_id= null;
			String sl_name= null;
			try {
				Msgs = new HashMap<String, String>();
				/***************(修改)取得Sign_list-sl_id表單資料***************/
				sl_id =Integer.parseInt(request.getParameter("sl_id"));
				if (sl_id == null) {
					Msgs.put("sl_id", "權限代號不可空白");
				}
				/***************(修改)取得Sign_list-sl_name表單資料***************/
				sl_name = request.getParameter("sl_name");
				if (sl_name == null || sl_name.trim().length() == 0) {
					Msgs.put("sl_nameMsg", "權限名稱不可空白");
				}
				if (sl_name.trim().length() >20) {
					Msgs.put("sl_nameMsg", "權限名稱中英文長度不可大於20碼");
				}
				
				if (!Msgs.isEmpty()) {
					out.write("資料更新失敗");
					return;
				}
				/*******************將資料(更新)至資料庫**********************/
				else{
					slSvc = new Sign_listService();
					slSvc.updateSl(sl_id,sl_name);
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
		if ("getALLSl".equals(action)) {
			try {
				// ============查詢權限設定全部資料回傳JSON字串====================
				slSvc = new Sign_listService();
				String jsonString = slSvc.getAllSlToJSON();
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/********************************查詢全部資料表FOR DataTables init() ***********************/
		if ("getAllSlToJSONInitTable".equals(action)) {
			try {
				// ============查詢權限設定全部資料回傳JSON字串====================
				slSvc = new Sign_listService();
				String jsonString = slSvc.getAllSlToJSONInitTable();
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
		/******************************** 查詢單一筆資料 ***********************/	
		if ("getoneSl".equals(action)) {
			try {
				// ============接收權限代號sl_id資料====================
				Integer sl_id =Integer.parseInt(request.getParameter("sl_id"));
				// ============查詢權限設定單筆資料回傳JSON字串============
				slSvc = new Sign_listService();
				String jsonString = slSvc.findByPrimaryKeySlToJSON(sl_id);
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/***************************初始連結呼叫Sign_listServletJSON轉址至Sign_listTODataTablesJSON.jsp********************/	
		if ("initSlViewTODataTablesJSON".equals(action)) {
			try {
				// ============轉到教育中心EduViewJSON====================
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Sign_list/Sign_listTODataTablesJSON.jsp");
				successMsg.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/******************************** 結束 ***********************/		
	}

	

}
