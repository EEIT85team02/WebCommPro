package com.student.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentVO;

/**
 * Servlet implementation class UploadOneServlet
 */
@WebServlet("/UploadOneServlet")
public class UploadOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UploadOneServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IStudentDAO dao = new StudentDAO();
		StudentVO studentVO = new StudentVO(); 
		studentVO.setStu_name("陳顥賢");
		System.out.println("1");
		studentVO.setStu_age(new Integer(76));
		System.out.println("2");
		studentVO.setStu_sex(new Integer(1));
		System.out.println("3");
		studentVO.setStu_sch("私立淡江大學經濟學系碩士");
		System.out.println("4");
		studentVO.setStu_group(new Integer(2));
		System.out.println("5");
		studentVO.setStu_seatno(new Integer(29));
		System.out.println("6");
		studentVO.setStu_email("pighouse7647@gmail.com");
		System.out.println("7");
		studentVO.setStu_pre(new Integer(0));
		System.out.println("8");
		studentVO.setStu_implement(new Double(0));
		System.out.println("9");
		studentVO.setStu_testtime(new java.util.Date(new java.util.Date().getTime()));
		studentVO.setStu_interview(new Double(0));
		System.out.println("10");
		studentVO.setStu_total(new Double(0));
		System.out.println("11");
		studentVO.setStu_workdate(new java.util.Date(new java.util.Date().getTime()));
		studentVO.setStu_except(new Double(32000.0));
		System.out.println("12");
		studentVO.setStu_final(new Integer(1));
//		studentVO.setStuNote();
		studentVO.setStu_note2("EEIT");
		System.out.println("13");
		
		
		
//		session.saveOrUpdate(studentVO);
		try {
			dao.insert(studentVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("15");
		
		
		System.out.println("commit之前");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		}

}
