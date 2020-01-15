package ony.framework;

import ony.framework.BaseException;

public class SystemException extends BaseException {
	/** Generated serialVersionUID. */
	private static final long serialVersionUID = -4801045968436886508L;

	/**
	 * 새로운 SystemException 생성하는 생성자.
	 */
	public SystemException() {
		super();
	}

	/**
	 * 전달할 메시지를 이용하여 새로운 SystemException을 생성하는 생성자.
	 *
	 * @param msg 전달할 메시지
	 */
	public SystemException(String msg) {
		super(msg);
	}

	/**
	 * 새로운 SystemException을 생성하는 생성자.
	 *
	 * @param errorCode 에러코드
	 * @param message 전달할 메시지
	 */
	public SystemException(String errorCode, String message) {
		super(errorCode, message);
	}

	/**
	 * 새로운 SystemException을 생성하는 생성자.
	 *
	 * @param msg 전달할 메시지
	 * @param cause 전달할 Exception
	 */
	public SystemException(String msg, Throwable cause) {
		super(msg, cause);
	}

	/**
	 * 새로운 SystemException을 생성하는 생성자.
	 *
	 * @param cause 전달할 Exception
	 */
	public SystemException(Throwable cause) {
		super(cause);
	}
}
