package LogIn.model;

import java.security.NoSuchAlgorithmException;

import SendMail.model.EncryptService;
import Student.model.StudentDAO;
import Student.model.StudentVO;

public class SaveChangedPasswordService {
	public void SaveNewPasswordToDataBase(String password,String email) throws NoSuchAlgorithmException{
		EncryptService es =new EncryptService();
		byte[] st=es.MD5Encrypt(password);
		StudentDAO stdao = new StudentDAO();
		StudentVO stvo=stdao.getStudentByEmail(email);
		stvo.setLog_pw(st);
		stdao.update(stvo);
		
	}

		public void SaveRandomPasswordToDataBase(byte[] password,String email) throws NoSuchAlgorithmException{
			EncryptService es =new EncryptService();

			StudentDAO stdao = new StudentDAO();
			StudentVO stvo=stdao.getStudentByEmail(email);
			stvo.setLog_pw(password);
			stdao.update(stvo);
		}


}
