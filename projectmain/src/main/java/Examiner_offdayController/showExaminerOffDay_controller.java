package Examiner_offdayController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import Examiner_offday.model.ExamierVoToDatatableJSONService;
import Examiner_offday.model.Examiner_offdayVO;


/**
 * Servlet implementation class showExaminerOffDay_controller
 */
@WebServlet("/Examiner_offday/showExaminerOffDay_controller.do")
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
		req.setCharacterEncoding("UTF-8"); 
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		System.out.println("歡迎進入showExaminerOffDay_controller");

		String emp_id=req.getParameter("emp_id");
		ExamierVoToDatatableJSONService evtdj= new ExamierVoToDatatableJSONService();
		String JSONString=evtdj.getDatatableJSON(emp_id);
		out.print(JSONString);
		
	}

}
