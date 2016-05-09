package Mail_templateController;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mail_template.model.IMail_templateDAO;
import Mail_template.model.Mail_template;
import Mail_template.model.Mail_templateDAO;


@WebServlet("/Mail_template/InsertMail_template.do")
public class InsertMail_template extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertMail_template() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("OK1");
			IMail_templateDAO mai= new Mail_templateDAO(); 
			System.out.println("Ok2");
			request.setCharacterEncoding("UTF-8");
			String mail_name = request.getParameter("mail_name");
			String mail_text = request.getParameter("mail_text");
			Mail_template mai1= new Mail_template();
			mai1.setMail_name(mail_name);
			mai1.setMail_text(mail_text);
			mai.insert(mai1);
			System.out.println("okokokok");
			
			RequestDispatcher rd = request.getRequestDispatcher("/Mail_template/Mail_templateformOK.jsp");
			rd.forward(request, response);
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		} 	
	}

}
