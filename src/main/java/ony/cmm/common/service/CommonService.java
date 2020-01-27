package ony.cmm.common.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
import ony.cpes.external.jobcenter.bean.JobCenterBean;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.mypage.compny.bean.VideoIntvwPatcptnBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;

public interface CommonService {



	/**
	 * 공토코드 조회
	 * common code search
	 * @param param
	 * @return List<CommDtlCdBean>
	 */
	public List<CommDtlCdBean> selectCommCdList(ConditionBean param) throws Exception;


	/**
	 * 회원정보 조회
	 * member info search
	 * @param param
	 * @return MemberBean
	 */
	public MemberBean selectMemberInfo(ConditionBean param) throws Exception;


	/**
	 * 북마크 저장
	 * insert bookmark
	 * @param param
	 * @return String
	 */
	public String insertBookMark(BookMarkBean param) throws Exception;

	/**
	 * 좋아요 저장
	 * insert like
	 * @param param
	 * @return MemberBean
	 */
	public int insertLike(LikeBean param) throws Exception;

	/**
	 * 지역정보 depth 별 조회
	 * @param param
	 * @return
	 */
	public List<LocCdBean> selectLocCdList(ConditionBean param) throws Exception;

	/**
	 * bookmark 삭제
	 * @param param
	 * @return
	 */
	public int deleteBookMark(BookMarkBean param) throws Exception;

	/**
	 * 직종 코드 검색
	 * @param param
	 * @return
	 */
	public List<CommonBean> selectIscoCdList(ConditionBean param) throws Exception;
	public List<CommonBean> selectCommonLocCdList(ConditionBean param)throws Exception;

	public int insertOffer(OfferBean param) throws Exception;

	public int deleteLike(LikeBean param) throws Exception;

	public int insertAttachFiles(FileBean param) throws Exception;

	public List<FileBean> selectAttachFilesList(FileBean param) throws Exception;

	public int deleteAttachFiles(FileBean param) throws Exception;

	//public String inserCommonFile(MultipartHttpServletRequest multipartHttpServletRequest, String fileGrpSeq);
	public String inserCommonFile(MultipartFile uploadFile, String fileGrpSeq, String regUserSeq) throws Exception;

	public FileBean selectAttachFiles(FileBean param) throws Exception;

	public int updateMemberImg(MemberBean param) throws Exception;


	/**
	 * 학위 레벨별 조회
	 * @param param
	 * @return List<IscedCdBean>
	 */
	public List<IscedCdBean> selectIscedCdList(ConditionBean param) throws Exception;;


	/**
	 * 사업분류 레벨별 조회
	 * @param param
	 * @return List<IsicCdBean>
	 */
	public List<IsicCdBean> selectIsicCdList(ConditionBean param) throws Exception;

	/**
	 * 북마크 일괄삭제
	 * @param param
	 * @return int
	 */
	public int deleteBookMarkList(BookMarkBean param) throws Exception;

	public String dext5UploadInsert(String param, String userSeq, String fileGrpSeq) throws Exception;

	public String inserCommonFile(MultipartFile uploadFile, String fileGrpSeq, String regUserSeq, String seq, String flag) throws Exception;

	public List<CommonBean> select2CommonLocCdList(ConditionBean conditionBean) throws Exception;

	public MemberBean selectMemberInfoByUserSeq(ConditionBean param) throws Exception;

	public List<String> selectBanWordList() throws Exception;

    /**
    *
    * @param param
    * @return
    * @throws Exception
    */
   public SmsBean insertSmsLog(SmsBean param) throws Exception;

   /**
    * 잡센터 코드 목록
    * @param param
    * @return
    * @throws Exception
    */
   public List<JobCenterBean> selectJobCenterCdList(ConditionBean param) throws Exception;


	/**
	 * 화상면접 상세
	 * video intview deail
	 * @param param
	 * @return VideoIntvwPatcptnBean
	 */
	public VideoIntvwPatcptnBean selectVideoIntvw(ConditionBean param) throws Exception;

}
