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
public class CondVacancyBean extends CommonBean {
	private static final long serialVersionUID = 4979179976898050104L;

	private String condText;//검색어
	private ArrayList<String> condJobTypeArr;//직종별
	private ArrayList<String> condAddrCdArr;//지역별
	private String condUserSeq;
	private String condBmkCateCd;
	private String condSeq;
	private String condArea;
	private String condIsco;
	private String condDiv;
	private String condAreaCd;
	private String condDtlText;

	private String condIscoLvlOne;
	private String condIscoLvlTwo;
	private String condIscoLvlThree;
	private String condIscoLvlFour;
	private String condAreaCdLvlOne;
	private String condAreaCdLvlTwo;

	private List<String> condVacancyTypeCd;
	private String condSalAmt;
	private List<String> condPreferEmploymtTypeCd;
	private List<String> condEmployCtrctCd;
	private List<String> minEduDegreeCd;
	private String condMinWorkExp;
	private List<String> condPreferntCondCd;
	private List<String> condlangCd;
	private String condSort;
	private List<String> condMinEduDegreeCd;
	private List<String> condLangCd;
	private int condLimit;

	public String getCondText() {
		return condText;
	}
	public void setCondText(String condText) {
		this.condText = condText;
	}
	public ArrayList<String> getCondJobTypeArr() {
		return condJobTypeArr;
	}
	public void setCondJobTypeArr(ArrayList<String> condJobTypeArr) {
		this.condJobTypeArr = condJobTypeArr;
	}
	public ArrayList<String> getCondAddrCdArr() {
		return condAddrCdArr;
	}
	public void setCondAddrCdArr(ArrayList<String> condAddrCdArr) {
		this.condAddrCdArr = condAddrCdArr;
	}
	public String getCondUserSeq() {
		return condUserSeq;
	}
	public void setCondUserSeq(String condUserSeq) {
		this.condUserSeq = condUserSeq;
	}
	public String getCondBmkCateCd() {
		return condBmkCateCd;
	}
	public void setCondBmkCateCd(String condBmkCateCd) {
		this.condBmkCateCd = condBmkCateCd;
	}
	public String getCondSeq() {
		return condSeq;
	}
	public void setCondSeq(String condSeq) {
		this.condSeq = condSeq;
	}
	public String getCondArea() {
		return condArea;
	}
	public void setCondArea(String condArea) {
		this.condArea = condArea;
	}
	public String getCondIsco() {
		return condIsco;
	}
	public void setCondIsco(String condIsco) {
		this.condIsco = condIsco;
	}
	public String getCondAreaCd() {
		return condAreaCd;
	}
	public void setCondAreaCd(String condAreaCd) {
		this.condAreaCd = condAreaCd;
	}
	public String getCondIscoLvlOne() {
		return condIscoLvlOne;
	}
	public void setCondIscoLvlOne(String condIscoLvlOne) {
		this.condIscoLvlOne = condIscoLvlOne;
	}
	public String getCondIscoLvlTwo() {
		return condIscoLvlTwo;
	}
	public void setCondIscoLvlTwo(String condIscoLvlTwo) {
		this.condIscoLvlTwo = condIscoLvlTwo;
	}
	public String getCondIscoLvlThree() {
		return condIscoLvlThree;
	}
	public void setCondIscoLvlThree(String condIscoLvlThree) {
		this.condIscoLvlThree = condIscoLvlThree;
	}
	public String getCondIscoLvlFour() {
		return condIscoLvlFour;
	}
	public void setCondIscoLvlFour(String condIscoLvlFour) {
		this.condIscoLvlFour = condIscoLvlFour;
	}
	public String getCondAreaCdLvlOne() {
		return condAreaCdLvlOne;
	}
	public void setCondAreaCdLvlOne(String condAreaCdLvlOne) {
		this.condAreaCdLvlOne = condAreaCdLvlOne;
	}
	public String getCondAreaCdLvlTwo() {
		return condAreaCdLvlTwo;
	}
	public void setCondAreaCdLvlTwo(String condAreaCdLvlTwo) {
		this.condAreaCdLvlTwo = condAreaCdLvlTwo;
	}
	public List<String> getCondVacancyTypeCd() {
		return condVacancyTypeCd;
	}
	public void setCondVacancyTypeCd(List<String> condVacancyTypeCd) {
		this.condVacancyTypeCd = condVacancyTypeCd;
	}
	public String getCondSalAmt() {
		return condSalAmt;
	}
	public void setCondSalAmt(String condSalAmt) {
		this.condSalAmt = condSalAmt;
	}
	public List<String> getCondPreferEmploymtTypeCd() {
		return condPreferEmploymtTypeCd;
	}
	public void setCondPreferEmploymtTypeCd(List<String> condPreferEmploymtTypeCd) {
		this.condPreferEmploymtTypeCd = condPreferEmploymtTypeCd;
	}
	public List<String> getCondEmployCtrctCd() {
		return condEmployCtrctCd;
	}
	public void setCondEmployCtrctCd(List<String> condEmployCtrctCd) {
		this.condEmployCtrctCd = condEmployCtrctCd;
	}
	public List<String> getMinEduDegreeCd() {
		return minEduDegreeCd;
	}
	public void setMinEduDegreeCd(List<String> minEduDegreeCd) {
		this.minEduDegreeCd = minEduDegreeCd;
	}
	public String getCondMinWorkExp() {
		return condMinWorkExp;
	}
	public void setCondMinWorkExp(String condMinWorkExp) {
		this.condMinWorkExp = condMinWorkExp;
	}
	public List<String> getCondPreferntCondCd() {
		return condPreferntCondCd;
	}
	public void setCondPreferntCondCd(List<String> condPreferntCondCd) {
		this.condPreferntCondCd = condPreferntCondCd;
	}
	public List<String> getCondlangCd() {
		return condlangCd;
	}
	public void setCondlangCd(List<String> condlangCd) {
		this.condlangCd = condlangCd;
	}
	public String getCondDiv() {
		return condDiv;
	}
	public void setCondDiv(String condDiv) {
		this.condDiv = condDiv;
	}
	public String getCondDtlText() {
		return condDtlText;
	}
	public void setCondDtlText(String condDtlText) {
		this.condDtlText = condDtlText;
	}
	public String getCondSort() {
		return condSort;
	}
	public void setCondSort(String condSort) {
		this.condSort = condSort;
	}
	public List<String> getCondMinEduDegreeCd() {
		return condMinEduDegreeCd;
	}
	public void setCondMinEduDegreeCd(List<String> condMinEduDegreeCd) {
		this.condMinEduDegreeCd = condMinEduDegreeCd;
	}
	public List<String> getCondLangCd() {
		return condLangCd;
	}
	public void setCondLangCd(List<String> condLangCd) {
		this.condLangCd = condLangCd;
	}
	public int getCondLimit() {
		return condLimit;
	}
	public void setCondLimit(int condLimit) {
		this.condLimit = condLimit;
	}



}
