package ony.framework;

import java.io.PrintStream;
import java.io.PrintWriter;

public class BaseException extends RuntimeException {
	/** Generated serialVersionUID. */
	private static final long serialVersionUID = 6886620455771149657L;

    /** Exception의 에러코드. */
    private String		errorCode	= null;
	/** root cause. */
	private Throwable	rootCause	= null;
	/** message arguments. */
	private Object[]	messageArgs	= null;

	/**
	 * Constructor BaseException.
	 */
	public BaseException() {
		super();
	}

	/**
	 * Constructor BaseException with Message.
	 *
	 * @param msg 전달할 메시지
	 */
	public BaseException(String msg) {
		super(msg);
	}

	/**
	 * Constructor BaseException with Error Code & Message.
	 *
	 * @param errorCode 전달할 에러코드
	 * @param msg 전달할 메시지
	 */
	public BaseException(String errorCode, String msg) {
		super(msg);
		this.errorCode	= errorCode;
	}

	/**
	 * Constructor BaseException with Exception & Message.
	 *
	 * @param msg 전달할 메시지
	 * @param cause 전달할 exception
	 */
	public BaseException(String msg, Throwable cause) {
		super(msg, cause);
		this.rootCause	= cause;
	}

	/**
	 * Constructor BaseException with Exception
	 *
	 * @param cause 전달할 exception
	 */
	public BaseException(Throwable cause) {
		super(cause);
		this.rootCause	= cause;
	}

	/**
	 * Prints the stack trace.
	 *
	 * @see java.lang.Throwable#printStackTrace()
	 */
	public void printStackTrace() {
		printStackTrace(System.err);
	}

	/**
	 * Prints the stack trace.
	 *
	 * @param outStream the out stream
	 * @see java.lang.Throwable#printStackTrace(java.io.PrintStream)
	 */
	public void printStackTrace(PrintStream outStream) {
		printStackTrace(new PrintWriter(outStream));
	}

	/**
	 * Prints the stack trace.
	 *
	 * @param writer the writer
	 * @see java.lang.Throwable#printStackTrace(java.io.PrintWriter)
	 */
	public void printStackTrace(PrintWriter writer) {
		super.printStackTrace(writer);

		if (null != getRootCause()) {
			getRootCause().printStackTrace(writer);
		}

		writer.flush();
	}

	/**
	 * Root Code getter.
	 *
	 * @return Root Code
	 */
	public Throwable getRootCause() {
		return rootCause;
	}

	/**
	 * Root Code setter.
	 *
	 * @param rootCause Root Code
	 */
	public void setRootCause(Throwable rootCause) {
		this.rootCause = rootCause;
	}

	/**
	 * Message Arguments getter.
	 *
	 * @return Message Arguments
	 */
	public Object[] getMessageArgs() {
		return messageArgs;
	}

	/**
	 * Message Arguments setter.
	 *
	 * @param messageArgs Message Arguments
	 */
	public void setMessageArgs(Object[] messageArgs) {
		this.messageArgs = messageArgs;
	}

	/**
	 * Gets exception의 에러코드.
	 *
	 * @return the exception의 에러코드
	 */
	public String getErrorCode() {
		return errorCode;
	}

	/**
	 * Sets exception의 에러코드.
	 *
	 * @param errorCode the new exception의 에러코드
	 */
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
}
