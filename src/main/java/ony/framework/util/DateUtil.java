package ony.framework.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import org.apache.commons.lang.StringUtils;


public class DateUtil {
  /**
   * 현재의 연도값을 반환한다.
   *
   * @return 년
   */
  public static int getCurrentYearAsInt() {
    Calendar  cal = new GregorianCalendar();
    return cal.get(Calendar.YEAR);
  }

  /**
   * 현재의 월값을 반환한다.
   *
   * @return 월
   */
  public static int getCurrentMonthAsInt() {
    Calendar  cal = new GregorianCalendar();
    return cal.get(Calendar.MONTH) + 1;
  }

  /**
   * 현재의 일값을 반환한다.
   *
   * @return 일
   */
  public static int getCurrentDayAsInt() {
    Calendar  cal = new GregorianCalendar();
    return cal.get(Calendar.DAY_OF_MONTH);
  }

  /**
   * 현재의 시간값을 반환한다.
   *
   * @return 시간
   */
  public static int getCurrentHourAsInt() {
    Calendar  cal = new GregorianCalendar();
    return cal.get(Calendar.HOUR_OF_DAY);
  }

  /**
   * 현재의 분값을 반환한다.
   *
   * @return 분
   */
  public static int getCurrentMinuteAsInt() {
    Calendar  cal = new GregorianCalendar();
    return cal.get(Calendar.MINUTE);
  }

  /**
   * 현재의 초값을 반환한다.
   *
   * @return 초
   */
  public static int getCurrentSecondAsInt() {
    Calendar  cal = new GregorianCalendar();
    return cal.get(Calendar.SECOND);
  }

  /**
   * 현재의 밀리초값을 반환한다.
   *
   * @return 밀리초
   */
  public static int getCurrentMillisecondAsInt() {
    Calendar  cal = new GregorianCalendar();
    return cal.get(Calendar.MILLISECOND);
  }

  /**
   * 현재의 연도값을 YYYY 형태로 반환한다.
   *
   * @return YYYY 형태의 연도
   */
  public static String getCurrentYearAsString() {
    return getFormalYear(new GregorianCalendar());
  }

  /**
   * 현재의 월값을 MM 형태로 반환한다.
   *
   * @return MM 형태의 월
   */
  public static String getCurrentMonthAsString() {
    return getFormalMonth(new GregorianCalendar());
  }

  /**
   * 현재의 일값을 dd 형태로 반환한다.
   *
   * @return dd 형태의 일
   */
  public static String getCurrentDayAsString() {
    return getFormalDay(new GregorianCalendar());
  }

  /**
   * 현재의 시간값을 HH 형태로 반환한다.
   *
   * @return HH 형태의 시간
   */
  public static String getCurrentHourAsString() {
    return getFormalHour(new GregorianCalendar());
  }

  /**
   * 현재의 분값을 mm 형태로 반환한다.
   *
   * @return mm 형태의 분
   */
  public static String getCurrentMinuteAsString() {
    return getFormalMinute(new GregorianCalendar());
  }

  /**
   * 현재의 초값을 SS 형태로 반환한다.
   *
   * @return SS 형태의 초
   */
  public static String getCurrentSecondAsString() {
    return getFormalSecond(new GregorianCalendar());
  }

  /**
   * 현재의 밀리초값을 sss 형태로 반환한다.
   *
   * @return sss 형태의 밀리초
   */
  public static String getCurrentMillisecondAsString() {
    return getFormalMillisecond(new GregorianCalendar());
  }

  /**
   * 현재 날짜를 년월일을 합쳐서 하나의 문자열로 반환한다.
   *
   * @return 년+월+일 값 8자리
   */
  public static String getCurrentDateAsString() {
    Calendar  cal = new GregorianCalendar();
    return getFormalYear(cal) + getFormalMonth(cal) + getFormalDay(cal);
  }

