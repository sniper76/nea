package ony.cmm.common.util;

import java.security.MessageDigest;

import ony.framework.util.Encryption;

public class EncryptUtil {

	/**
	 * SHA 512로 암호화
	 *
	 * @param
	 * @return 암호화된 string
	 */
	public static String getSha512(String val) {
		//return val;
		return Encryption.getSHA512(val);
	}

	/**
	 * Aes256로 암호화
	 *
	 * @param
	 * @return 암호화된 string
	 */
	public static String getAes256Enc(String val) {

		//return val;
		return Encryption.encryptAES256(val);
	}


	/**
	 * Aes256로 복호화
	 *
	 * @param
	 * @return 암호화된 string
	 */
	public static String getAes256Dec(String val) {

		//return val;
		return Encryption.decryptAES256(val);
	}

	 /**
	  * 문자열을 MD-5 방식으로 암호화
	  * @param txt 암호화 하려하는 문자열
	  * @return String
	  * @throws Exception
	  */
	 public static String getEncMD5(String txt) {

	 	StringBuffer sbuf = new StringBuffer();

	 	try {
		 	MessageDigest mDigest = MessageDigest.getInstance("MD5");
		 	mDigest.update(txt.getBytes());

		 	byte[] msgStr = mDigest.digest() ;

		 	for(int i=0; i < msgStr.length; i++){
		 		String tmpEncTxt = Integer.toHexString((int)msgStr[i] & 0x00ff) ;
		 		sbuf.append(tmpEncTxt) ;
		 	}
	 	} catch(Exception e) {

	 	}


	 	return sbuf.toString() ;
	 }
}
