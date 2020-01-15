package ony.cpes.external.jobfair.bean;

/**
 * Job Fair Booth Reservation
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
 *  2020.01.02    kj.park  최초생성
 *
 * </pre>
 */
public class JobFairBoothResvWaitBean {

	private String fairBoothResvWaitSeq;
	private String compnyInsttSeq;
	private String compnyInsttDivCd;
	private String fairSeq;
	private String mngerNm;
	private String mngerEmail;
	private String mngerCell;
	private String regUserSeq;
	private String regDt;

	public String getFairBoothResvWaitSeq() {
		return fairBoothResvWaitSeq;
	}
	public void setFairBoothResvWaitSeq(String fairBoothResvWaitSeq) {
		this.fairBoothResvWaitSeq = fairBoothResvWaitSeq;
	}
	public String getCompnyInsttSeq() {
		return compnyInsttSeq;
	}
	public void setCompnyInsttSeq(String compnyInsttSeq) {
		this.compnyInsttSeq = compnyInsttSeq;
	}
	public String getCompnyInsttDivCd() {
		return compnyInsttDivCd;
	}
	public void setCompnyInsttDivCd(String compnyInsttDivCd) {
		this.compnyInsttDivCd = compnyInsttDivCd;
	}
	public String getFairSeq() {
		return fairSeq;
	}
	public void setFairSeq(String fairSeq) {
		this.fairSeq = fairSeq;
	}
	public String getMngerNm() {
		return mngerNm;
	}
	public void setMngerNm(String mngerNm) {
		this.mngerNm = mngerNm;
	}
	public String getMngerEmail() {
		return mngerEmail;
	}
	public void setMngerEmail(String mngerEmail) {
		this.mngerEmail = mngerEmail;
	}
	public String getMngerCell() {
		return mngerCell;
	}
	public void setMngerCell(String mngerCell) {
		this.mngerCell = mngerCell;
	}
	public String getRegUserSeq() {
		return regUserSeq;
	}
	public void setRegUserSeq(String regUserSeq) {
		this.regUserSeq = regUserSeq;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

}