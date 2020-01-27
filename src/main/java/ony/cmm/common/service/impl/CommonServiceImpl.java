package ony.cmm.common.service.impl;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.BookMarkBean;
import ony.cmm.common.bean.CommDtlCdBean;
import ony.cmm.common.bean.CommonBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.bean.FileBean;
import ony.cmm.common.bean.IscedCdBean;
import ony.cmm.common.bean.IsicCdBean;
import ony.cmm.common.bean.LikeBean;
import ony.cmm.common.bean.LocCdBean;
import ony.cmm.common.bean.SmsBean;
import ony.cmm.common.dao.CommDAO;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.EncryptUtil;
import ony.cpes.external.jobcenter.bean.JobCenterBean;
import ony.cpes.external.jobstudy.bean.JobStudyBean;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.mypage.compny.bean.VideoIntvwPatcptnBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;
import ony.cpes.external.mypage.privt.bean.ResumeBean;
import ony.cpes.external.mypage.privt.dao.ResumeDAO;
import ony.cpes.external.mypage.privt.service.ResumeService;
import ony.framework.BaseConfig;
import ony.framework.util.FileUtil;
import ony.framework.util.KeyGenerateUtil;
import ony.framework.util.StringUtil;


@Service("CommonService")
public class CommonServiceImpl implements CommonService {


	@Autowired
	private CommDAO commDAO;

	@Autowired
	private ResumeDAO resumeDAO;

	@Autowired SessionLocaleResolver localeResolver;

    @Autowired MessageSource messageSource;


	/**
	 * 공통코드 조회
	 * common code search
	 * @param param
	 * @return List<CommDtlCdBean>
	 */
    @Override
	public List<CommDtlCdBean> selectCommCdList(ConditionBean param)  throws Exception {
		return commDAO.selectCommCdList(param);
	}


	/**
	 * 회원정보 조회
	 * member info search
	 * @param param
	 * @return MemberBean
	 */
    @Override
	public MemberBean selectMemberInfo(ConditionBean param)  throws Exception {
		return commDAO.selectMemberInfo(param);
	}


	/**
	 * 북마크 저장
	 * insert like(bookmark)
	 * @param param
	 * @return String
	 */
    @Override
	public String insertBookMark(BookMarkBean param) throws Exception {
		String uuid = "";
    	ConditionBean conditionBean = new ConditionBean();
    	uuid = commDAO.selectUUID(conditionBean);
    	param.setBkmkSeq(uuid);

    	try {
	    	int result = commDAO.insertBookMark(param);

	    	if(result > 0) {
		    	if(StringUtils.equals(ConstVal.BKMK_CATE_CD_COMPNY_VAL,param.getCateCd())) {
		    		result += commDAO.updateCompanyBookMarkCnt(param);
		    	} else if(StringUtils.equals(ConstVal.BKMK_CATE_CD_VACANCY_VAL,param.getCateCd())) {
		    		result += commDAO.updateVacancyBookMarkCnt(param);
		    	} else if(StringUtils.equals(ConstVal.BKMK_CATE_CD_FAIR_VAL,param.getCateCd())) {
		    		result += commDAO.updateFairBookMarkCnt(param);
		    	} else if(StringUtils.equals(ConstVal.BKMK_CATE_CD_INSTT_VAL,param.getCateCd())) {
		    		result += commDAO.updateInsttBookMarkCnt(param);
		    	} else if(StringUtils.equals(ConstVal.BKMK_CATE_CD_TRNNG_VAL,param.getCateCd())) {
		    		result += commDAO.updateTrnngBookMarkCnt(param);
		    	} else if(StringUtils.equals(ConstVal.BKMK_CATE_CD_NEA_TRNNG_VAL,param.getCateCd())) {
		    		result += commDAO.updateTrnngBookMarkCnt(param);
		    	}
	    	}
    	} catch(Exception e) {
    		uuid = "";
    	}
    	return uuid;

	}



	/**
	 * 좋아요 저장
	 * insert like
	 * @param param
	 * @return MemberBean
	 */
    @Override
	public int insertLike(LikeBean param) throws Exception {
    	int result = commDAO.insertLike(param);
    	if(StringUtils.equals(ConstVal.LIKE_CATE_CD_COUNSEL_VAL,param.getCateCd())) {
    		result += commDAO.updateCounselLikeCnt(param);
    	} else if(StringUtils.equals(ConstVal.LIKE_CATE_CD_BULLETIN_VAL,param.getCateCd()) || StringUtils.equals(ConstVal.LIKE_CATE_CD_COMMUNITY_VAL,param.getCateCd())) {
    		result += commDAO.updateBulletinLikeCnt(param);
    	}

    	return result;
	}