  /**
   * 현재 날짜를 년월일을 합쳐서 하나의 문자열로 반환한다.
   *
   * @return 년+월+일 값 8자리
   */
  public static String getCurrentDateAsStringKo() {
    String  currentDate = getCurrentDateAsString();

    return currentDate.substring(0, 4) + "년" + currentDate.substring(4, 6) + "월" + currentDate.substring(6, 8) + "일";
  }

  /**
   * 현재 시간을 시분초를 합쳐서 하나의 문자열로 반환한다.
   *
   * @return 시+분+초 값 6자리
   */
  public static String getCurrentTimeAsString() {
    Calendar  cal = new GregorianCalendar();
    return getFormalHour(cal) + getFormalMinute(cal) + getFormalSecond(cal);
  }

  /**
   * 현재 날짜와 시간을 년월일시분초를 합쳐서 하나의 문자열로 반환한다.
   *
   * @return 년+월+일+시+분+초 값 14자리
   */
  public static String getCurrentDateTimeAsString() {
    Calendar  cal = new GregorianCalendar();
    return getFormalYear(cal) + getFormalMonth(cal) + getFormalDay(cal)
        + getFormalHour(cal) + getFormalMinute(cal) + getFormalSecond(cal);
  }

  /**
   * 연도값을 YYYY 형태로 반환한다.
   *
   * @param cal 년도를 포함하는 <strong>Calendar</strong> 오브젝트
   * @return YYYY 형태의 연도
   */
  private static String getFormalYear(Calendar cal) {
    return StringUtils.leftPad(Integer.toString(cal.get(Calendar.YEAR)), 4, '0');
  }

  /**
   * 월값을 MM 형태로 반환한다.
   *
   * @param cal 월을 포함하는 <strong>Calendar</strong> 오브젝트
   * @return MM 형태의 월
   */
  private static String getFormalMonth(Calendar cal) {
    return StringUtils.leftPad(Integer.toString(cal.get(Calendar.MONTH) + 1), 2, '0');
  }

  /**
   * 일값을 dd 형태로 반환한다.
   *
   * @param cal 일을 포함하는 <strong>Calendar</strong> 오브젝트
   * @return dd 형태의 일
   */
  private static String getFormalDay(Calendar cal) {
    return StringUtils.leftPad(Integer.toString(cal.get(Calendar.DAY_OF_MONTH)), 2, '0');
  }

  /**
   * 시간값을 HH 형태로 반환한다.
   *
   * @param cal 시간을 포함하는 <strong>Calendar</strong> 오브젝트
   * @return HH 형태의 시간
   */
  private static String getFormalHour(Calendar cal) {
    return StringUtils.leftPad(Integer.toString(cal.get(Calendar.HOUR_OF_DAY)), 2, '0');
  }

  /**
   * 분값을 mm 형태로 반환한다.
   *
   * @param cal 분을 포함하는 <strong>Calendar</strong> 오브젝트
   * @return mm 형태의 분
   */
  private static String getFormalMinute(Calendar cal) {
    return StringUtils.leftPad(Integer.toString(cal.get(Calendar.MINUTE)), 2, '0');
  }

  /**
   * 초값을 ss 형태로 반환한다.
   *
   * @param cal 초를 포함하는 <strong>Calendar</strong> 오브젝트
   * @return ss 형태의 초
   */
  private static String getFormalSecond(Calendar cal) {
    return StringUtils.leftPad(Integer.toString(cal.get(Calendar.SECOND)), 2, '0');
  }

  /**
   * 밀리초값을 sss 형태로 반환한다.
   *
   * @param cal 밀리초를 포함하는 <strong>Calendar</strong> 오브젝트
   * @return sss 형태의 밀리초
   */
  private static String getFormalMillisecond(Calendar cal) {
    return StringUtils.leftPad(Integer.toString(cal.get(Calendar.MILLISECOND)), 3, '0');
  }

