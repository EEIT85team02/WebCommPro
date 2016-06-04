package Controller;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/*@WebServlet("/LoginServlet")*/
public class LoginServletForwarded extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServletForwarded() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			Object LoginOK = request.getSession().getAttribute("LoginOK");
			System.out.println("LoginServletForwarded------"+LoginOK);
			if(LoginOK != null){
			RequestDispatcher successMsg = request.getRequestDispatcher("/WEB-INF/JSPs/User_Profile.jsp");
			successMsg.forward(request, response);
			}
	}	
}
