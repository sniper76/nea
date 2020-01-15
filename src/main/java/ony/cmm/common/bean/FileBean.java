package ony.cmm.common.bean;

import java.util.List;

import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;


public class FileBean extends CommonBean{
	private String bizName;
	private int    attachGroupId;
    private int    attachId;
    private String originalNm;
    private String saveNm;
    private String saveFilePath;
   	private String fileExtension;
    private String fileSize;
    private String delYn;
   	private String fileChk;

    private String imgView;

    // CPES_ATTACH_FILES table 관련
    private String fileSeq;
	private String fileGrpSeq;

	/** The content type. */
	private String contentType;




	private String [] files;
	private String [] fileNames;
	private String [] filesExtension;
	private String [] fileSizes;
	private String [] fileChks;
	private String [] attachIds;

	private List<FileBean> list;


	public String getFileSeq() {
		return fileSeq;
	}


	public void setFileSeq(String fileSeq) {
		this.fileSeq = fileSeq;
	}


	public String getFileGrpSeq() {
		return fileGrpSeq;
	}


	public void setFileGrpSeq(String fileGrpSeq) {
		this.fileGrpSeq = fileGrpSeq;
	}


	/**
	 * @return the bizName
	 */
	public String getBizName() {
		return bizName;
	}


	/**
	 * @param bizName the bizName to set
	 */
	public void setBizName(String bizName) {
		this.bizName = bizName;
	}


	/**
	 * @return the attachGroupId
	 */
	public int getAttachGroupId() {
		return attachGroupId;
	}


	/**
	 * @param attachGroupId the attachGroupId to set
	 */
	public void setAttachGroupId(int attachGroupId) {
		this.attachGroupId = attachGroupId;
	}


	/**
	 * @return the attachId
	 */
	public int getAttachId() {
		return attachId;
	}


	/**
	 * @param attachId the attachId to set
	 */
	public void setAttachId(int attachId) {
		this.attachId = attachId;
	}


	/**
	 * @return the originalNm
	 */
	public String getOriginalNm() {
		return originalNm;
	}


	/**
	 * @param originalNm the originalNm to set
	 */
	public void setOriginalNm(String originalNm) {
		this.originalNm = originalNm;
	}


	/**
	 * @return the saveNm
	 */
	public String getSaveNm() {
		return saveNm;
	}


	/**
	 * @param saveNm the saveNm to set
	 */
	public void setSaveNm(String saveNm) {
		this.saveNm = saveNm;
	}


	/**
	 * @return the saveFilePath
	 */
	public String getSaveFilePath() {
		return saveFilePath;
	}


	/**
	 * @param saveFilePath the saveFilePath to set
	 */
	public void setSaveFilePath(String saveFilePath) {
		this.saveFilePath = saveFilePath;
	}


	/**
	 * @return the fileExtension
	 */
	public String getFileExtension() {
		return fileExtension;
	}


	/**
	 * @param fileExtension the fileExtension to set
	 */
	public void setFileExtension(String fileExtension) {
		this.fileExtension = fileExtension;
	}


	/**
	 * @return the fileSize
	 */
	public String getFileSize() {
		return fileSize;
	}


	/**
	 * @param fileSize the fileSize to set
	 */
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}


	/**
	 * @return the delYn
	 */
	public String getDelYn() {
		return delYn;
	}


	/**
	 * @param delYn the delYn to set
	 */
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}


	/**
	 * @return the fileChk
	 */
	public String getFileChk() {
		return fileChk;
	}


	/**
	 * @param fileChk the fileChk to set
	 */
	public void setFileChk(String fileChk) {
		this.fileChk = fileChk;
	}


	/**
	 * @return the contentType
	 */
	public String getContentType() {
		return contentType;
	}


	/**
	 * @param contentType the contentType to set
	 */
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}


	/**
	 * @return the files
	 */
	public String[] getFiles() {
		return files;
	}


	/**
	 * @param files the files to set
	 */
	public void setFiles(String[] files) {
		this.files = files;
	}


	/**
	 * @return the fileNames
	 */
	public String[] getFileNames() {
		return fileNames;
	}


	/**
	 * @param fileNames the fileNames to set
	 */
	public void setFileNames(String[] fileNames) {
		this.fileNames = fileNames;
	}


	/**
	 * @return the filesExtension
	 */
	public String[] getFilesExtension() {
		return filesExtension;
	}


	/**
	 * @param filesExtension the filesExtension to set
	 */
	public void setFilesExtension(String[] filesExtension) {
		this.filesExtension = filesExtension;
	}


	/**
	 * @return the fileSizes
	 */
	public String[] getFileSizes() {
		return fileSizes;
	}


	/**
	 * @param fileSizes the fileSizes to set
	 */
	public void setFileSizes(String[] fileSizes) {
		this.fileSizes = fileSizes;
	}


	/**
	 * @return the fileChks
	 */
	public String[] getFileChks() {
		return fileChks;
	}


	/**
	 * @param fileChks the fileChks to set
	 */
	public void setFileChks(String[] fileChks) {
		this.fileChks = fileChks;
	}


	/**
	 * @return the list
	 */
	public List<FileBean> getList() {
		return list;
	}


	/**
	 * @param list the list to set
	 */
	public void setList(List<FileBean> list) {
		this.list = list;
	}


	/**
	 * @return the attachIds
	 */
	public String[] getAttachIds() {
		return attachIds;
	}


	/**
	 * @param attachIds the attachIds to set
	 */
	public void setAttachIds(String[] attachIds) {
		this.attachIds = attachIds;
	}

	/**
	 * @return the imgView
	 */
	public String getImgView() {
		return imgView;
	}


	/**
	 * @param imgView the imgView to set
	 */
	public void setImgView(String imgView) {
		this.imgView = imgView;
	}


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return ReflectionToStringBuilder.toString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
