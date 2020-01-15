package ony.cmm.common.util;

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

		return val;
		//return Encryption.encryptAES256(val);
	}


	/**
	 * Aes256로 복호화
	 *
	 * @param
	 * @return 암호화된 string
	 */
	public static String getAes256Dec(String val) {

		return val;
		//return Encryption.decryptAES256(val);
	}
}
