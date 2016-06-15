package SendMail.model;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import Student.model.StudentVO;

public class InsertLogpwAndSendMailService {
	
	
	public static void insertKeysCiphertextAndSendMail(String inputClassId,String path) throws NoSuchAlgorithmException, SQLException, InvalidKeyException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException{
//		請將這幾句程式加入servlet中
//		String serverName=req.getServerName();
//		int ServerPort=req.getServerPort();
//		String contextPath=req.getContextPath();
//		String path=serverName+":"+ServerPort+contextPath;

		
		
		EncryptIdentificationIdService ls=new EncryptIdentificationIdService();
		//輸入班級呼叫insertLogpwAndReturnAllStudentVO方法 ，方法裡會產生一組密碼存入資料庫
		//並把此班級的學生用StudentVO一筆一筆裝入陣列傳回來
		
		
		StudentVO[] st=ls.insertPubkeyPrivateKeyTextAndReturnAllStudentVO(inputClassId);
	
		String[] emailStringArray=new String[st.length];		
		String[] nameStringArray=new String[st.length];
		byte[][] publickeyArray=new byte[st.length][];
		byte[][] privatekeyArray=new byte[st.length][];
		byte[][] ciphertextArray=new byte[st.length][];
	
	
	
		//將tudentVO裡的學員名字,email和欲傳出的密碼分類放入陣列
		for(int i =0,max=st.length;i<max;i++){
			
			emailStringArray[i]=st[i].getStu_email();
			nameStringArray[i]=st[i].getStu_name();
			publickeyArray[i]=st[i].getPub_key();
			privatekeyArray[i]=st[i].getPri_key();
			ciphertextArray[i]=st[i].getCipher_text();
			
			
		}
		//將送信所需的資料pass給送信的方法
		SendMailService sms=new SendMailService();
		sms.SendlinkMailToStudent(emailStringArray, nameStringArray,publickeyArray,privatekeyArray,ciphertextArray,inputClassId,path);
		
	}


	
	
	
	
	
	

	public static void main(String[] args) throws NoSuchAlgorithmException, SQLException, InvalidKeyException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException {
		insertKeysCiphertextAndSendMail("EEIT85","localhost:8080/projectmain");
		
		
		//			EncryptIdentificationIdService ls=new EncryptIdentificationIdService();
			//輸入班級呼叫insertLogpwAndReturnAllStudentVO方法 ，方法裡會產生一組密碼存入資料庫
			//並把此班級的學生用StudentVO一筆一筆裝入陣列傳回來
//			String classId="EEIT85";
//			StudentVO[] st=ls.insertPubkeyPrivateKeyTextAndReturnAllStudentVO(classId);
//			
//			String[] emailStringArray=new String[st.length];		
//			String[] nameStringArray=new String[st.length];
//			byte[][] publickeyArray=new byte[st.length][];
//			byte[][] privatekeyArray=new byte[st.length][];
//			byte[][] ciphertextArray=new byte[st.length][];
//		
		
		
			//將tudentVO裡的學員名字,email和欲傳出的密碼分類放入陣列
//			for(int i =0,max=st.length;i<max;i++){
//				
//				emailStringArray[i]=st[i].getStu_email();
//				nameStringArray[i]=st[i].getStu_name();
//				publickeyArray[i]=st[i].getPub_key();
//				privatekeyArray[i]=st[i].getPri_key();
//				ciphertextArray[i]=st[i].getCipher_text();
//				
//				
//			}
//			SendMailService sms=new SendMailService();
//			sms.SendlinkMailToStudent(emailStringArray, nameStringArray,publickeyArray,privatekeyArray,ciphertextArray,classId);
//			
		}

	

}
