package ony.framework;


public class NotExistException extends UserException {
	/** Generated serialVersionUID. */
	private static final long serialVersionUID = -6656577999948959984L;

	/**
	 * 새로운 NotExistException을 생성하는 생성자.
	 */
	public NotExistException() {
		super();
	}

	/**
	 * 전달할 메시지를 이용하여 새로운 NotExistException을 생성하는 생성자.
	 *
	 * @param msg 전달할 메시지
	 */
	public NotExistException(String msg) {
		super(msg);
	}

	/**
	 * 새로운 NotExistException을 생성하는 생성자.
	 *
	 * @param errorCode 에러코드
	 * @param message 전달할 메시지
	 */
	public NotExistException(String errorCode, String message) {
		super(errorCode, message);
	}

	/**
	 * 새로운 NotExistException을 생성하는 생성자.
	 *
	 * @param msg 전달할 메시지
	 * @param cause 전달할 Exception
	 */
	public NotExistException(String msg, Throwable cause) {
		super(msg, cause);
	}

	/**
	 * 새로운 NotExistException을 생성하는 생성자.
	 *
	 * @param cause 전달할 Exception
	 */
	public NotExistException(Throwable cause) {
		super(cause);
	}
}
