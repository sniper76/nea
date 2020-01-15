package ony.framework.util;

import java.util.Random;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;

public class KeyGenerateUtil {
	/**
	 * NaonSecond를 기반으로 유니크한 ID를 생성한다.
	 *
	 * @return DB에서 Key로 사용가능한 ID 값(namosecond 17자리 + 랜덤 3자리)
	 */
	public static String getUniqueId() {
		Random	randomGenerator	= new Random();

		String	randomInteger	= Integer.toString(randomGenerator.nextInt(999));
		String	naonTime		= Long.toString(System.nanoTime());

		return StringUtils.leftPad(naonTime, 17, "0") + StringUtils.leftPad(randomInteger, 3, "0");
	}

	/**
	 * 업무코드와 NaonSecond를 기반으로 유니크한 ID를 생성한다.
	 *
	 * @param moduleCode 업무코드
	 * @return DB에서 Key에 사용가능한 ID 값(업무코드 3자리 + namosecond 17자리 + 랜덤 3자리)
	 */
	public static String getUniqueId(String moduleCode) {
		return moduleCode + getUniqueId();
	}

	/**
	 * 암복호화 모듈에서 사용할 Salt (암호화키) 를 생성한다.
	 *
	 * @return 생성한 Salt
	 */
	public static String getSalt() {
		return StringUtils.replace(UUID.randomUUID().toString(), "-", "");
	}

	/**
	 * UUID의 값을 반환한다.<br/><br/>
	 *
	 * UUID 알고리즘중 Java에서 기본 제공하는 v4를 사용한다.<br/>
	 * UUID는 DB의 Key 보다는 서버에 저장되는 파일명 등에 사용한다.<br/><br/>
	 *
	 * UUID 알고리즘<br/>
	 * &nbsp; &nbsp; MAC address based (v1)<br/>
	 * &nbsp; &nbsp; DCE Security based (v2)<br/>
	 * &nbsp; &nbsp; Name based + MD5 hash (v3)<br/>
	 * &nbsp; &nbsp; Random (v4)<br/>
	 * &nbsp; &nbsp; Name based + SHA1 hash (v5)
	 *
	 * @return uuid the UUID
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString();
	}

	/**
	 * 6자리 인증코드값을 반환한다.
	 *
	 * @return auth key
	 */
	public static String getAuthKey() {
		String	authKey	= Integer.toString(getRandomRange(0, 999999));

		return StringUtils.leftPad(authKey, 6, "0");
	}

	/**
	 * 초기화 요청시 랜덤으로 비밀번호를 생성 반환한다.
	 *
	 * @param passwordLength the password length (3 이상, 3 이하로 입력하면 3 으로 처리)
	 * @return random password
	 */
	public static String getRandomPassword(int passwordLength) {
		if (3 > passwordLength) {
			passwordLength	= 3;
		}

		int				countIndex	= (int)Math.ceil(passwordLength / 3.0f);
		int				countUpper	= 0;
		int				countLower	= 0;
		int				countNumber	= 0;
		// 아래 문자열 중 i, l, o, I, L, O 는 사용하지 않음 (숫자 1, 0 과의 혼동 가능성으로 인해)
		String			letters		= "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ0123456789";
		StringBuffer	password	= new StringBuffer();

		for (int i = 0; i < passwordLength; i++) {
			int	index	= getRandomRange(0, letters.length() - 1);

			if (23 > index) {
				countLower++;

				if (countIndex < countLower) {
					index	= getRandomRange(23, letters.length() - 1);
					countLower--;
				}
			}

			if ((23 <= index) && (46 > index)) {
				countUpper++;

				if (countIndex < countUpper) {
					if (countIndex > countLower) {
						index	= getRandomRange(0, 22);
						countLower++;
					} else {
						index	= getRandomRange(46, letters.length() - 1);
						countNumber++;
					}

					countUpper--;
				}
			}

			if (46 <= index) {
				countNumber++;

				if (countIndex < countNumber) {
					if (countIndex > countLower) {
						index	= getRandomRange(0, 22);
						countLower++;
					} else {
						index	= getRandomRange(46, letters.length() - 1);
						countUpper++;
					}

					countNumber--;
				}
			}

			password.append(letters.substring(index, index + 1));
		}

		return password.toString();
	}

	/**
	 * 특정 범위 내에서 랜덤값을 반환한다.
	 *
	 * @param startNo the start no
	 * @param endNo the end no
	 * @return random range
	 */
	private static int getRandomRange(int startNo, int endNo) {
		int	random	= startNo + (int)(Math.random() * (endNo - startNo));

		return (endNo >= random) ? random : (random - 1);
	}
}
