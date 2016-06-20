package Controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.exception.ConstraintViolationException;

import SendMail.model.SendMailService;
import Talk.model.TalkService;

@WebServlet("/Talk/TalkServletJSON.do")
public class TalkServletJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public TalkServletJSON() {
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
		TalkService talkSvc = null;
		String action = request.getParameter("action");
		/******************************** 新增資料表 ***********************/
		if ("addTalk".equals(action)) {
			String talkTitle= null;
			String talkName= null;
			Integer talkChose= null;
			String talkMail = null;
			String	talkContent= null;
			String	retalkContent= "尚未回覆";
			java.sql.Timestamp talkDate=null;
			java.sql.Timestamp retalkDate=null;
			Integer talkstatus=0;
			try {
				talkTitle = request.getParameter("talkTitle");
				talkName = request.getParameter("talkName");
				talkChose = Integer.parseInt(request.getParameter("talkChose"));
				talkMail = request.getParameter("talkMail");
				talkContent = request.getParameter("talkContent");
				talkDate= new java.sql.Timestamp(new java.util.Date().getTime());
				retalkDate= new java.sql.Timestamp(new java.util.Date().getTime());
				if (talkTitle == null || talkTitle.trim().length() == 0) {
					talkTitle="無標題";
				}
				if (talkName == null || talkName.trim().length() == 0) {
					talkName ="無名氏";
				}
				if (talkContent == null || talkContent.trim().length() == 0) {
					talkContent ="無填寫內容";
				}
					talkSvc = new TalkService();
					talkSvc.insertTalk(talkTitle,talkName,talkChose,talkMail,talkContent,retalkContent,talkDate,retalkDate,talkstatus);
					out.write("資料新增成功");
					return;
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
		}/******************************** 更新資料表 ***********************/
		if ("updateTalk".equals(action)) {
			Integer talkId= null;
			String	retalkContent= null;
			Timestamp retalkDate= null;
			Integer talkstatus=1;
			try {
				
				talkId = Integer.parseInt(request.getParameter("talkId"));
				retalkContent = request.getParameter("retalkContent");
				retalkDate= new java.sql.Timestamp(new java.util.Date().getTime());
				talkSvc = new TalkService();
				talkSvc.updateTalk(talkId,retalkContent,retalkDate,talkstatus);
				out.write("資料更新成功");
				return;
			} 
			catch (SQLException e) {
				out.write("資料更新失敗");
				e.printStackTrace();
			}
		}
		/******************************** 多筆刪除資料表 ***********************/
		if ("deleteTalkMulti".equals(action)) {
			try {
				String talkIdJSON =request.getParameter("talkId");
				talkSvc = new TalkService();
				talkSvc.deleteTalkMulti(talkIdJSON);
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
				
		if ("getALLTalk".equals(action)) {
			try {
				talkSvc = new TalkService();
				String jsonString = talkSvc.getAllTalkToJSON();
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/******************************** 查詢單一筆資料 ***********************/	
		if ("getoneTalk".equals(action)) {
			try {
				
				Integer talkId =Integer.parseInt(request.getParameter("talkId"));
				
				talkSvc = new TalkService();
				String jsonString = talkSvc.findByPrimaryKeyTalkToJSON(talkId);
				out.write(jsonString);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/***************************留言板悄悄話mail發送********************/	
		if ("talkMailTotalkName".equals(action)) {
			
				SendMailService sendmailSrc=new SendMailService();
				String emailString = request.getParameter("talkMail");
				String nameString = request.getParameter("talkName");
				String context = request.getParameter("retalkContent");
				sendmailSrc.replyMessageBoardToStudent(emailString, nameString, context);
				out.write("OK");
				return;
			
		}
		/***************************初始連結呼叫TalkServletJSON轉址至TalkViewTODataTablesJSON.jsp********************/	
		if ("initTalkViewTODataTablesJSON".equals(action)) {
			try {
			
				RequestDispatcher successMsg = request
						.getRequestDispatcher("/Talk/TalkViewTODataTablesJSON.jsp");
				successMsg.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/******************************** 結束 ***********************/		
	}
}