  /**
   * 년, 월, 일을 입력하면 해당하는 요일을 반환한다.
   *
   * @param nYear 년
   * @param nMonth 월
   * @param nDay 일
   * @return 요일 인덱스 (숫자: 일=1,월=2,화=3,수=4,목=5,금=6,토=7)
   */
  public static int getDayOfWeekAsInt(int nYear, int nMonth, int nDay) {
    Calendar  cal = new GregorianCalendar(nYear, nMonth - 1, nDay);
    return cal.get(Calendar.DAY_OF_WEEK);
  }

  /**
   * 년, 월, 일을 입력하면 해당하는 요일을 반환한다.
   *
   * @param nYear 년
   * @param nMonth 월
   * @param nDay 일
   * @return 요일 (한글: 일,월,화,수,목,금,토)
   */
  public static String getDayOfWeekAsString(int nYear, int nMonth, int nDay) {
    SimpleDateFormat  format  = new SimpleDateFormat("E");
    Calendar      cal   = new GregorianCalendar(nYear, nMonth - 1, nDay);
    return format.format(cal.getTime());
  }

  /**
   * 해당 년도 특정월의 마지막 일자를 반환한다.
   *
   * @param nYear 년도(4자리)
   * @param nMonth 월
   * @return 특정월의 마지막 일자
   */
  public static int getDayCountForMonth(int nYear, int nMonth) {
    Calendar  cal = new GregorianCalendar(nYear, nMonth - 1, 1);
    return cal.getActualMaximum(Calendar.DAY_OF_MONTH);
  }

  /**
   * 문자열 날짜값을 Date 값으로 변환하여 반환한다.
   *
   * @param dateStr 문자열 날짜값 (예: 2012.03.14)
   * @param formatStr 변환 날짜 포맷 (예: "yyyy.MM.dd")
   * @return 변환된 Date 값
   * @throws Exception
   */
  public static Date getDateFromString(String dateStr, String formatStr) throws Exception {
    SimpleDateFormat  format  = new SimpleDateFormat(formatStr, Locale.KOREA);
    Date        date  = null;

    try {
      date  = format.parse(dateStr);
    } catch (ParseException e) {
      e.printStackTrace();

      StringBuffer  msg = new StringBuffer();
      msg.append("날짜 형식을 변환할 수 없습니다. : ").append(dateStr).append(" [").append(formatStr).append("]");

      throw new Exception();
    }

    return date;
  }

  /**
   * Date 를 패턴에 맞는 문자열로 변환한다.
   *
   * @param date Date 객체
   * @param pattern 변환할 패턴 문자열
   * @return 문자열 날짜값
   */
  public static String toString(Date date, String pattern) {
    return toString(date, pattern, Locale.KOREA);
  }

  /**
   * Date 를 패턴에 맞는 문자열로 변환한다.
   *
   * @param date Date 객체
   * @param pattern 변환할 패턴 문자열
   * @param locale 지역화 코드
   * @return 문자열 날짜값
   */
  public static String toString(Date date, String pattern, Locale locale) {
    SimpleDateFormat  format  = new SimpleDateFormat(pattern, locale);

    return format.format(date);
  }

  /**
   * 날짜/시간 가감 연산
   *
   * @param date Date 객체
   * @param type 가감시킬 항목 (y:년, M:월, d:일, H:시, m:분, s:초)
   * @param amount 가감값
   * @return the date
   */
  public static Date add(Date date, String type, int amount) {
    Calendar  cal = Calendar.getInstance();

    cal.setTime(date);

    if ("y".equals(type)) {
      cal.add(Calendar.YEAR, amount);
    } else if ("M".equals(type)) {
      cal.add(Calendar.MONTH, amount);
    } else if ("d".equals(type)) {
      cal.add(Calendar.DATE, amount);
    } else if ("H".equals(type)) {
      cal.add(Calendar.HOUR_OF_DAY, amount);
    } else if ("m".equals(type)) {
      cal.add(Calendar.MINUTE, amount);
    } else if ("s".equals(type)) {
      cal.add(Calendar.SECOND, amount);
    }

    return cal.getTime();
  }

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
