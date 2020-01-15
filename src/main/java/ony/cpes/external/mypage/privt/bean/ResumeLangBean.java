package ony.cpes.external.mypage.privt.bean;

import java.util.List;

import ony.cmm.common.bean.CommonBean;

/**
 * bean 이력서 추천인 정보를 담는 Bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.06
 */
public class ResumeLangBean extends CommonBean {

	private String resumeLangSeq;
	private String resumeLangId;
	private String langCd;
	private String langLvlCd;
	private String langTypeCd;
	private String resumeSeq;

	// 조회 관련
	private String langLvlCdNm;
	private String langCdNm;
	private String langTypeCdNm;

	private List<ResumeLangBean> list;

	public List<ResumeLangBean> getList() {
		return list;
	}
	public void setList(List<ResumeLangBean> list) {
		this.list = list;
	}
	public String getLangTypeCdNm() {
		return langTypeCdNm;
	}
	public void setLangTypeCdNm(String langTypeCdNm) {
		this.langTypeCdNm = langTypeCdNm;
	}
	public String getLangCdNm() {
		return langCdNm;
	}
	public void setLangCdNm(String langCdNm) {
		this.langCdNm = langCdNm;
	}
	public String getLangLvlCdNm() {
		return langLvlCdNm;
	}
	public void setLangLvlCdNm(String langLvlCdNm) {
		this.langLvlCdNm = langLvlCdNm;
	}
	public String getResumeLangSeq() {
		return resumeLangSeq;
	}
	public void setResumeLangSeq(String resumeLangSeq) {
		this.resumeLangSeq = resumeLangSeq;
	}
	public String getResumeLangId() {
		return resumeLangId;
	}
	public void setResumeLangId(String resumeLangId) {
		this.resumeLangId = resumeLangId;
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
	public String getLangTypeCd() {
		return langTypeCd;
	}
	public void setLangTypeCd(String langTypeCd) {
		this.langTypeCd = langTypeCd;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}



}
