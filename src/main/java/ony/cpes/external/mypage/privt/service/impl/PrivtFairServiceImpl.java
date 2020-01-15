package ony.cpes.external.mypage.privt.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cmm.common.ConstVal;
import ony.cpes.external.mypage.privt.bean.CondFairBean;

import ony.cpes.external.mypage.privt.bean.FairBean;
import ony.cpes.external.mypage.privt.dao.PrivtFairDAO;
import ony.cpes.external.mypage.privt.service.PrivtFairService;
import ony.framework.util.StringUtil;


@Service("PrivtFairService")
public class PrivtFairServiceImpl implements PrivtFairService {

	@Autowired
	private PrivtFairDAO privtFairDAO;



	/**
	 * 채용행사 목록 count
	 * fair list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectFairListCnt(CondFairBean param) throws Exception {
		return privtFairDAO.selectFairListCnt(param);
	}

	/**
	 * 채용행사 목록
	 * fair list
	 * @param param
	 * @return List<FairBean>
	 */
	@Override
	public List<FairBean> selectFairList(CondFairBean param) throws Exception {
		return privtFairDAO.selectFairList(param);
	}

	/**
	 * 채용행사 신청 취소
	 * fair cancel
	 * @param param
	 * @return int
	 */
	@Override
	public int updateCancelFair(CondFairBean param) throws Exception {
		return privtFairDAO.updateCancelFair(param);
	}

	/**
	 * 채용행사 삭제
	 * fair delete
	 * @param param
	 * @return int
	 */
	@Override
	public int deleteFair(CondFairBean param) throws Exception {
    	int result = 0;

    	if(StringUtil.isEmpty(param.getCondSeqStr())) {
    		return 0;
    	} else {
    		String[] strArr = param.getCondSeqStr().split(ConstVal.COMMA_VAL);

    		if(strArr != null && strArr.length > 0) {
        		for(int i=0; i<strArr.length; i++) {
        			param.setCondSeq(strArr[i]);
        			result = result + privtFairDAO.deleteFair(param);

        		}
    		}
    	}

    	return result;

	}
}