	@Override
	public List<LocCdBean> selectLocCdList(ConditionBean param) throws Exception {
		return commDAO.selectLocCdList(param);
	}


	@Override
	public int deleteBookMark(BookMarkBean param) throws Exception {
		int result = commDAO.deleteBookMark(param);

		if(result > 0) {
			param.setDiv(ConstVal.DEL_VAL);
	    	if(StringUtils.equals(ConstVal.BKMK_CATE_CD_COMPNY_VAL,param.getCateCd())) {
	    		result += commDAO.updateCompanyBookMarkCnt(param);
	    	} else if(StringUtils.equals(ConstVal.BKMK_CATE_CD_VACANCY_VAL,param.getCateCd())) {
	    		result += commDAO.updateVacancyBookMarkCnt(param);
	    	} else if(StringUtils.equals(ConstVal.BKMK_CATE_CD_FAIR_VAL,param.getCateCd())) {
	    		result += commDAO.updateFairBookMarkCnt(param);
	    	} else if(StringUtils.equals(ConstVal.BKMK_CATE_CD_INSTT_VAL,param.getCateCd())) {
	    		result += commDAO.updateInsttBookMarkCnt(param);
	    	} else if(StringUtils.equals(ConstVal.BKMK_CATE_CD_TRNNG_VAL,param.getCateCd())) {
	    		result += commDAO.updateTrnngBookMarkCnt(param);
	    	} else if(StringUtils.equals(ConstVal.BKMK_CATE_CD_NEA_TRNNG_VAL,param.getCateCd())) {
	    		result += commDAO.updateTrnngBookMarkCnt(param);
	    	}
		}

    	return result;
	}


	@Override
	public List<CommonBean> selectIscoCdList(ConditionBean param) throws Exception {
		return commDAO.selectIscoCdList(param);
	}


	@Override
	public List<CommonBean> selectCommonLocCdList(ConditionBean param) throws Exception {
		return commDAO.selectCommonLocCdList(param);
	}


	@Override
	public int insertOffer(OfferBean param) throws Exception {
		return commDAO.insertOffer(param);
	}


	@Override
	public int deleteLike(LikeBean param) throws Exception {
		int result = commDAO.deleteLike(param);
    	if(StringUtils.equals(ConstVal.LIKE_CATE_CD_COUNSEL_VAL,param.getCateCd())) {
    		result += commDAO.updateCounselLikeDecreaseCnt(param);
    	} else if(StringUtils.equals(ConstVal.LIKE_CATE_CD_BULLETIN_VAL,param.getCateCd()) || StringUtils.equals(ConstVal.LIKE_CATE_CD_COMMUNITY_VAL,param.getCateCd())) {
    		result += commDAO.updateBulletinLikeDecreaseCnt(param);
    	}

    	return result;
	}


	@Override
	public int insertAttachFiles(FileBean param) throws Exception {
		return commDAO.insertAttachFiles(param);
	}


	@Override
	public List<FileBean> selectAttachFilesList(FileBean param) throws Exception {
		return commDAO.selectAttachFilesList(param);
	}


	@Override
	public int deleteAttachFiles(FileBean param) throws Exception {
		return commDAO.deleteAttachFiles(param);
	}


	/*@Override
	public String inserCommonFile(MultipartHttpServletRequest multipartHttpServletRequest, String fileGrpSeq) {
		String result = "";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String uploadPath = BaseConfig.getValue("fileUploadDir") + BaseConfig.getValue("SEPARATOR") + sdf.format(new Date());//저장경로

        try {
        	// 폴더 생성
            File fDir = new File(uploadPath);

            if (!fDir.exists()) {
    			fDir.mkdirs();
    		}

    		Iterator<String> iter = multipartHttpServletRequest.getFileNames();
    		while (iter.hasNext()) {
    			String fileName = (String) iter.next();

    			List<MultipartFile> getFileList = multipartHttpServletRequest.getFiles(fileName);
    			for (MultipartFile mpf : getFileList) {
    				FileBean file = new FileBean();
    				file.setOriginalNm(mpf.getOriginalFilename());
    				String saveNm = (KeyGenerateUtil.getUUID()).replaceAll("-", "") + "." + FileUtil.getFileType(mpf.getOriginalFilename());
    				file.setSaveNm(saveNm);
    				file.setFileSize(String.valueOf(mpf.getSize()));
    				file.setFileExtension(FileUtil.getFileType(mpf.getOriginalFilename()));
    				file.setContentType(mpf.getContentType());
    				file.setFileGrpSeq(fileGrpSeq);

    				File destFile = new File(uploadPath, saveNm);
    				mpf.transferTo(destFile);

    				commDAO.insertAttachFiles(file);
    				result = file.getFileSeq();
    			}
    		}
        } catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}*/

