package ony.cpes.external.jobfair.service;

import java.util.List;

import ony.cpes.external.jobfair.bean.CondJobFairCenterBean;
import ony.cpes.external.jobfair.bean.JobFairBoothBean;
import ony.cpes.external.jobfair.bean.JobFairBoothHistBean;
import ony.cpes.external.jobfair.bean.JobFairBoothResvWaitBean;
import ony.cpes.external.jobfair.bean.JobFairCenterBean;
import ony.cpes.external.jobfair.bean.JobFairPatcptnBean;
import ony.cpes.external.jobfair.bean.JobFairPatcptnCompnyBean;
import ony.cpes.external.jobfair.bean.JobFairPatcptnInsttBean;
import ony.cpes.external.jobfair.bean.JobFairPatcptnOnlineBean;
import ony.cpes.external.mypage.privt.bean.InterestBean;

public interface JobFairService {

	/**
	 * jobfair list count
	 * @param param
	 * @return int
	 */
	public int selectJobFairListCnt (CondJobFairCenterBean param) throws Exception;

	/**
	 * jobfair list
	 * @param param
	 * @return List<JobFairCenterBean>
	 */
	public List<JobFairCenterBean> selectJobFairList (CondJobFairCenterBean param) throws Exception;

	/**
	 * jobfair detail
	 * @param param
	 * @return JobFairCenterBean
	 */
	public JobFairCenterBean selectJobFairInfo (CondJobFairCenterBean param) throws Exception;

	/**
	 * jobfair detail by employers count
	 * @param param
	 * @return int
	 */
	public int selectJobFairByEmployersCnt (CondJobFairCenterBean param) throws Exception;

	/**
	 * jobfair detail by employers
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectJobFairByEmployers (CondJobFairCenterBean param) throws Exception;

	/**
	 * jobfair detail by vacancys count
	 * @param param
	 * @return int
	 */
	public int selectJobFairByVacancysCnt (CondJobFairCenterBean param) throws Exception;

	/**
	 * jobfair detail by vacancys
	 * @param param
	 * @return List<CompanyBean>
	 */
	public List<InterestBean> selectJobFairByVacancys (CondJobFairCenterBean param) throws Exception;

	/**
	 * jobfair detail by edu instts count
	 * @param param
	 * @return int
	 */
	public int selectJobFairByEduInsttsCnt (CondJobFairCenterBean param) throws Exception;

	/**
	 * jobfair detail by edu instts
	 * @param param
	 * @return List<CompanyBean>
	 */
	public List<InterestBean> selectJobFairByEduInstts (CondJobFairCenterBean param) throws Exception;

	/**
	 * jobfair apply list count
	 * @param param
	 * @return int
	 */
	public int selectJobFairApplyListCnt(CondJobFairCenterBean param) throws Exception;

	/**
	 * jobfair apply list
	 * @param param
	 * @return List<JobFairCenterBean>
	 */
	public List<JobFairCenterBean> selectJobFairApplyList(CondJobFairCenterBean param) throws Exception;

	/**
	 * jobfair apply detail
	 * @param param
	 * @return JobFairCenterBean
	 */
	public JobFairCenterBean selectJobFairApplyInfo(CondJobFairCenterBean param) throws Exception;

	/**
	 * 참가신청 (일반/학생)
	 * Participate job fair (Online)
	 * @param param
	 * @return integer
	 * @throws Exception
	 */
	public int insertJobFairApplyPatcptnOnline(JobFairPatcptnBean param) throws Exception;

	/**
	 * Job Fair Participate information (online)
	 * @param fairSeq
	 * @param userSeq
	 * @return
	 * @throws Exception
	 */
	public JobFairPatcptnOnlineBean selectJobFairApplyPatcptnOnline(String fairSeq, String userSeq) throws Exception;

	/**
	 * 참가신청 (기업) :: 저장
	 * Participate job fair (Company)
	 * @param param
	 * @return integer
	 * @throws Exception
	 */
	public int insertJobFairApplyPatcptnCompny(JobFairPatcptnBean param) throws Exception;

	/**
	 * 참가신청 (기업) :: 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public JobFairPatcptnCompnyBean selectJobFairApplyPatcptnCompny(String fairSeq, String userSeq) throws Exception;

	/**
	 * 참가신청 (기관) :: 저장
	 * Participate job fair (Institute)
	 * @param param
	 * @return integer
	 * @throws Exception
	 */
	public int insertJobFairApplyPatcptnInstt(JobFairPatcptnBean param) throws Exception;

	/**
	 * 참가신청 (기관) :: 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public JobFairPatcptnInsttBean selectJobFairApplyPatcptnInstt(String fairSeq, String userSeq) throws Exception;

	/**
	 * Job Fair Booth information
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public JobFairBoothBean selectJobFairBooth(String boothSeq, String fairSeq) throws Exception;

	/**
	 * jobfair booth list
	 * @param param
	 * @return List<JobFairCenterBean>
	 */
	public List<JobFairBoothBean> selectJobFairBoothList(String fairSeq, String langCd) throws Exception;

	/**
	 * Job Fair Booth Apply
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int insertJobFairBoothApply(JobFairBoothHistBean jobFairBoothHist, JobFairBoothBean jobFairBooth, String userAuthCd, String langCd) throws Exception;

	/**
	 * Job Fair Booth Reservation Waiting :: insert
	 * @param jobFairBoothResvWaitBean
	 * @return
	 * @throws Exception
	 */
	public int insertJobFairBoothResvWait(JobFairBoothResvWaitBean param) throws Exception;

	/**
	 *Job Fair Booth Reservation Waiting :: information
	 * @param fairSeq
	 * @param userSeq
	 * @return
	 * @throws Exception
	 */
	public JobFairBoothResvWaitBean selectJobFairBoothResvWait(String fairSeq, String userSeq, String compnyInsttDivCd) throws Exception;

	/**
	 * Job Fair Count by period
	 * @param startDt
	 * @param endDt
	 * @return
	 * @throws Exception
	 */
	public int selectJobFairTermCnt(String startDt, String endDt, String langCd) throws Exception;

	/**
	 * Job Fair List by period
	 * @param startDt
	 * @param endDt
	 * @return
	 * @throws Exception
	 */
	public List<JobFairCenterBean> selectJobFairTermList(String startDt, String endDt, String langCd) throws Exception;

}
