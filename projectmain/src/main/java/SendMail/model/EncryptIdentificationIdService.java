package SendMail.model;


    import java.security.MessageDigest;  
import java.security.NoSuchAlgorithmException;  
import java.sql.SQLException;
import java.util.List;

import Stu_additional.model.IStu_additionalDAO;
import Stu_additional.model.Stu_additionalDAO;
import Stu_additional.model.Stu_additionalVO;
import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentVO;

public class EncryptIdentificationIdService{
	
	   //這是將字串轉為編碼的方法
       public byte[] Encrypt(String info) throws NoSuchAlgorithmException{  
           // 根據 MD5 演算法生成 MessageDigest 物件  
           MessageDigest md5 = MessageDigest.getInstance("MD5");  
           byte[] srcBytes = info.getBytes();  
           // 使用 srcBytes 更新摘要  \
           md5.update(srcBytes);
           
           // 完成哈希計算，得到 result  
           byte[] resultBytes = md5.digest();  
           return resultBytes;  

       }  
       //這是給我班級名稱然後我可以存入
       	public void insertLogpwInInAdditionStudentTable(String class_id) throws SQLException, NoSuchAlgorithmException{
       		//new 一個自己的class
     	   EncryptIdentificationIdService md5 = new EncryptIdentificationIdService();
     	   //為了使用getAllStudentByClass方法，new一個StudentDAO物件
     	   IStudentDAO stu = new StudentDAO();
     	   //輸入classid抓出此班級之所有學生
     	   List<StudentVO> stuList=stu.getAllStudentByClass(class_id);
     	   
     	   IStu_additionalDAO stuaddi = new Stu_additionalDAO();
     	   
     	   //List<StudentVO> stulist=stu.getAll();
     	   for(int i =0,max=stuList.size();i<max;i++){
     	   String stuId=stuList.get(i).getStu_id();//將選擇的student抓出stu_id
     	   System.out.println("stuId========"+stuId);
     	   byte[] resultBytes = md5.Encrypt(stuId); //將stu_id 轉成 MD5的編碼 
     	   System.out.println("編碼後========"+resultBytes);
//     	   Stu_additionalVO stuaddiVO=stuaddi.findByPrimaryKey(stuId);//依照stu_id抓相應的VO
//     	   stuaddiVO.setLog_pw(resultBytes);//將二位元資料存入VO
     	       	   
     	   
       	}
       
//          	public void insertLogpwInInAdditionStudentTable(String class_id) throws SQLException, NoSuchAlgorithmException{
//           		//new 一個自己的class
//         	   EncryptIdentificationIdService md5 = new EncryptIdentificationIdService();
//         	   //為了使用getAllStudentByClass方法，new一個StudentDAO物件
//         	   IStudentDAO stu = new StudentDAO();
//         	   //輸入classid抓出此班級之所有學生
//         	   List<StudentVO> stuList=stu.getAllStudentByClass(class_id);
//         	   
//         	   IStu_additionalDAO stuaddi = new Stu_additionalDAO();
//         	   
//         	   //List<StudentVO> stulist=stu.getAll();
//         	   for(int i =0,max=stuList.size();i<max;i++){
//         	   String stuId=stuList.get(i).getStu_id();//將選擇的student抓出stu_id-------------------------預備要放入inadditionalStudent的stu_id的欄位（一對一）
//         	   System.out.println("stuId========"+stuId);
//         	   byte[] resultBytes = md5.Encrypt(stuId); //將stu_id 轉成 MD5的編碼 
//         	   System.out.println("編碼後========"+resultBytes);
////         	   Stu_additionalVO stuaddiVO=stuaddi.findByPrimaryKey(stuId);//依照stu_id抓相應的VO
////         	   stuaddiVO.setLog_pw(resultBytes);//將二位元資料存入VO
//         	       	   
//         	   
//           	}      
       
//       public static void main(String args[]) throws  NoSuchAlgorithmException, SQLException{  
//    	   EncryptIdentificationIdService md5 = new EncryptIdentificationIdService();  
//    	   IStudentDAO stu = new StudentDAO();
//    	   List<StudentVO> stuList=stu.getAllStudentByClass(class_id);//輸入classid抓出所有學生
//    	   
//    	   IStu_additionalDAO stuaddi = new Stu_additionalDAO();
//    	   
//    	   //List<StudentVO> stulist=stu.getAll();
//    	   for(int i =0,max=stuList.size();i<max;i++){
//    	   String stuId=stuList.get(i).getStu_id();//將選擇的student抓出stu_id
//    	   System.out.println("stuId========"+stuId);
//    	   byte[] resultBytes = md5.Encrypt(stuId); //將stu_id 轉成 MD5的編碼 
//    	   System.out.println("編碼後========"+resultBytes);
//    	   Stu_additionalVO stuaddiVO=stuaddi.findByPrimaryKey(stuId);//依照stu_id抓相應的VO
//    	   stuaddiVO.setLog_pw(resultBytes);//將二位元資料存入VO
//    	   
//    	   }

       } 

        
      
} 

