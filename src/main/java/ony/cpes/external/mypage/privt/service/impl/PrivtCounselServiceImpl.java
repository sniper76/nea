package ony.cpes.external.mypage.privt.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cmm.common.ConstVal;
import ony.cpes.external.mypage.privt.bean.CondCounselBean;
import ony.cpes.external.mypage.privt.bean.EduTrnngBean;
import ony.cpes.external.mypage.privt.dao.PrivtCounselDAO;
import ony.cpes.external.mypage.privt.service.PrivtCounselService;
import ony.framework.util.StringUtil;



@Service("PrivtCounselService")
public class PrivtCounselServiceImpl implements PrivtCounselService {

	@Autowired
	private PrivtCounselDAO privtCounselDAO;

	/**
	 * 직업훈련 신청 목록 count
	 * education trnning nea list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectEduTrnngNeaListCnt(CondCounselBean param) throws Exception {
		return privtCounselDAO.selectEduTrnngNeaListCnt(param);
	}

	/**
	 * 직업훈련 신청 목록
	 * education trnning nea list
	 * @param param
	 * @return List<FairBean>
	 */
	@Override
	public List<EduTrnngBean> selectEduTrnngNeaList(CondCounselBean param) throws Exception {
		return privtCounselDAO.selectEduTrnngNeaList(param);
	}

	/**
	 * 직업훈련 신청 신청 취소
	 * education trnning nea cancel
	 * @param param
	 * @return int
	 */
	@Override
	public int updateCancelEduTrnngNea(CondCounselBean param) throws Exception {
		return privtCounselDAO.updateCancelEduTrnngNea(param);
	}

	/**
	 * 직업훈련 신청 삭제
	 * education trnning nea delete
	 * @param param
	 * @return int
	 */
	@Override
	public int deleteEduTrnngNea(CondCounselBean param) throws Exception {

    	int result = 0;

    	if(StringUtil.isEmpty(param.getCondSeqStr())) {
    		return 0;
    	} else {
    		String[] strArr = param.getCondSeqStr().split(ConstVal.COMMA_VAL);

    		if(strArr != null && strArr.length > 0) {
        		for(int i=0; i<strArr.length; i++) {
        			param.setCondSeq(strArr[i]);
        			result = result + privtCounselDAO.deleteEduTrnngNea(param);
        		}
    		}
    	}

    	return result;


	}

}
