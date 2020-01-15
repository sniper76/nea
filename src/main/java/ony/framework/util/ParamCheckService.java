package ony.framework.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

@Service("paramCheckService")
public class ParamCheckService{

	protected final Log logger = LogFactory.getLog(getClass());

	public String LPAD(String str, int len, String append)
	 {
	  String rtn = str;
	  if (str.length() < len){
	   for (int i = (len - str.length()); i > 0; i--){
	    rtn = append + rtn;
	   }
	  }
	  else{
	   rtn = str.substring(0, len);
	  }
	  return rtn;
	 }


	public int getByteSizeToComplex(String str) {
	    int en = 0;
	    int ko = 0;
	    int etc = 0;

	    char[] string = str.toCharArray();

	    for (int j=0; j<string.length; j++) {
	        if (string[j]>='A' && string[j]<='z') {
	            en++;
	        }
	        else if (string[j]>='\uAC00' && string[j]<='\uD7A3') {
	            ko++;
	            ko++;
	        }
	        else {
	            etc++;
	        }
	    }
	    return (en + ko + etc);
	}



	public String NullStringStr(String value){
		  String result = null;
	      if(value.trim().equals("--") || value.trim().equals("-")){
		         result = "";
		  }else{
				 result = value;
		  }
		  return result;
		}

	// String --> Int
	public int NullStringInt(String value){

		  int result = 0;
	      if(value == null || value.equals("null")|| value.equals("")){
		         result = 0;
		  }else{
				 result = Integer.parseInt(value);
		  }
		  return result;
		}

	// String --> String
	// return 0
	public String NullStringInt2(String value){

		  String result = "0";
		  int result_int = 0;
	      if(value == null || value.equals("null")|| value.equals("")){
		  }else{
				 result_int = Integer.parseInt(value);
				 result = Integer.toString(result_int);
		  }
		  return result;
		}

	 public String NullString3(String value){

     String result = null;
       if(value == null || value.equals("null") || value.equals(" ")){
            result = "";
     }else{
        result = value;
     }
     return result;
   }

	public int NullStringPageNo(String value){

		  int result = 1;
	      if(value == null || value.equals("null")|| value.equals("")){
		         result = 1;
		  }else{
				 result = Integer.parseInt(value);
		  }
		  return result;
		}


	public String NullString(String value){

	  String result = null;
      if(value == null || value.equals("null") || value.equals("0")){
	         result = "";
	  }else{
			 result = value;
	  }
	  return result;
	}

	// String Null üũ (0 ���)
	public String NullString2(String value){

	  String result = null;
      if(value == null || value.equals("null") || value.equals("")){
	         result = "";
	  }else{
			 result = value;
	  }
	  return result;
	}

	// String Null type (���� �ƴҶ� �ڿ� �ٴ� ����)
	public String NullStringText(String value, String nextValue){

	  String result = null;
      if(value == null || value.equals("null")){
	         result = "";
	  }else{
			 result = value+nextValue;
	  }
	  return result;
	}

	// String Null type (���� �ƴҶ� �յڰ���)
	public String NullStringText2(String value, String nextValue){

	  String result = null;
      if(value == null || value.equals("null")){
	         result = "";
	  }else{
			 result = "("+value+nextValue+")";
	  }
	  return result;
	}

	// String Null type (���� �ƴҶ� �յڰ���+Value)
	public String NullStringText3(String value){

	  String result = null;
      if(value == null || value.equals("null")){
	         result = "";
	  }else{
			 result = "("+value+")";
	  }
	  return result;
	}

	// int --> String
	public String NullInt(int value){

		String  result = null;

		if(value == 0){
		         result = "";
		  }else{
				result = Integer.toString(value);
		  }
		  return result;
		}

	// float --> String
	public int NullFloat(float value){

		int  result = 0;

		if(value == 0){
		         result = 0;
		  }else{
				result = (int)value;
		  }
		  return result;
		}


	public int NullDouble(double value){

		int  result = 0;

		if(value == 0){
		         result = 0;
		  }else{
				result = (int)value;
		  }
		  return result;
		}

	// String --> String
	// return 0
	public Double NullStringDouble2(String value){

		  Double result_int = 0.0;
	      if(value == null || value.equals("null")|| value.equals("")){
		  }else{
				 result_int = Double.parseDouble(value);
		  }
		  return result_int;
		}

	public String NullStringDouble3(String value){

		  String result = "0.0";
		  Double result_int = 0.0;
	      if(value == null || value.equals("null")|| value.equals("")){
		  }else{
				 result_int = Double.parseDouble(value);
				 result = Double.toString(result_int);
		  }
		  return result;
		}


