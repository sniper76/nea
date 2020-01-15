package ony.framework.util.upload;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ony.cmm.common.bean.FileBean;
import ony.framework.BaseConfig;
import ony.framework.SystemException;
import ony.framework.util.FileUtil;
import ony.framework.util.KeyGenerateUtil;


public class UploadHelper {
  /** 웹요청 객체 */
  private HttpServletRequest  request;

  /** 업로드 디렉토리 경로 */
  private String        baseDir;

  /** 업무모듈이름 */
  private String        bizName;

  /** 업무모듈의 하위 업무이름 */
  private String        subName;

  /** 웹 요청 파라미터 */
  @SuppressWarnings("rawtypes")
  private Map         paramMap;

  /** 저장된 파일목록 */
  private List<FileBean>    fileList;


  /**
   * 새로운 upload helper를 생성하는 생성자.
   *
   * @param request 웹요청 객체
   * @param bizName 모듈이름
   * @param subName 모듈의 하위 이름
   * @param baseDir 저장된 파일목록
   */
  public UploadHelper(HttpServletRequest request, String baseDir, String bizName, String subName) {
    this.request  = request;
    this.baseDir  = baseDir;
    this.bizName  = bizName;
    this.subName  = subName;
  }

  /**
   * 파일을 저장한다.
   */
  public void upload() {
    // 조건체크
    if (!(request instanceof MultipartHttpServletRequest)) {
      throw new IllegalArgumentException(
          "please 'multipart/form-data' enc-type for your form.");
    }

    try {
        // 파일저장
      MultipartHttpServletRequest  multipartRequest = (MultipartHttpServletRequest)request;
      this.paramMap = multipartRequest.getParameterMap();
      parseMultipart(multipartRequest);
        } catch (Exception e) {
            throw new SystemException(e);
        }
  }

  /**
   * 저장된 파일정보를 가지고 아래와 같은 JSON 문자열을 생성한다.<br/>
   * [{"serverFileName":"a5feeb41-c28b-4fe1-b13c-f064dca0cc3a","originFileName":"원본이미지.jpg",
   * "contentType":"image/jpeg","fileExt":"jpg","fileSize":786512,"fileUrl":"/board/2012/11/08",
   * "moduleName":"menu"}]
   *
   * @return JSON 문자열
   */
  public String getResponseJSON() {
    JSONArray jArray  = new JSONArray();

    for (FileBean file : this.fileList) {
      jArray.add(makeJSONObjectByDefault(file));
    }
    return jArray.toString();
  }

  public JSONArray getResponseJSONArray() {
    JSONArray jArray  = new JSONArray();

    for (FileBean file : this.fileList) {
      jArray.add(makeJSONObjectByDefault(file));
    }
    return jArray;
  }

  /**
   * 저장된 파일정보를 설정.
   *
   * @param file 파일정보
   * @return the jSON object
   */
  public JSONObject makeJSONObjectByDefault(FileBean file) {
    JSONObject  jObj  = new JSONObject();
    jObj.put("saveNm"        , file.getSaveNm());
    jObj.put("originalNm"    , file.getOriginalNm());
    jObj.put("contentType"   , file.getContentType());
    jObj.put("fileExtension" , file.getFileExtension());
    jObj.put("fileSize"      , file.getFileSize());
    jObj.put("saveFilePath"  , file.getSaveFilePath());
    jObj.put("bizName"       , file.getBizName());
    return jObj;
  }

  /**
   * 파일목록을 생성한다.
   *
   * @param multipartRequest the multipart request
   * @throws IOException Signals that an I/O exception has occurred.
   */


  private void parseMultipart(MultipartHttpServletRequest multipartRequest) throws IOException {

     //폴더 만들기
     String  fileUrl = makeFileUrl(this.bizName, this.subName);
     Iterator<String> iter = multipartRequest.getFileNames();
     while (iter.hasNext()) {
      String fileName = (String) iter.next();

      List<MultipartFile> getFileList = multipartRequest.getFiles(fileName);
      this.fileList = new ArrayList<FileBean>();
          for(int i = 0; i<getFileList.size(); i++){
             MultipartFile mpf = getFileList.get(i);
             FileBean    file    = new FileBean();

             file.setOriginalNm(mpf.getOriginalFilename());
             file.setSaveNm(KeyGenerateUtil.getUUID() + "." + FileUtil.getFileType(mpf.getOriginalFilename()));
             file.setFileSize( String.valueOf(mpf.getSize()) );
             file.setSaveFilePath(fileUrl);
             file.setFileExtension(FileUtil.getFileType(mpf.getOriginalFilename()));
             file.setContentType(mpf.getContentType());
             file.setBizName(this.bizName);
             fileList.add(file);
             this.write(mpf, file);

             //System.out.println("###############################################");
             //System.out.println("####file.getSaveNm() : " + file.getSaveNm());
             //System.out.println("###############################################");
          }
     }
  }

  /**
   * 파일 저장경로를 생성한다.
   *
   * @param bizName 업무분류명
   * @param subName 하위업무분류명
   * @return 파일 저장경로
   */
  private String makeFileUrl(String bizName, String subName) {
    File fDir = new File(BaseConfig.getValue("fileUploadDir")+BaseConfig.getValue("fileUploadUrl")+BaseConfig.getValue("SEPARATOR")+bizName);
    if(!fDir.exists()){
      fDir.mkdirs();
    }
    String fileUrl =BaseConfig.getValue("SEPARATOR")+bizName;
    return fileUrl;
  }

  /**
   * 파일을 디스크에 저장한다.
   *
   * @param mfile 멀티파트 파일
   * @param file 변환된 파일정보
   * @throws IOException Signals that an I/O exception has occurred.
   */
  private void write(MultipartFile mfile, FileBean file) throws IOException {
    File  destFile  = new File(this.baseDir + file.getSaveFilePath(),
        file.getSaveNm());
        mfile.transferTo(destFile);
  }

  /**
   * 웹 요청 파라미터를 반환한다.
   *
   * @return 웹 요청 파라미터
   */
  @SuppressWarnings("rawtypes")
  public Map getParamMap() {
    return paramMap;
  }

  /**
   * 웹 요청 파라미터를 등록한다.
   *
   * @param paramMap 웹 요청 파라미터
   */
  @SuppressWarnings("rawtypes")
  public void setParamMap(Map paramMap) {
    this.paramMap = paramMap;
  }

  /**
   * 저장된 파일목록을 반환한다.
   *
   * @return 저장된 파일목록
   */
  public List<FileBean> getFileList() {
    return fileList;
  }

  /**
   * 저장된 파일목록을 등록한다.
   *
   * @param fileList 저장된 파일목록
   */
  public void setFileList(List<FileBean> fileList) {
    this.fileList = fileList;
  }
}
