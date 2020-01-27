package ony.cpes.external.jobstudy.bean;

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
public class CondJobStudyBean extends CommonBean {
	private static final long serialVersionUID = 4979179976898050104L;

	private String condText;
	private String condUserSeq;
	private String condSeq;
	private String condLvl;
	private String condLvlCd;
	private List<String> condList;
	private String condDiv;
	private String condType;
	private String condIscoCd;

	public String getCondIscoCd() {
		return condIscoCd;
	}
	public void setCondIscoCd(String condIscoCd) {
		this.condIscoCd = condIscoCd;
	}
	public String getCondText() {
		return condText;
	}
	public void setCondText(String condText) {
		this.condText = condText;
	}
	public String getCondUserSeq() {
		return condUserSeq;
	}
	public void setCondUserSeq(String condUserSeq) {
		this.condUserSeq = condUserSeq;
	}
	public String getCondSeq() {
		return condSeq;
	}
	public void setCondSeq(String condSeq) {
		this.condSeq = condSeq;
	}
	public String getCondLvl() {
		return condLvl;
	}
	public void setCondLvl(String condLvl) {
		this.condLvl = condLvl;
	}
	public String getCondLvlCd() {
		return condLvlCd;
	}
	public void setCondLvlCd(String condLvlCd) {
		this.condLvlCd = condLvlCd;
	}
	public List<String> getCondList() {
		return condList;
	}
	public void setCondList(List<String> condList) {
		this.condList = condList;
	}
	public String getCondDiv() {
		return condDiv;
	}
	public void setCondDiv(String condDiv) {
		this.condDiv = condDiv;
	}
	public String getCondType() {
		return condType;
	}
	public void setCondType(String condType) {
		this.condType = condType;
	}


}
