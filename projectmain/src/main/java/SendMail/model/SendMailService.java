package SendMail.model;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.json.JSONArray;
import org.json.JSONObject;

import sun.misc.BASE64Encoder;
import LogIn.model.SaveChangedPasswordService;
import SendMail.Controller.Verification_controller;
import Student.model.StudentDAO;
import Student.model.StudentVO;

//這隻service主要功能是拿來寄信
public class SendMailService {

	

	
	
	
public void SendMailToStudent(JSONArray ja) throws UnsupportedEncodingException{

	//將輸入的 json陣列分門別類並new出空陣列
	String[] emailarray=new String[ja.length()];
	String[] namearray=new String[ja.length()];
	String[] mailtextarray=new String[ja.length()];


	
	
	//每個json物件代表一個學生，依序取出並分門別類到不同字串陣列中
	for(int i =0,max=ja.length();i<max;i++){
		JSONObject jo=(JSONObject) ja.get(i);
		String email=jo.getString("stu_email");
		String stu_name=jo.getString("stu_name");
		String mail_name=jo.getString("mail_name");
		
		emailarray[i]=email;
		namearray[i]=stu_name;
		mailtextarray[i]=mail_name;
		 
		
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
		  System.setProperty("mail.mime.charset","UTF-8");
	   Message message = new MimeMessage(session);
	   message.setFrom(new InternetAddress("eeit85team02@gmail.com"));
	   
	  for(int i=0,max=ja.length();i<max;i++){
	   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailarray[i]));//對方email
	   
	   message.setContent(mailtextarray[i], "text/html;charset=UTF8");

	   message.setSubject(MimeUtility.encodeText("Hello你好","UTF-8","B"));
	   message.setContent("Dear "+namearray[i]+","+mailtextarray[i],"text/html;charset=UTF-8");//內文

	   Transport transport = session.getTransport("smtp");
	   transport.connect(host, port, username, password);

	   Transport.send(message);

	   System.out.println(emailarray[i]+"寄送email結束.");
	  }
	  
	  } catch (MessagingException|RuntimeException e) {
		  throw new RuntimeException(e);
	  }
}

public void SendlinkMailToStudent(String[] emailStringArray,String[]  nameStringArray,byte[][] publickeyArray,byte[][] privatekeyArray,byte[][] ciphertextArray,String classId,String path) throws NoSuchAlgorithmException{
  	 

	  String host = "smtp.gmail.com";
	  int port = 587;
	  
	  
	  
	  final String username = "eeit85team02@gmail.com";//發信的帳號
	  final String password = "pw123456789";//your password
	  
	  EncryptService es =new EncryptService();
	  
	  
 
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
	   
	  for(int i=0,max=nameStringArray.length;i<max;i++){
		  String ramdonString=es.GenerateRandomString();
		  byte[] encodedByteArray=es.MD5Encrypt(ramdonString);
		  SaveChangedPasswordService scp =new SaveChangedPasswordService(); 
		  scp.SaveRandomPasswordToDataBase(encodedByteArray,emailStringArray[i]);
		  EncryptService ess=new EncryptService();
		  String encodedByteArrayToString=ess.Base64Encrypt(encodedByteArray);
		  
	   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailStringArray[i]));//對方email
	   message.setSubject("測試寄信.");

	   String a=ess.Base64Encrypt(ciphertextArray[i]); 
	   //String a=new BASE64Encoder().encode(ciphertextArray[i],);

	   
	   
	   

	   message.setText("Dear "+nameStringArray[i]);
	   message.setText("Dear"+nameStringArray[i]+"\n"+"請由下列的網址直接登錄並預約考試時間\n"+"http://"+path+"/Verification_controller?key="+a+"&email="+emailStringArray[i]+"\n如果你擁有Google帳號可以用google方式登錄，或是用我們提供的密碼做登錄"+"\n這是你的登錄密碼"+encodedByteArrayToString);//內文

	   Transport transport = session.getTransport("smtp");
	   transport.connect(host, port, username, password);
	   
	   Transport.send(message);

	   
	   System.out.println(nameStringArray[i]+"寄送email結束."+"此人密碼編碼"+ a);
	  }
	  
	  } catch (MessagingException|RuntimeException e) {
		  throw new RuntimeException(e);
	  }
}

public  void SendConfirmMailToStudent(String emailString,String nameString,Timestamp stu_applytime){
 	 
   
	  String host = "smtp.gmail.com";
	  int port = 587;
	  
	  SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日 h:mm a");

	  
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
	   

		  
	   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailString));//對方email
	   message.setSubject("恭喜你成功預約偉康考試");
	   
	 

	   message.setText("Dear "+nameString+"\n");
	   message.setText("你的預約日期是"+"時段是"+sdf.format(stu_applytime));//內文


	   Transport transport = session.getTransport("smtp");
	   transport.connect(host, port, username, password);
	   
	   Transport.send(message);

	   

	  
	  } catch (MessagingException|RuntimeException e) {
		  throw new RuntimeException(e);
	  }
}



public static  void SendPasswordMailToStudent(String emailString,String path){
	 
	StudentDAO stdao=new StudentDAO();
	StudentVO stuvo=stdao.getStudentByEmail(emailString);
	String nameString=stuvo.getStu_name();

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
	   

		  
	   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailString));//對方email
	   message.setSubject("更改你的密碼");
	   
	 
	   message.setText("Dear "+nameString+"<br/>");

	   message.setText("請登入以下網址更改你的密碼"+"http://"+path+"/LogIn/retypePassword.jsp?stu_email="+emailString);//內文

	   Transport transport = session.getTransport("smtp");
	   transport.connect(host, port, username, password);
	   
	   Transport.send(message);

	   

	   System.out.println(emailString+"寄送email結束.");	  
	  } catch (MessagingException e) {
		  throw new RuntimeException(e);
	  }
}

public  void replyMessageBoardToStudent(String emailString,String nameString,String context){
	 
	   
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
	   

		  
	   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailString));//對方email
	   message.setSubject("您的回覆留言已經被回覆");
	   
	 

	   message.setText("Dear "+nameString+"\n");
	   message.setText(context);//內文


	   Transport transport = session.getTransport("smtp");
	   transport.connect(host, port, username, password);
	   
	   Transport.send(message);

	   

	  
	  } catch (MessagingException|RuntimeException e) {
		  throw new RuntimeException(e);
	  }
}





}
