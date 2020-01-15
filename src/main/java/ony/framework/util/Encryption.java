package ony.framework.util;

import java.math.BigInteger;
import java.security.Key;
import java.security.MessageDigest;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.CharEncoding;
import org.apache.commons.codec.binary.Base64;



@SuppressWarnings("unchecked")
public class Encryption {

	private final static String KEY = "jababanet01234567890123456789012";
	// 128bit (16자리)
    private final static String KEY_128 = KEY.substring(0, 128 / 8);
    // 256bit (32자리)
	private final static String KEY_256 = KEY.substring(0, 256 / 8);
	
	/**
     * sha512 방식으로 암호화한 스트링을 리턴한다
     *
     * @param target
     * @return [encrypted string]
     */
	public static String getSHA512(String input){

	String toReturn = null;
		try {
		    MessageDigest digest = MessageDigest.getInstance("SHA-512");
		    digest.reset();
		    digest.update(input.getBytes("utf8"));
		    toReturn = String.format("%0128x", new BigInteger(1, digest.digest()));
		} catch (Exception e) {
		    e.printStackTrace();
		}
	
	return toReturn;
    }
    
    
 // AES 256 암호화
    public final static String encryptAES256(String string) {

           try {
                   byte[] key256Data = KEY_256.getBytes(CharEncoding.UTF_8);
                   byte[] key128Data = KEY_128.getBytes(CharEncoding.UTF_8);
                   
                   // 운용모드 CBC, 패딩은 PKCS5Padding
                   Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");

                   // key 와 iv 같게..
                   // 블록 암호의 운용 모드(Block engine modes of operation)가 CBC/OFB/CFB를 사용할 경우에는
                   // Initialization Vector(IV), IvParameterSpec를 설정해줘야한다. 아니면 InvalidAlgorithmParameterException 발생
                   
                   // AES 256은 미국만 되는거라. JDK/JRE 패치를 해야된다.
                   // http://www.oracle.com/technetwork/java/javase/downloads/index.html 에서 
                   // Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files for JDK/JRE 8 이런 링크 찾아서 다운
                   // $JAVA_HOME\jre\lib\security 아래에 local_policy.jar, US_export_policy.jar 파일 overwrite!
                   
                   // iv값이 16자리가 아니면..
                   // java.security.InvalidAlgorithmParameterException: Wrong IV length: must be 16 bytes long 발생
                   
                   cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key256Data, "AES"), new IvParameterSpec(key128Data));

                   // AES 암호화
                   byte[] encrypted = cipher.doFinal(string.getBytes(CharEncoding.UTF_8));

                   // base64 인코딩
                   byte[] base64Encoded = Base64.encodeBase64(encrypted);

                   // 결과
                   String result = new String(base64Encoded, CharEncoding.UTF_8);

                   return result;
           }
           catch (Exception e) {
                   return null;
           }
    }       
    
    // AES 256복호화
    public final static String decryptAES256(String string) {

           try {
                   byte[] key256Data = KEY_256.getBytes(CharEncoding.UTF_8);
                   byte[] key128Data = KEY_128.getBytes(CharEncoding.UTF_8);

                   // 운용모드 CBC, 패딩은 PKCS5Padding
                   Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");

                   cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key256Data, "AES"), new IvParameterSpec(key128Data));

                   // base64 디코딩
                   byte[] base64Decoded = Base64.decodeBase64(string.getBytes(CharEncoding.UTF_8));

                   // AES 복화화
                   byte[] decrypted = cipher.doFinal(base64Decoded);

                   // 결과
                   String result = new String(decrypted, CharEncoding.UTF_8);

                   return result;
           }
           catch (Exception e) {
                   return null;
           }
    }
    
    public static Key getAESKey() throws Exception {
        String iv;
        Key keySpec;

        String key = "jababanet0123456";
        iv = key.substring(0, 16);
        byte[] keyBytes = new byte[16];
        byte[] b = key.getBytes("UTF-8");

        int len = b.length;
        if (len > keyBytes.length) {
           len = keyBytes.length;
        }

        System.arraycopy(b, 0, keyBytes, 0, len);
        keySpec = new SecretKeySpec(keyBytes, "AES");

        return keySpec;
    }

    // 	AES 128 암호화
    public final static String encryptAES128(String str) {

    	String enStr = "";
    	try {
	    	Key keySpec = getAESKey();
	        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
	        c.init(Cipher.ENCRYPT_MODE, keySpec);
	        byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
	        enStr = new String(Base64.encodeBase64(encrypted));
    	} catch (Exception e) {
    		
    	}

        return enStr;
	 }       
 
	 // AES 128복호화
	 public final static String decryptAES128(String enStr) {
		 String decStr = "";
	    	try {
	    		Key keySpec = getAESKey();
	    		Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
	    		c.init(Cipher.DECRYPT_MODE, keySpec);
	    		byte[] byteStr = Base64.decodeBase64(enStr.getBytes("UTF-8"));
	    		 decStr = new String(c.doFinal(byteStr), "UTF-8");
	    	} catch (Exception e) {
	    		
	    	}

		    return decStr;
	 }
}

