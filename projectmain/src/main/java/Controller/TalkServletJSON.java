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
			Map<String, String> Msgs = null;
			String talkName= null;
			String talkGender= null;
			Integer talkChose= null;
			String	talkContent= null;
			try {
				
				talkName = request.getParameter("talkName");
				talkGender =request.getParameter("talkGender") ;
				talkChose = Integer.parseInt(request.getParameter("talkChose"));
				talkContent = request.getParameter("talkContent");
				if (talkName == null || talkName.trim().length() == 0) {
					talkName="無名氏";
				}
				if (talkContent == null || talkContent.trim().length() == 0) {
					talkContent ="無填寫內容。";
				}
					talkSvc = new TalkService();
					talkSvc.insertTalk(talkName,talkGender,talkChose,talkContent);
					out.write("資料新增成功");
					return;
			} 
			catch (SQLException e) {
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
		
		/***************************初始連結呼叫TalkServletJSON轉址至ClassViewTODataTablesJSON.jsp********************/	
		if ("initTalkViewTODataTablesJSON".equals(action)) {
			try {
				// ============轉到班級TalkViewTODataTablesJSON====================
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
