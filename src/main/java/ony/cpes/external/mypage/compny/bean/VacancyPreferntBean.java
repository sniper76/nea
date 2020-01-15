package ony.cpes.external.mypage.compny.bean;


import java.util.List;

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
public class VacancyPreferntBean extends CommonBean {

	private String vacancyPreferntCondSeq;//구인_우대_조건_시퀀스
	private String preferntCondCd;//우대_조건_코드
	private String preferntCondNm;//우대_조건_코드
	private String vacancySeq;//구인_시퀀스
	public String getVacancyPreferntCondSeq() {
		return vacancyPreferntCondSeq;
	}
	public void setVacancyPreferntCondSeq(String vacancyPreferntCondSeq) {
		this.vacancyPreferntCondSeq = vacancyPreferntCondSeq;
	}
	public String getPreferntCondCd() {
		return preferntCondCd;
	}
	public void setPreferntCondCd(String preferntCondCd) {
		this.preferntCondCd = preferntCondCd;
	}
	public String getPreferntCondNm() {
		return preferntCondNm;
	}
	public void setPreferntCondNm(String preferntCondNm) {
		this.preferntCondNm = preferntCondNm;
	}
	public String getVacancySeq() {
		return vacancySeq;
	}
	public void setVacancySeq(String vacancySeq) {
		this.vacancySeq = vacancySeq;
	}




}
