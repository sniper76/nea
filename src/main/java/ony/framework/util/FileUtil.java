package ony.framework.util;

import java.io.File;
import java.text.DecimalFormat;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import ony.framework.BaseConfig;
import ony.framework.BaseConstant;


/**
 * FileUtil Class 이다.<br/>
 * 파일 및 디렉토리와 관련된 여러 기능을 제공하는 유틸리티 클래스
 *
 */
public class FileUtil {
	/** logger */
	private static Logger	logger	= Logger.getLogger(FileUtil.class);

	/**
	 * 입력받은 파일 이름에서 파일 확장자를 추출한다.
	 *
	 * @param fileName 파일명
	 * @return 파일 확장자<br/>입력받은 파일명이 null이거나 확장자를 추출할수 없다면 빈문자열을 반환한다.
	 */
	public static String getFileType(String fileName) {
		String	fileExt	= "";

		if (StringUtils.isNotEmpty(fileName)) {
			int	offset	= fileName.lastIndexOf(".");

			if ((-1 < offset) && (offset != fileName.length())) {
				fileExt	= fileName.substring(offset + 1);
			} else {
				fileExt	= "";
			}
		}

		return fileExt;
	}

	/**
	 * 폴더를 생성한다.
	 *
	 * @param dirPath 폴더 경로
	 */
	public static void makeFolder(String dirPath) {
		File	dir	= new File(dirPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
	}

	 /**
   * 파일&디렉토리를 삭제한다. (download)
   *
   * @param source 삭제할 파일&디렉토리 (/upload 이하의 경로만 사용)
   * @return boolean 삭제 성공 여부
   */
  public static boolean deleteDown() {
    File  sourceFile  = new File(BaseConfig.getValue("fileDownloadPath") + BaseConfig.getValue("SEPARATOR"));
    return delete(sourceFile);
  }

  public static boolean deleteUpload() {
    File  sourceFile  = new File(BaseConfig.getValue("fileUploadDir") + BaseConfig.getValue("SEPARATOR"));
    return delete(sourceFile);
  }


  /**
   * 파일&디렉토리를 삭제한다.
   *
   * @param source 삭제할 파일&디렉토리 (/upload 이하의 경로만 사용)
   * @return boolean 삭제 성공 여부
   */
  public static boolean delete(String source) {
    File  sourceFile  = new File(
                  BaseConfig.getValue("fileUploadDir") + BaseConfig.getValue("SEPARATOR") + source
                );
    return delete(sourceFile);
  }

   public static boolean delete() {
      File  sourceFile  = new File(BaseConfig.getValue("fileUploadDir") + BaseConfig.getValue("SEPARATOR"));
      return delete(sourceFile);
    }

	/**
	 * 파일&디렉토리 삭제 메소드
	 *
	 * @param source 삭제 파일&디렉토리
	 * @return boolean 삭제 성공 여부
	 */
	public static boolean delete(File source) {
		boolean	sucess	= false;

		if (source.exists()) {
			if (source.isDirectory()) {
				File[]	list	= source.listFiles();

				for (int i = 0; i < list.length; i++) {
					File	sourceFile	= new File(source.getPath() + BaseConfig.getValue("SEPARATOR") + list[i].getName());

					sucess	= delete(sourceFile);

					if (!sucess) {
						break;
					}
				}

				sucess	= source.delete();
			} else {
				sucess	= source.delete();
			}
		}

		return sucess;
	}

	/**
	 * 숫자를 단위(Bytes, KB, MB, GB)로 변환
	 *
	 * @param num 파일크기 숫자
	 * @return 변환된 문자열
	 */
	public static String getFileSizeFromNum(long num) {
		String	ret		= "";
		int		bias	= 1024;
		float	real	= num * 1.0f;

		DecimalFormat	format	= new DecimalFormat("#,###.00");

		if (num >= (bias * bias * bias)) {
			ret		= format.format(real / (bias * bias * bias)) + "GB";
		} else if (num >= (bias * bias)) {
			ret		= format.format(real / (bias * bias)) + "MB";
		} else if (num >= bias) {
			ret		= format.format(real / bias) + "KB";
		} else {
			format	= new DecimalFormat("#,###");
			ret		= format.format(num) + "Bytes";
		}

		return ret;
	}

	/**
	 * 숫자를 단위(Bytes, KB, MB, GB)로 변환
	 *
	 * @param num 파일크기 숫자
	 * @return 변환된 문자열
	 */
	public static String getFileSizeFromNum(int num) {
		return getFileSizeFromNum((long)num);
	}

	/**
	 * 유효한 파일명을 반환한다. (파일명에서 /, :, *, ?, <, >, \, ", | 문자를 _ 문자로 치환한다.)
	 *
	 * @param fileName 원본 파일명
	 * @return 변환된 파일명
	 */
	public static String getValidFileName(String fileName) {
		return StringUtils.replace(fileName.trim().replaceAll("[/:*?<>\"|]", "_"), "\\", "_");
	}
}
