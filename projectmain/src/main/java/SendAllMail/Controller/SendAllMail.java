package SendAllMail.Controller;

import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import Student.model.StudentDAO;

public class SendAllMail {
 public static void main(String args[]) {
  String host = "smtp.gmail.com";
  int port = 587;


  
  final String username = "eeit85team02@gmail.com";//發信的帳號
  final String password = "pw123456789";//your password
  StudentDAO stdao = new StudentDAO(); 
  List<String> gmailList=stdao.getAllGmail();
  List<String> nonGmailList=stdao.getAllNonGmail(); 
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
  for(int i=0,max=gmailList.size();i<max;i++){
   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(gmailList.get(0)));//對方email
   message.setSubject("測試寄信.");
   message.setText("Dear Levin, \n\n 測試 測試 測試 測試 測試 測試 email !");//內文

   Transport transport = session.getTransport("smtp");
   transport.connect(host, port, username, password);

   Transport.send(message);

   System.out.println("gmail寄送email結束.");
  }
  for(int i=0,max=nonGmailList.size();i<max;i++){
	   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(nonGmailList.get(i)));//對方email
	   message.setSubject("測試寄信.");
	   message.setText("Dear Levin, \n\n 測試 測試 測試 測試 測試 測試 email !");//內文

	   Transport transport = session.getTransport("smtp");
	   transport.connect(host, port, username, password);

	   Transport.send(message);

	   System.out.println("nongmail寄送email結束.");
	  }
  } catch (MessagingException|RuntimeException e) {
	  throw new RuntimeException(e);
  }
 
 
}
// private void sendMail(List list){
//	 
//	 try{
//		 Message message = new MimeMessage(session);
//		 message.setFrom(new InternetAddress("eeit85team02@gmail.com"));
//		 for(int i=0,max=list.size();i<max;i++){
//			 message.setRecipients(Message.RecipientType.TO, InternetAddress.parse((String) list.get(i)));//對方email
//			 message.setSubject("測試寄信.");
//			 message.setText("Dear Levin, \n\n 測試 測試 測試 測試 測試 測試 email !");//內文
//			 
//			 Transport transport = session.getTransport("smtp");
//			 transport.connect(host, port, username, password);
//			 
//			 Transport.send(message);
//			 
//			 System.out.println(list.get(i)+"寄送email結束.");
//		 }
//	 } catch (MessagingException|RuntimeException e) {
//		 throw new RuntimeException(e);
//	 }
// }
}
