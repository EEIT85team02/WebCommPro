package com.student.servlet;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DownloadStudent2desktopServlet")
public class DownloadStudent2desktopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DownloadStudent2desktopServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		response.setHeader("content-type", "text/x-csv;charset=UTF-8");
//		response.setContentType("application/force-download");
//		response.setHeader("Content-Disposition","attachment; filename=\"" + "test01.csv\"");//fileName);
//		response.setHeader("Content-type", "text/csv");
//		response.setContentType("application/msexcel");
//		response.setHeader("Content-disposition", "attachment; filename=\"export.xls\"");
//		response.setHeader("content-disposition","attachment");
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/csv");
		
//		response.setHeader("Cache-Control", "no-cache");
		
		
		
		String realPath = request.getSession().getServletContext().getRealPath("/");
		realPath+="\\test01.csv";
		/*
		 */
		try(BufferedReader in  = new BufferedReader(new InputStreamReader(new DataInputStream(new FileInputStream(new File(realPath)))));
//				BufferedWriter out = new BufferedWriter(new OutputStreamWriter(response.getOutputStream(),"UTF-8"))){
			PrintWriter out =new PrintWriter( new BufferedWriter(new OutputStreamWriter(response.getOutputStream(),"UTF-8")))){
		
		/*
			try(BufferedInputStream in  = new BufferedInputStream(request.getInputStream());
					BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(realPath))){
		 */
			
			/*
			String str;
			while((str=in.readLine())!=null){
				System.out.println(str);
				out.write(str);				
				out.newLine();
			}
			 */
		
		
			/*
			 */
			String str;
			while((str=in.readLine())!=null){
				System.out.println(str);
				out.print(str);				
				out.print("\n");
			}
			}
//			response.sendRedirect("http://localhost:8080/Hibernate01/test01.csv");
			
		}
		
		
		
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
