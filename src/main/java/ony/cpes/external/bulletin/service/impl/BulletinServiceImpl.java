package ony.cpes.external.bulletin.service.impl;

import java.util.List;

import org.apache.commons.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import ony.cmm.common.ConstVal;
import ony.cmm.common.service.CommonService;
import ony.cpes.external.bulletin.bean.BulletinBean;
import ony.cpes.external.bulletin.bean.BulletinCateBean;
import ony.cpes.external.bulletin.bean.BulletinConfigBean;
import ony.cpes.external.bulletin.bean.CommentBean;
import ony.cpes.external.bulletin.bean.CondBulletinBean;
import ony.cpes.external.bulletin.dao.BulletinDAO;
import ony.cpes.external.bulletin.service.BulletinService;

@Service("BulletinService")
public class BulletinServiceImpl implements BulletinService {

	@Autowired BulletinDAO bulletinDAO;

	@Autowired SessionLocaleResolver localeResolver;

    @Autowired MessageSource messageSource;

    @Autowired CommonService commonService;

	/**
	 * 게시판 설정 정보
	 * bulletin config info
	 * @param param
	 * @return BulletinConfigBean
	 */
    @Override
	public BulletinConfigBean selectBulletinConfig (CondBulletinBean param) throws Exception {
    	return bulletinDAO.selectBulletinConfig(param);
    }

	/**
	 * 게시판 설정 정보 type 별로
	 * bulletin config type info
	 * @param param
	 * @return BulletinConfigBean
	 */
    @Override
	public BulletinConfigBean selectBulletinConfigType (CondBulletinBean param) throws Exception {
		return bulletinDAO.selectBulletinConfigType(param);
	}


	/**
	 * 게시물 목록 count
	 * bulletin list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectBulletinListCnt (CondBulletinBean param) throws Exception {
    	return bulletinDAO.selectBulletinListCnt(param);
    }

	/**
	 * 게시물 목록
	 * bulletin list
	 * @param param
	 * @return List<BulletinBean>
	 */
    @Override
	public List<BulletinBean> selectBulletinList (CondBulletinBean param) throws Exception {
    	List<BulletinBean> result = bulletinDAO.selectBulletinList(param);

    	for(BulletinBean bulletinBean : result) {
    		bulletinBean.setTitle(bulletinBean.getTitle().replaceAll("<span id=\"banwordY\" style=\"color: red;\">", ""));
    		bulletinBean.setTitle(bulletinBean.getTitle().replaceAll("</span>", ""));
    	}

    	return result;
    }


	/**
	 * 게시물 상세
	 * bulletin view
	 * @param param
	 * @return List<BulletinBean>
	 */
    @Override
	public BulletinBean selectBulletin (CondBulletinBean param) throws Exception {
    	if(!StringUtils.equals(ConstVal.NO_VAL, param.getCondViewCntYn())) {//수정화면에서 조회할경우 조회수 업데이트 하지 않음
    		bulletinDAO.updateViewCnt(param);
    	}
    	BulletinBean result = bulletinDAO.selectBulletin(param);
    	result.setTitle(result.getTitle().replaceAll("<span id=\"banwordY\" style=\"color: red;\">", ""));
    	result.setTitle(result.getTitle().replaceAll("</span>", ""));
    	result.setContent(result.getContent().replaceAll("<span id=\"banwordY\" style=\"color: red;\">", ""));
    	result.setContent(result.getContent().replaceAll("</span>", ""));

    	return result;
    }


	/**
	 * 게시물 이전글 다음글
	 * bulletin pre,next
	 * @param param
	 * @return List<BulletinBean>
	 */
    @Override
	public List<BulletinBean> selectBulletinPreNextList (CondBulletinBean param) throws Exception {
    	return bulletinDAO.selectBulletinPreNextList(param);
    }


	/**
	 * 게시판 카테고리
	 * bulletin category
	 * @param param
	 * @return List<BulletinCateBean>
	 */
    @Override
	public List<BulletinCateBean> selectBulletinCateList (CondBulletinBean param) throws Exception {
    	return bulletinDAO.selectBulletinCateList(param);
	}


	/**
	 * 게시물 이전글
	 * bulletin pre
	 * @param param
	 * @return BulletinBean
	 */
    @Override
	public BulletinBean selectBulletinPre (CondBulletinBean param) throws Exception {
    	return bulletinDAO.selectBulletinPre(param);
    }



	/**
	 * 게시물 다음글
	 * bulletin next
	 * @param param
	 * @return BulletinBean
	 */
    @Override
	public BulletinBean selectBulletinNext (CondBulletinBean param) throws Exception {
    	return bulletinDAO.selectBulletinNext(param);
    }


