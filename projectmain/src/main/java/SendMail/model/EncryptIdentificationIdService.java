package SendMail.model;


    import java.io.IOException;
import java.lang.reflect.Array;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.Signature;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import com.sun.org.apache.xml.internal.security.utils.Base64;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
import Class.model.ClassVO;
import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentVO;

public class EncryptIdentificationIdService{
	
	   //這是將字串轉為編碼的方法
       /**
     * @param class_id
     * @return
     * @throws NoSuchAlgorithmException
     * @throws NoSuchPaddingException
     * @throws InvalidKeyException
     * @throws IllegalBlockSizeException
     * @throws BadPaddingException
     * @throws SQLException
     */
    public StudentVO[] insertPubkeyPrivateKeyTextAndReturnAllStudentVO(String class_id) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException, SQLException{  
    	   //為了使用getAllStudentByClass方法，new一個StudentDAO物件
    	   IStudentDAO stu = new StudentDAO();
    	   //輸入classid抓出此班級之所有學生
    	   List<StudentVO> stuList=stu.getAllStudentByClass(class_id);
    	   StudentVO[] studentvoArray =new StudentVO[stuList.size()];
    	   
    	   
    	   //List<StudentVO> stulist=stu.getAll();
    	   for(int i =0,max=stuList.size();i<max;i++){
    		   //將抓出來的StudentVO中的資訊一個一個抓出來
    		   Integer stuId=stuList.get(i).getStu_id();
    		   String stu_email=stuList.get(i).getStu_email();   	   
    		   Integer stu_final=stuList.get(i).getStu_final();       	   
    		   String stu_name=stuList.get(i).getStu_name();
    		   String stu_note1=stuList.get(i).getStu_note1();         	   
    		   String stu_note2=stuList.get(i).getStu_note2();        	   
    		   Integer stu_pre=stuList.get(i).getStu_pre();
    		   String stu_sch=stuList.get(i).getStu_sch();
    		   Integer stu_sex=stuList.get(i).getStu_sex();         	   
    		   Timestamp stu_testtime=stuList.get(i).getStu_testtime();         	   
    		   Integer stu_age=stuList.get(i).getStu_age();
    		   Double stu_except=stuList.get(i).getStu_except();
    		   int stu_group=stuList.get(i).getStu_group();
    		   double stu_implement=stuList.get(i).getStu_implement();
    		   double stu_interview=stuList.get(i).getStu_interview();
    		   double stu_total=stuList.get(i).getStu_total();
    		   Timestamp stu_workdate=stuList.get(i).getStu_workdate();
    		   Integer stu_seatno =stuList.get(i).getStu_seatno();
    		   String class_id1 =stuList.get(i).getClassVO().getClass_id();
    		   byte[] log_pw=stuList.get(i).getLog_pw();
//			MD5無法解碼，單向，
//           // 根據 MD5 演算法生成 MessageDigest 物件  
//           MessageDigest md5 = MessageDigest.getInstance("MD5");  
//           byte[] srcBytes = info.getBytes();  
//           // 使用 srcBytes 更新摘要  \
//           md5.update(srcBytes);
//           
//           // 完成哈希計算，得到 result  
//           byte[] resultBytes = md5.digest();  
//           return resultBytes;
    	   
    		 String plainText = stuId.toString();
    		 System.out.println("plainText==="+plainText);
    		    //創建兩隻鑰匙  
    		    KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("rsa");  
    		    keyPairGenerator.initialize(512);
    		    KeyPair keyPair = keyPairGenerator.generateKeyPair();  
    		    //從keypair中拿到公鑰和私鑰
    		    PublicKey publicKey= keyPair.getPublic();  
    		    PrivateKey privateKey = keyPair.getPrivate();  
    		    System.out.println("PublicKey===="+publicKey);
    		    System.out.println("privateKey===="+privateKey);
    		    
    		    //伺服器的數據使用公鑰加密  
    		    Cipher cipher = Cipher.getInstance("rsa");  
    		    SecureRandom random = new SecureRandom();  
    		      
    		    cipher.init(Cipher.ENCRYPT_MODE, publicKey, random);  
    		    byte[] cipherData = cipher.doFinal(plainText.getBytes()); 
    		    
    		    for(int k=0,max2=cipherData.length;k<max2;k++){
    		    System.out.print(cipherData[k]);
    		    }
    		    System.out.println();
    		    System.out.println("cipherText : " + new BASE64Encoder().encode(cipherData));  
    		    System.out.println("cipherText byte[] : " + cipherData);  
 
    		    //存publickey進資料庫
    		    X509EncodedKeySpec x509ks = new X509EncodedKeySpec(
    		           publicKey.getEncoded());
    		    System.out.println("x509ks==="+x509ks);
    		    	byte[] publicKeyEncrpty=x509ks.getEncoded();
    		    	System.out.println("publicKeyEncrpty==="+publicKeyEncrpty);

    		    //存privatekey進資料庫	
    		    PKCS8EncodedKeySpec pkcsKeySpec = new PKCS8EncodedKeySpec(
    		                privateKey.getEncoded());
    		    	byte[] privatekeyEncrpty=pkcsKeySpec.getEncoded();
    		    	System.out.println("privatekeyEncrpty==="+privatekeyEncrpty);
    		    	
    	         	   

    	         	       	   
    	         	   
    	       		StudentVO slVO = new StudentVO();
    	       		slVO.setStu_id(stuId);
    	       		slVO.setStu_email(stu_email);
    	       		slVO.setStu_final(stu_final);
    	       		slVO.setStu_name(stu_name);
    	       		slVO.setStu_note1(stu_note1);
    	       		slVO.setStu_note2(stu_note2);
    	       		slVO.setStu_pre(stu_pre);
    	       		slVO.setStu_sch(stu_sch);
    	       		slVO.setStu_sex(stu_sex);
    	       		slVO.setStu_testtime(stu_testtime);
    	       		slVO.setStu_except(stu_except);
    	       		slVO.setStu_age(stu_age);      	   
    	       		slVO.setStu_group(stu_group);
    	       		slVO.setStu_implement(stu_implement);
    	       		slVO.setStu_interview(stu_interview);
    	       		slVO.setStu_total(stu_total);
    	       		slVO.setStu_workdate(stu_workdate);
    	       		slVO.setPub_key(publicKeyEncrpty);
    	       		slVO.setPri_key(privatekeyEncrpty);
    	       		slVO.setCipher_text(cipherData);
    	       		slVO.setStu_seatno(stu_seatno);
    	       		slVO.setLog_pw(log_pw);
    	       		
    	       		ClassVO classVO=new ClassVO(); 
    	       		classVO.setClass_id(class_id);
    	       		slVO.setClassVO(classVO);
    	         	
    	       		
    	       		
    	       		
    	       		
    	         	   
    	         	   
    	         	   
    	         	   
    	         	   
    	         	   studentvoArray[i]=slVO;
    	         	   stu.update(slVO);//無法更新過去嘗試new新VO
    	         	   System.out.println("getStu_sex===="+stuList.get(i).getStu_sex());
    	         	   System.out.println("getPub_key===="+stuList.get(i).getPub_key());
    	         	   System.out.println("setCipher_text===="+stuList.get(i).getCipher_text());
    	         	   } 

    	          	return studentvoArray;
    	          	}		    	
    		    	
    		    	
    

