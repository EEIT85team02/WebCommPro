package Member_statusController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member_status.model.Member_statusService;

@WebServlet("/Status/ShowStatusJSON.do")
public class ShowStatusJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ShowStatusJSON() {
        super();
       
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setHeader("Access-Control-Allow-Origin", "*");
		res.setHeader("content-type", "text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
        PrintWriter out = res.getWriter();
        
		String action = req.getParameter("action");
		
		if("getShowStatus".equals(action)){
			Member_statusService memSvc = new Member_statusService();
			String jsonString;
			try {
				jsonString = memSvc.getStatusWAIT();
				out.write(jsonString);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
		}
	}

}
