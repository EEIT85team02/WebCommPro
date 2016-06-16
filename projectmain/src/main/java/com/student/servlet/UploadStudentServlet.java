package com.student.servlet;

import java.io.File;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileIO.util.FileIOUtil;
import SendMail.model.InsertLogpwAndSendMailService;
import Stu_additional.model.Stu_additionalService;
import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentVO;


@WebServlet("/UploadStudentServlet")
public class UploadStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UploadStudentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<StudentVO> studentRowVO = new ArrayList<StudentVO>();
		FileIOUtil io = new FileIOUtil();
		IStudentDAO studao = new StudentDAO();
		
//		boolean isreading = true;
//		while(isreading){
//			
//			 isreading =!( io.uploadCSV(""));
//			return;
//		};
		File file = new File(getServletContext().getRealPath("/"));
		studentRowVO = io.uploadCSV(file);
		
		/*		
		System.out.println("一共有\n【"+studentRowVO.size()+"】\n筆資料 需要匯入");
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuName().toString());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuAge());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuGender());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuTeam());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuSeatNo());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuEmail());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuIsExamPC());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuScorePC());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuDatePC());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuScoreIn());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuScoreSum());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuDateHire());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuSalary());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuFinalR());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuNote());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuMajor());
		System.out.println("~~~~~~~"+studentRowVO.get(0).getStuSession());
		studao.insert(studentRowVO.get(0));
	
		
 */
		for(StudentVO onestu:studentRowVO){
			System.out.println("xxx");
			try {
				studao.insert(onestu);
//				String serverName=request.getServerName();
//				int ServerPort=request.getServerPort();
//				String contextPath=request.getContextPath();
//				String path=serverName+":"+ServerPort+contextPath;
//				InsertLogpwAndSendMailService ILSendMail = new InsertLogpwAndSendMailService();
//				ILSendMail.insertKeysCiphertextAndSendMail(onestu.getClassVO().getClass_id(),"localhost:8080/projectmain");
//				insertKeysCiphertextAndSendMail("EEIT85","localhost:8080/projectmain");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
//			} catch (InvalidKeyException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (NoSuchAlgorithmException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (NoSuchPaddingException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IllegalBlockSizeException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (BadPaddingException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
