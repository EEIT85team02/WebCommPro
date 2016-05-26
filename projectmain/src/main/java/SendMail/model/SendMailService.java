package SendMail.model;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.json.JSONArray;
import org.json.JSONObject;

import Student.model.StudentDAO;

//這隻service主要功能是拿來寄信
public class SendMailService {

public void SendMailToStudent(JSONArray ja){

	//將輸入的 json陣列分門別類並new出空陣列
	String[] emailarray=new String[ja.length()];
	String[] namearray=new String[ja.length()];
	String[] mailtextarray=new String[ja.length()];

	
	
	//每個json物件代表一個學生，依序取出並分門別類到不同字串陣列中
	for(int i =0,max=ja.length();i<max;i++){
		JSONObject jo=(JSONObject) ja.get(i);
		String email=jo.getString("stu_email");
		String stu_name=jo.getString("stu_name");
		String mailText=jo.getString("mailText");
		
		emailarray[i]=email;
		namearray[i]=stu_name;
		mailtextarray[i]=mailText;
		 
		
		}
//	for(int i =0,max=ja.length();i<max;i++){
//		
//		System.out.println("全部emailarray====="+emailarray[i]);	
//		System.out.println("全部namearray====="+namearray[i]);	
//	System.out.println("全部mailtextarray====="+mailtextarray[i]);	
//	}	
	
	
	
	
	
	  String host = "smtp.gmail.com";
	  int port = 587;
	  

	  
	  final String username = "eeit85team02@gmail.com";//發信的帳號
	  final String password = "pw123456789";//your password

 
	  Properties props = new Properties();
	  props.put("mail.smtp.host", host);
	  props.put("mail.smtp.auth", "true");
	  props.put("mail.smtp.starttls.enable", "true");
	  props.put("mail.smtp.port", port);
	  Session session = Session.getInstance(props, new javax.mail.Authenticator() {
		    protected PasswordAuthentication getPasswordAuthentication() {
		        return new PasswordAuthentication(username, password);
		    }
		});

	  try {

	   Message message = new MimeMessage(session);
	   message.setFrom(new InternetAddress("eeit85team02@gmail.com"));
	   
	  for(int i=0,max=ja.length();i<max;i++){
	   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailarray[i]));//對方email
	   message.setSubject("測試寄信.");
	   message.setText("Dear "+namearray[i]+","+mailtextarray[i]);//內文

	   Transport transport = session.getTransport("smtp");
	   transport.connect(host, port, username, password);

	   Transport.send(message);

	   System.out.println(emailarray[i]+"寄送email結束.");
	  }
	  
	  } catch (MessagingException|RuntimeException e) {
		  throw new RuntimeException(e);
	  }
}

}