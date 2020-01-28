package ony.cmm.common.bean;

import java.util.List;

/**
 * Integrated Search Bean
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
public class CondIntegratedSearchBean extends CommonBean {

	private String condText;
	String[] condTextArr = null;
    List<SynonymBean> synonymList = null;

	public String getCondText() {
		return condText;
	}
	public void setCondText(String condText) {
		if(condText != null && !"".equals(condText.trim())) {
			this.condTextArr = condText.split("[ ]");
		}
		this.condText = condText;
	}
	public String[] getCondTextArr() {
		return condTextArr;
	}
	public void setCondTextArr(String[] condTextArr) {
		this.condTextArr = condTextArr;
	}
	public List<SynonymBean> getSynonymList() {
		return synonymList;
	}
	public void setSynonymList(List<SynonymBean> synonymList) {
		this.synonymList = synonymList;
	}

}
