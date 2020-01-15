package ony.cmm.common.bean;

import java.util.List;

/**
 * bean 공통정보를 담는 bean
 *
 * @author 우성택
 * @version 1.0
 * @since 2019.01.02
 */
public class CommDtlCdBean extends CommonBean{

	private String dtlCd = "";
	private String grpCd = "";
	private String cdKhNm = "";
	private String cdEnNm = "";
	private String cdContent = "";
	private String useYn = "";
	private String sort = "";
	private String cdNm = "";

	private List<CommDtlCdBean> list;

	public String getDtlCd() {
		return dtlCd;
	}
	public void setDtlCd(String dtlCd) {
		this.dtlCd = dtlCd;
	}
	public String getGrpCd() {
		return grpCd;
	}
	public void setGrpCd(String grpCd) {
		this.grpCd = grpCd;
	}
	public String getCdKhNm() {
		return cdKhNm;
	}
	public void setCdKhNm(String cdKhNm) {
		this.cdKhNm = cdKhNm;
	}
	public String getCdEnNm() {
		return cdEnNm;
	}
	public void setCdEnNm(String cdEnNm) {
		this.cdEnNm = cdEnNm;
	}
	public String getCdContent() {
		return cdContent;
	}
	public void setCdContent(String cdContent) {
		this.cdContent = cdContent;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public List<CommDtlCdBean> getList() {
		return list;
	}
	public void setList(List<CommDtlCdBean> list) {
		this.list = list;
	}
	public String getCdNm() {
		return cdNm;
	}
	public void setCdNm(String cdNm) {
		this.cdNm = cdNm;
	}



}
