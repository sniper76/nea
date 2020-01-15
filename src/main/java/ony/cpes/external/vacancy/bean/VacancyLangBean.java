package ony.cpes.external.vacancy.bean;

import java.util.ArrayList;
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
public class VacancyLangBean extends CommonBean {
	private static final long serialVersionUID = 4979179976898050104L;

	private String vacancyLangSeq;//구인_언어_시퀀스
	private String langCd;//언어_코드(LANG_CD)
	private String langNm;//언어_코드(LANG_CD)
	private String langLvlCd;//언어_레벨_코드(LANG_LVL_CD)
	private String langLvlNm;//언어_레벨_코드(LANG_LVL_CD)
	private String vacancySeq;//구인_시퀀스
	private String langLvlCdStr;//LANG_LVL_CD,LANG_LVL_CD

	public String getVacancyLangSeq() {
		return vacancyLangSeq;
	}
	public void setVacancyLangSeq(String vacancyLangSeq) {
		this.vacancyLangSeq = vacancyLangSeq;
	}
	public String getLangCd() {
		return langCd;
	}
	public void setLangCd(String langCd) {
		this.langCd = langCd;
	}
	public String getLangLvlCd() {
		return langLvlCd;
	}
	public void setLangLvlCd(String langLvlCd) {
		this.langLvlCd = langLvlCd;
	}
	public String getVacancySeq() {
		return vacancySeq;
	}
	public void setVacancySeq(String vacancySeq) {
		this.vacancySeq = vacancySeq;
	}
	public String getLangLvlCdStr() {
		return langLvlCdStr;
	}
	public void setLangLvlCdStr(String langLvlCdStr) {
		this.langLvlCdStr = langLvlCdStr;
	}
	public String getLangNm() {
		return langNm;
	}
	public void setLangNm(String langNm) {
		this.langNm = langNm;
	}
	public String getLangLvlNm() {
		return langLvlNm;
	}
	public void setLangLvlNm(String langLvlNm) {
		this.langLvlNm = langLvlNm;
	}






}
