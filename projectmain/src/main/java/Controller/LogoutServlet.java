package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //request.getRequestDispatcher("/WEB-INF/JSPs/User_Profile.jsp").include(request, response);  
		System.out.println("LogoutServlet1-----------"+request.getSession()); 
		System.out.println("LogoutServlet2-----------"+request.getSession().getAttribute("LoginOK")); 
		request.getSession().removeAttribute("LoginOK");
	    request.getSession().invalidate();
	    System.out.println("LogoutServlet3-----------"+request.getSession().getAttribute("LoginOK")); 
		 //HttpSession session=request.getSession();  
	     //session.invalidate();  
	 	//response.sendRedirect("WebComm_index.jsp");
	 	  //session=request.getSession(false);  
	 //	 System.out.println("LogoutServlet4-----------"+request.getSession()); 
       
	 	if(request.getSession().getAttribute("LoginOK")==null){
	
        	response.sendRedirect("WebComm_index.jsp");  
        	System.out.println("End---------------------------LogoutServlet");

        }  

    }  
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
