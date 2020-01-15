package ony.cmm.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cmm.common.bean.BookMarkBean;
import ony.cmm.common.bean.CommDtlCdBean;
import ony.cmm.common.bean.CommonBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.bean.FileBean;
import ony.cmm.common.bean.IscedCdBean;
import ony.cmm.common.bean.IsicCdBean;
import ony.cmm.common.bean.LikeBean;
import ony.cmm.common.bean.LocCdBean;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;


@Repository("CommDAO")
public class CommDAO extends EgovAbstractMapper{


	/**
	 * 공토코드 조회
	 * common code search
	 * @param param
	 * @return List<CommDtlCdBean>
	 */
	public List<CommDtlCdBean> selectCommCdList(ConditionBean param) {
        return getSqlSession().selectList("comm.selectCommCdList", param);
    }


	/**
	 * 회원정보 조회
	 * member info search
	 * @param param
	 * @return MemberBean
	 */
	public MemberBean selectMemberInfo(ConditionBean param) {
		return getSqlSession().selectOne("comm.selectMemberInfo", param);
    }


	/**
	 * 좋아요(북마크) 저장
	 * insert like(bookmark)
	 * @param param
	 * @return int
	 */
	public int insertBookMark(BookMarkBean param) {
		return getSqlSession().insert("setComm.insertBookMark", param);
    }


	/**
	 * 상담게시판 좋아요 수정
	 * update counsel like cnt
	 * @param param
	 * @return int
	 */
	public int updateCounselLikeCnt(LikeBean param) {
		return getSqlSession().update("setComm.updateCounselLikeCnt", param);
	}


	/**
	 * 게시판 좋아요 수정
	 * update bulletin like cnt
	 * @param param
	 * @return int
	 */
	public int updateBulletinLikeCnt(LikeBean param) {
		return getSqlSession().update("setComm.updateBulletinLikeCnt", param);
	}


	/**
	 * 좋아요 저장
	 * insert like
	 * @param param
	 * @return MemberBean
	 */
	public int insertLike(LikeBean param) {
		return getSqlSession().insert("setComm.insertLike", param);
    }

	/**
	 * 기업 북마크 수정
	 * update company bookmark cnt
	 * @param param
	 * @return int
	 */
	public int updateCompanyBookMarkCnt(BookMarkBean param) {
		return getSqlSession().update("setComm.updateCompanyBookMarkCnt", param);
	}

	/**
	 * 지역정보 depth 별 조회
	 * @param param
	 * @return
	 */
	public List<LocCdBean> selectLocCdList(ConditionBean param){
		return getSqlSession().selectList("comm.selectLocCdList", param);
	}


	/**
	 * UUID GET
	 * @param param
	 * @return int
	 */
	public String selectUUID(ConditionBean param) {
        return getSqlSession().selectOne("member.selectUUID", param);
    }

	/**
	 * bookmark 삭제
	 * @param param
	 * @return
	 */
	public int deleteBookMark(BookMarkBean param) {
		return getSqlSession().delete("setComm.deleteBookMark", param);
	}

	/**
	 * 직종 코드 검색
	 * @param param
	 * @return
	 */
	public List<CommonBean> selectIscoCdList(ConditionBean param){
		return getSqlSession().selectList("comm.selectIscoCdList", param);
	}

	public List<CommonBean> selectCommonLocCdList(ConditionBean param){
		return getSqlSession().selectList("comm.selectCommonLocCdList", param);
	}


	/**
	 * 채용공고 북마크 수정
	 * update company bookmark cnt
	 * @param param
	 * @return int
	 */
	public int updateVacancyBookMarkCnt(BookMarkBean param) {
		return getSqlSession().update("setComm.updateVacancyBookMarkCnt", param);
	}

	/**
	 * 채용행사 북마크 수정
	 * update company bookmark cnt
	 * @param param
	 * @return int
	 */
	public int updateFairBookMarkCnt(BookMarkBean param) {
		return getSqlSession().update("setComm.updateFairBookMarkCnt", param);
	}


	/**
	 * 기관 북마크 수정
	 * update company bookmark cnt
	 * @param param
	 * @return int
	 */
	public int updateInsttBookMarkCnt(BookMarkBean param) {
		return getSqlSession().update("setComm.updateInsttBookMarkCnt", param);
	}


	/**
	 * 교육훈련 북마크 수정
	 * update company bookmark cnt
	 * @param param
	 * @return int
	 */
	public int updateTrnngBookMarkCnt(BookMarkBean param) {
		return getSqlSession().update("setComm.updateTrnngBookMarkCnt", param);
	}

	/**
	 * 입사제의 공통
	 * @param param
	 * @return
	 */
	public int insertOffer(OfferBean param) {
		return getSqlSession().update("setComm.insertOffer", param);
	}

	/**
	 * 좋아요 삭제
	 * @param param
	 * @return
	 */
	public int deleteLike(LikeBean param) {
		return getSqlSession().delete("setComm.deleteLike", param);
	}

	/**
	 * 좋아요 카운트 감소
	 * @param param
	 * @return
	 */
	public int updateCounselLikeDecreaseCnt(LikeBean param) {
		return getSqlSession().update("setComm.updateCounselLikeDecreaseCnt", param);
	}

	public int updateBulletinLikeDecreaseCnt(LikeBean param) {
		return getSqlSession().update("setComm.updateBulletinLikeDecreaseCnt", param);
	}

	public int insertAttachFiles(FileBean param) {
		return getSqlSession().update("setComm.insertAttachFiles", param);
	}

	public List<FileBean> selectAttachFilesList(FileBean param){
		return getSqlSession().selectList("comm.selectAttachFilesList", param);
	}

	public int deleteAttachFiles(FileBean param) {
		return getSqlSession().delete("setComm.deleteAttachFiles", param);
	}

	public FileBean selectAttachFiles(FileBean param) {
		return getSqlSession().selectOne("comm.selectAttachFiles", param);
	}

	public int updateMemberImg(MemberBean param) {
		return getSqlSession().update("setMember.updateMemberImg", param);
	}

	/**
	 * 학위 레벨별 조회
	 * @param param
	 * @return List<IscedCdBean>
	 */
	public List<IscedCdBean> selectIscedCdList(ConditionBean param) {
		return getSqlSession().selectList("comm.selectIscedCdList", param);
	}

	/**
	 * 사업분류 레벨별 조회
	 * @param param
	 * @return List<IsicCdBean>
	 */
	public List<IsicCdBean> selectIsicCdList(ConditionBean param) {
		return getSqlSession().selectList("comm.selectIsicCdList", param);
	}

	public MemberBean selectMemberInfoByUserSeq(ConditionBean param) {
		return getSqlSession().selectOne("comm.selectMemberInfoByUserSeq", param);
	}

	public List<String> selectBanWordList(){
		return getSqlSession().selectList("comm.selectBanWordList");
	}

}
