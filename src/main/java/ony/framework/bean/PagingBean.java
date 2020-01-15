package ony.framework.bean;
public class PagingBean {


	/** 기본 페이지별 리스트 갯수. (10개) */
	public static final int	DEFAULT_LIST_BLOCK		= 10;

	/** 기본 화면별 페이지 수. (10개) */
	public static final int	DEFAULT_PAGE_BLOCK		= 10;

	/** 최대 페이지별 리스트 갯수. (1000개) */
	public static final int	AVAILABLE_LIST_BLOCK	= 1000;

	/** 목록 시작 번호. */
	private int	startNum;

	/** 목록 마지막 번호. */
	private int	endNum;

	/** 현재 페이지 번호. */
	private int	pageNo = 1;

	/** 페이지별 리스트 갯수. */
	private int	listBlock;

	/** 화면별 페이지 수. */
	private int	pageBlock;

	/** 목록 총 갯수. */
	private int	totalCount;

	/** 페이지별 리스트 갯수 해제 가능 여부. */
	private boolean	availFullList	= false;

	/**
	 * 생성자.
	 */
	public PagingBean() {
		super();

		listBlock	= DEFAULT_LIST_BLOCK;
		pageBlock	= DEFAULT_PAGE_BLOCK;
		pageNo		= 1;
	}

	/**
	 * Gets 목록 시작 번호.
	 *
	 * @return the 목록 시작 번호
	 */
	public int getStartNum() {
		return startNum;
	}

	/**
	 * Sets 목록 시작 번호.
	 *
	 * @param startNum the new 목록 시작 번호
	 */
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	/**
	 * Gets 목록 마지막 번호.
	 *
	 * @return the 목록 마지막 번호
	 */
	public int getEndNum() {
		if (isAvailFullList()) {
			endNum	= totalCount;
		} else {
			endNum	= ((pageNo * listBlock) > totalCount) ? totalCount : (pageNo * listBlock);
		}

		return endNum;
	}

	/**
	 * Sets 목록 마지막 번호.
	 *
	 * @param endNum the new 목록 마지막 번호
	 */
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	/**
	 * Gets 현재 페이지 번호.
	 *
	 * @return the 현재 페이지 번호
	 */
	public int getPageNo() {
		return pageNo;
	}

	/**
	 * Sets 현재 페이지 번호.
	 *
	 * @param pageNo the new 현재 페이지 번호
	 */
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	/**
	 * 전체 페이지 카운트를 조회한다.
	 *
	 * @return total page count
	 */
	public int getTotalPageCnt() {
		int	pageCnt	= totalCount / listBlock;

		if (0 == totalCount % listBlock) {
			pageCnt++;
		}

		return pageCnt;
	}

	/**
	 * Gets 페이지별 리스트 갯수.
	 *
	 * @return the 페이지별 리스트 갯수
	 */
	public int getListBlock() {
		if (isAvailFullList()) {
			return totalCount;
		}

		return listBlock;
	}

	/**
	 * Sets 페이지별 리스트 갯수.
	 *
	 * @param listBlock the new 페이지별 리스트 갯수
	 */
	public void setListBlock(int listBlock) {
		if (!isAvailFullList()) {
			if ((AVAILABLE_LIST_BLOCK < listBlock) || (1 > listBlock)) {
				return;
			}
		}

		this.listBlock = listBlock;
	}

	/**
	 * Gets 화면별 페이지 수.
	 *
	 * @return the 화면별 페이지 수
	 */
	public int getPageBlock() {
		return pageBlock;
	}

	/**
	 * Sets 화면별 페이지 수.
	 *
	 * @param pageBlock the new 화면별 페이지 수
	 */
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	/**
	 * Gets 목록 총 갯수.
	 *
	 * @return the 목록 총 갯수
	 */
	public int getTotalCount() {
		return totalCount;
	}

	/**
	 * Sets 목록 총 갯수.
	 *
	 * @param totalCount the new 목록 총 갯수
	 */
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	/**
	 * Checks if is 페이지별 리스트 갯수 해제 가능 여부.
	 *
	 * @return the 페이지별 리스트 갯수 해제 가능 여부
	 */
	public boolean isAvailFullList() {
		return availFullList;
	}

	/**
	 * Sets 페이지별 리스트 갯수 해제 가능 여부.
	 *
	 * @param availFullList the new 페이지별 리스트 갯수 해제 가능 여부
	 */
	public void setAvailFullList(boolean availFullList) {
		this.availFullList = availFullList;
	}
}
