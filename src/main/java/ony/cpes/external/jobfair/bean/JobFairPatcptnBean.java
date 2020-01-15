package ony.cpes.external.jobfair.bean;

/**
 * Job Fair Participate
 * @author kj.park
 * @since
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일                       수정자           수정내용
 *  ------------- -------- ---------------------------
 *  2019.12.27    kj.park  최초생성
 *
 * </pre>
 */
public class JobFairPatcptnBean {

	private String userSeq;
	private String fairSeq;
	private String langCd;

	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getFairSeq() {
		return fairSeq;
	}
	public void setFairSeq(String fairSeq) {
		this.fairSeq = fairSeq;
	}
	public String getLangCd() {
		return langCd;
	}
	public void setLangCd(String langCd) {
		this.langCd = langCd;
	}

}