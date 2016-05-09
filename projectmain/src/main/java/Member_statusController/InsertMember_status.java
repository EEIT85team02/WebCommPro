package Member_statusController;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Member_status.model.IMember_statusDAO;
import Member_status.model.Member_status;
import Member_status.model.Member_statusDAO;


@WebServlet("/Member_status/InsertMember_status.do")
public class InsertMember_status extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertMember_status() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("OK1");
			IMember_statusDAO mem= new Member_statusDAO(); 
			System.out.println("Ok2");
			request.setCharacterEncoding("UTF-8");
			Integer sta_id = Integer.parseInt(request.getParameter("sta_id"));
			String sta_name = request.getParameter("sta_name");
			Member_status mem1= new Member_status();
			mem1.setSta_id(sta_id);
			mem1.setSta_name(sta_name);
			mem.insert(mem1);
			System.out.println("okokokok");
			
			RequestDispatcher rd = request.getRequestDispatcher("/Member_status/Member_statusformOK.jsp");
			rd.forward(request, response);
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		} 	
	}

}
