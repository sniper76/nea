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

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
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
public class PageUtil {
	public static PaginationInfo getPageInfo(int pageIndex,int pageUnit, int pageSize) {
		// pageIndex : 현재 페이지 번호
		// pageUnit : Record count per page
		// pageSize : 페이지 리스트에 게시되는 페이지 건수

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageIndex);
		paginationInfo.setRecordCountPerPage(pageUnit);
		paginationInfo.setPageSize(pageSize);
		return paginationInfo;
	}




}
