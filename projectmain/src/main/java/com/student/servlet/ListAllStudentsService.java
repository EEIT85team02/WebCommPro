package com.student.servlet;

import java.sql.SQLException;
import java.util.List;

import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentVO;

import com.google.gson.Gson;

public class ListAllStudentsService {
	IStudentDAO dao;
	List<StudentVO> studentVOs;	
	Gson gson;
	// --1. 列出所有學生 回傳一堆學生
	public List<StudentVO> listAllStudents() throws SQLException{
		// 實體化DAO
		dao = new StudentDAO();
		// 取得所有 StudentVO
		studentVOs = dao.getAll();
		for(StudentVO studentVO:studentVOs){
//			studentVO.setCalendarVO(null);
		}
		return studentVOs;
	}
	
	
	
	
	
	// -- 2. 將多筆VO的屬性、屬性值給取出(Map) @傳入一堆學生	@回傳String 
	public String convertJsonFormat(List<StudentVO> voList){
		// 為了將所有資料從json 換成[]方式呈現
		String tempStr="[";	
		// 為了forEach 計數器
		int counter=0;		
		
		/**
		 * getAllAttributes()回傳的是Map<String 欄位名稱, Object 欄位值>
		 * 
		 */
		System.out.println("所有人員的成員變數共有:\t"+voList.get(0).getAllAttributes().keySet().size()+"個");
		System.out.println("所有人員的成員變數:\t"+voList.get(0).getAllAttributes().keySet().toString());
		
		// 取出所有學生的資料
		for(StudentVO oneVO:voList){
			counter++;
			System.out.println("第\t"+counter+"\t位人員的成員變數值:\t"+oneVO.getAllAttributes().values().toString());
			tempStr+=oneVO.getAllAttributes().values().toString();
			if(counter!=voList.size()){	// 只要不是最後一筆 都要多串上,
				tempStr+=",";
			}
		}
		System.out.println("一共有\t"+counter+"\t筆資料");
		return tempStr+"]";				// 最後一筆要串]
	}
}