	@Override
	public String inserCommonFile(MultipartFile uploadFile, String fileGrpSeq, String regUserSeq) throws Exception {
		String result = "";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String uploadPath = BaseConfig.getValue("fileUploadDir") + BaseConfig.getValue("SEPARATOR") + sdf.format(new Date());//저장경로

        try {
        	// 기존에 등록되어 있는 파일 삭제
        	ConditionBean conditionBean = new ConditionBean();
            conditionBean.setCondUserSeq(regUserSeq);
          	MemberBean memberBean = commDAO.selectMemberInfoByUserSeq(conditionBean);

          	FileBean fileBean = new FileBean();

          	if(!StringUtil.isEmpty(memberBean.getFileGrpSeq())) {
          		fileBean.setFileSeq(memberBean.getFileGrpSeq());
          	}else if(!StringUtil.isEmpty(memberBean.getLogoFileGrpSeq())){
          		fileBean.setFileSeq(memberBean.getLogoFileGrpSeq());
          	}else if(!StringUtil.isEmpty(memberBean.getInsttLogoFileGrpSeq())) {
          		fileBean.setFileSeq(memberBean.getInsttLogoFileGrpSeq());
          	}

          	if(!StringUtil.isEmpty(fileBean.getFileSeq())) {
          		fileBean = commDAO.selectAttachFiles(fileBean);

          		File deleteFile = new File(fileBean.getSaveFilePath());
              	if(deleteFile.exists()) {
              		deleteFile.delete();
              		commDAO.deleteAttachFiles(fileBean);
              	}
          	}

        	// 폴더 생성
            File fDir = new File(uploadPath);

            if (!fDir.exists()) {
    			fDir.mkdirs();
    		}

            FileBean file = new FileBean();
			file.setOriginalNm(uploadFile.getOriginalFilename());
			String saveNm = (KeyGenerateUtil.getUUID()).replaceAll("-", "") + "." + FileUtil.getFileType(uploadFile.getOriginalFilename());
			file.setSaveNm(saveNm);
			file.setSaveFilePath(uploadPath + BaseConfig.getValue("SEPARATOR") + saveNm);
			file.setFileSize(String.valueOf(uploadFile.getSize()));
			file.setFileExtension(FileUtil.getFileType(uploadFile.getOriginalFilename()));
			file.setContentType(uploadFile.getContentType());
			file.setFileGrpSeq(fileGrpSeq);
			file.setRegUserSeq(regUserSeq);

			File destFile = new File(uploadPath, saveNm);
			uploadFile.transferTo(destFile);

			commDAO.insertAttachFiles(file);
			result = file.getFileSeq();

        } catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}


	@Override
	public FileBean selectAttachFiles(FileBean param) throws Exception {
		return commDAO.selectAttachFiles(param);
	}


	@Override
	public int updateMemberImg(MemberBean param) throws Exception {
		return commDAO.updateMemberImg(param);
	}

	/**
	 * 학위 레벨별 조회
	 * @param param
	 * @return List<IscedCdBean>
	 */
	@Override
	public List<IscedCdBean> selectIscedCdList(ConditionBean param)  throws Exception {
		return commDAO.selectIscedCdList(param);
	}


	/**
	 * 사업분류 레벨별 조회
	 * @param param
	 * @return List<IsicCdBean>
	 */
	@Override
	public List<IsicCdBean> selectIsicCdList(ConditionBean param) throws Exception {
		return commDAO.selectIsicCdList(param);
	}

	/**
	 * 북마크 일괄삭제
	 * @param param
	 * @return int
	 */
	@Override
	public int deleteBookMarkList(BookMarkBean param) throws Exception {
		int result = 0;

		if(!StringUtil.isEmpty(param) && !StringUtil.isEmpty(param.getBkmkSeqStr())) {
			String[] seqArr = param.getBkmkSeqStr().split(ConstVal.COMMA_VAL);

			for(String seq: seqArr) {
				param.setBkmkSeq(seq);
				result = result + commDAO.deleteBookMark(param);
			}

		}

		return result;
	}


