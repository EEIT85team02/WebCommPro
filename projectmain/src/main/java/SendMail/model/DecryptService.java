package SendMail.model;

import Student.model.StudentDAO;
import Student.model.StudentVO;

public class DecryptService {
	public static byte[] decryptBase64String(String encryptedBase64String){
		byte[] decrytedBase64StringToByteArray=org.apache.tomcat.util.codec.binary.Base64.decodeBase64(encryptedBase64String);	
	
		return decrytedBase64StringToByteArray;
		
	}
	
	public static boolean compareIfMatchThePassword(String emailAccountInput,String passwordinput){
		StudentDAO stdao = new StudentDAO();
		StudentVO stvo=stdao.getStudentByEmail(emailAccountInput);
		boolean match=true;
		
		byte[] DateBasebyteArray=stvo.getLog_pw();
		
		byte[] passwordinputTobyteArray=decryptBase64String(passwordinput);
		for(int i =0,max=passwordinputTobyteArray.length;i<max;i++){
			System.out.println(DateBasebyteArray[i]);
			System.out.println(passwordinputTobyteArray[i]);
			if(DateBasebyteArray[i]==passwordinputTobyteArray[i]){
				System.out.println("match");
			}else{
				System.out.println("no match");
				match=false;
			}
		}
		if(match==true){
			return true;
		}else{
			return false;
		}
		
		
	}
	
	public static void main(String[] args) {
		System.out.println(compareIfMatchThePassword("llluuuyyy123@gmail.com","CHxuejI-b0FbvWto7E7vAg"));

	}

}
