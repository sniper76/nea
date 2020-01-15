package ony.framework.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import ony.cmm.common.ConstVal;

/**
 * 문자열관련 기능을 모은 클래스
 * @author (주)한신정보기술 연구개발팀 최관형
 * @since 2014.03.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일           수정자     수정내용
 *  ------------- -------- ---------------------------
 *  2014.03.11 최관형     최초 생성
 *  2014.06.05 최관형     배열에 key값이 존재 여부 확인 추가, html을 text로 변환 추가
 *  2014.06.07 최관형     cutOffUTF8String, availibleByteNum 메소드 추가
 *  2014.06.09 최관형     removeTag 메소드 추가
 *  2014.06.19 최관형     htmlSpecialChars 메소드 추가
 *  2015.04.21 최관형     nvlNum(String str), nvlNum(Object str) 메소드 추가
 *
 * </pre>
 */
public class StringUtil {

    /**
     * XSS 방지 처리
     * @param String
     * @return  String
     * @exception
     */
    public static String unscript(String data) {

        if (data == null || data.trim().equals("")) {
            return "";
        }

        String ret = data;

        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");

        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");

        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");

        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");

        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

        return ret;

    }

    /**
     * 리턴문자를 br태그로 치환하여 돌려줌.
     * @param String
     * @return  String
     * @exception
     */
	public static String nl2br(String str) {
		if( str == null ) return "";
		str = str.replaceAll("\r\n", "<br/>");
		str = str.replaceAll("\n", "<br/>");
		str = str.replaceAll("\r", "<br/>");
		return str;
	}

    /**
     * XSS 방지와 리턴문자 br 치환
     * @param String
     * @return  String
     * @exception
     */
	public static String xssbr(String str) {

		str = unscript(str);
		str = nl2br(str);

		return str;

	}

    /**
     * 데이터가 비어있는지 유무를 판단하여 돌려줌
     * - isZeroCheck ( true : 0일때 return true )
     * @param Integer, boolean
     * @return  boolean
     * @exception
     */
	public static boolean isEmpty(Integer num, boolean isZeroCheck) {
		if( isZeroCheck ) {
			if( num == null ) {
				return true;
			} else {
				return num == 0 ? true : isEmpty(num);
			}
		} else {
			return isEmpty(num);
		}
	}

    /**
     * 데이터가 비어있는지 유무를 판단하여 돌려줌
     * @param Integer
     * @return  boolean
     * @exception
     */
	public static boolean isEmpty(Integer num) {
		return isEmpty(String.valueOf(num));
	}

    /**
     * 데이터가 비어있는지 유무를 판단하여 돌려줌
     * @param String
     * @return  boolean
     * @exception
     */
	public static boolean isEmpty(String str) {
		if( str == null  || "null".equals(str) || "NULL".equals(str) ) return true;
		return str.trim().length() > 0 ? false : true;
	}

	public static boolean isNull(String contents) {
		if (contents != null && !"".equals(contents))
			return true;
		else
			return false;
	}

    /**
     * fill문자를 len의 길이만큼 앞에 붙여 돌려줌
     * @param int, int, String
     * @return  String
     * @exception
     */
	public static String zerofill(int num, int len, String fill) {
		return zerofill(String.valueOf(num), len, fill);
	}

    /**
     * fill문자를 len의 길이만큼 앞에 붙여 돌려줌
     * @param String, int, String
     * @return  String
     * @exception
     */
	public static String zerofill(String str, int len, String fill) {
		int strLen = str.length();
		StringBuffer tmp = new StringBuffer();
		for( int LoopI=0; LoopI<len-strLen; LoopI++ ) {
			tmp.append(fill);
		}
		tmp.append(str);
		return tmp.toString();
	}

