package com.login.servlet;

import java.sql.SQLException;
import java.util.List;

import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentVO;



public class LoginService {
		IStudentDAO dao = new StudentDAO();
		
		public StudentVO checkIDPassword(String id, String password){
			
			try {
				List<StudentVO> vos;
				vos = dao.getAll();
				for(StudentVO vo:vos){
					if(vo.getStu_name().equals(id) && vo.getStu_email().equals(password)){
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
	}
