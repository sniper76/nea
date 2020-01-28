package ony.cmm.common.bean;

/**
 * Synonym Bean
 * @author kj.park
 * @since
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일           수정자     수정내용
 *  ------------- -------- ---------------------------
 *  2020.01.27 KJ.PARK
 *
 * </pre>
 */
public class SynonymBean {

	private String synonymSeq;
	private String kh;
	private String en;
	private String useYn;
	private String regUserSeq;
	private String regDt;
	private String modUserSeq;
	private String modDt;

	public String getSynonymSeq() {
		return synonymSeq;
	}
	public void setSynonymSeq(String synonymSeq) {
		this.synonymSeq = synonymSeq;
	}
	public String getKh() {
		return kh;
	}
	public void setKh(String kh) {
		this.kh = kh;
	}
	public String getEn() {
		return en;
	}
	public void setEn(String en) {
		this.en = en;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
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
	public String getModUserSeq() {
		return modUserSeq;
	}
	public void setModUserSeq(String modUserSeq) {
		this.modUserSeq = modUserSeq;
	}
	public String getModDt() {
		return modDt;
	}
	public void setModDt(String modDt) {
		this.modDt = modDt;
	}

}
