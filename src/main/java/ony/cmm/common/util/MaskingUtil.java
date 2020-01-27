package ony.cmm.common.util;

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
public class MaskingUtil {

	/*
	 * email masking
	 */
	public static String getEmailMasking(String email) {
		//ex hong01**@****.com
		StringBuilder result = new StringBuilder();;
		try {
			String[] arr = email.split("\\@");

			//System.out.println("arr[0]="+arr[0]);
			//System.out.println("arr[1]="+arr[1]);

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
			result.append("***");
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

	//yn이 Y가 아닐경우만 마스크 처리
	public static String getEmailMasking(String val, String yn) {
		String result = val;

		if(!StringUtils.equals(ConstVal.YES_VAL, yn)) {
			result = "***";
		}

		return result;

	}

	//yn이 Y가 아닐경우만 마스크 처리
	public static String getNmMasking(String val, String yn) {
		String result = val;

		if(!StringUtils.equals(ConstVal.YES_VAL, yn)) {
			result = "***";
		}

		return result;

	}

	//yn이 Y가 아닐경우만 마스크 처리
	public static String getBirthMasking(String val, String yn) {
		String result = val;

		if(!StringUtils.equals(ConstVal.YES_VAL, yn)) {
			if(val != null && val.length() > 4) {
				result = val.substring(0,4);
			} else {
				result = val;
			}
		}

		return result;

	}

	//yn이 Y가 아닐경우만 마스크 처리
	public static String getPhoneNumberMasking(String val, String yn) {
		String result = val;

		if(!StringUtils.equals(ConstVal.YES_VAL, yn)) {
			result = "***";
		}

		return result;

	}
}