    /**
     * 응용어플리케이션에서 고유값을 사용하기 위해 시스템에서17자리의TIMESTAMP값을 구하는 기능
     *
     * @param
     * @return Timestamp 값
     * @exception MyException
     * @see
     */
    public static String getTimeStamp() {
		String rtnStr = null;
		// 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
		String pattern = "yyyyMMddhhmmssSSS";
		try {
		    SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
		    Timestamp ts = new Timestamp(System.currentTimeMillis());
		    rtnStr = sdfCurrent.format(ts.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rtnStr;
    }


    /**
     * 스트링이 비어있으면 ""  있으면 입력 str 리턴
     * @param str
     * @return "" or  str
     */
    public static String nvl(String str){
    	if(isEmpty(str)){
    		return "";
    	}else{
    		return str;
    	}
    }

    /**
     * 스트링이 비어있다면 0을 리턴
     * 스트링 값이 있다면 Integer형으로 변환해서 리턴
     * Integer로 변환중 NumberFormatException이 발생되면 0을 리턴
     * @param str
     * @return 0 or Integer str
     */
    public static int nvlNum(String str){
    	if(isEmpty(str)){
    		return 0;
    	}else{
    		try {
    			return Integer.parseInt(str);
    		} catch(NumberFormatException e) {
    			e.printStackTrace();
    			return 0;
    		}
    	}
    }

    /**
     * 스트링이 비어있다면 0을 리턴
     * 스트링 값이 있다면 Integer형으로 변환해서 리턴
     * Integer로 변환중 NumberFormatException이 발생되면 0을 리턴
     * @param obj
     * @return 0 or Integer str
     */
    public static int nvlNum(Object obj){
    	if(isEmpty(String.valueOf(obj))){
    		return 0;
    	}else{
    		try {
    			return Integer.parseInt(String.valueOf(obj));
    		} catch(NumberFormatException e) {
    			e.printStackTrace();
    			return 0;
    		}
    	}
    }

    /**
     * 배열에 key값이 존재 여부 확인
     * @param key
     * @param array
     * @return
     */
    public static boolean isExistArray(String key, String[] array) {

    	boolean result = false;

    	if( array == null ) return result;

    	int arrayCnt = array.length;

    	for( int i=0; i<arrayCnt; i++ ) {
    		if( key.equals(array[i]) ) {
    			result = true;
    			break;
    		}
    	}

    	return result;

    }

    /**
     * 배열에 key값이 존재 여부 확인
     * @param key
     * @param array
     * @return
     */
    public static String isExistArray(int key, String[] array) {

    	return isExistArray(String.valueOf(key), array) ? "1" : "0";

    }

	/**
	 * html 을 text로 변환
	 * @param str
	 * @return
	 */
	public static String html2text(String str) {

		if( isEmpty(str) ) {
			return str;
		} else {
			//HTML = HTML.replaceAll("&", "&amp;");
			str = str.replaceAll("<", "&lt;");
			str = str.replaceAll(">", "&gt;");
			//HTML = HTML.replaceAll("\"", "&quot;");
			//HTML = HTML.replaceAll("'", "&#39;");
			str = str.replaceAll("\n", "<br/>");
			//HTML = HTML.replaceAll(" ", "&nbsp;");
			return str;
		}

	}

	public static String htmlSpecialChars( String s ) {

		if(StringUtils.isNotEmpty(s)){
			s = s.replaceAll( "&nbsp;", " " );
			s = s.replaceAll( "&quot;", "\"" );
			s = s.replaceAll( "&#039;", "'" );
			s = s.replaceAll( "&lt;", "<" );
			s = s.replaceAll( "&gt;", ">" );
			s = s.replaceAll( "&amp;", "&" );
			s = s.replaceAll( "&", "&amp;" );
			s = s.replaceAll( "'", "&#039;" );
			s = s.replaceAll( "\"", "&quot;" );
			s = s.replaceAll( "<", "&lt;" );
			s = s.replaceAll( ">", "&gt;" );
			s = s.replaceAll( " ", "&nbsp;" );
			return s;
		}else{
			return new String();
		}

	}

	/**
	 * 문자열을 특정 byteSize에 맞게 자르고 뒤에 문자열(trail)을 붙여줌
	 * @param str
	 * @param maxByteSize
	 * @param trail
	 * @return
	 */
	public static String cutOffUTF8String(String str, int maxByteSize, String trail) {

		try {

			// 널일 경우에는 그냥 리턴
			if (str == null) return null;
			if (str.length() == 0) return str;

			byte strByte[] = str.getBytes("UTF-8");

			if (strByte.length <= maxByteSize) return str;

			// 마지막 줄임말
			int trailByteSize = 0;

			// 줄임말의 바이트 수 계산
			if (trail != null) trailByteSize = trail.getBytes("UTF-8").length;

			// 실질적으로 포함되는 최대 바이트 수는 trailByte를 뺀 것이다.
			maxByteSize = maxByteSize - trailByteSize;

			int endPos = 0; // 마지막 바이트 위치
			int currByte = 0; // 현재까지 조사한 바이트 수

			for (int i = 0; i < str.length(); i++) {
				// 순차적으로 문자들을 가져옴.
				char ch = str.charAt(i);

				// 이 문자가 몇 바이트로 구성된 UTF-8 코드인지를 검사하여 currByte에 누적 시킨다.
				currByte = currByte + availibleByteNum(ch);

				// 현재까지 조사된 바이트가 maxSize를 넘는다면 이전 단계 까지 누적된 바이트 까지를 유효한 바이트로 간주한다.
				if (currByte > maxByteSize) {
					endPos = currByte - availibleByteNum(ch);
					break;
				}
			}

			// 원래 문자열을 바이트로 가져와서 유효한 바이트 까지 배열 복사를 한다.
			byte newStrByte[] = new byte[endPos];

			System.arraycopy(strByte, 0, newStrByte, 0, endPos);

			String newStr = new String(newStrByte, "UTF-8");

			newStr += trail;

			return newStr;

		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}

	}

	/**
	 * 바이트 검사
	 * @param c
	 * @return
	 */
	public static int availibleByteNum(char c) {

		// UTF-8은 최대 4바이트를 사용하고 ASCII는 1바이트 그외의 문자들은 2~3바이트 까지 조합하여 사용한다.
		// 즉, 어느 나라 문자이냐에 따라서 몇 바이트를 사용하는지 모르기 때문에 하나의 charater가 몇 바이트 대역에
		// 있는지 조사하여 한문자의 바이트를 조사... 이를 더해 나가면 문자 단위로 몇 바이트를 차지 하는지 정확하게 조사할 수 있다.
		int ONE_BYTE_MIN = 0x0000;
		int ONE_BYTE_MAX = 0x007F;

		int TWO_BYTE_MIN = 0x0800;
		int TWO_BYTE_MAX = 0x07FF;

		int THREE_BYTE_MIN = 0x0800;
		int THREE_BYTE_MAX = 0xFFFF;

		int SURROGATE_MIN = 0x10000;
		int SURROGATE_MAX = 0x10FFFF;

		int digit = (int) c;

		if(ONE_BYTE_MIN <= digit && digit <= ONE_BYTE_MAX) return 1;
		else if(TWO_BYTE_MIN <= digit && digit <= TWO_BYTE_MAX) return 2;
		else if(THREE_BYTE_MIN <= digit && digit <= THREE_BYTE_MAX) return 3;
		else if(SURROGATE_MIN <= digit && digit <= SURROGATE_MAX) return 4;

		return -1;

	}

	/**
	 * 태그를 제거한다
	 * @param str
	 * @return
	 */
	public static String removeTag(String str){

		int lt = str.indexOf("<");

		if ( lt != -1 ) {
			int gt = str.indexOf(">", lt);
			if ( (gt != -1) ) {
				str = str.substring( 0, lt ) + str.substring( gt + 1 );
				str = removeTag(str);
			}
		}

		return str;

	}

	public static String randomStr(int Len) {

		Random rnd = new Random();

		String RandomStr = "";

		String[] arrStr = { "0","1","2","3","4","6","7","8","9",
				"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
				"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z" };

		for( int LoopI=0; LoopI<Len; LoopI++ ) {
			RandomStr+= arrStr[rnd.nextInt(61)];
		}

		return RandomStr;

	}

	public static String randomStrLow(int Len) {

		Random rnd = new Random();

		String RandomStr = "";

		String[] arrStr = { "0","1","2","3","4","6","7","8","9",
				"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z" };

		for( int LoopI=0; LoopI<Len; LoopI++ ) {
			RandomStr+= arrStr[rnd.nextInt(35)];
		}

		return RandomStr;

	}

	public static String randomStrNumber(int Len) {

		Random rnd = new Random();

		String RandomStr = "";

		String[] arrStr = { "0","1","2","3","4","6","7","8","9" };

		for( int LoopI=0; LoopI<Len; LoopI++ ) {
			RandomStr+= arrStr[rnd.nextInt(9)];
		}

		return RandomStr;

	}

	public static String arrayJoin(String glue, String array[]) {
	    String result = "";

	    for (int i = 0; i < array.length; i++) {
	      if (!array[i].trim().equals("")){
	    	  result += array[i];
	    	  if (i < array.length - 1) result += glue;
	      }

	    }
	    return result;
	  }

	public static String cropByte(String str, int i, String trail) {
        if (str==null) return "";
        String tmp = str;
        int slen = 0, blen = 0;
        char c;
        try {
            if(tmp.getBytes("MS949").length>i) {
                while (blen+1 < i) {
                    c = tmp.charAt(slen);
                    blen++;
                    slen++;
                    if ( c  > 127 ) blen++;  //2-byte character..
                }
                tmp=tmp.substring(0,slen)+trail;
            }
        } catch(java.io.UnsupportedEncodingException e) {

        }
        return tmp;
    }

	public static String excelClean(String value) {
		value = value.replaceAll("<", "").replaceAll(">", "");
		value = value.replaceAll("\"", "");
		value = value.replaceAll("\\*", "");
		value = value.replaceAll("\\?", "");
		value = value.replaceAll("\\\\", "");
		value = value.replaceAll("\\|", "");
		value = value.replaceAll(":", "");
		value = value.replaceAll("/", "");
		return value;
	}

	public static String osType(HttpServletRequest request) {
		String osType = "";
		String ua = request.getHeader("User-Agent").toLowerCase();
		if (ua.matches(".*(android|avantgo|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\\/|plucker|pocket|psp|symbian|treo|up\\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino).*")||ua.substring(0,4).matches("1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\\-(n|u)|c55\\/|capi|ccwa|cdm\\-|cell|chtm|cldc|cmd\\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\\-s|devi|dica|dmob|do(c|p)o|ds(12|\\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\\-|_)|g1 u|g560|gene|gf\\-5|g\\-mo|go(\\.w|od)|gr(ad|un)|haie|hcit|hd\\-(m|p|t)|hei\\-|hi(pt|ta)|hp( i|ip)|hs\\-c|ht(c(\\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\\-(20|go|ma)|i230|iac( |\\-|\\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\\/)|klon|kpt |kwc\\-|kyo(c|k)|le(no|xi)|lg( g|\\/(k|l|u)|50|54|e\\-|e\\/|\\-[a-w])|libw|lynx|m1\\-w|m3ga|m50\\/|ma(te|ui|xo)|mc(01|21|ca)|m\\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\\-2|po(ck|rt|se)|prox|psio|pt\\-g|qa\\-a|qc(07|12|21|32|60|\\-[2-7]|i\\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\\-|oo|p\\-)|sdk\\/|se(c(\\-|0|1)|47|mc|nd|ri)|sgh\\-|shar|sie(\\-|m)|sk\\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\\-|v\\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\\-|tdg\\-|tel(i|m)|tim\\-|t\\-mo|to(pl|sh)|ts(70|m\\-|m3|m5)|tx\\-9|up(\\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\\-|2|g)|yas\\-|your|zeto|zte\\-")) {
			osType = "mobile";
		}else{
			osType = "pc";
		}
		return osType;
	}

	/**
	 * json 을 맵으로
	 * ony.kr.co.NeoCMS.cmm.util
	 * @author lsc
	 * @date 2018. 4. 4.
	 */
	public static HashMap<String, String> jsonToMap(Object obj) {
		ObjectMapper mapper = null;
		HashMap<String, String> loginInfo = null;
		String strJson = "";

		try {
			mapper = new ObjectMapper();
			loginInfo = new HashMap<String, String>();

			strJson = obj.toString();

			loginInfo = mapper.readValue(strJson, new TypeReference<HashMap<String, String>>() {});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return loginInfo;
	}

	/**
     * 스트링이 비어있으면 ""  있으면 입력 str 리턴
     * @param str
     * @return "" or  str
     */
    public static String toString(String str1, String str2){
    	if(isEmpty(str1)){
    		return str2;
    	}else{
    		return str1;
    	}
    }

    public static String toString(String contents) {
		if (isEmpty(contents))
			return contents;
		else
			return "";
	}

    public static String cut(String str, int size){
    	return str.substring(0, 10);
    }


    private String decodeXSS(String value) {
        //You'll need to remove the spaces from the html entities below
    	value = value.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
    	value = value.replaceAll("&#40;", "\\(").replaceAll("&#41;", "\\)");
    	value = value.replaceAll("&#39;", "'");
    	return value;
    }

	/*
	 * 공백 또는 null 체크
	 */
	public static boolean isEmpty(Object obj) {
		if(obj == null) return true;

		if ((obj instanceof String) && (((String)obj).trim().length() == 0)) { return true; }

	    if (obj instanceof Map) { return ((Map<?, ?>) obj).isEmpty(); }

	    if (obj instanceof Map) { return ((Map<?, ?>)obj).isEmpty(); }

	    if (obj instanceof Object[]) { return (((Object[])obj).length == 0); }

		return false;

	}

	/*
	 * email masking
	 */
	public static String getEmailMasking(String email) {
		//ex hong01**@****.com
		StringBuilder result = new StringBuilder();;
		try {
			String[] arr = email.split("\\@");

			System.out.println("arr[0]="+arr[0]);
			System.out.println("arr[1]="+arr[1]);

			if(arr[0].length() > 2) {
				result.append(arr[0].substring(0,arr[0].length()-2)).append("**@");
				String[] arr2 = arr[1].split("\\.");
				result.append("***.").append(arr2[1]);

			} else {
				result.append("**@");
				String[] arr2 = arr[1].split("\\.");
				result.append("***.").append(arr2[1]);

			}
		} catch(Exception e) {
			result.append("**@***.com");
		}
		return result.toString();
	}

	/*
	 * cellphone masking
	 */
	public static String getCellMasking(String cellPhone) {
		//ex 090234***
		StringBuilder result = new StringBuilder();;
		try {
			result.append(cellPhone.substring(0,cellPhone.length() - 3)).append("***");
		} catch(Exception e) {
			result.append(cellPhone.substring(0,2)).append("***");;
		}
		return result.toString();
	}


	public static boolean getCurLangCode(Locale locale) {
		String lang = locale.getLanguage().toUpperCase();
		if(StringUtils.equals(ConstVal.LANG_EN_VAL, lang) || StringUtils.equals(ConstVal.LANG_KO_VAL, lang)) {
			return true;
		} else {
			return false;
		}

	}


}
