package SendMail.Controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
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

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import sun.misc.BASE64Encoder;

public class test04 {
public static void main(String[] args) throws Exception{
	  String plainText = "1";  
	    //創建兩隻鑰匙  
	    KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("rsa");  
	    keyPairGenerator.initialize(512);//密鑰長度1024
	    KeyPair keyPair = keyPairGenerator.generateKeyPair();
	    String a=keyPair.toString();
	    System.out.println("keyPair.toString()====="+keyPair.toString());
	    
	    //從keypair中拿到公鑰和私鑰
	    PublicKey publicKey = keyPair.getPublic();  
	    PrivateKey privateKey = keyPair.getPrivate(); 
	    System.out.println("publicKey=="+publicKey);
	    System.out.println("privateKey==="+privateKey);
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
	    
	    
	    
	    
	    //伺服器的數據使用私鑰加密  
	    Cipher cipher = Cipher.getInstance("rsa");  
	    SecureRandom random = new SecureRandom();  
	      
	    cipher.init(Cipher.ENCRYPT_MODE, privateKey, random);  
	    
	    byte[] cipherData = cipher.doFinal(plainText.getBytes());  
	    System.out.println("cipherText byte[] : " + cipherData); 
	    System.out.println("cipherText : " + new BASE64Encoder().encode(cipherData));
	    System.out.println("型態 : " + new BASE64Encoder().encode(cipherData).getClass()); 
	    //gDsJxZM98U2GzHUtUTyZ/Ir/NXqRWKUJkl6olrLYCZHY3RnlF3olkWPZ35Dwz9BMRqaTL3oPuyVq  
	    //sehvHExxj9RyrWpIYnYLBSURB1KVUSLMsd/ONFOD0fnJoGtIk+T/+3yybVL8M+RI+HzbE/jdYa/+  
	    //yQ+vHwHqXhuzZ/N8iNg=  
	    
	    //將二進位的publickey讀回來變成publickey物件
	    KeyFactory keyFactory = KeyFactory.getInstance("RSA");
	    X509EncodedKeySpec pkSpec = new X509EncodedKeySpec(
	    		publicKeyEncrpty);
	    PublicKey publicKeydecoded = keyFactory.generatePublic(pkSpec);
	    

	    //將二進位的privatekey讀回來變成privatekey物件
	    PKCS8EncodedKeySpec privKeySpec = new PKCS8EncodedKeySpec(
	    		privatekeyEncrpty);
	    PrivateKey privateKeydecode = keyFactory.generatePrivate(privKeySpec);
	    
	    
	    
	    //使用者用公鑰解密
	    cipher.init(Cipher.DECRYPT_MODE, publicKeydecoded, random);  
	    byte[] plainData = cipher.doFinal(cipherData);  
	    System.out.println("plainText : " + new String(plainData));  
	    //Hello , world !  
	    
	    //伺服器根據加密的數據和私鑰產生數據簽名
	    Signature signature  = Signature.getInstance("MD5withRSA");  
	    signature.initSign(privateKeydecode);  
	    signature.update(cipherData);  
	    byte[] signData = signature.sign();  
	    System.out.println("signature : " + new BASE64Encoder().encode(signData));  
	    //ADfoeKQn6eEHgLF8ETMXan3TfFO03R5u+cQEWtAQ2lRblLZw1DpzTlJJt1RXjU451I84v3297LhR  
	    //co64p6Sq3kVt84wnRsQw5mucZnY+jRZNdXpcbwh2qsh8287NM2hxWqp4OOCf/+vKKXZ3pbJMNT/4  
	    ///t9ewo+KYCWKOgvu5QQ=  
	  
	    //用戶根據公鑰和加密數據驗證數據是否有被修改過
	    signature.initVerify(publicKeydecoded);  
	    signature.update(cipherData);  
	    boolean status = signature.verify(signData);  
	    System.out.println("status : " + status);  
	    //true  
	
}
	
public static void encrypt(String s) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException{
	 String plainText = s;  
	    //創建兩隻鑰匙  
	    KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("rsa");  
	    keyPairGenerator.initialize(512);//密鑰長度1024
	    KeyPair keyPair = keyPairGenerator.generateKeyPair();  
	    //從keypair中拿到公鑰和私鑰
	    PublicKey publicKey= keyPair.getPublic();  
	    PrivateKey privateKey = keyPair.getPrivate();  
	    //伺服器的數據使用私鑰加密  
	    Cipher cipher = Cipher.getInstance("rsa");  
	    SecureRandom random = new SecureRandom();  
	      
	    cipher.init(Cipher.ENCRYPT_MODE, privateKey, random);  
	    byte[] cipherData = cipher.doFinal(plainText.getBytes());  
	    System.out.println("cipherText : " + new BASE64Encoder().encode(cipherData));  
	    //gDsJxZM98U2GzHUtUTyZ/Ir/NXqRWKUJkl6olrLYCZHY3RnlF3olkWPZ35Dwz9BMRqaTL3oPuyVq  
	    //sehvHExxj9RyrWpIYnYLBSURB1KVUSLMsd/ONFOD0fnJoGtIk+T/+3yybVL8M+RI+HzbE/jdYa/+  
	    //yQ+vHwHqXhuzZ/N8iNg=  
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
	    
}
	
//	public static void decrypt(KeyPair keyPair,byte[] cipherData,Cipher cipher,SecureRandom random) throws Exception {  
//		  //將二進位的publickey讀回來變成publickey物件
//	    KeyFactory keyFactory = KeyFactory.getInstance("RSA");
//	    X509EncodedKeySpec pkSpec = new X509EncodedKeySpec(
//	    		publicKeyEncrpty);
//	    PublicKey publicKeydecoded = keyFactory.generatePublic(pkSpec);
//	    
//
//	    //將二進位的privatekey讀回來變成privatekey物件
//	    PKCS8EncodedKeySpec privKeySpec = new PKCS8EncodedKeySpec(
//	    		privatekeyEncrpty);
//	    PrivateKey privateKeydecode = keyFactory.generatePrivate(privKeySpec);
//	    
//	    
//	  
//	    
//	    //使用者用公鑰解密
//	    cipher.init(Cipher.DECRYPT_MODE, publicKey, random);  
//	    byte[] plainData = cipher.doFinal(cipherData);  
//	    System.out.println("plainText : " + new String(plainData));  
//	    //Hello , world !  
//	    
//	    //伺服器根據加密的數據和私鑰產生數據簽名
//	    Signature signature  = Signature.getInstance("MD5withRSA");  
//	    signature.initSign(privateKey);  
//	    signature.update(cipherData);  
//	    byte[] signData = signature.sign();  
//	    System.out.println("signature : " + new BASE64Encoder().encode(signData));  
//	    //ADfoeKQn6eEHgLF8ETMXan3TfFO03R5u+cQEWtAQ2lRblLZw1DpzTlJJt1RXjU451I84v3297LhR  
//	    //co64p6Sq3kVt84wnRsQw5mucZnY+jRZNdXpcbwh2qsh8287NM2hxWqp4OOCf/+vKKXZ3pbJMNT/4  
//	    ///t9ewo+KYCWKOgvu5QQ=  
//	  
//	    //用戶根據公鑰和加密數據驗證數據是否有被修改過
//	    signature.initVerify(publicKey);  
//	    signature.update(cipherData);  
//	    boolean status = signature.verify(signData);  
//	    System.out.println("status : " + status);  
//	    //true  
//	}  

}
