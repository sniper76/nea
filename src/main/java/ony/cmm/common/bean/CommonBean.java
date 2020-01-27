package ony.cmm.common.bean;

import java.util.List;

import ony.framework.bean.PagingBean;

/**
 * bean 공통정보를 담는 bean
 *
 * @author 우성택
 * @version 1.0
 * @since 2019.01.02
 */
//public class CommonBean extends PagingBean{
public class CommonBean {

	private String regDt;		//등록일시
	private String regUserSeq;		//등록자 일련번호
	private String regNm;		//등록자명
	private String modDt;		//수정일시
	private String modUserSeq;		//수정자 일련번호
	private String updNm;		//수정자명
	private String resultCode;  //결과코드
	private String msg;			//결과메시지
	private String newYn;			//결과메시지

	//[2019-10-14 : Joo] Add Language Code
	private String langCd;

	// 공통 코드 관련
	private String CODE_ID;
	private String CODE;
	private String CODE_NM;
	private List<CommonBean> commonList;

	// 공통 코드 레이어 관련
	private String cd;
	private String cdNm;
	private String upperCd;

	/** 페이징관련 */
	/** 페이징 객체 */
	PagingBean paging;


	/* Paging Variable */
	private int draw						= 0;
    private int recordsTotal				= 0;
    private int recordsFiltered				= 0;
	private int iTotalRecords				= 0;
	private int iTotalDisplayRecords		= 0;
	private int start 						= 0;
    private int length 						= 10;
    private int orderStr 					= 0;
    private String orderColumn 				= "";
    private String orderColumnSort 			= "";



	private static final long serialVersionUID = 1L;
	private static final int RECORD_COUNT_PER_PAGE = 10;

	private int pageIndex = 1;
	private int pageUnit;
	private int pageSize;
	private int firstIndex = 1;
	private int lastIndex = 1;
	private int recordCountPerPage = RECORD_COUNT_PER_PAGE;
	private String searchCondition = "";
	private String searchKeyword = "";

	private String tempFlag;

	private String uploadResult;
	private String filePath;
	private List<FileBean> fileList;

	public String getUpperCd() {
		return upperCd;
	}

	public void setUpperCd(String upperCd) {
		this.upperCd = upperCd;
	}

	public List<FileBean> getFileList() {
		return fileList;
	}

	public void setFileList(List<FileBean> fileList) {
		this.fileList = fileList;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getUploadResult() {
		return uploadResult;
	}

	public void setUploadResult(String uploadResult) {
		this.uploadResult = uploadResult;
	}

	public String getCd() {
		return cd;
	}

	public void setCd(String cd) {
		this.cd = cd;
	}

	public String getCdNm() {
		return cdNm;
	}

	public void setCdNm(String cdNm) {
		this.cdNm = cdNm;
	}

	public String getTempFlag() {
		return tempFlag;
	}

	public void setTempFlag(String tempFlag) {
		this.tempFlag = tempFlag;
	}

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public int getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}

	public int getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}

	public int getiTotalRecords() {
		return iTotalRecords;
	}

	public void setiTotalRecords(int iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}

	public int getiTotalDisplayRecords() {
		return iTotalDisplayRecords;
	}

	public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getOrderStr() {
		return orderStr;
	}

	public void setOrderStr(int orderStr) {
		this.orderStr = orderStr;
	}

	public String getOrderColumn() {
		return orderColumn;
	}

	public void setOrderColumn(String orderColumn) {
		this.orderColumn = orderColumn;
	}

	public String getOrderColumnSort() {
		return orderColumnSort;
	}

	public void setOrderColumnSort(String orderColumnSort) {
		this.orderColumnSort = orderColumnSort;
	}

	/** 게시글 노출 갯수 */
	/** 페이지 번호 */

	public List<CommonBean> getCommonList() {
		return commonList;
	}

	public void setCommonList(List<CommonBean> commonList) {
		this.commonList = commonList;
	}

	public String getCODE_ID() {
		return CODE_ID;
	}

	public void setCODE_ID(String cODE_ID) {
		CODE_ID = cODE_ID;
	}

	public String getCODE() {
		return CODE;
	}

	public void setCODE(String cODE) {
		CODE = cODE;
	}

	public String getCODE_NM() {
		return CODE_NM;
	}

	public void setCODE_NM(String cODE_NM) {
		CODE_NM = cODE_NM;
	}

	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getRegNm() {
		return regNm;
	}

	public String getUpdNm() {
		return updNm;
	}

	public PagingBean getPaging() {
		return paging;
	}

	public void setRegNm(String regNm) {
		this.regNm = regNm;
	}

	public void setUpdNm(String updNm) {
		this.updNm = updNm;
	}

	public void setPaging(PagingBean paging) {
		this.paging = paging;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getRegUserSeq() {
		return regUserSeq;
	}

	public void setRegUserSeq(String regUserSeq) {
		this.regUserSeq = regUserSeq;
	}

	public String getModDt() {
		return modDt;
	}

	public void setModDt(String modDt) {
		this.modDt = modDt;
	}

	public String getModUserSeq() {
		return modUserSeq;
	}

	public void setModUserSeq(String modUserSeq) {
		this.modUserSeq = modUserSeq;
	}

	//[2019-10-14 : Joo] Add Language Code
	/**
	 * @return the langCd
	 */
	public String getLangCd() {
		return langCd;
	}

	/**
	 * @param langCd the langCd to set
	 */
	public void setLangCd(String langCd) {
		this.langCd = langCd;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getNewYn() {
		return newYn;
	}

	public void setNewYn(String newYn) {
		this.newYn = newYn;
	}



}
