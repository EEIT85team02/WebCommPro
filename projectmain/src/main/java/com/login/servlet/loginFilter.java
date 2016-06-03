package com.login.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(  
			urlPatterns = { "/*" }, 
			initParams = {
//		@WebInitParam(name = "url_1", value = "/UserInfo.jsp"),
//		@WebInitParam(name = "url_2", value = "/uploadCSV.jsp"),
//		@WebInitParam(name = "url_3", value = "/ch05_09/*"),
//		@WebInitParam(name = "url_4", value = "/ch07_02/*") 
		})
public class loginFilter implements Filter {
	
	Collection<String> url = new ArrayList<String>();
    /**
     * Default constructor. 
     */
    public loginFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		if (request instanceof HttpServletRequest
				&& response instanceof HttpServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			String servletPath = req.getServletPath();//取系統名稱
			System.out.println("111--->" + servletPath);
			//呼叫底下mustLogin方法
			if (mustLogin(servletPath)) {//若進入需要登入的頁面 則...
				//已登入
				if (checkLogin(req)) {
					System.out.println("222-->需要Login, 已經Login");
					//執行filter 交棒
					chain.doFilter(request, response);
					//未登入
				} else {
					HttpSession session = req.getSession();
					session.setAttribute("target", req.getServletPath());
					System.out.println("333-->需要Login, 尚未Login , ServletPath="
							+ req.getServletPath());
					
					
					
					RequestDispatcher rd = request
							.getRequestDispatcher("/LoginServletGoogle.do");
					rd.forward(req, resp);


				}
			} else {//進入不需要登入的頁面
				System.out.println("444-->不需要Login ");
				//繼續執行下一支FILTER
				chain.doFilter(request, response);
			}
		} else {
			throw new ServletException("Request/Response Type Error");
		}
	}
	//監聽規則
		private boolean mustLogin(String servletPath) {
			boolean login = false;
			for (String sURL : url) {
				//如果用*結尾的表示該資料夾內所資源都要監聽
				if (sURL.endsWith("*")) {//把*去掉
					sURL = sURL.substring(0, sURL.length() - 1);
					//指定該路徑底下的所有資源 都要監聽
					if (servletPath.startsWith(sURL)) {
						login = true;
						break;
					}
				} else {
					//如果不是*結尾 表示完整路經精確比對才監聽
					if (servletPath.equals(sURL)) {
						login = true;
						break;
					}
				}
			}
			return login;
		}

		
		//檢測是否LoginOK為真 是表示已經登入
		private boolean checkLogin(HttpServletRequest request) {
			HttpSession session = request.getSession();
//			MemberVO loginToken = (MemberVO) session.getAttribute("LoginOK");
			Object loginToken = session.getAttribute("LoginOK");
			if (loginToken == null) {
				return false;
			} else {
				return true;
			}
		}

	
	
	public void init(FilterConfig fConfig) throws ServletException {
		//fConfig 
				Enumeration<String> e = fConfig.getInitParameterNames();
				//取剛剛在上面標籤的地方 所設定的filterConfig
				while (e.hasMoreElements()) {
					String name = e.nextElement();
					// 將fileConfig中每個value抓出存起來
					url.add(fConfig.getInitParameter(name));
				}
	}

}
