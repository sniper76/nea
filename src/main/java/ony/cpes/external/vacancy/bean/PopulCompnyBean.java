package ony.cpes.external.vacancy.bean;//

import ony.cmm.common.bean.CommonBean;

/**
 * Batch Popuplate Company (Today, This Month, Accumulate)
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
 *  2020.01.13 KJ.PARK
 *
 * </pre>
 */
public class PopulCompnyBean extends CommonBean {

	private String compnySeq;
	private String ranking;
	private String bkmkCnt;
	private String compnyNm;
	private String isicNm;
	private String locNm;
	private String bkmkSeq;
	private String logoFileGrpSeq;
	private String logoFilePath;
	private String filePath;

	public String getCompnySeq() {
		return compnySeq;
	}
	public void setCompnySeq(String compnySeq) {
		this.compnySeq = compnySeq;
	}
	public String getRanking() {
		return ranking;
	}
	public void setRanking(String ranking) {
		this.ranking = ranking;
	}
	public String getBkmkCnt() {
		return bkmkCnt;
	}
	public void setBkmkCnt(String bkmkCnt) {
		this.bkmkCnt = bkmkCnt;
	}
	public String getCompnyNm() {
		return compnyNm;
	}
	public void setCompnyNm(String compnyNm) {
		this.compnyNm = compnyNm;
	}
	public String getIsicNm() {
		return isicNm;
	}
	public void setIsicNm(String isicNm) {
		this.isicNm = isicNm;
	}
	public String getLocNm() {
		return locNm;
	}
	public void setLocNm(String locNm) {
		this.locNm = locNm;
	}
	public String getBkmkSeq() {
		return bkmkSeq;
	}
	public void setBkmkSeq(String bkmkSeq) {
		this.bkmkSeq = bkmkSeq;
	}
	public String getLogoFileGrpSeq() {
		return logoFileGrpSeq;
	}
	public void setLogoFileGrpSeq(String logoFileGrpSeq) {
		this.logoFileGrpSeq = logoFileGrpSeq;
	}
	public String getLogoFilePath() {
		return logoFilePath;
	}
	public void setLogoFilePath(String logoFilePath) {
		this.logoFilePath = logoFilePath;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}
