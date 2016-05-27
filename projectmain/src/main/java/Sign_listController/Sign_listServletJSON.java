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

import com.microsoft.sqlserver.jdbc.SQLServerException;


@WebServlet("/Sign_list/Sign_listServletJSON.do")
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

		/******************************** 更新資料表 ***********************/	
		if ("updateSl".equals(action)) { 
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
				if (emp_name.trim().length() >30) {
					Msgs.put("edu_nameMsg", "員工名稱中英文長度不可大於30碼");
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
					slSvc = new Sign_listService();
					slSvc.updateSl(emp_id,emp_name,emp_mail,dep_name,sl_id);
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
		
		/********************** 更新(刪除權限代號設定-->sl_id=0)資料表 ********************/	
		if ("updatedelSl".equals(action)) { 
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
				if (emp_name.trim().length() >30) {
					Msgs.put("edu_nameMsg", "員工名稱中英文長度不可大於30碼");
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
					slSvc = new Sign_listService();
					slSvc.updatedelSl(emp_id,emp_name,emp_mail,dep_name,sl_id);
					
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
		/******************************** 查詢全部資料表 ***********************/		
		if ("getALLSl".equals(action)) {
			try {
				// ============查詢員工權限設定全部資料回傳JSON字串====================
				slSvc = new Sign_listService();
				String jsonString = slSvc.getAllSlToJSON();
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
		/******************************** 查詢單一筆資料 ***********************/	
		if ("getoneSl".equals(action)) {
			try {
				// ============接收員工代號emp_id資料====================
				String emp_id =request.getParameter("emp_id");
				// ============查詢員工權限設定單筆資料回傳JSON字串============
				slSvc = new Sign_listService();
				String jsonString = slSvc.findByPrimaryKeySlToJSON(emp_id);
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		/***************************初始連結呼叫Sign_listServletJSON轉址至Sign_listTODataTablesJSON.jsp********************/	
		if ("initSlViewTODataTablesJSON".equals(action)) {
			try {
				
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