	public String NullDate(Date value){

		String result = null;

		if(value == null){
		         result = "";
		  }else{
				result = value.toString();
		  }
		  return result;
		}

	// ��¥�� ����(��������...)
	public static String SubString(String str, int num){
		String result = null;
		if(str != null && str.length() >= num){
			result = str.substring(0,num)+"...";
		}else{
			result = str;
		}
		 return result;
	}

	// �Ⱓ�� ���� ��¥ ���ϱ�
	public static String DayEmpty(Date begin, String end) throws Exception{	//string���� ��¥�� �Է� �޾� end���� start�� �� �� ���� ����.
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");	//��¥ ���� �������
		SimpleDateFormat formatter2 = new SimpleDateFormat("yyyyMMdd");	//��¥ ���� �������

	    Date current = new Date();

	    int sectioncheck = 0;
	    int currentdate = Integer.parseInt(formatter2.format(current));   // ������ ��¥
	    int P_startdate = Integer.parseInt(formatter2.format(begin));    // ������Ʈ ������ ��¥

	    if(currentdate > P_startdate){
			sectioncheck = 1;   // ������ ��¥�� ������Ʈ ���� ��¥���� ũ�� 1����
		}else{
			sectioncheck = 2;
		}

		Date beginDate = null;
		if(sectioncheck == 1){
			beginDate = current;
		}else{
			beginDate = begin;
		}

	    Date endDate = formatter.parse(end);
	    Long time = (endDate.getTime() - beginDate.getTime()) / (60 * 1000 * 60 * 24);
	    String str = Long.toString(time);

	    return str;
		}

	// ���糯�ڿ� ������ ���ϱ�(String Type)
	public static int diffOfDay(String end) throws Exception{	//string���� ��¥�� �Է� �޾� end���� start�� �� �� ���� ����.
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");	//��¥ ���� �������
	    Date beginDate = new Date();

	    Date endDate = formatter.parse(end);
	    Long time = (endDate.getTime() - beginDate.getTime()) / (60 * 1000 * 60 * 24);
	    String str_str = Long.toString(time);
	    int str = Integer.parseInt(str_str);
	    return str+1;
		}

	// ���糯�ڿ� ������ ���ϱ�(Date Type)
	public static int diffOfDay2(Date end) throws Exception{

	    Date beginDate = new Date();
	    Date endDate = end;
	    Long time = (endDate.getTime() - beginDate.getTime()) / (60 * 1000 * 60 * 24);
	    String str_str = Long.toString(time);
	    int str = Integer.parseInt(str_str);
	    return str+1;
		}

	// ���糯�ڿ� ������ ���ϱ�(Date Type)
	public static int diffOfDayBefore(Date start) throws Exception{

	    Date End = new Date();
	    Date Start = start;
	    Long time = (End.getTime() - Start.getTime()) / (60 * 1000 * 60 * 24);
	    String str_str = Long.toString(time);
	    int str = Integer.parseInt(str_str);
	    return str+1;
		}

	//�ش� �Ⱓ�� ��¥�� ��ȯ
	public String Day(String begin, String end) throws Exception{	//string���� ��¥�� �Է� �޾� end���� start�� �� �� ���� ����.
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");	//��¥ ���� �������
	    Date beginDate = formatter.parse(begin);
	    Date endDate = formatter.parse(end);
	    Long time = (endDate.getTime() - beginDate.getTime()) / (60 * 1000 * 60 * 24);
	    String str = Long.toString(time);
	    return str;
		}

	//�ش� �Ⱓ�� ��¥�� ��ȯ (�����Ϸ� ���� ���ñ����� String ��¥)
	public String Day_est(String begin) throws Exception{	//string���� ��¥�� �Է� �޾� end���� start�� �� �� ���� ����.
		  SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");	//��¥ ���� �������
	    Date beginDate = formatter.parse(begin);
	    Date endDate = new Date();
	    Long time = (endDate.getTime() - beginDate.getTime()) / (60 * 1000 * 60 * 24);
	    String str = Long.toString(time);
	    return str;
		}

	// ���ϳ�¥ ���ϱ�
	public String AfterDate() throws Exception{
		java.util.Calendar cal = new java.util.GregorianCalendar();
		cal.add(java.util.Calendar.DATE, +1);
        String year = Integer.toString(java.util.Calendar.YEAR);
        String month = Integer.toString(cal.get(java.util.Calendar.MONTH)+1);
		String day = Integer.toString(cal.get(java.util.Calendar.DAY_OF_MONTH));
		return "201"+year+month+day;
	}


