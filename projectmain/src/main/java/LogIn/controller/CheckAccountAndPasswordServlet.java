package LogIn.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SendMail.model.SendMailService;

/**
 * Servlet implementation class CheckAccountAndPassword_controller
 */
@WebServlet("/CheckAccountAndPasswordServlet")
public class CheckAccountAndPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckAccountAndPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("---------------------------CheckAccountAndPasswordServlet");
		
		String stu_email = request.getParameter("stu_email");
		System.out.println("stu_email----------"+stu_email);
		SendMailService.SendPasswordMailToStudent(stu_email);
		System.out.println("stu_email----------ok");
	}

}
