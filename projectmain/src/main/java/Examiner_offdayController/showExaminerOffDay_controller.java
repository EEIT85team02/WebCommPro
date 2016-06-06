package Examiner_offdayController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import Examiner_offday.model.Examiner_offdayVO;
import Examiner_offday.model.SelectExamierOffdayInformationService;

/**
 * Servlet implementation class showExaminerOffDay_controller
 */
@WebServlet("/showExaminerOffDay_controller")
public class showExaminerOffDay_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showExaminerOffDay_controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		this.doPost(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("歡迎進入showExaminerOffDay_controller");
		HttpSession session=req.getSession();
		String emp_id=(String) session.getAttribute("emp_id");
		SelectExamierOffdayInformationService seoi= new SelectExamierOffdayInformationService();
		Examiner_offdayVO eo=seoi.SelectExamierVOByEmpId(emp_id);
		
	}

}
