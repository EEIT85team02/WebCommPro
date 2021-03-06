package com.login.servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SendMail.model.DecryptService;
import Student.model.StudentVO;


/*@WebServlet("/Login.do")*/
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			// 準備存放錯誤訊息的 Map<String, String> 物件 : errorMsgMap
			Map<String, String> errorMsgMap = new HashMap<String, String>();
			// 將 errorMsgMap 放入 request 置物櫃內，識別字串為 "ErrorMsgKey"
			request.setAttribute("ErrorMsgKey", errorMsgMap);
			// 1. 讀取使用者輸入資料(<Input>標籤內的name屬性分別為 userId與pswd
			String userId = request.getParameter("Username");
			String password = request.getParameter("Password");
			System.out.println("userId--------"+userId);
			System.out.println("password--------"+password);
			// 2. 進行必要的資料轉換
			// 無
			// 3. 檢查使用者輸入資料
			// 如果 userId 欄位為空白，放錯誤訊息"帳號欄必須輸入"到 errorMsgMap 之內
			// 對應的識別字串為 "AccountEmptyError"
			if (userId == null || userId.trim().length() == 0) {
				errorMsgMap.put("AccountEmptyError", "帳號欄必須輸入");
			}
			// 如果 password 欄位為空白，放錯誤訊息"密碼欄必須輸入"到 errorMsgMap 之內
			// 對應的識別字串為 "PasswordEmptyError"
			if (password == null || password.trim().length() == 0) {
				errorMsgMap.put("PasswordEmptyError", "密碼欄必須輸入");
			}
			// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給/ch06_01/login.jsp，
			// 然後 return
			if (!errorMsgMap.isEmpty()) {
				RequestDispatcher rd = request
						.getRequestDispatcher("/Login.jsp");
				rd.forward(request, response);
				return;
			}
			// 將LoginService類別new為物件，存放物件參考的變數為 ls
			//LoginService ls = new LoginService();
			//DecryptService ls = new DecryptService();
			// 呼叫 ls物件的 checkIDPassword()，要記得傳入userid與password兩個參數
			// 同時將傳回值放入MemberBean型別的變數mb之內。
			//StudentVO mb = ls.checkIDPassword(userId, password);

			StudentVO mb;
			try {
				//要使用compareIfMatchThePassword比較
				mb = DecryptService.compareIfMatchThePassword(userId, password);
			
			// 如果變數mb的值不等於 null,表示資料庫含有userId搭配password的紀錄
			if (mb != null) {
				// OK, 將mb物件放入Session範圍內，識別字串為"LoginOK"，表示此使用者已經登入
				session.setAttribute("LoginOK", mb);
				Integer stu_id = mb.getStu_id();
				System.out.println("stu_id"+stu_id);
				session.setAttribute("stu_id", stu_id);
			} else {
				// NG, userid與密碼的組合錯誤，放錯誤訊息"該帳號不存在或密碼錯誤"到 errorMsgMap 之內
				// 對應的識別字串為 "LoginError"
				errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
			}
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// 5.依照 Business Logic 運算結果來挑選適當的畫面
			// 如果 errorMsgMap是空的，表示沒有任何錯誤，準備交棒給下一隻程式
		if (errorMsgMap.isEmpty()) {
				// 如果session物件內含有"target"屬性物件，表示使用者先前嘗試執行某個應該
				// 登入，但使用者未登入的網頁，由該網頁放置的"target"屬性物件，因此如果
				// 有"target"屬性物件則導向"target"屬性物件所標示的網頁，否則導向首頁
				String contextPath = getServletContext().getContextPath();
				Object LoginOK =  session.getAttribute("LoginOK");
				if (LoginOK != null) {
					// 先由session中移除此項屬性，否則下一次User直接執行login功能後，
					// 會再度被導向到 target
					//session.removeAttribute("target");
					// 導向 contextPath + target
					//response.sendRedirect(contextPath + target);
					session.setAttribute("userId", userId);
	/*				response.sendRedirect(
				       response.encodeRedirectURL(contextPath + target));*/

				//} else {
					// 導向 contextPath + "/index.jsp"
					//response.sendRedirect(contextPath + "/index.jsp");
	        /*      	RequestDispatcher rd = request
							.getRequestDispatcher("/LoginForwarded.do");
					rd.forward(request, response);*/
					
					response.sendRedirect(
						      response.encodeRedirectURL("LoginForwarded.do" ));

				}
				return;
			} else {
				// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給/ch06_01/login.jsp
			
				response.sendRedirect(
					      response.encodeRedirectURL( "Login.jsp" ));
				return;
			}
		}
	}
