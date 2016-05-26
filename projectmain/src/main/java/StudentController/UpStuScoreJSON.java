package StudentController;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.model.StudentService;

public class UpStuScoreJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpStuScoreJSON() {
        super();
        
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}


//	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		
//		req.setCharacterEncoding("UTF-8");
//		String action = req.getParameter("action");
//		
//		if ("getAllScore".equals(action)) {
//			
//				 StudentService stuSvc = new StudentService();
//				try {
//					String jsonString = stuSvc.getAllScoreJSON();
//				} catch (SQLException e) {
//					
//					e.printStackTrace();
//				}
//				
//			}
//		}
	}