   	public StudentVO decrypt(String ciphertextString,String emailString) throws Exception {  
   		
   		StudentVO returnStudent=null;
   		StudentDAO stu = new StudentDAO();
		//List<StudentVO> list=stu.getAllStudentByClass(classId);
		StudentVO matchedStudent=stu.getStudentByEmail(emailString);
		

		System.out.println("matchedStudent=="+matchedStudent);
		byte[] publickeydb=matchedStudent.getPub_key();
		byte[] privatekeydb=matchedStudent.getPri_key();
		byte[] ciphertextdb=matchedStudent.getCipher_text();
		
		  //將二進位的publickey讀回來變成publickey物件
	    KeyFactory keyFactory = KeyFactory.getInstance("RSA");
	    X509EncodedKeySpec pkSpec = new X509EncodedKeySpec(
	    		publickeydb);
	    PublicKey publicKeydecoded = keyFactory.generatePublic(pkSpec);
	    

	    //將二進位的privatekey讀回來變成privatekey物件
	    PKCS8EncodedKeySpec privKeySpec = new PKCS8EncodedKeySpec(
	    		privatekeydb);
	    PrivateKey privateKeydecode = keyFactory.generatePrivate(privKeySpec);
	    
	    byte[] bb=org.apache.tomcat.util.codec.binary.Base64.decodeBase64(ciphertextString);
	    
//	    System.out.println("----------------------");
//	    for(int k=0,max2=bb.length;k<max2;k++){
//	    	System.out.print(bb[k]);
//	    }
//	    System.out.println();
	    //byte[] bb=new BASE64Decoder().decodeBuffer(ciphertextString);
	    
	    
	    //new byte[] 裝database和email傳進來的值
	    byte[] g=new byte[ciphertextdb.length];
	    byte[] f=new byte[bb.length];	   
	    System.out.println("ciphertextdb.length=="+ciphertextdb.length);
	    System.out.println("new BASE64Decoder().decodeBuffer(ciphertextString).length="+bb.length);
	    System.out.println(ciphertextdb);
	    System.out.println(bb);
	    
		for(int j=0,max1=ciphertextdb.length;j<max1;j++){	
			
			 f[j]=Array.getByte(ciphertextdb,j);
			 g[j]=Array.getByte(bb,j);
			System.out.println("ciphertextdb=="+Array.getByte(ciphertextdb,j));
			System.out.println("ciphertextString=="+Array.getByte(bb,j));
			if(Array.getByte(ciphertextdb,j)==Array.getByte(bb,j)){
				System.out.println("match");

				
			}else{
				System.out.println("failXXXXXXXXXXXXXXXXXXXXX");
				
			}
			
		
		}
			
	    //伺服器的數據使用私鑰加密  
	    Cipher cipher = Cipher.getInstance("rsa");  
	    //Cipher cipher1 = Cipher.getInstance("rsa");  
	    SecureRandom random = new SecureRandom(); 

	    //使用者用公鑰解密
	    cipher.init(Cipher.DECRYPT_MODE, privateKeydecode, random);  
	    //cipher1.init(Cipher.DECRYPT_MODE, privateKeydecode, random);  
	    byte[] plainData = cipher.doFinal(f);  
	    
	    System.out.println("從資料庫抓出來解密完的plainText : " + new String(plainData));  
	    byte[] plainData1 = cipher.doFinal(g); 
	    System.out.println("從email抓出來解密完的plainText : " + new String(plainData1));  
	    //Hello , world !



//	    
	    //伺服器根據加密的數據和私鑰產生數據簽名
//	    Signature signature  = Signature.getInstance("MD5withRSA");  
//	    signature.initSign(privateKeydecode);  
//	    signature.update(ciphertextdb);  
//	    byte[] signData = signature.sign();  
//	    System.out.println("signature : " + new BASE64Encoder().encode(signData));
	    //ADfoeKQn6eEHgLF8ETMXan3TfFO03R5u+cQEWtAQ2lRblLZw1DpzTlJJt1RXjU451I84v3297LhR  
	    //co64p6Sq3kVt84wnRsQw5mucZnY+jRZNdXpcbwh2qsh8287NM2hxWqp4OOCf/+vKKXZ3pbJMNT/4  
	    ///t9ewo+KYCWKOgvu5QQ=  
	  
	    //用戶根據公鑰和加密數據驗證數據是否有被修改過
//	    signature.initVerify(publicKeydecoded);  
//	    signature.update(ciphertextdb);  
//	    boolean status = signature.verify(signData);  
//	    System.out.println("status : " + status);  
	    //true 
	    
	    //伺服器根據加密的數據和私鑰產生數據簽名
//	    Signature signature1  = Signature.getInstance("MD5withRSA");  
//	    signature1.initSign(privateKeydecode);  
//	    signature1.update(bb);  
//	    byte[] signData1 = signature1.sign();  
//	    System.out.println("signature : " + new BASE64Encoder().encode(signData1));
	    //ADfoeKQn6eEHgLF8ETMXan3TfFO03R5u+cQEWtAQ2lRblLZw1DpzTlJJt1RXjU451I84v3297LhR  
	    //co64p6Sq3kVt84wnRsQw5mucZnY+jRZNdXpcbwh2qsh8287NM2hxWqp4OOCf/+vKKXZ3pbJMNT/4  
	    ///t9ewo+KYCWKOgvu5QQ=  
	  
	    //用戶根據公鑰和加密數據驗證數據是否有被修改過
//	    signature1.initVerify(publicKeydecoded);  
//	    signature1.update(bb);  
//	    boolean status1 = signature1.verify(signData1);  
//	    System.out.println("status : " + status1);  
	    //true 	    

	    	if(new String(plainData).equals(new String(plainData1))){
				System.out.println("email和密鑰配對成功");
				returnStudent= matchedStudent;
	    	}else{
				System.out.println("配對失敗");
	    	}
		
		return returnStudent;         
   	}

//public static void main(String[] args) throws InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, SQLException, IOException{
//	EncryptIdentificationIdService ls=new EncryptIdentificationIdService();
//	String classId="EEIT85";
//	StudentVO[] st=ls.insertPubkeyPrivateKeyTextAndReturnAllStudentVO(classId);
//	byte[][] publickeyArray=new byte[st.length][];
//	byte[][] privatekeyArray=new byte[st.length][];
//	byte[][] ciphertextArray=new byte[st.length][];
//	String[] nameStringArray=new String[st.length];	
//	
//	
//	
//	for(int i =0,max=st.length;i<max;i++){
//		
//		publickeyArray[i]=st[i].getPub_key();
//		privatekeyArray[i]=st[i].getPri_key();
//		ciphertextArray[i]=st[i].getCipher_text();
//		nameStringArray[i]=st[i].getStu_name();
//		
//
//		String a=new BASE64Encoder().encode(st[i].getCipher_text());
//		
//		for(int j=0,max1=st[i].getCipher_text().length;j<max1;j++){
//			byte[] f=new byte[st[i].getCipher_text().length];
//
//			
//			f[j]=Array.getByte(st[i].getCipher_text(), j);
//			System.out.println("Array.getByte(st[i].getCipher_text(), j)="+Array.getByte(st[i].getCipher_text(), j));
//
//			System.out.println("new BASE64Decoder().decodeBuffer(a)="+Array.getByte(new BASE64Decoder().decodeBuffer(a),j));
//			if(Array.getByte(st[i].getCipher_text(), j)==Array.getByte(new BASE64Decoder().decodeBuffer(a),j)){
//				System.out.println("match");
//			}else{
//			System.out.println("failXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
//			}		
//			}
//	
//
//		System.out.println("抓二進制陣列＝＝＝"+Array.getByte(st[i].getCipher_text(), 1)+"(資料庫裡拉出來的）");
//		
//
//		System.out.println("加密之後的二進制資料＝＝＝"+new String(st[i].getCipher_text().toString())+"(資料庫裡拉出來的）");
//		System.out.println("加密之後的二進制資料轉字串(toString)＝＝＝"+st[i].getCipher_text().toString());
//		System.out.println("加密之後的二進制資料轉字串(new String)＝＝＝"+new String(st[i].getCipher_text()));
//		System.out.println("加密之後的二進制資料轉字串再轉回二進制(getBytes)(toString)＝＝＝"+st[i].getCipher_text().toString().getBytes());
//		System.out.println("加密之後的二進制資料轉字串再轉回二進制(getBytes)(new String)＝＝＝"+new String(st[i].getCipher_text().toString()).getBytes());
//		System.out.println("加密之後的二進制資料轉字串(BASE64)＝＝＝"+new BASE64Encoder().encode(st[i].getCipher_text()));
//		System.out.println("加密之後的二進制資料轉字串再轉回二進制(BASE64)＝＝＝"+new BASE64Decoder().decodeBuffer(a));
//		System.out.println("加密之後的二進制資料轉字串(new String)(ISO-8859-1)＝＝＝"+new String(st[i].getCipher_text(),"ISO-8859-1"));
//		System.out.println("加密之後的二進制資料轉字串再轉回二進制(getBytes)(ISO-8859-1)＝＝＝"+new String(st[i].getCipher_text(),"ISO-8859-1").getBytes());
//		System.out.println("加密之後的二進制資料轉字串(new String)(UTF8)＝＝＝"+new String(st[i].getCipher_text(),"UTF8"));
//		System.out.println("加密之後的二進制資料轉字串再轉回二進制(getBytes)(UTF8)＝＝＝"+new String(st[i].getCipher_text(),"UTF8").getBytes());
//		
//		System.out.println("-------------------------------------------");
//		
//	}
//	}
}



      
 

