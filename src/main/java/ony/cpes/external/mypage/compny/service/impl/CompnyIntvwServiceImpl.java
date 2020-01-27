package ony.cpes.external.mypage.compny.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.CommDtlCdBean;
import ony.cpes.external.mypage.compny.bean.CondCompnyIntvwBean;
import ony.cpes.external.mypage.compny.bean.VacancyIntvwBean;
import ony.cpes.external.mypage.compny.bean.VideoIntvwPatcptnBean;
import ony.cpes.external.mypage.compny.dao.CompnyIntvwDAO;
import ony.cpes.external.mypage.compny.service.CompnyIntvwService;
import ony.framework.util.StringUtil;

@Service("CompnyIntvwService")
public class CompnyIntvwServiceImpl implements CompnyIntvwService {

	@Autowired
	private CompnyIntvwDAO compnyIntvwDAO;

	/**
	 * 화상면접신청관리::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectVacancyIntwvVideoListCnt(CondCompnyIntvwBean param) throws Exception {
		return compnyIntvwDAO.selectVacancyIntwvVideoListCnt(param);
	}

	/**
	 * 화상면접신청관리::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<VacancyIntvwBean> selectVacancyIntwvVideoList(CondCompnyIntvwBean param) throws Exception {
		return compnyIntvwDAO.selectVacancyIntwvVideoList(param);
	}

	/**
	 * 화상면접신청관리::삭제
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int deleteVacancyIntwvVideo(VacancyIntvwBean param) throws Exception {
		int ret = 0;
		if(!StringUtil.isEmpty(param) && !StringUtil.isEmpty(param.getVideoIntvwPatcptnSeq())) {
			String[] seqArr = param.getVideoIntvwPatcptnSeq().split(ConstVal.COMMA_VAL);
			for(String seq : seqArr) {
				param.setVideoIntvwPatcptnSeq(seq);
				ret += compnyIntvwDAO.deleteVacancyIntwvVideo(param);
			}
		}
		return ret;
	}

	/**
	 * 화상면접 신청 저장
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int insertVacancyIntwvVideo(VideoIntvwPatcptnBean param) throws Exception {
		int ret = 0;
		compnyIntvwDAO.insertVacancyIntwvVideo(param);
		return ret;
	}

	/**
	 * 화상면접 신청 정보
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public VideoIntvwPatcptnBean selectVacancyIntwvVideoPatcptn(String videoIntvwPatcptnSeq, String langCd) throws Exception {
		Map<String, Object> param = null;
		param = new HashMap<String, Object>();
		param.put("videoIntvwPatcptnSeq", videoIntvwPatcptnSeq);
		param.put("langCd", langCd);

		return compnyIntvwDAO.selectVacancyIntwvVideoPatcptn(param);
	}

	/**
	 * 잡센터의 휴일 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<String> selectJcHolidayList(String jcCd) throws Exception {
		Map<String, Object> param = null;
		param = new HashMap<String, Object>();
		param.put("jcCd", jcCd);

		return compnyIntvwDAO.selectJcHolidayList(param);
	}

	/**
	 * 화상면접 시간테이블 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<CommDtlCdBean> selectVacancyIntwvVideoTimeList(VideoIntvwPatcptnBean param) throws Exception {
		return compnyIntvwDAO.selectVacancyIntwvVideoTimeList(param);
	}

}
