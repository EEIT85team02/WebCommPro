package com.login.servlet;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.StringReader;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.client.auth.oauth2.AuthorizationCodeFlow;
import com.google.api.client.auth.oauth2.AuthorizationCodeResponseUrl;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.auth.oauth2.StoredCredential;
import com.google.api.client.auth.oauth2.TokenResponse;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeTokenRequest;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.calendar.CalendarScopes;
import com.google.api.services.oauth2.Oauth2;
import com.google.api.services.oauth2.model.Userinfoplus;
import com.google.gson.Gson;
// -- 這是一支工具類別 GoogleOAuthorizationCodeFlow 物件為靜態!
public class OAuth2Util {
	
	// -- 驗證流程初始化所需參數
		private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
		private static final JsonFactory JSON_FACTORY = new JacksonFactory();
		
		// -- 授權範圍
		private static final List<String> SCOPE = Arrays.asList( 
				"https://www.googleapis.com/auth/userinfo.profile",
				"https://www.googleapis.com/auth/userinfo.email",
				 CalendarScopes.CALENDAR_READONLY);	
		
		// -- 驗證流程 【器】
		private static AuthorizationCodeFlow flow;
		
		// -- 帳密
		private static GoogleClientSecrets clientSecrets; 
		
		/**
		 * 初始化驗證流程器
		 * 參數:
		 * @NetHttpTransport
		 * @JacksonFactory
		 * @String (帳號)
		 * @String (密碼)
		 * @String (授權範圍)
		 * @AuthorizationCodeFlow (儲存方式)
		 */
			/**
			 * 儲存方式
			 * 1. setDataStoreFactory(DataStoreFactory dataStore)
			 * 	參數
			 * 		@DataStoreFactory 介面
			 * 			使用FileDataStoreFactory(File file)類別
			 * 	
			 * 2. setCredentialDataStore(DataStore<StoredCredential> typedDataStore)
			 * 		
			 */
		// -- 靜態區塊
		static{
			// -- 提取資源【器】(帳、密)
			try {
				clientSecrets = GoogleClientSecrets.load(JSON_FACTORY,
						new InputStreamReader(loginFilter.class.getResourceAsStream("/client_secrets.json")));
				System.out.println("ClientId"+ clientSecrets.getDetails().getClientId());
				System.out.println("ClientSecret"+ clientSecrets.getDetails().getClientSecret());
			} catch (IOException e1) {
				//e1.printStackTrace();
				System.out.println("提取帳密時出錯");
			}
		
			/*
			Map<String, Object> map = clientSecrets.getDetails().getUnknownKeys();
			for(Object key:map.keySet()){
//				key=key.toString();
				System.out.println("-----"+map.get(key)+"------");
			}
			*/

			
			// -- Inner Class 初始化 Builder 
			AuthorizationCodeFlow.Builder builder = new GoogleAuthorizationCodeFlow.Builder(HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPE);
			// -- 繼續對 Builder 進行設定		
			// -- 1. 設定儲存位置
			
			
			try {
//				builder.setDataStoreFactory( new FileDataStoreFactory(new File("/OA2")));
				/**
				 *  嘗試使用一個類別兩個方法來設定flow將來要存放Credentials的位置
				 *  1. setCredentialDataStore()
				 *  2. StoredCredential			-- 靜態類別
				 *  3. getDefaultDataStore()
				 */
				builder.setCredentialDataStore(StoredCredential.getDefaultDataStore(new FileDataStoreFactory(new File("resources"))));
			} catch (IOException e) {
				//e.printStackTrace();
				System.out.println("儲存工廠有問題! 可能是路徑設錯 !");
			}
			// -- 將Builder 製作成 "授權流程" 物件 
			flow = builder.build();
		}
		
		
		
