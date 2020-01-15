package ony.framework;

import ony.framework.BaseException;

/**
 * 정의된 오류에 대한 User Exception Class.<br/>
 * 시스템 사용자가 어떤 조치를 취하도록 명백한 메시지를 전달할 필요가 있는 경우 UserException을 사용하여 예외를 던진다.<br/>
 */
public class UserException extends BaseException {
	/** Generated serialVersionUID. */
	private static final long serialVersionUID = 5862938373173056243L;

	/**
	 * 새로운 UserException 생성하는 생성자.
	 */
	public UserException() {
		super();
	}

	/**
	 * 전달할 메시지를 이용하여 새로운 UserException을 생성하는 생성자.
	 *
	 * @param msg 전달할 메시지
	 */
	public UserException(String msg) {
		super(msg);
	}

	/**
	 * 새로운 UserException을 생성하는 생성자.
	 *
	 * @param errorCode 에러코드
	 * @param message 전달할 메시지
	 */
	public UserException(String errorCode, String message) {
		super(errorCode, message);
	}

	/**
	 * 새로운 UserException을 생성하는 생성자.
	 *
	 * @param msg 전달할 메시지
	 * @param cause 전달할 Exception
	 */
	public UserException(String msg, Throwable cause) {
		super(msg, cause);
	}

	/**
	 * 새로운 UserException을 생성하는 생성자.
	 *
	 * @param cause 전달할 Exception
	 */
	public UserException(Throwable cause) {
		super(cause);
	}
}
