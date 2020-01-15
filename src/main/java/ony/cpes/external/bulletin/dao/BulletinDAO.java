package ony.cpes.external.bulletin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.bulletin.bean.BulletinBean;
import ony.cpes.external.bulletin.bean.BulletinCateBean;
import ony.cpes.external.bulletin.bean.BulletinConfigBean;
import ony.cpes.external.bulletin.bean.CommentBean;
import ony.cpes.external.bulletin.bean.CondBulletinBean;
import ony.cpes.external.counsel.bean.CondCounselBean;


@Repository("BulletinDAO")
public class BulletinDAO extends EgovAbstractMapper {


	/**
	 * 게시판 설정 정보
	 * bulletin config info
	 * @param param
	 * @return BulletinConfigBean
	 */
	public BulletinConfigBean selectBulletinConfig (CondBulletinBean param) {
		return getSqlSession().selectOne("bulletin.selectBulletinConfig", param);
	}

	/**
	 * 게시판 설정 정보 타입별로
	 * bulletin config type info
	 * @param param
	 * @return BulletinConfigBean
	 */
	public BulletinConfigBean selectBulletinConfigType (CondBulletinBean param) {
		return getSqlSession().selectOne("bulletin.selectBulletinConfigType", param);
	}



	/**
	 * 게시물 목록 count
	 * bulletin list
	 * @param param
	 * @return List<BulletinBean>
	 */
	public int selectBulletinListCnt (CondBulletinBean param) {
		return getSqlSession().selectOne("bulletin.selectBulletinListCnt", param);
    }

	/**
	 * 게시물 목록
	 * bulletin list
	 * @param param
	 * @return List<BulletinBean>
	 */
	public List<BulletinBean> selectBulletinList (CondBulletinBean param) {
		return getSqlSession().selectList("bulletin.selectBulletinList", param);
    }


	/**
	 * 게시물 상세
	 * bulletin view
	 * @param param
	 * @return List<BulletinBean>
	 */
	public BulletinBean selectBulletin (CondBulletinBean param) {
		return getSqlSession().selectOne("bulletin.selectBulletin", param);
    }


	/**
	 * 게시물 이전글,다음글
	 * bulletin pre,next
	 * @param param
	 * @return List<BulletinBean>
	 */
	public List<BulletinBean> selectBulletinPreNextList (CondBulletinBean param) {
		return getSqlSession().selectList("bulletin.selectBulletinPreNextList", param);
    }


	/**
	 * 게시판 카테고리
	 * bulletin category
	 * @param param
	 * @return List<BulletinCateBean>
	 */
	public List<BulletinCateBean> selectBulletinCateList (CondBulletinBean param) {
		return getSqlSession().selectList("bulletin.selectBulletinCateList", param);
    }


	/**
	 * 게시판 조회수 수정
	 * bulletin hit count update
	 * @param param
	 * @return int
	 */
	public int updateViewCnt(CondBulletinBean param) {
        return getSqlSession().update("setBulletin.updateViewCnt", param);
    }


	/**
	 * 게시물 이전글
	 * bulletin pre
	 * @param param
	 * @return BulletinBean
	 */
	public BulletinBean selectBulletinPre (CondBulletinBean param) {
		return getSqlSession().selectOne("bulletin.selectBulletinPre", param);
    }


	/**
	 * 게시물 다음글
	 * bulletin next
	 * @param param
	 * @return BulletinBean
	 */
	public BulletinBean selectBulletinNext (CondBulletinBean param) {
		return getSqlSession().selectOne("bulletin.selectBulletinNext", param);
    }

	/**
	 * 게시물 저장
	 * bulletin insert
	 * @param param
	 * @return int
	 */
	public int insertBulletin (BulletinBean param) {
		return getSqlSession().insert("setBulletin.insertBulletin", param);
    }


	/**
	 * 코멘트 목록 count
	 * comment list count
	 * @param param
	 * @return int
	 */
	public int selectCommentListCnt (CondBulletinBean param) {
		return getSqlSession().selectOne("bulletin.selectCommentListCnt", param);
    }

	/**
	 * 코멘트 목록
	 * comment list
	 * @param param
	 * @return List<CommentBean>
	 */
	public List<CommentBean> selectCommentList (CondBulletinBean param) {
		return getSqlSession().selectList("bulletin.selectCommentList", param);
    }


	/**
	 * 코멘트 저장
	 * comment insert
	 * @param param
	 * @return int
	 */
	public int insertComment (CommentBean param) {
		return getSqlSession().insert("setBulletin.insertComment", param);
    }


	/**
	 * 코멘트 수정
	 * comment update
	 * @param param
	 * @return int
	 */
	public int updateComment (CommentBean param) {
		return getSqlSession().update("setBulletin.updateComment", param);
    }


	/**
	 * 코멘트 삭제
	 * comment update
	 * @param param
	 * @return int
	 */
	public int deleteComment (CommentBean param) {
		return getSqlSession().update("setBulletin.deleteComment", param);
    }


	/**
	 * 댓글에 댓글 목록
	 * comment reply list
	 * @param param
	 * @return List<CommentBean>
	 */
	public List<CommentBean> selectCommentReplyList (CondBulletinBean param) {
		return getSqlSession().selectList("bulletin.selectCommentReplyList", param);
    }


	/**
	 * 댓글에  하위 댓글 count
	 * comment reply count
	 * @param param
	 * @return int
	 */
	public int selectCommentChildCnt (CondBulletinBean param) {
		return getSqlSession().selectOne("bulletin.selectCommentChildCnt", param);
    }


	/**
	 * 게시물 수정
	 * bulletin update
	 * @param param
	 * @return int
	 */
	public int updateBulletin (BulletinBean param) {
		return getSqlSession().insert("setBulletin.updateBulletin", param);
    }


	/**
	 * 게시물 삭제
	 * bulletin delete
	 * @param param
	 * @return int
	 */
	public int deleteBulletin (BulletinBean param) {
		return getSqlSession().insert("setBulletin.deleteBulletin", param);
    }

	/**
	 * 게시물 댓글 갯수
	 * comment count
	 * @param param
	 * @return int
	 */
	public int updateCommentCnt (CommentBean param) {
		return getSqlSession().update("setBulletin.updateCommentCnt", param);
    }

}