		/**
		 * 其他工具性的函數
		 * 1. 判斷某User-ID是否已經擁有授權
		 * 2. 取得授權網址
		 * 3. 設定授權配置 
		 * 	@HttpServletRequest request
		 * 	@String redirectUrl
		 *  @String user-ID
		 * 4. 刪除授權
		 * 5. 取得User資訊 
		 * 6. 取得User資訊 (TokenRequest) 
		 * 7. 儲存User資訊 (IdToken) 
		 * 8. 取得User資訊 (UserId)
		 * 9. 取得User資訊 (com.google.api.services.calendar.model.Calendar)
		 * 10.取得User資訊 (credential) -- 不適用
		 * 11.取得User資訊 (credential) -- 嘗試抓取而已
		 * 12.取得User資訊 (credential) -- 真正抓取
		 */

		// 1.
		public boolean hasCredentials(String userId){
			// getCredential() 在下面10.
			// 如果沒有此UserId的Credential 回傳null
			// 如果有    此UserId的Credential 回傳此User的Credential
			boolean isUserExit = getCredential(userId)==null?null:true;
			return isUserExit;
//			return userId==null?false:true;
		}
		
		// 2.
		public String getAuthorizationUrl(String redirectUrl){
			return flow.newAuthorizationUrl()		// 配置新的Url
					   .setRedirectUri(redirectUrl)	// 設定跳轉Uri
					   .build();					// 建立
		}
		
		// 3.
		public void setCredentials(HttpServletRequest request, String redirectUrl, String userId) {
			StringBuffer urlBuff = request.getRequestURL(); // 串字串 仿造瀏覽器送出請求
			// 單獨取出Query-String
			if(request.getQueryString()!=null){
				urlBuff.append('?').append(request.getQueryString());
			}
			
			// 建立新的回應網址
			AuthorizationCodeResponseUrl authResponse = new AuthorizationCodeResponseUrl(urlBuff.toString());
			// 若無錯誤發生 ... 這邊省略程式碼不曉得有沒有問題
			
			try {
				GoogleTokenResponse response = 
						new GoogleAuthorizationCodeTokenRequest(
								HTTP_TRANSPORT, JSON_FACTORY, clientSecrets.getDetails().getClientId(),clientSecrets.getDetails().getClientSecret() , authResponse.getCode(),redirectUrl)
						.execute();
				flow.createAndStoreCredential(response, userId);
			} catch(IOException e){
				System.out.println("儲存資料失敗! 可能是回應物件或是IO失敗!");
			}
		}
		 
		// 4.
		public void removeCredentials(String userId){
			try {
				flow.getCredentialDataStore().delete(userId);
			} catch (IOException e) {
				System.out.println("可能是不存在此User! 或者是刪除失敗!");
			}
		}
		
		// 5.
		public Userinfoplus getUserInfo(String userId) throws IOException{
			Oauth2 userInfoService = new Oauth2
					.Builder(HTTP_TRANSPORT,JSON_FACTORY,null)				// inner Class
					.setHttpRequestInitializer(flow.loadCredential(userId))	// ini-er
					.build();												// builder -> Oauth2 
			
			Userinfoplus userInfo = null;
			try{
				userInfo = userInfoService.userinfo().get().execute();
			} catch(IOException e){
				System.out.println("取userInfo時出錯!");
			}
			if(userInfo!=null && userInfo.getId()!=null)
			return userInfo;
			else
				System.out.println("沒有任何資訊 或者根本找不到此ID");
				return null;
		}
		
		
		
		// 6.
		public GoogleAuthorizationCodeTokenRequest getToken(String code, String redirectURL){
			return	new GoogleAuthorizationCodeTokenRequest(HTTP_TRANSPORT,JSON_FACTORY,clientSecrets.getDetails().getClientId(),clientSecrets.getDetails().getClientSecret(),code,redirectURL);

		}
	
//		public GoogleIdToken verifyIdToken(GoogleIdToken idToken){
//		return	new GoogleIdTokenVerifier.Builder(this.HTTP_TRANSPORT, this.JSON_FACTORY).verify(idToken.toString());
//		}
		
//		try(Reader reader = new InputStreamReader(loginFilter.class.getResourceAsStream("/user_data.json"), "UTF-8")){
//            Gson gson = new GsonBuilder().create();
//            Person p = gson.fromJson(reader, Person.class);
//            System.out.println(p);
//        }
		
		
		
		
		