	@Override
	public String dext5UploadInsert(String param, String userSeq, String fileGrpSeq) throws Exception {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Map<String, List<String>>> fileList = mapper.readValue(param, new TypeReference<Map<String, Map<String, List<String>>>>(){});

		Map<String, List<String>> oldList = fileList.get("webFile");
		int oldListSize = oldList.get("originalName").size();
		List<FileBean> oldFileList = null;

		if(!StringUtil.isEmpty(fileGrpSeq)) {
			FileBean checkFileBean = new FileBean();
			checkFileBean.setFileGrpSeq(fileGrpSeq);
			oldFileList = commDAO.selectAttachFilesList(checkFileBean);

			for(FileBean fb : oldFileList) {
				boolean flag = false;
				for(int i = 0; i<oldListSize; i++) {
					String oldListKey = oldList.get("uniqKey").get(i);

					if(fb.getFileSeq().equals(oldListKey)) {
						flag = true;
					}
				}

				if(!flag) {
					File deleteFile = new File(fb.getSaveFilePath());
	              	if(deleteFile.exists()) {
	              		deleteFile.delete();
	    				commDAO.deleteAttachFiles(fb);
	              	}
				}
			}
		}

		Map<String, List<String>> newList = fileList.get("newFile");
		int listSize = newList.get("originalName").size();

		for(int i = 0; i<listSize; i++) {
			FileBean fileBean = new FileBean();
			fileBean.setOriginalNm(newList.get("originalName").get(i));
			fileBean.setSaveNm(newList.get("uploadName").get(i));
			fileBean.setSaveFilePath(newList.get("uploadPath").get(i));
			fileBean.setFileSize(newList.get("size").get(i));
			fileBean.setRegUserSeq(userSeq);

			String extension = newList.get("extension").get(i).toLowerCase();
			fileBean.setFileExtension(extension);

			if(StringUtil.isEmpty(fileGrpSeq)) {
				ConditionBean conditionBean = new ConditionBean();
				fileGrpSeq = commDAO.selectUUID(conditionBean);
			}
			fileBean.setFileGrpSeq(fileGrpSeq);

			commDAO.insertAttachFiles(fileBean);
		}

		return fileGrpSeq;
	}


	@Override
	public String inserCommonFile(MultipartFile uploadFile, String fileGrpSeq, String regUserSeq, String seq, String flag)
			throws Exception {

		FileBean fileBean = new FileBean();

		if(!StringUtil.isEmpty(seq)) {
			// 기존에 등록되어 있는 파일 삭제
			if("resume".equals(flag)) {
				ResumeBean resumeBean = new ResumeBean();
				resumeBean.setResumeSeq(seq);
				resumeBean = resumeDAO.selectResumeDetail(resumeBean);
				fileBean.setFileSeq(resumeBean.getFileGrpSeq());
			}

	      	if(!StringUtil.isEmpty(fileBean.getFileSeq())) {
	      		fileBean = commDAO.selectAttachFiles(fileBean);

	      		File deleteFile = new File(fileBean.getSaveFilePath());
	          	if(deleteFile.exists()) {
	          		deleteFile.delete();
	          		commDAO.deleteAttachFiles(fileBean);
	          	}
	      	}
		}

		return inserCommonFile(uploadFile, fileGrpSeq, regUserSeq);
	}


	@Override
	public List<CommonBean> select2CommonLocCdList(ConditionBean conditionBean) {
		if(StringUtil.isEmpty(conditionBean.getDepth())) {
			conditionBean.setDepth("0");
		}
		List<CommonBean> result = commDAO.selectCommonLocCdList(conditionBean);

		for(CommonBean commonBean : result) {
			if("0".equals(conditionBean.getDepth())) {
				conditionBean.setDepth("99");
			}else if("1".equals(conditionBean.getDepth())) {
				conditionBean.setDepth("2");
			}
			conditionBean.setCondGrpCd(commonBean.getCd());
			conditionBean.setCdLength(String.valueOf(commonBean.getCd().length()));
			commonBean.setCommonList(commDAO.selectCommonLocCdList(conditionBean));
		}

		return result;
	}


	@Override
	public MemberBean selectMemberInfoByUserSeq(ConditionBean param) {
		return commDAO.selectMemberInfoByUserSeq(param);
	}


