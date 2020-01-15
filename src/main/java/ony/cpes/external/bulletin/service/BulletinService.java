package ony.cpes.external.bulletin.service;

import java.util.List;

import ony.cpes.external.bulletin.bean.BulletinBean;
import ony.cpes.external.bulletin.bean.BulletinCateBean;
import ony.cpes.external.bulletin.bean.BulletinConfigBean;
import ony.cpes.external.bulletin.bean.CommentBean;
import ony.cpes.external.bulletin.bean.CondBulletinBean;





public interface BulletinService {
	/**
	 * 게시판 설정 정보
	 * bulletin config info
	 * @param param
	 * @return BulletinConfigBean
	 */
	public BulletinConfigBean selectBulletinConfig (CondBulletinBean param) throws Exception;


	/**
	 * 게시판 설정 정보 type 별로
	 * bulletin config type info
	 * @param param
	 * @return BulletinConfigBean
	 */
	public BulletinConfigBean selectBulletinConfigType (CondBulletinBean param) throws Exception;

	/**
	 * 게시물 목록 count
	 * bulletin list count
	 * @param param
	 * @return int
	 */
	public int selectBulletinListCnt (CondBulletinBean param) throws Exception;

	/**
	 * 게시물 목록
	 * bulletin list
	 * @param param
	 * @return List<BulletinBean>
	 */
	public List<BulletinBean> selectBulletinList (CondBulletinBean param) throws Exception;


	/**
	 * 게시물 상세
	 * bulletin view
	 * @param param
	 * @return List<BulletinBean>
	 */
	public BulletinBean selectBulletin (CondBulletinBean param) throws Exception;


	/**
	 * 게시물 이전글 다음글
	 * bulletin pre,next
	 * @param param
	 * @return List<BulletinBean>
	 */
	public List<BulletinBean> selectBulletinPreNextList (CondBulletinBean param) throws Exception;


	/**
	 * 게시판 카테고리
	 * bulletin category
	 * @param param
	 * @return List<BulletinCateBean>
	 */
	public List<BulletinCateBean> selectBulletinCateList (CondBulletinBean param) throws Exception;


	/**
	 * 게시물 이전글
	 * bulletin pre
	 * @param param
	 * @return BulletinBean
	 */
	public BulletinBean selectBulletinPre (CondBulletinBean param) throws Exception;



	/**
	 * 게시물 다음글
	 * bulletin next
	 * @param param
	 * @return BulletinBean
	 */
	public BulletinBean selectBulletinNext (CondBulletinBean param) throws Exception;


	/**
	 * 게시물 저장
	 * bulletin insert
	 * @param param
	 * @return int
	 */
	public int insertBulletin (BulletinBean param) throws Exception;


	/**
	 * 댓글 목록 count
	 * comment list count
	 * @param param
	 * @return int
	 */
	public int selectCommentListCnt (CondBulletinBean param) throws Exception;


	/**
	 * 댓글 목록
	 * comment list
	 * @param param
	 * @return List<CommentBean>
	 */
	public List<CommentBean> selectCommentList (CondBulletinBean param) throws Exception;


	/**
	 * 코멘트 저장
	 * comment insert
	 * @param param
	 * @return int
	 */
	public int insertComment (CommentBean param) throws Exception;


	/**
	 * 댓글에 댓글 목록
	 * comment reply list
	 * @param param
	 * @return List<CommentBean>
	 */
	public List<CommentBean> selectCommentReplyList (CondBulletinBean param) throws Exception;


	/**
	 * 코멘트 삭제
	 * comment update
	 * @param param
	 * @return int
	 */
	public int deleteComment (CommentBean param) throws Exception;


	/**
	 * 게시물 수정
	 * bulletin update
	 * @param param
	 * @return int
	 */
	public int updateBulletin (BulletinBean param) throws Exception;


	/**
	 * 게시물 삭제
	 * bulletin delete
	 * @param param
	 * @return int
	 */
	public int deleteBulletin (BulletinBean param) throws Exception;

}
