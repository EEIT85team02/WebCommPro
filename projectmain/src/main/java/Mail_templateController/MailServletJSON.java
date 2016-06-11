package Mail_templateController;

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
import Mail_template.model.Mail_templateService;



@WebServlet("/Mail_template/MailServletJSON.do")
public class MailServletJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MailServletJSON() {
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
			Mail_templateService mailSvc = null;
			String action = request.getParameter("action");

			/******************************** 新增資料表 ***********************/
			if ("addMail".equals(action)) {
				Map<String, String> Msgs = null;
				String mail_name= null;
				String mail_text= null;
				try {
					Msgs = new HashMap<String, String>();
					/***************(新增)取得Mail_template-mail_name表單資料***************/
					mail_name = request.getParameter("mail_name");
					if (mail_name == null || mail_name.trim().length() == 0) {
						Msgs.put("mail_nameMsg", "樣版名稱不可空白");
					}
					if (mail_name.trim().length() >30) {
						Msgs.put("mail_nameMsg", "樣版名稱中英文長度不可大於30碼");
					}
					/***************(新增)取得Mail_template-mail_text表單資料***************/
					mail_text = request.getParameter("mail_text");
					if (mail_text == null || mail_text.trim().length() == 0) {
						Msgs.put("mail_textMsg", "樣版內容不可空白");
					}
					if (mail_text.trim().length() >250) {
						Msgs.put("mail_textMsg", "樣版內容中英文長度不可大於250碼");
					}
					
					if (!Msgs.isEmpty()) {
						out.write("資料新增失敗");
						return;
						/***************呼叫Service方法將資料新增***********************/
					}else{
						mailSvc = new Mail_templateService();
						mailSvc.insertMail(mail_name,mail_text);
						out.write("資料新增成功");
						return;
					}
				} 
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
			/******************************** 刪除資料表 ***********************/
			if ("deleteMail".equals(action)) {
				
				try {
					// ============接收員工代號emp_id資料====================
					Integer mail_id =Integer.parseInt(request.getParameter("mail_id"));
					// ============呼叫方法刪除資料====================
					mailSvc = new Mail_templateService();
					mailSvc.deleteMail(mail_id);
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
			if ("updateMail".equals(action)) { 
				Map<String, String> Msgs = null;
				List mails =new LinkedList();
				String jsonString = null;
				Integer mail_id= null;
				String mail_name= null;
				String mail_text= null;
				
				
				try {
					Msgs = new HashMap<String, String>();
					/***************(修改)取得Mail_template-mail_id表單資料***************/
					mail_id =Integer.parseInt(request.getParameter("mail_id"));
					if (mail_id == null) {
						Msgs.put("mail_id", "Email樣版代號不可空白");
					}
					/***************(修改)取得Mail_template-mail_name表單資料***************/
					mail_name = request.getParameter("mail_name");
					if (mail_name == null || mail_name.trim().length() == 0) {
						Msgs.put("mail_nameMsg", "Email樣版名稱不可空白");
					}
					if (mail_name.trim().length() >30) {
						Msgs.put("mail_nameMsg", "Email樣版名稱中英文長度不可大於30碼");
					}
					/***************(修改)取得Mail_template-mail_text表單資料***************/
					mail_text = request.getParameter("mail_text");
					if (mail_text == null || mail_text.trim().length() == 0) {
						Msgs.put("mail_textMsg", "Email樣版內容不可空白");
					}
					if (mail_text.trim().length() >250) {
						Msgs.put("mail_textMsg", "Email樣版內容中英文長度不可大於250碼");
					}
					
					if (!Msgs.isEmpty()) {
						out.write("資料更新失敗");
						return;
					}
					/*******************將資料(更新)至資料庫**********************/
					else{
						mailSvc = new Mail_templateService();
						mailSvc.updateMail(mail_id,mail_name,mail_text);
						out.write("資料更新成功");
						return;
					}
				}catch (Exception e) {
					out.write("資料更新失敗");
					return;
				}
			}
			/******************************** 查詢全部資料表 ***********************/		
			if ("getALLMail".equals(action)) {
				try {
					// ============查詢員工權限設定全部資料回傳JSON字串====================
					mailSvc = new Mail_templateService();
					String jsonString = mailSvc.getAllMailToJSON();
					out.write(jsonString);
					return;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		
			/******************************** 查詢單一筆資料 ***********************/	
			if ("getoneMail".equals(action)) {
				try {
					// ============接收員工代號mail_id資料====================
					Integer mail_id =Integer.parseInt(request.getParameter("mail_id"));
					// ============查詢員工權限設定單筆資料回傳JSON字串============
					mailSvc = new Mail_templateService();
					String jsonString = mailSvc.findByPrimaryKeyMailToJSON(mail_id);
					out.write(jsonString);
					return;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			/***************************初始連結呼叫MailServletJSON轉址至Mail_templateTODataTablesJSON.jsp********************/	
			if ("initMailViewTODataTablesJSON".equals(action)) {
				try {
					
					RequestDispatcher successMsg = request
							.getRequestDispatcher("/Mail_template/Mail_templateTODataTablesJSON.jsp");
					successMsg.forward(request, response);
					return;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			/******************************** 結束 ***********************/		
		}

		

	}
