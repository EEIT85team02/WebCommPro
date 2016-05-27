package com.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.model.StudentVO;

import com.google.gson.Gson;

@WebServlet("/ListAllStudents.do")
public class ListAllStudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    List<StudentVO> studentVO;   
    Gson gson;
	
	
    public ListAllStudentsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
	/*
		gson = new GsonBuilder().setExclusionStrategies(
				new ExclusionStrategy() {

					@Override
					public boolean shouldSkipField(FieldAttributes f) {
						return false;
					}

					@Override
					public boolean shouldSkipClass(Class<?> clazz) {

						return (clazz == CalendarVO.class);
					}

				})
				.setPrettyPrinting()
				.serializeNulls()
				.create();
		// 告訴Gson 我們要的格式 必須配合 Hibernate的ORM技術
		// String half = gson.toJson(new ListAllStudentsService().listAllStudents());
		 
	*/
		
		/**
		 * 	-- 1.取得服務
		 */
		ListAllStudentsService service = new ListAllStudentsService();
		
		/**
		 * 	-- 2.取得所有學生的VO
		 */
		List<StudentVO> allStudents = null;
		try {
			allStudents = service.listAllStudents();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/**
		 *  -- 3.將所有學生的VO轉為json格式
		 */
		String allStudentsStr = new ListAllStudentsService().convertJsonFormat(allStudents);
		
		/**
		 *  -- 4.改用串接小英雄省個記憶體
		 */
//		String half="";	
		StringBuffer half = new StringBuffer(); 
		// 串上人數
		half.append("{\"recordsTotal\":"  + allStudents.size()+",");	//	串上總共筆數
		half.append("\"recordsFiltered\":" + allStudents.size()+",");	//	串上找到的筆數
		half.append("\"data\":"+allStudentsStr+"}");					//	串上資料本身
//		half = "{\"data\":"+half+"}";
		
		
		/**
		 *  -- 5.寫出去給前端
		 */
		out.write(half.toString());
		/*
		 *	請參考: https://datatables.net/examples/ajax/objects.html 
		 */
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
	}

}