		// 7.
		public boolean storeIdToken(GoogleIdToken googleToken, HttpServletRequest request){
			
			String realPath = request.getSession().getServletContext().getRealPath("/");
			realPath+="user_data.json";
			System.out.println("準備儲存的路徑為:"+realPath);
			try (	BufferedWriter out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(realPath)));
					BufferedReader in = new BufferedReader(new StringReader(new Gson().toJson(googleToken)))){ 
				 String str;
				 while((str=in.readLine())!=null){
					out.write(str);
				} 
				 // 若儲存資料無問題則回傳成功 
				return true;
				
				
			} catch (FileNotFoundException e) {
				System.out.println("存放使用者資料時出錯");
				// 若儲存資料有問題則回傳失敗
				return false;
				
			}catch(IOException e1){
				System.out.println("IO錯誤");
				// 若儲存資料有問題則回傳失敗
				return false;
			}
			
		}
		// 8.
		public String getUserId(GoogleIdToken googleToken){
			// 此方法已經被淘汰
			// googleToken.getPayload().getUserId(); 
			
			// 改用getSubject()
			return googleToken.getPayload().getSubject();
		}
		
		// 9.
		public com.google.api.services.calendar.model.Calendar getCalendar(Credential credentials){
//			
			com.google.api.services.calendar.Calendar calendarSend = 
					new com.google.api.services.calendar.Calendar.Builder(HTTP_TRANSPORT, JSON_FACTORY, credentials)
			.setApplicationName("EEIT實作")
			.build(); 
			
			try {
				com.google.api.services.calendar.model.Calendar calendarResponse = calendarSend.calendars().get("primary")
						// 這裡的確是設定API KEY 的地方 (必要 除非設定OAuth2.0 Token)
						.setKey("AIzaSyBrCsDjLs9Z2ULox1dtjMdzrYqzUWf3ZrI")
						.execute();
				return calendarResponse;
			} catch (IOException e) {
//				e.printStackTrace();
				System.out.println("取得使用者日曆發生錯誤");
				
				return null;
			}
					
			
//			new Calendar.Builder(httpTransport, jsonFactory, credentials)
//		    .setApplicationName("applicationName").build();
			
			
			
		}
		
		// 10. 
		public Credential getCredential(String userId){
			try {
				return flow.loadCredential(userId);
				
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("取得credential時發生錯誤");
				return null;
			}
			
		}
	
		
		// 11. 
		public boolean testCredential(TokenResponse response, String userId){
			try {
				flow.createAndStoreCredential(response, userId);
				return true;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
		
		
		
		// 12.
		public Credential getNewCredential(TokenResponse response, String userId){
			try {
				return  flow.createAndStoreCredential(response, userId);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		// 13.
		public boolean storeCredential(String credentialGson, HttpServletRequest request){
			
			String realPath = request.getSession().getServletContext().getRealPath("/");
			realPath+="user_credential.json";
			System.out.println("準備儲存的路徑為:"+realPath);
			try (	BufferedWriter out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(realPath)));
					BufferedReader in = new BufferedReader(new StringReader(credentialGson))){ 
				 String str;
				 while((str=in.readLine())!=null){
					out.write(str);
				} 
				 // 若儲存資料無問題則回傳成功 
				return true;
				
				
			} catch (FileNotFoundException e) {
				System.out.println("存放使用者資料時出錯 (credential)");
				// 若儲存資料有問題則回傳失敗
				return false;
				
			}catch(IOException e1){
				System.out.println("IO錯誤 (credential)");
				// 若儲存資料有問題則回傳失敗
				return false;
			}
			
		}		
		
}
	
	
	
