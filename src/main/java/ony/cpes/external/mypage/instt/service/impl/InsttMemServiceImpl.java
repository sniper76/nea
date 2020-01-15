package ony.cpes.external.mypage.instt.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cmm.common.ConstVal;
import ony.cmm.common.service.CommonService;
import ony.cpes.external.mypage.instt.bean.CondInsttMemBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngHistBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;
import ony.cpes.external.mypage.instt.dao.InsttMemDAO;
import ony.cpes.external.mypage.instt.service.InsttMemService;
import ony.framework.util.StringUtil;




@Service("InsttMemService")
public class InsttMemServiceImpl implements InsttMemService {
	@Autowired
	private InsttMemDAO insttMemDAO;

	@Autowired
	private CommonService commonService;


	/**
	 * 교육기관 조회
	 * Institution member view
	 * @param param
	 * @return InsttMemBean
	 */
	@Override
	public InsttMemBean selectInsttMember(CondInsttMemBean param) throws Exception {
		return insttMemDAO.selectMember(param);
	}

	/**
	 * 교육기관 수정
	 * Institution member update
	 * @param param
	 * @return int
	 */
	@Override
	public int updateInsttMember(InsttMemBean param) throws Exception {
		return insttMemDAO.updateMember(param);
	}


	/**
	 * 교육훈련 이력 목록 조회
	 * education history list
	 * @param param
	 * @return List<EduTrnngHistBean>
	 */
	@Override
	public List<EduTrnngHistBean> selectEduTrnngHistList(CondInsttMemBean param) {
		return insttMemDAO.selectEduTrnngHistList(param);
	}

	/**
	 * 교육기관정보 프로파일 수정
	 * education profile update
	 * @param param
	 * @return int
	 */
	@Override
	public int updateProfile(InsttMemBean param) throws Exception {

		if(!StringUtil.isEmpty(param.getUploadResult())) {

    		String fileGrpSeq = commonService.dext5UploadInsert(param.getUploadResult(), param.getUserSeq(), param.getFileGrpSeq());
    		param.setFileGrpSeq(fileGrpSeq);
		}

		int result = insttMemDAO.updateProfile(param);

		if(result > 0) {
			EduTrnngHistBean eduTrnngHistBean = new EduTrnngHistBean();
			eduTrnngHistBean.setInsttSeq(param.getInsttSeq());
			eduTrnngHistBean.setUserSeq(param.getUserSeq());
			eduTrnngHistBean.setRegUserSeq(param.getUserSeq());

			insttMemDAO.deleteEduTrnngHist(eduTrnngHistBean);

			if(!StringUtil.isEmpty(param.getEduProgramIdStr())) {
				String[] idArr = param.getEduProgramIdStr().split(ConstVal.COMMA_VAL);
				String[] dtArr = param.getTrnngDtStr().split(ConstVal.COMMA_VAL);
				String[] nmArr = param.getTrnngNmStr().split(ConstVal.COMMA_VAL);
				for(int i=0; i<idArr.length; i++) {
					eduTrnngHistBean.setEduProgramId(idArr[i]);
					eduTrnngHistBean.setTrnngDt(dtArr[i]);
					eduTrnngHistBean.setTrnngNm(nmArr[i]);

					insttMemDAO.insertEduTrnngHist(eduTrnngHistBean);
				}
			}

		}

		return result;
	}

	@Override
	public int updateInsttLogoImg(InsttMemBean param) {
		return insttMemDAO.updateInsttLogoImg(param);
	}
}
