package ony.cpes.external.jobstudy.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * board bean
 * @author kwon
 * @since
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일           수정자     수정내용
 *  ------------- -------- ---------------------------
 *  2019.10.17 KWON
 *
 * </pre>
 */
public class JobStudyBean extends CommonBean {
	private static final long serialVersionUID = 4979179976898050104L;

	private String iscoId;//
	private String iscoCd;//
	private String enNm;//
	private String khNm;//
	private String upperCd;//
	private String cdLvl;//
	private String useYn;//
	private String lvl;//
	private String expln;//
	private String cateNm;//
	private String jobCateCd;//
	private String iscoNm;//
	private String fullPath;//
	private int lvlCnt;


	public String getIscoId() {
		return iscoId;
	}
	public void setIscoId(String iscoId) {
		this.iscoId = iscoId;
	}
	public String getIscoCd() {
		return iscoCd;
	}
	public void setIscoCd(String iscoCd) {
		this.iscoCd = iscoCd;
	}
	public String getEnNm() {
		return enNm;
	}
	public void setEnNm(String enNm) {
		this.enNm = enNm;
	}
	public String getKhNm() {
		return khNm;
	}
	public void setKhNm(String khNm) {
		this.khNm = khNm;
	}
	public String getUpperCd() {
		return upperCd;
	}
	public void setUpperCd(String upperCd) {
		this.upperCd = upperCd;
	}
	public String getCdLvl() {
		return cdLvl;
	}
	public void setCdLvl(String cdLvl) {
		this.cdLvl = cdLvl;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
	}
	public String getExpln() {
		return expln;
	}
	public void setExpln(String expln) {
		this.expln = expln;
	}
	public String getCateNm() {
		return cateNm;
	}
	public void setCateNm(String cateNm) {
		this.cateNm = cateNm;
	}
	public String getJobCateCd() {
		return jobCateCd;
	}
	public void setJobCateCd(String jobCateCd) {
		this.jobCateCd = jobCateCd;
	}
	public String getIscoNm() {
		return iscoNm;
	}
	public void setIscoNm(String iscoNm) {
		this.iscoNm = iscoNm;
	}
	public String getFullPath() {
		return fullPath;
	}
	public void setFullPath(String fullPath) {
		this.fullPath = fullPath;
	}
	public int getLvlCnt() {
		return lvlCnt;
	}
	public void setLvlCnt(int lvlCnt) {
		this.lvlCnt = lvlCnt;
	}




}