	@Override
	public List<String> selectBanWordList() {
		return commDAO.selectBanWordList();
	}


	public SmsBean insertSmsLog(SmsBean param) throws Exception {


		String respContent	= "";

		if (param == null) {

		}

		if(param.getSmsUsername() == null || "".equals(param.getSmsUsername())) {

		}

		if(param.getSmsPassword() == null || "".equals(param.getSmsPassword())) {

		}

		if(param.getSmsFrom() == null || "".equals(param.getSmsFrom())) {

		}

		if(param.getSmsTo() == null || "".equals(param.getSmsTo())) {

		}

		String smsUrl = "http://tool.plasgate.com:11040/cgi-bin/sendsms";

		param.setSmsUsername("minlwapi_pop");
		param.setSmsPassword("Mi!kw@81");
		param.setSmsFrom("SMS info");



		int sendResult = commDAO.insertSmsLog(param);

		if(sendResult > 0) {
//			HttpClient httpClient = new DefaultHttpClient();
			HttpPost httpPost = new HttpPost(smsUrl);
			CloseableHttpClient client = HttpClientBuilder.create().build();

			List<NameValuePair> params = new ArrayList<NameValuePair>();

			params.add(new BasicNameValuePair("gw-username", param.getSmsUsername()));
			params.add(new BasicNameValuePair("gw-password", param.getSmsPassword()));
			params.add(new BasicNameValuePair("gw-from", param.getSmsFrom()));
			params.add(new BasicNameValuePair("gw-to", param.getSmsTo()));
			params.add(new BasicNameValuePair("gw-text", param.getSmsText()));

			try {
				httpPost.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				// writing error to Log
				e.printStackTrace();
			}

			try {

				HttpResponse response =    client.execute(httpPost);
				HttpEntity respEntity = response.getEntity();
				if (respEntity != null)
				{
					// EntityUtils to get the reponse content
					respContent = EntityUtils.toString(respEntity);
					Map<String, String> queryMap = getQueryParser(respContent);

					if(queryMap != null && queryMap.get("status") != null) {
						param.setSmsStatus(queryMap.get("status"));
					}
					if(queryMap != null && queryMap.get("err_msg") != null) {
						param.setSmsErrMsg(queryMap.get("err_msg"));
					}
					if(queryMap != null && queryMap.get("msgid") != null) {
						param.setSmsMsgid(queryMap.get("msgid"));
					}


				} else {
					param.setResultCode("9999");
					param.setSmsStatus("9999");
					param.setSmsErrMsg("ERROR");
				}


			} catch (Exception e) {
				param.setResultCode("9999");
				param.setSmsStatus("9999");
				param.setSmsErrMsg(e.toString());

			} finally {
				int result2 = commDAO.updateSmsLog(param);
			}
		}


		return param ;
	}


	public static Map<String, String> getQueryParser(String query) {

        Map<String, String> returnData = new HashMap<String, String>();
        // query is from getQuery()
        StringTokenizer st = new StringTokenizer(query, "&", false);

        while (st.hasMoreElements()) {
            // First Pass to retrive the
            // "parametername=value" combo
            String paramValueToken = st.nextElement().toString();
            // StringTokenizer stParamVal = new StringTokenizer(paramValueToken,"=", false );

            //방식 변경
            String[] strParamVal = paramValueToken.split("=", 2);
            String paramName = strParamVal[0];
            String paramValue = strParamVal[1];
            returnData.put(paramName, paramValue);

             /* int i = 0;
            while (stParamVal.hasMoreElements()) {
                //Second pass to separate the "paramname" and "value".
                // 1st token is param name
                // 2nd token is param value

                String separatedToken = stParamVal.nextElement().toString();

                if ( i== 0) {
                    //This indicates that it is the param name : ex val4,val5 etc
                    paramName = separatedToken;
                } else {
                    // This will hold value of the parameter
                    paramValue = separatedToken;
                }

                i++;
            }*/
        }
        return returnData;

    }

	/**
	 * 잡센터 코드 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<JobCenterBean> selectJobCenterCdList(ConditionBean param) throws Exception {
		return commDAO.selectJobCenterCdList(param);
	}

	/**
	 * 화상면접 상세
	 * video intview deail
	 * @param param
	 * @return VideoIntvwPatcptnBean
	 */
	@Override
	public VideoIntvwPatcptnBean selectVideoIntvw(ConditionBean param) throws Exception {
		return commDAO.selectVideoIntvw(param);
	}

}
