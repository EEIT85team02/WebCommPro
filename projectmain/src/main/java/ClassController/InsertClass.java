package ClassController;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Class.model.ClassDAO;
import Class.model.IClassDAO;
import Class.model.Class;


@WebServlet("/Class/InsertClass.do")
public class InsertClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public InsertClass() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("OK1");
			IClassDAO cla=new ClassDAO();
			System.out.println("Ok2");
			request.setCharacterEncoding("UTF-8");
			String class_id = request.getParameter("class_id");
			String class_name = request.getParameter("class_name");
			String class_contact = request.getParameter("class_contact");
			String class_teach = request.getParameter("class_teach");
			Integer edu_id = Integer.parseInt(request.getParameter("edu_id"));
			Class cla1=new Class();
			cla1.setClass_id(class_id);
			cla1.setClass_name(class_name);
			cla1.setClass_contact(class_contact);
			cla1.setClass_teach(class_teach);
			cla1.setEdu_id(edu_id);
			cla.insert(cla1);
			System.out.println("okokokok");
			
			RequestDispatcher rd = request.getRequestDispatcher("/Class/ClassformOK.jsp");
			rd.forward(request, response);
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		} 	
	}
}

