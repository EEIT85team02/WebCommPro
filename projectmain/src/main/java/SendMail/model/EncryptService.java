package SendMail.model;

import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class EncryptService{

	public static String GenerateRandomString() throws NoSuchAlgorithmException{

		SecureRandom sr=new SecureRandom();

		String encryptedString=new BigInteger(40, sr).toString(32);

		
		return encryptedString;
		
	}
	public static byte[] MD5Encrypt(String msg) throws NoSuchAlgorithmException{


	        MessageDigest md = MessageDigest.getInstance("MD5");
	        byte[] messageDigest = md.digest(msg.getBytes());

			return messageDigest;	
	}
	
	public static byte[] AESEncrypt(String msg) throws NoSuchAlgorithmException, InvalidKeyException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException{


		System.out.println("原始字串："+new String(msg));
		//設定要使用的加密演算法
		KeyGenerator keyG = KeyGenerator.getInstance("AES");
		//設定key的長度
		keyG.init(128);
		//產生SecretKey
		SecretKey secuK = keyG.generateKey();
		//取得要用來加密的key(解密也需使用這把key)
		byte[] key = secuK.getEncoded();
		System.out.println("key："+new String(key));
		SecretKeySpec spec = new SecretKeySpec(key, "AES");
		Cipher cipher = Cipher.getInstance("AES");
		//設定為加密模式
		cipher.init(Cipher.ENCRYPT_MODE, spec);
		//將字串加密，並取得加密後的資料
		byte[] encryptData = cipher.doFinal(msg.getBytes());
		System.out.println("加密後字串："+new String(encryptData));

		 System.out.println();
		 return	encryptData;	
}	
	public  String Base64Encrypt(byte[] encrtyptedByteArray){
		
		String toString=Base64.getUrlEncoder().encodeToString(encrtyptedByteArray);
		return toString;
		
	}
	
	
	public static void main(String[] args) throws NoSuchAlgorithmException, NoSuchProviderException, InvalidKeyException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException {

		 
		
	}
}
