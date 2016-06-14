package SendMail.model;

import java.security.NoSuchAlgorithmException;



import com.google.api.client.util.Base64;

import Student.model.StudentDAO;
import Student.model.StudentVO;

public class DecryptService {
	public static byte[] decryptBase64String(String encryptedBase64String){
		byte[] decrytedBase64StringToByteArray=Base64.decodeBase64(encryptedBase64String);	
	
		return decrytedBase64StringToByteArray;
		
	}
	
	public static StudentVO compareIfMatchThePassword(String emailAccountInput,String passwordinput) throws NoSuchAlgorithmException{
		StudentDAO stdao = new StudentDAO();
		StudentVO stvo=stdao.getStudentByEmail(emailAccountInput);
		boolean match=true;
		
		byte[] DateBasebyteArray=stvo.getLog_pw();
		
		EncryptService es= new EncryptService();
		byte[] passwordinputTobyteArray=es.MD5Encrypt(passwordinput);
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
			return stvo;
		}else{
			return null;
		}
		
		
	}
	
	public static void main(String[] args) throws NoSuchAlgorithmException {
		System.out.println(compareIfMatchThePassword("eeit85team02@gmail.com","YRfFF_0wmUNnsbbHJj3dCw"));

	}

}
