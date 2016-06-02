package Sign_listController;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import Sign_list.model.Sign_listService;



@WebServlet("/Sign_list/Sign_listToJSONInitTableServlet")
public class Sign_listToJSONInitTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Sign_listToJSONInitTableServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Sign_listService slSvc = new Sign_listService();
		try {
			String jsonString=slSvc.getAllSlToJSONInitTable();
			out.write(jsonString);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
