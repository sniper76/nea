package ony.cpes.external.mypage.compny.bean;

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
public class VacancyLocBean extends CommonBean {
	private static final long serialVersionUID = 4979179976898050104L;

	private String addrCd;//주소_코드(ADDR_CD)
	private String addrFullCd;//주소_완성_코드
	private String addrFullNm;//주소_완성_명
	private String vacancyLocSeq;//구인_지역_시퀀스
	private String vacancyNo;//구인_번호
	private String vacancySeq;//구인_시퀀스

	private String addrCdNm;

	public String getAddrCdNm() {
		return addrCdNm;
	}
	public void setAddrCdNm(String addrCdNm) {
		this.addrCdNm = addrCdNm;
	}
	public String getAddrCd() {
		return addrCd;
	}
	public void setAddrCd(String addrCd) {
		this.addrCd = addrCd;
	}
	public String getAddrFullCd() {
		return addrFullCd;
	}
	public void setAddrFullCd(String addrFullCd) {
		this.addrFullCd = addrFullCd;
	}
	public String getAddrFullNm() {
		return addrFullNm;
	}
	public void setAddrFullNm(String addrFullNm) {
		this.addrFullNm = addrFullNm;
	}
	public String getVacancyLocSeq() {
		return vacancyLocSeq;
	}
	public void setVacancyLocSeq(String vacancyLocSeq) {
		this.vacancyLocSeq = vacancyLocSeq;
	}
	public String getVacancyNo() {
		return vacancyNo;
	}
	public void setVacancyNo(String vacancyNo) {
		this.vacancyNo = vacancyNo;
	}
	public String getVacancySeq() {
		return vacancySeq;
	}
	public void setVacancySeq(String vacancySeq) {
		this.vacancySeq = vacancySeq;
	}





}
