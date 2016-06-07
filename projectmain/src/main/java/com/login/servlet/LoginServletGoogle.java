package com.login.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Employee.model.EmployeeVO;
import Student.model.StudentVO;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.gson.Gson;


/*@WebServlet("/LoginServletGoogle.do")*/
public class LoginServletGoogle extends HttpServlet {

	OAuth2Util oa2 = new OAuth2Util();
	String loginPage ;
	String service;
	
    public LoginServletGoogle() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// -- Google登入畫面
		
		
		// 把target從session挖出來 再存起來
		
		//service = request.getSession().getAttribute("target")==null?service:request.getSession().getAttribute("target").toString();
		service = "//LoginForwarded.do";
		// 錯誤碼
		System.out.println("Error Code 授權失敗,或是還未Google驗證"+"\n"
				+"授權代碼:"+request.getParameter("code")+"\n"
				+"錯誤代碼"+request.getParameter("error"));
		
		// -- 如果登入失敗 不會拿到code
		if(request.getParameter("code")==null || request.getParameter("error")!=null){
			
			
			
			System.out.println("Error Code 授權失敗,或是還未Google驗證"+"\n"
						+"授權代碼:"+request.getParameter("code")+"\n"
						+"錯誤代碼"+request.getParameter("error"));
			
			// -- 先將session取消 否則無限迴圈
		request.getSession().invalidate();
		

													
		loginPage = oa2.getAuthorizationUrl("http://localhost:8080/projectmain/LoginServletGoogle.do");
		response.sendRedirect(loginPage);
//		}
		}else{
			
			// 如果code已經有東西表示google那邊已經驗證OK
//			loginPage = oa2.getAuthorizationUrl("http://localhost:8080/OA2/UserInfo.jsp");

			
			String userCode = request.getParameter("code");
			/**
			 * 這邊要用Code去換Access Token. 寫在Util類別中
			 * getToken
			 * @String code
			 * @String RedirectURL
			 */
			
/**
 * 			1. GoogleAuthorizationCodeTokenRequest 執行 execute()
 * 
 * 				return a GoogleTokenResponse obj.
 * 			
 * 			2. GoogleTokenResponse 執行getAccessToken()
 * 		
 * 				return a String AccessToken obj.
 * 
 * 
 * 
 * 
 */
			
			
			
			/**
			 * 1. 使用Code取得 (換取) tokenRequset物件
			 * 2. 使用tokenRequest執行 execute()
			 * 3. 取得tokenResponse
			 * 
			 */
			// 取得GoogleTokenResponse
			GoogleTokenResponse tokenResponse= oa2.getToken(userCode, "http://localhost:8080/projectmain/LoginServletGoogle.do").execute();
			
			
			
			
			/**
			 * 1. 使用tokenResponse 換取 AccessToken 物件
			 * 
			 */
			// 取得AccessToken
			String token = tokenResponse.getAccessToken();
			System.out.println("AccessToken 的內容為\n"+token);
			
			
			/**
			 * 1. 使用tokenResponse 換取idToken 物件
			 */
			// 取得TokenID
			String idToken = tokenResponse.getIdToken();
			System.out.println("未解碼的IDToken 的內容為\n"+idToken);
			
			
			
			/** 
			 *  解釋下面的行為:
			 *  目前拿到的idToken還是未解碼的狀態
			 *	還需要進行解碼的動作 (parseIdToken) 
			 *	才會看到可讀的資訊.
			 *	
			 */
			
			/**
			 * 1. 使用tokenResponse換取googleToken物件(解析)
			 * 
			 */
			// 取得 已解碼的IdToken
			GoogleIdToken googleToken = tokenResponse.parseIdToken();
			String email = googleToken.getPayload().getEmail();
			System.out.println("已解碼的IDToken 的內容為\n"+googleToken);
			
			System.out.println("特地列出Email:\n"+email);
			// 必須進資料庫確認此email是否為本系統的使用者
			
			//Emp
			EmployeeVO employeeVO = new LoginService().checkEmailGoogleByEmp(email);
			System.out.println("Emp mail=====" + employeeVO);
			boolean isEmp = employeeVO==null?false:true;
			
			//Stu
			StudentVO studentVO = new LoginService().checkEmailGoogle(email);
			System.out.println("Stu mail=====" + studentVO);
			boolean isMember = studentVO==null?false:true;
			
			//Emp 權限驗證分流
			if(isEmp){
				
				HttpSession session = request.getSession();
				String emp_id = employeeVO.getEmp_id();
				session.setAttribute("emp_id", emp_id);
			
			
			/**
			 * 1. 使用googleToken換取UserId 
			 * 2. 內容包裝在Util類別中
			 */
			// 取得UserId (用GoogleIdToken換)
			String userId = oa2.getUserId(googleToken);
			System.out.println("取得UserId\n"+userId);
			
			
			/**
			 * 自訂方法 驗證手上的UserId 
			 * 只要手上有IdToken 就可以去換 UserId
			 * 
			 */
			
			System.out.println("儲存已解碼的IdToken是否成功\n"+oa2.storeIdToken(googleToken,request)); 
			
			
//			String str = new Gson().toJson(googleToken);
			
			/**
			 * 先設定credentials
			 * @param request
			 * @param redirectUrl
			 * @param userId
			 */
//			oa2.setCredentials(request, "http://localhost:8080/OA2/LoginServletGoogle.do", userId);
			
			
			/**
			 * 先想辦法取得Credential
			 * getCredential()
			 * @UserId
			 */
//			Credential credentials = oa2.getCredential(userId);
//			System.out.println("取得UserId的Credential\n"+credentials);
//			
		
			/**
			 * 自定方法 取得使用者的com.google.api.services.calendar.model.Calendar
			 * getCalendar()
			 * @Credential
			 * 
			 */
//			com.google.api.services.calendar.model.Calendar calendars = oa2.getCalendar(credentials);
//			System.out.println("取得該使用者的calendars"+ calendars.getSummary()+"\n"+calendars.getDescription()+"\n");
				
			/**
			 * 先試試看是否可以成功取得Credential
			 * @tokenResponse
			 * @userId
			 */
			System.out.println("測試取得Credential\n"+oa2.testCredential(tokenResponse, userId));
		
			/**
			 * 若成功取得Credential 印出
			 * @tokenResponse
			 * @userId
			 */
			
			// 先取得credential 物件
			Credential credential = oa2.getNewCredential(tokenResponse, userId);
			// 再轉為Gson 物件
			String credentialGson = new Gson().toJson(credential);
			System.out.println("取得credential\n"+credentialGson);
			// 儲存credential 物件
			oa2.storeCredential(credentialGson, request);

			
			/**
			 * 
			 */
			request.getSession().setAttribute("LoginOK", true);
			request.getSession().setAttribute("code", userCode);
			request.getSession().setAttribute("token", token);
			request.getSession().setAttribute("idtoken", idToken);
			request.getSession().setAttribute("googleidtoken", googleToken);
			// 把userId暫時換成使用者姓名
//			request.getSession().setAttribute("userId", userId);
			
			request.getSession().setAttribute("userId", employeeVO.getEmp_mail());
			request.getSession().setAttribute("sign_list", employeeVO.getSlVO().getSl_name());
			request.getSession().setAttribute("credential", credentialGson);
//			 request.getSession().setAttribute("calSummary", calendars.getSummary());
			
			Object signCheck  =  request.getSession().getAttribute("sign_list");		
			System.out.println("登入權限:" + signCheck);

			//驗證分流
			if(("Administrator").equals(signCheck)){
				service = "//indexOfAdminPage.jsp";
				System.out.println(service);
				System.out.println("即將導向網頁..."+"http://localhost:8080/projectmain"+service);
				response.sendRedirect("http://localhost:8080/projectmain"+service);
			}else if (("Examiner").equals(signCheck)){
				service = "//indexOfExamierPage.jsp";
				System.out.println(service);
				System.out.println("即將導向網頁..."+"http://localhost:8080/projectmain"+service);
				response.sendRedirect("http://localhost:8080/projectmain"+service);
			}else{
				service = "//WebComm_index.jsp";
			System.out.println(service);
			System.out.println("即將導向網頁..."+"http://localhost:8080/projectmain"+service);
			response.sendRedirect("http://localhost:8080/projectmain"+service);
			}
			
			//Stu驗證	
			}else if(isMember){
				HttpSession session = request.getSession();
				Integer stu_id = studentVO.getStu_id();
				session.setAttribute("stu_id", stu_id);
			
			
			/**
			 * 1. 使用googleToken換取UserId 
			 * 2. 內容包裝在Util類別中
			 */
			// 取得UserId (用GoogleIdToken換)
			String userId = oa2.getUserId(googleToken);
			System.out.println("取得UserId\n"+userId);
			
			
			/**
			 * 自訂方法 驗證手上的UserId 
			 * 只要手上有IdToken 就可以去換 UserId
			 * 
			 */
			
			System.out.println("儲存已解碼的IdToken是否成功\n"+oa2.storeIdToken(googleToken,request)); 
			
			
//			String str = new Gson().toJson(googleToken);
			
			/**
			 * 先設定credentials
			 * @param request
			 * @param redirectUrl
			 * @param userId
			 */
//			oa2.setCredentials(request, "http://localhost:8080/OA2/LoginServletGoogle.do", userId);
			
			
			/**
			 * 先想辦法取得Credential
			 * getCredential()
			 * @UserId
			 */
//			Credential credentials = oa2.getCredential(userId);
//			System.out.println("取得UserId的Credential\n"+credentials);
//			
		
			/**
			 * 自定方法 取得使用者的com.google.api.services.calendar.model.Calendar
			 * getCalendar()
			 * @Credential
			 * 
			 */
//			com.google.api.services.calendar.model.Calendar calendars = oa2.getCalendar(credentials);
//			System.out.println("取得該使用者的calendars"+ calendars.getSummary()+"\n"+calendars.getDescription()+"\n");
				
			/**
			 * 先試試看是否可以成功取得Credential
			 * @tokenResponse
			 * @userId
			 */
			System.out.println("測試取得Credential\n"+oa2.testCredential(tokenResponse, userId));
		
			/**
			 * 若成功取得Credential 印出
			 * @tokenResponse
			 * @userId
			 */
			
			// 先取得credential 物件
			Credential credential = oa2.getNewCredential(tokenResponse, userId);
			// 再轉為Gson 物件
			String credentialGson = new Gson().toJson(credential);
			System.out.println("取得credential\n"+credentialGson);
			// 儲存credential 物件
			oa2.storeCredential(credentialGson, request);

			
			/**
			 * 
			 */
			request.getSession().setAttribute("LoginOK", true);
			request.getSession().setAttribute("code", userCode);
			request.getSession().setAttribute("token", token);
			request.getSession().setAttribute("idtoken", idToken);
			request.getSession().setAttribute("googleidtoken", googleToken);
			// 把userId暫時換成使用者姓名
//			request.getSession().setAttribute("userId", userId);
			
			request.getSession().setAttribute("userId", studentVO.getStu_email());
			request.getSession().setAttribute("credential", credentialGson);
//			 request.getSession().setAttribute("calSummary", calendars.getSummary());
			
			
			
			
			System.out.println(service);
			System.out.println("即將導向網頁..."+"http://localhost:8080/projectmain"+service);
			response.sendRedirect("http://localhost:8080/projectmain"+service);
			
			}else{
				System.out.println("即將導向網頁..."+"http://localhost:8080/projectmain/Login.jsp");
				response.sendRedirect("http://localhost:8080/projectmain/Login.jsp");
				
				
			}
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
