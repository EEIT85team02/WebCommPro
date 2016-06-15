package LogIn.model;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;

import SendMail.model.EncryptService;
import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentVO;

public class SaveChangedPasswordService {
	public void SaveNewPasswordToDataBase(String password,String email) throws NoSuchAlgorithmException{
		EncryptService es =new EncryptService();
		byte[] st=es.MD5Encrypt(password);
		StudentDAO stdao = new StudentDAO();
		StudentVO stvo=stdao.getStudentByEmail(email);
//		StudentVO stvo=stdao
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
		
		
		
public static void main(String args[]) throws NoSuchAlgorithmException{
			IStudentDAO dao = new StudentDAO();
			try {
				List<StudentVO> studentVOs = dao.getAll();
				for(StudentVO one:studentVOs){
					new SaveChangedPasswordService().SaveNewPasswordToDataBase("P@ssw0rd", one.getStu_email());
				}
				
				
//				new SaveChangedPasswordService().SaveNewPasswordToDataBase("P@ssw0rd", "pighouse764701@gmail.com");
				
				
			} catch (SQLException e) {
			}
			
	
}

}
