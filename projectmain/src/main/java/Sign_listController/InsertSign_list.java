package Sign_listController;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Sign_list.model.ISign_listDAO;
import Sign_list.model.Sign_list;
import Sign_list.model.Sign_listDAO;


@WebServlet("/Sign_list/InsertSign_list.do")
public class InsertSign_list extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public InsertSign_list() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("OK1");
			ISign_listDAO sig= new Sign_listDAO(); 
			System.out.println("Ok2");
			request.setCharacterEncoding("UTF-8");
			Integer sl_id = Integer.parseInt(request.getParameter("sl_id"));
			String sl_name = request.getParameter("sl_name");

			Sign_list sig1= new Sign_list();
			sig1.setSl_id(sl_id);
			sig1.setSl_name(sl_name);

			sig.insert(sig1);
			System.out.println("okokokok");
			
			RequestDispatcher rd = request.getRequestDispatcher("/Sign_list/Sign_listformOK.jsp");
			rd.forward(request, response);
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		} 	
	}

}
