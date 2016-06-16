package com.login.servlet;

import java.sql.SQLException;
import java.util.List;



import Employee.model.EmployeeDAO;
import Employee.model.EmployeeVO;
import Employee.model.IEmployeeDAO;
import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentVO;



public class LoginService {
		IStudentDAO dao = new StudentDAO();
		IEmployeeDAO eDao = new EmployeeDAO();
		
		public StudentVO checkIDPassword(String id, String password){
			
			List<StudentVO> vos;
			vos = (List<StudentVO>) dao.getStudentByEmail(id);
			
			for(StudentVO vo:vos){
				System.out.println("password:" + password);
				System.out.println("id:" + id);
				System.out.println("vo.getStu_id():" + vo.getStu_id());
				System.out.println("vo.getStu_email():" + vo.getStu_email());
				System.out.println(vo.getStu_id().toString().equals(password));
				System.out.println(vo.getStu_email().equals(id));
				if(vo.getStu_id().toString().equals(password) && vo.getStu_email().equals(id)){
					System.out.println("---------------checkIDPassword-------------------");
					return vo;
				}
			}
			return null;
		}
		
		
		
		public StudentVO checkEmailGoogle(String email){
			StudentVO vo;
			vo = dao.getStudentByEmail(email);
			if(vo != null){
		
				if(vo.getStu_email().equals(email)){
					return vo;
			}
			return null;
			}
			return null;
		}
		
		public EmployeeVO checkEmailGoogleByEmp(String email){
			EmployeeVO vo;
			vo =  eDao.getEmployeeByEmail(email);
			if(vo != null){

				if(vo.getEmp_mail().equals(email)){
					
					return vo;
				
			}
			return null;
			}
			return null;
		}
	}