	/**
	 * 게시물 저장
	 * bulletin insert
	 * @param param
	 * @return BulletinBean
	 */
    @Override
	public int insertBulletin (BulletinBean param) throws Exception {

    	List<String> banwordList = commonService.selectBanWordList();
    	String banYn = "N";
    	for(String banword : banwordList) {
    		if(param.getTitleEn().contains(banword)) {
    			param.setTitleEn(param.getTitleEn().replaceAll(banword, "<span id=\"banwordY\" style=\"color: red;\">" + banword + "</span>"));
    			banYn = "Y";
    		}
    		if(param.getTitleKh().contains(banword)) {
    			param.setTitleKh(param.getTitleKh().replaceAll(banword, "<span id=\"banwordY\" style=\"color: red;\">" + banword + "</span>"));
    			banYn = "Y";
    		}
    		if(param.getContentEn().contains(banword)) {
    			param.setContentEn(param.getContentEn().replaceAll(banword, "<span id=\"banwordY\" style=\"color: red;\">" + banword + "</span>"));
    			banYn = "Y";
    		}
    		if(param.getContentKh().contains(banword)) {
    			param.setContentKh(param.getContentKh().replaceAll(banword, "<span id=\"banwordY\" style=\"color: red;\">" + banword + "</span>"));
    			banYn = "Y";
    		}
    	}

   		param.setBanYn(banYn);

		return bulletinDAO.insertBulletin(param);
	}

	/**
	 * 댓글 목록 count
	 * comment list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectCommentListCnt (CondBulletinBean param) throws Exception {
    	return bulletinDAO.selectCommentListCnt(param);
    }


	/**
	 * 댓글 목록
	 * comment list
	 * @param param
	 * @return List<CommentBean>
	 */
    @Override
	public List<CommentBean> selectCommentList (CondBulletinBean param) throws Exception {
		return bulletinDAO.selectCommentList(param);
	}


	/**
	 * 코멘트 저장
	 * comment insert
	 * @param param
	 * @return int
	 */
    @Override
	public int insertComment (CommentBean param) throws Exception {
    	List<String> banwordList = commonService.selectBanWordList();
    	String banYn = "N";
    	for(String banword : banwordList) {
    		if(param.getContent().contains(banword)) {
    			param.setContent(param.getContent().replaceAll(banword, "<span id=\"banwordY\" style=\"color: red;\">" + banword + "</span>"));
    			banYn = "Y";
    		}
    	}

    	param.setBanYn(banYn);

    	int cnt = bulletinDAO.insertComment(param);
    	if(cnt > 0) {
    		 bulletinDAO.updateCommentCnt(param);
    	}
		return cnt;
	}

	/**
	 * 댓글에 댓글 목록
	 * comment reply list
	 * @param param
	 * @return List<CommentBean>
	 */
    @Override
	public List<CommentBean> selectCommentReplyList (CondBulletinBean param) throws Exception {
		return bulletinDAO.selectCommentReplyList(param);
	}

	/**
	 * 코멘트  답글삭제
	 * comment update
	 * @param param
	 * @return int
	 */
    @Override
	public int deleteComment(CommentBean param) throws Exception {
    	int result = 0;


    	if(StringUtils.equals("2", param.getDepth())) {//댓글에 댓글
    		param.setDelYn(ConstVal.YES_VAL);
    		result += bulletinDAO.deleteComment(param);
    	} else {
    		CondBulletinBean cond = new CondBulletinBean();
    		cond.setCondSeq(param.getBulletinSeq());
    		cond.setCondUpperSeq(param.getCommentSeq());

    		if(bulletinDAO.selectCommentChildCnt(cond) > 0) {//하위 댓글이 있을경우
    			param.setDelYn(ConstVal.NO_VAL);

    		} else {
    			param.setCommentDelYn(ConstVal.YES_VAL);//코멘트 갯수 마이너스 처리
    			bulletinDAO.updateCommentCnt(param);
    			param.setDelYn(ConstVal.YES_VAL);
    		}

    		result += bulletinDAO.deleteComment(param);

    	}

    	return result;
	}



	/**
	 * 게시물 수정
	 * bulletin update
	 * @param param
	 * @return int
	 */
    @Override
	public int updateBulletin (BulletinBean param) throws Exception {

    	List<String> banwordList = commonService.selectBanWordList();
    	String banYn = "N";
    	for(String banword : banwordList) {
    		if(param.getTitleEn().contains(banword)) {
    			param.setTitleEn(param.getTitleEn().replaceAll(banword, "<span id=\"banwordY\" style=\"color: red;\">" + banword + "</span>"));
    			banYn = "Y";
    		}
    		if(param.getTitleKh().contains(banword)) {
    			param.setTitleKh(param.getTitleKh().replaceAll(banword, "<span id=\"banwordY\" style=\"color: red;\">" + banword + "</span>"));
    			banYn = "Y";
    		}
    		if(param.getContentEn().contains(banword)) {
    			param.setContentEn(param.getContentEn().replaceAll(banword, "<span id=\"banwordY\" style=\"color: red;\">" + banword + "</span>"));
    			banYn = "Y";
    		}
    		if(param.getContentKh().contains(banword)) {
    			param.setContentKh(param.getContentKh().replaceAll(banword, "<span id=\"banwordY\" style=\"color: red;\">" + banword + "</span>"));
    			banYn = "Y";
    		}
    	}

   		param.setBanYn(banYn);

		return bulletinDAO.updateBulletin(param);
	}


	/**
	 * 게시물 삭제
	 * bulletin delete
	 * @param param
	 * @return int
	 */
    @Override
	public int deleteBulletin (BulletinBean param) throws Exception {
    	return bulletinDAO.deleteBulletin(param);
	}
}
