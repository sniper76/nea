package ony.cmm.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	/**
	 * 현재시간 가져오기
	 *
	 * @param
	 * @return DateFormat format 로 된 현재시간 문자열
	 */
	public static String getDate(String format) {
		// 현재시간 가져오기
		Date getDate = new Date();

		SimpleDateFormat df = new SimpleDateFormat(format);
		String getDateStr = df.format(getDate);

		return getDateStr;
	}

}
