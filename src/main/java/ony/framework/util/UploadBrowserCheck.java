package ony.framework.util;

public class UploadBrowserCheck {

	/**
	 * 생성자
	 */
	public UploadBrowserCheck() {

	}

	/**
	 * Request Headerd의 User-Agent를 분석하여 IE의 메이저 버전을 가져온다.
	 * @param userAgent User-Agent
	 * @param browserName 브라우저명
	 * @return MajorVersion
	 */
	public static int getBrowserMajorVersion(String userAgent, String browserName) {
		int nMajorVer = 0;
		int nPos = 0;

		if (browserName.equals("MSIE")) {
			// Mozilla/5.0 (compatible; MSIE 10.6; Windows NT 6.1; Trident/5.0; InfoPath.2; SLCC1;(공백)
			// .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 2.0.50727) 3gpp-gba UNTRUSTED/1.0
			nPos = userAgent.indexOf("MSIE ");
	        if (nPos == -1 || userAgent.contains("Opera")) {
	        	nMajorVer = 0;
	        } else {
	        	nMajorVer = parseMajorVersion(userAgent.substring(nPos + 5));
	        }
		} else if (browserName.equals("Chrome")) {
			// Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0(공백)
			// Safari/537.36
			nPos = userAgent.indexOf("Chrome/");
			if (nPos == -1) {
				nMajorVer = 0;
			} else {
				nMajorVer = parseMajorVersion(userAgent.substring(nPos + 7));
			}
		} else if (browserName.equals("Firefox")) {
			// Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0
			nPos = userAgent.indexOf("Firefox/");
			if (nPos == -1) {
				nMajorVer = 0;
			} else {
				nMajorVer = parseMajorVersion(userAgent.substring(nPos + 8));
			}
		} else if (browserName.equals("Safari")) {
			// Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0(공백)
			// Mobile/10A5355d Safari/8536.25
			nPos = userAgent.indexOf("Safari/");
			if (nPos == -1) {
				nMajorVer = 0;
			} else {
				nPos = userAgent.indexOf("Version/");
				if (nPos == -1) {
					nMajorVer = 0;
				} else {
					nMajorVer = parseMajorVersion(userAgent.substring(nPos + 8));
				}
			}
		}

		return nMajorVer;
	}

	/**
	 * 버전 문자열에서 숫자만 추출하여 메이저 버전을 가져온다.
	 * @param strMajorVer MajorVersion
	 * @return MajorVersion
	 */
	public static int parseMajorVersion(String strMajorVer) {
		int nMajorVer = 0;

    	int nDigit = 0;
        while (Character.isDigit(strMajorVer.charAt(nDigit))) {
        	nDigit++;
        }

        try {
        	nMajorVer = Integer.parseInt(strMajorVer.substring(0, nDigit));
        } catch (NumberFormatException ex) {
        	nMajorVer = 0;
        }

        return nMajorVer;
	}
}
