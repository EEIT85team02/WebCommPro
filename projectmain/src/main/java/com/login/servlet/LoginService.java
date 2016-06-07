package com.login.servlet;

import java.sql.SQLException;
import java.util.List;

import org.apache.catalina.connector.Request;

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
			
			try {
				List<StudentVO> vos;
				vos = dao.getAll();
				
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
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		
		
		
		public StudentVO checkEmailGoogle(String email){
			try {
				List<StudentVO> vos;
				vos = dao.getAll();
				for(StudentVO vo:vos){
					if(vo.getStu_email().equals(email)){
						return vo;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			return null;
		}
		
		public EmployeeVO checkEmailGoogleByEmp(String email){
			try {
				List<EmployeeVO> vos;
				vos = eDao.getAllEmp();
				for(EmployeeVO vo:vos){
					if(vo.getEmp_mail().equals(email)){
						
						return vo;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			return null;
		}
	}
