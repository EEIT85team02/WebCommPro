package SendMail.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import Mail_template.model.Mail_templateVO;
import Mail_template.model.Mail_templateDAO;
import Mail_template.model.Mail_templateService;
import Student.model.StudentVO;
import Student.model.StudentDAO;
import Student.model.StudentService;

@WebServlet("/SendMail/SelectStudentInformationNormalJSON_controller.do")
public class SelectStudentInformationNormalJSON_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       







	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	this.doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8"); 
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		String classId=req.getParameter("class");//從jsp傳入的classId
		String textNumber=req.getParameter("content");//從jsp傳入的樣板編號		
	
		   StudentService stSvc = new StudentService();

		    try {
		    	String jsonString=stSvc.getAllStudentInformationByClass(classId, textNumber);
				                    
				 System.out.println("jsonString in .do2======"+jsonString);
				 out.println(jsonString);//把json String丟到jsp 裡面有我那個班上所有的學生
	
				
//--------------------用setAttribute set 值然後用RequestDispatcher轉				
//				req.setAttribute("allstudent====", list);
//				req.setAttribute("textcontent=====", mailText);
//				RequestDispatcher failureView = req.getRequestDispatcher("/SendMail/SendMail.jsp");
//				failureView.forward(req, res);
			} catch (SQLException e) {

				e.printStackTrace();
			}
		
//		String contentNumber=req.getParameter("content");//從jsp傳入的classId樣板號碼
//		System.out.println("class="+classId);
		//StudentDAO st=new StudentDAO();//為了要從資料庫抓那個class所有名字的方法
//		Mail_templateDAO mt= new Mail_templateDAO();//為了抓資料庫樣板文字
//		String contentText=mt.findByPrimaryKey(Integer.parseInt(contentNumber)).getMail_text();//抓到文字
//		System.out.println(contentText);
//		
//		List<String> list =st.getAllNameByClass(classId);//抓到名字
//		System.out.println("name="+list);
		
		
		
	}

}