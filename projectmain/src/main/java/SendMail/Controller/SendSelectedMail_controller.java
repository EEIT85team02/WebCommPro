package SendMail.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;
import org.json.*;

import SendMail.model.SendMailService;
import Student.model.StudentVO;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;


@WebServlet("/SendMail/SendMail1.do")
public class SendSelectedMail_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SendSelectedMail_controller() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		this.doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8"); 
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		String json= req.getParameter("key");
		System.out.println("進controller的json"+json);
		
		
		JSONArray ja = new JSONArray(json);

		
		
		
		
		SendMailService smv =new SendMailService();
		smv.SendMailToStudent(ja);
		
//		String[] emailarray=new String[ja.length()];
//		String[] namearray=new String[ja.length()];
//		String[] mailtextarray=new String[ja.length()];
//	
//		
//		
//		
//		for(int i =0,max=ja.length();i<max;i++){
//			JSONObject jo=(JSONObject) ja.get(i);
//			String email=jo.getString("stu_email");
//			String stu_name=jo.getString("stu_name");
//			String mailText=jo.getString("mailText");
//			
//			emailarray[i]=email;
//			namearray[i]=stu_name;
//			mailtextarray[i]=mailText;
//			 
//			
//			}
//		for(int i =0,max=ja.length();i<max;i++){
//			
//			System.out.println("全部emailarray====="+emailarray[i]);	
//			System.out.println("全部namearray====="+namearray[i]);	
//		System.out.println("全部mailtextarray====="+mailtextarray[i]);	
//		}


	}

}
