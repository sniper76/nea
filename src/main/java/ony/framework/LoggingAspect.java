
package ony.framework;

import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.util.StopWatch;

import ony.framework.BaseConfig;
import ony.framework.BaseConstant;

/** 
 * 공통 로깅 처리용 Aspect
 *
 */
public class LoggingAspect {
	/** 로거 오브젝트 */
	private final Log	logger	= LogFactory.getLog(getClass());

	/**
	 * DAO, Service 예외 발생시 로그 출력
	 *
	 * @param joinPoint (JoinPoint)
	 * @param ex 발생된 예외(Throwable)
	 */
	public void throwLogging(JoinPoint joinPoint, Throwable ex) {
		String			methodName	= joinPoint.getSignature().getName();
		StringBuffer	sb			= new StringBuffer();

		sb.append("\r\n");
		sb.append("Exception occured class : [");
		sb.append(joinPoint.getSignature().getDeclaringType().getName());
		sb.append("], methodName : [" + methodName);
		sb.append("]\r\n");

		logger.error(sb.toString());
		logger.error(ex);
	}

	/**
	 * DAO, Service 메소드 처리에 대한 로그를 출력한다.
	 *
	 * @param joinPoint (ProceedingJoinPoint)
	 * @return 대상 메소드 객체
	 * @throws Throwable 실행시 발생되는 오류에 대한 예외 처리
	 */
	public Object loggingService(ProceedingJoinPoint joinPoint) throws Throwable {
		StopWatch	stopWatch	= new StopWatch();

		try {
			stopWatch.start();
			Object	retValue	= joinPoint.proceed();
			return retValue;
		} catch (Throwable e) {
			throw e;
		} finally {
			stopWatch.stop();
			logger.info("["+joinPoint.getSignature().getDeclaringType().getName()+"클래스 ]["+joinPoint.getSignature().getName()+"] 메소드 처리 완료시간 : " + stopWatch.getTotalTimeMillis());
			this.writeLogOverTimeMethood(joinPoint, stopWatch.getTotalTimeMillis());
		}
	}
	
	/**
	 * DAO, Service 메소드 처리에 대한 로그를 출력한다.
	 *
	 * @param joinPoint (ProceedingJoinPoint)
	 * @return 대상 메소드 객체
	 * @throws Throwable 실행시 발생되는 오류에 대한 예외 처리
	 */
	public Object loggingDAO(ProceedingJoinPoint joinPoint) throws Throwable {
		StopWatch	stopWatch	= new StopWatch();

		try {
			stopWatch.start();
			Object	retValue	= joinPoint.proceed();
			return retValue;
		} catch (Throwable e) {
			throw e;
		} finally {
			stopWatch.stop();
			logger.info("["+joinPoint.getSignature().getDeclaringType().getName()+"클래스 ]["+joinPoint.getSignature().getName()+"] 메소드 처리 완료시간 : " + stopWatch.getTotalTimeMillis());
			this.writeLogOverTimeMethood(joinPoint, stopWatch.getTotalTimeMillis());
		}
	}

	/**
	 * 처리 기준 시간을 넘기는 메소드에 대해 로그를 출력한다.
	 *
	 * @param joinPoint (ProceedingJoinPoint)
	 * @param proccessTimeMills 처리 시간, 밀리세컨드(long)
	 */
	private void writeLogOverTimeMethood(ProceedingJoinPoint joinPoint, long proccessTimeMills) {
		if (null != joinPoint) {
			int		limitTime	= Integer.parseInt(BaseConfig.getValue(BaseConstant.PROCESS_LIMIT_TIME, "1000"));
			String	methodName	= joinPoint.getSignature().getName();

			//처리 시간이 기준시간 이상인가 (기본 1초)
			if (limitTime <= (proccessTimeMills / 1000)) {
				logger.warn("OverTime 기록시작");
				logger.warn(methodName + " 메소드 실행시간 : " + proccessTimeMills + "[ms]");

				StringBuffer	sb	= new StringBuffer();
				sb.append("\r\n");
				sb.append("Called class : [");
				sb.append(joinPoint.getSignature().getDeclaringType().getName());
				sb.append("], methodName : [");
				sb.append(methodName);
				sb.append("]\r\n");

				logger.warn(sb.toString());

				Object[]	args	= joinPoint.getArgs();
				if (null != args) {
					for (Object obj : args) {
						if (isParamModel(obj)) {
							writeLogParameter(obj);
						}
					}
				}

				logger.warn("OverTime 기록종료");
			}
		}
	}
	

	/**
	 * 메소드에 전달된 파라미터를 객체로 받아 출력한다.
	 *
	 * @param obj 파라미터(Object)
	 */
	@SuppressWarnings("unchecked")
	private void writeLogParameter(Object obj) {
		try {
			StringBuffer	sb	= new StringBuffer();

			sb.append("\r\n");
			sb.append("Controller parameter name : [");
			sb.append(obj.getClass().getName());
			sb.append("]\r\n");
			sb.append(getMapValue((Map<String, Object>)BeanUtils.describe(obj)));

			logger.warn(sb.toString());
		} catch (Exception e) {
			logger.error("로그 출력중 에러가 발생 하였습니다.", e);
		}
	}

	/**
	 * 맵 데이터를 [키=값] ... 형태의 문자열로 변환한다.
	 *
	 * @param beanMap 맵 데이터(Map<String, ?>)
	 * @return [키=값] ... 형태의 문자열 (String)
	 * @throws Exception 맵 데이터 변환시 발생될 수 있는 예외 처리
	 */
	private String getMapValue(Map<String, ?> beanMap) throws Exception {
		StringBuffer	sb	= new StringBuffer();

		for (String key : beanMap.keySet()) {
			if (!"class".equals(key) && !"pageModel".equals(key)) {
				sb.append(" [");
				sb.append(key);
				sb.append("=");
				sb.append(beanMap.get(key));
				sb.append("] ");
			}
		}

		return sb.toString();
	}

	/**
	 * 객체가 아래 클래스에 해당하는지 검사한다.<br/><br/>
	 * @param obj 검사할 객체(Object)
	 * @return 해당 클래스의 객체이면 true, 그렇지 않으면 false(boolean)
	 */
	private boolean isParamModel(Object obj) {
		if (null != obj) {
			String	parmaName	= obj.getClass().getName();

			if (parmaName.contains("ony.framework.bean")
					|| parmaName.contains("ony.hrd.system.bean")) {
				return true;
			}
		}

		return false;
	}
}
