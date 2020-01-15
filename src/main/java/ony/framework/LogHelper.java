package ony.framework;

import org.apache.log4j.Logger;


public class LogHelper {
	/**
	 * Logging Error
	 *
	 * @param obj 출력에 사용할 객체(Object)
	 * @param msg 출력할 메시지(String)
	 */
	public static void error(Object obj, String msg) {
		Logger	logger	= Logger.getLogger(obj.getClass());
		logger.error(msg);
	}

	/**
	 * Logging Fatal
	 *
	 * @param obj 출력에 사용할 객체(Object)
	 * @param msg 출력할 메시지(String)
	 */
	public static void fatal(Object obj, String msg) {
		Logger	logger	= Logger.getLogger(obj.getClass());
		logger.fatal(msg);
	}

	/**
	 * Logging Info.
	 *
	 * @param obj 출력에 사용할 객체(Object)
	 * @param msg 출력할 메시지(String)
	 */
	public static void info(Object obj, String msg) {
		Logger	logger	= Logger.getLogger(obj.getClass());
		logger.info(msg);
	}

	/**
	 * Logging Debug
	 *
	 * @param obj 출력에 사용할 객체(Object)
	 * @param msg 출력할 메시지(String)
	 */
	public static void debug(Object obj, String msg) {
		Logger	logger	= Logger.getLogger(obj.getClass());
		logger.debug(msg);
	}

	/**
	 * Logging Error
	 *
	 * @param cls 출력에 사용할 클래스(Class)
	 * @param msg 출력할 메시지(String)
	 */
	public static void error(Class<?> cls, String msg) {
		Logger	logger	= Logger.getLogger(cls);
		logger.error(msg);
	}

	/**
	 * Logging Fatal
	 *
	 * @param cls 출력에 사용할 클래스(Class)
	 * @param msg 출력할 메시지(String)
	 */
	public static void fatal(Class<?> cls, String msg) {
		Logger	logger	= Logger.getLogger(cls);
		logger.fatal(msg);
	}

	/**
	 * Logging Info.
	 *
	 * @param cls 출력에 사용할 클래스(Class)
	 * @param msg 출력할 메시지(String)
	 */
	public static void info(Class<?> cls, String msg) {
		Logger	logger	= Logger.getLogger(cls);
		logger.info(msg);
	}

	/**
	 * Logging Debug
	 *
	 * @param cls 출력에 사용할 클래스(Class)
	 * @param msg 출력할 메시지(String)
	 */
	public static void debug(Class<?> cls, String msg) {
		Logger	logger	= Logger.getLogger(cls);
		logger.debug(msg);
	}
}
