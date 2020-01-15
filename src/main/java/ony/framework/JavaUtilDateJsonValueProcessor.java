package ony.framework;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;


public class JavaUtilDateJsonValueProcessor implements JsonValueProcessor {
	/** 데이트 포맷 정의 */
	private DateFormat	defaultDateFormat	= null;

	/**
	 * 생성자 (Java Date 타입을 yyyy.MM.dd HH:mm:ss 형태로 변환한다.)
	 */
	public JavaUtilDateJsonValueProcessor() {
		this.defaultDateFormat	= new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
	}

    @Override
	public Object processArrayValue(Object value, JsonConfig jsonConfig) {
		if (null == value) {
			return null;
		}

		return this.defaultDateFormat.format(value);
	}

	@Override
	public Object processObjectValue(String key, Object value, JsonConfig jsonConfig) {
		return processArrayValue(value, jsonConfig);
	}
}