	/**
	 * @Description : ���� �̸� �ٲٱ�
	 *
	 * @see
	 * @since JDK1.4
	 * @param String
	 * @param String
	 * @return boolean
	 * @throws
	 */
	public boolean Rename(String fname1, String fname2) {
		File file = new File(fname1);
		File fileDest = new File(fname2);
		file.renameTo(fileDest);
		return true;
	}

	/**
	 * @Description : ���� �����
	 *
	 * @see
	 * @since JDK1.4
	 * @param String
	 * @return boolean
	 * @throws
	 */
	public boolean DelFile(String fname) {
		File file = new File(fname);
		if (file.exists()) // ������ ������ ������ ����
		{
			file.delete();
			return true;
		}
		return false;
	}

	/**
	 * @Description : ���� ���� Ȯ��
	 *
	 * @see
	 * @since JDK1.4
	 * @param String
	 * @return boolean
	 * @throws
	 */
	public  boolean ExistFile(String fname) {
		File file = new File(fname);
		if (file.exists()) // ������ ������ ������ ����
		{
			return true;
		} else {
			return false;
		}
	}
	/**
	 * �����Ͻø� Ư�����(yyyyMMddhhmmss)���� ��ȯ
	 *
	 * @param as_format
	 * @return String
	 */
	public  String getDateTime(String as_format) {
		// �������� �� �ʱ�ȭ.
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat(as_format);
		return dateFormat.format(date);
	}

	public  String getDateTime() {
		return getDateTime("yyyyMMddHHmmss");
	}


      //랜덤 문자열 생성
	    /** num : 뽑을 갯수
	      type : 대소문자
	    **/
      public String CreateString(int num, int type) {

        // 임의의 문자열을 누적 저장하는 객체
        StringBuilder sb = new StringBuilder();

        // 10개의 임의의 문자열 만들기
        for(int i=0; i<num; i++) {
           if(type  > 1){
                sb.append(randomUpperCharacter());
            }else{
                sb.append(randomLowerCharacter());
            }
        }
        // 누적된 임의의 문자열 출력
        return sb.toString();
    }

    // 임의의 소문자 뽑기
    public static char randomLowerCharacter() {
        // 97(a) ~ 122(z) 까지의 난수 생성 ( 소문자 ASCII값 )
        return (char)(Math.floor(Math.random() * (122 - 97 + 1)) + 97);
    }

    // 임의의 대문자 뽑기
    public static char randomUpperCharacter() {
        // 65(A) ~ 90(Z) 까지의 난수 생성 ( 대문자 ASCII값 )
        return (char)(Math.floor(Math.random() * (90 - 65 + 1)) + 65);
    }

    // 개월수 차이 구하기
    public int MonthDiff(String strtDate, String endDate){

        strtDate = strtDate.replaceAll("-", "");
        strtDate = strtDate.replaceAll("/", "");
        endDate = endDate.replaceAll("-", "");
        endDate = endDate.replaceAll("/", "");
        int strtYear = Integer.parseInt(strtDate.substring(0,4));
        int strtMonth = Integer.parseInt(strtDate.substring(4,6));
        int endYear = Integer.parseInt(endDate.substring(0,4));
        int endMonth = Integer.parseInt(endDate.substring(4,6));
        int month = (strtYear - endYear)* 12 + (strtMonth - endMonth);
      return month;

    }

    // 개월수 차이로 코드부여
    public int MonthDiffValueCode(String strtDate, String endDate, String payCtrtAlacStus){

      int resultMonth = 0;
      int result = matchString(payCtrtAlacStus);

      System.out.println(strtDate);
      System.out.println(endDate);

      if(result == 0){
        strtDate = strtDate.replaceAll("-", "");
        strtDate = strtDate.replaceAll("/", "");
        endDate = endDate.replaceAll("-", "");
        endDate = endDate.replaceAll("/", "");
        int strtYear = Integer.parseInt(strtDate.substring(0,4));
        int strtMonth = Integer.parseInt(strtDate.substring(4,6));
        int endYear = Integer.parseInt(endDate.substring(0,4));
        int endMonth = Integer.parseInt(endDate.substring(4,6));
        int month = (strtYear - endYear)* 12 + (strtMonth - endMonth);
        resultMonth = month;
      }else{
        resultMonth = result;
      }
      return resultMonth;

    }

