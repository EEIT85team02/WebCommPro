package Member_statusController;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member_status.model.Member_statusService;
import Member_status.model.Member_statusVO;


@WebServlet("/Status/ShowStatus.do")
public class ShowStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ShowStatus() {
        super();
       
    }


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("showstatus".equals(action)) {
			
			Member_statusService MscWAIT = new Member_statusService();
			List<Member_statusVO> statuslistWAIT = null;
			List<Member_statusVO> statuslistOK = null;
			List<Member_statusVO> statuslistNO = null;
			List<Member_statusVO> statuslistNEVER = null;
			List<Member_statusVO> statuslistYES  = null;
			List<Member_statusVO> statuslistWAITING = null;
//			try {
//				statuslistWAIT = MscWAIT.getStatusWAIT();
//				statuslistOK = MscWAIT.getStatusOK();
//				statuslistNO = MscWAIT.getStatusNO();
//				statuslistNEVER = MscWAIT.getStatusNEVER();
//				statuslistYES = MscWAIT.getStatusYES();
//				statuslistWAITING = MscWAIT.getStatusWAITING();
//			} catch (SQLException e) {
//				
//				e.printStackTrace();
//			}
	
			req.setAttribute("statuslistWAIT", statuslistWAIT);
			req.setAttribute("statuslistOK", statuslistOK);
			req.setAttribute("statuslistNO", statuslistNO);
			req.setAttribute("statuslistNEVER", statuslistNEVER);
			req.setAttribute("statuslistYES", statuslistYES);
			req.setAttribute("statuslistWAITING", statuslistWAITING);
			
			RequestDispatcher rd = req.getRequestDispatcher("/Status/showstatus.jsp");
			rd.forward(req, res);
		}
	}

}
