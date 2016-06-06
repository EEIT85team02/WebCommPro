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
		System.out.println("LogoutServlet-----------"+request.getSession()); 
      
	    request.getSession().invalidate();
	
		 //HttpSession session=request.getSession();  
	     //session.invalidate();  
	 	//response.sendRedirect("WebComm_index.jsp");
	 	  //session=request.getSession(false);  
	 	 System.out.println("LogoutServlet-----------"+request.getSession()); 
       
        	
        	response.sendRedirect("01_login/Logout.jsp");  
       /* 	if(session == null){ 
        }  */

    }  
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