    public int matchString(String txt){

      int matchFlag = 0;
      txt = txt.replaceAll(" ","");
       if(NullString2(txt).equals("")){
         matchFlag = 0;
       }else{
         System.out.println(txt);
         if(txt.matches(".*해약.*") || txt.matches(".*효력상실.*") || txt.matches(".*실효.*") ){
           matchFlag = 200;
          }else  if(txt.matches(".*품보.*") ||  txt.matches(".*품질.*")  || txt.matches(".*품질보.*") || txt.matches(".*민원.*") || txt.matches(".*무효.*")
                || txt.matches(".*보증해지.*") || txt.matches(".*반송.*") || txt.matches(".*거절.*") || txt.matches(".*철회.*") || txt.matches(".*철.*")
                || txt.matches(".*약철.*") || txt.matches(".*립전철.*") || txt.matches(".*립후철.*") || txt.matches(".*전철.*") || txt.matches(".*후철.*")
                || txt.matches(".*불가.*") || txt.matches(".*청약서.*") || txt.matches(".*해지.*") || txt.matches(".*약해.*") || txt.matches(".*부적격.*") || txt.matches(".*취소.*") || txt.matches(".*소멸.*")
                     )
          {
              matchFlag = 500;
          }else{
              matchFlag = 0;
          }
       }
          return matchFlag;
    }

    // KDB생명 계약상태코드 텍스트로변환
    public String changeAlacStusStr(int code){
      String txt = "";
      if(code == 10){
        txt = "청약";
      }else if(code == 20){
        txt = "청약소멸";
      }else if(code == 30){
        txt = "정상";
      }else if(code == 40){
        txt = "계약계류";
      }else if(code == 91){
        txt = "반송";
      }else if(code == 92){
        txt = "청약철회";
      }else if(code == 31){
        txt = "신계약";
      }else if(code == 32){
        txt = "응당";
      }else if(code == 33){
        txt = "연체";
      }else if(code == 34){
        txt = "선납";
      }else if(code == 36){
        txt = "납입면제,전액납명,납입완료";
      }else if(code == 37){
        txt = "실효";
      }else if(code == 81){
        txt = "해약";
      }else if(code == 86){
        txt = "해지";
      }else if(code == 90){
        txt = "사고소멸";
      }else if(code == 96){
        txt = "품보";
      }
      return txt;
    }

 // KDB생명 계약상태코드 밸류상태코드로변환
    public int changeCtrtStusCd(String txt){
      int matchFlag = 0;

      if(txt.equals("청약") || txt.equals("정상") || txt.equals("계약계류") || txt.equals("신계약") || txt.equals("응당") || txt.equals("선납") || txt.equals("납입면제,전액납명,납입완료")){
        matchFlag = 0;
      }else if(txt.equals("연체")){
        matchFlag = 1;
      }else if(txt.equals("실효")){
        matchFlag = 4;
      }else if(txt.equals("해약")){
        matchFlag = 200;
      }else if(txt.equals("품보") || txt.equals("반송") || txt.equals("청약철회") || txt.equals("청약소멸") || txt.equals("해지") || txt.equals("사고소멸") ){
        matchFlag = 500;
      }

      return matchFlag;
    }

    public String replacePclNum(String plcNum){
      String plcNumStr01 = plcNum.substring(0,plcNum.length()-3);
      String plcNumStr02 = plcNum.substring(plcNum.length()-3);
      plcNumStr02 = plcNumStr02.replaceAll("q", "1");
      plcNumStr02 = plcNumStr02.replaceAll("w", "2");
      plcNumStr02 = plcNumStr02.replaceAll("e", "3");
      plcNumStr02 = plcNumStr02.replaceAll("r", "4");
      plcNumStr02 = plcNumStr02.replaceAll("t", "5");
      plcNumStr02 = plcNumStr02.replaceAll("y", "6");
      plcNumStr02 = plcNumStr02.replaceAll("u", "7");
      plcNumStr02 = plcNumStr02.replaceAll("i", "8");
      plcNumStr02 = plcNumStr02.replaceAll("o", "9");
      plcNumStr02 = plcNumStr02.replaceAll("p", "0");
      plcNum = plcNumStr01+plcNumStr02;
      return plcNum;
    }

    /** 영문,숫자만 허용 정규식*/
    public String regAZNumber(String str){
      //한글 제거
      str = str.replaceAll("[ㄱ-ㅎㅏ-ㅣ가-힣]", "");
      //특수문자 제거
      str = str.replaceAll("[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]", "");
      return str;
    }
}

