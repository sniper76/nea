package ony.framework.util.download;

import java.util.MissingResourceException;
import java.util.ResourceBundle;

/**
 * Framework MimeTypeUtil class
 */
public class MimeTypeUtil {
	/** tekville_post Properties */
	private static ResourceBundle	bundle;

	// 리소스 번들 초기화
	static {
		if (null == bundle) {
			bundle	= ResourceBundle.getBundle("/properties/mimeType");
		}
	}

	/**
	 * mimeType.propeties 파일의 key를 검색하여 값을 구한다.
	 *
	 * @param key 검색키(String)
	 * @return 검색결과(String)
	 */
	public static String getValue(String key) {
		return bundle.getString(key);
	}

	/**
	 * 키에 해당하는 값을 가져오고, 없으면 defaultValue에 해당하는 값을 반환한다.
	 *
	 * @param key 검색키(String)
	 * @param defaultValue 디폴트 값(String)
	 * @return 값이 있으면 키의 값을 반환, 없으면 기본값을 반환(String)
	 */
	public static String getValue(String key, String defaultValue) {
		String	value	= defaultValue;

		try {
			value	= bundle.getString(key);
		} catch (MissingResourceException mre) {
			value	= defaultValue;
		}

		return value;
	}
}
