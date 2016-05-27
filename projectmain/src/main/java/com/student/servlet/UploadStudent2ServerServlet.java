package com.student.servlet;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UploadStudent2ServerServlet")
public class UploadStudent2ServerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UploadStudent2ServerServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String realPath = request.getSession().getServletContext().getRealPath("/");
		realPath+="\\test01.csv";

		/*
		try(BufferedReader in  = new BufferedReader(new InputStreamReader(request.getInputStream(),"UTF-8"));
			BufferedWriter out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(realPath),"UTF-8"))){
		 */
		try(BufferedReader in  = new BufferedReader(new InputStreamReader(request.getInputStream(),"UTF-8"));
				BufferedWriter out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(realPath)))){

		
		/*
			try(BufferedInputStream in  = new BufferedInputStream(request.getInputStream());
					BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(realPath))){
		 */
				String str;
				while((str=in.readLine())!=null){
					System.out.println(str);
					out.write(str);				
					out.newLine();
//					out.write("\n");
				}
					
					
					/*
				int str;
				byte [] buff = new byte[512];
				while((str=in.read(buff))!=-1){
					//System.out.println(str);
					out.write(buff,0,str);
				}
				
				
				
				
			*/
			
			
			
		} catch(Exception e){
			
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
