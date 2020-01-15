package ony.framework.util.download;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import ony.framework.BaseConfig;
import ony.framework.NotExistException;


public class DownloadHelper {
  /**
   * Download.
   *
   * @param request the request
   * @param response the response
   * @param filePath the file path
   * @param serverFileName the server file name
   * @param originFileName the origin file name
   * @throws Exception the exception
   */
  public static void download(HttpServletRequest request, HttpServletResponse response,
      String filePath, String serverFileName, String originFileName) throws Exception {
    String  basePath  = filePath;
    String  fullName  = basePath + File.separator + serverFileName;
    System.out.println("================================================================");
    System.out.println("fullName=="+fullName);
    System.out.println("================================================================");
    File  file    = new File(fullName);

    if (file.exists() && file.isFile() && !file.isDirectory() && !file.isHidden()) {
      long  fileLen = file.length();

      setHeaderForDownload(request, response, originFileName, fileLen);

      BufferedInputStream   bis = null;
      BufferedOutputStream  bos = null;

      try {
        bis = new BufferedInputStream(new FileInputStream(file));
        bos = new BufferedOutputStream(response.getOutputStream());

        byte[]  buffer  = new byte[4096]; // buffer size 4K.
        int   read  = 0;

        while ((read = bis.read(buffer)) != -1) {
          bos.write(buffer, 0, read);
        }

        bos.flush();
      } catch (Exception e) {
        throw e;
      } finally {
        try {
          if (null != bos) {
            bos.close();
          }

          if (null != bis) {
            bis.close();
          }
        } catch (Exception e) {
          throw e;
        }
      }
    } else {
      throw new NotExistException("파일이 존재하지 않습니다.");
    }
  }

  /**
   * Sets header for download.
   *
   * @param request the request
   * @param response the response
   * @param downName the down name
   * @param fileLen the file len
   * @throws Exception the exception
   */
  private static void setHeaderForDownload(HttpServletRequest request, HttpServletResponse response,
      String downName, long fileLen) throws Exception {
    String  convFileName  = null;
    String  strClient   = request.getHeader("user-agent");
    int   extIdx      = downName.lastIndexOf(".");
    String  ext       = "";

    if (-1 < extIdx) {
      ext = downName.substring(extIdx + 1);
    }

    String  mime    = MimeTypeUtil.getValue(ext, "application/octet-stream");
    String  resCharset  = StringUtils.defaultIfEmpty(
                  BaseConfig.getValue("fileDownloadCharset"), "iso-8859-1"
                );

    if ((null != strClient) && ( -1 < strClient.indexOf("MSIE") || -1 < strClient.indexOf("Trident") || -1 < strClient.indexOf("Edge")) ) {
      if (!"utf-8".equalsIgnoreCase(resCharset) && isMsOfficeFile(downName)) {
        Pattern kp  = Pattern.compile("[\uac00-\ud7af\u1100-\u11ff]");
        Pattern cp  = Pattern.compile("[\u3040-\u318f\u3100-\u312f\u3040-\u309F\u30A0-\u30FF"
                          + "\u31F0-\u31FF\u3300-\u337f\u3400-\u4dbf\u4e00-\u9fff"
                          + "\uf900-\ufaff\uff65-\uff9f]");
        Matcher km  = kp.matcher(downName);
        Matcher cm  = cp.matcher(downName);

        if (km.find() && !cm.find()) {
          request.setCharacterEncoding("euc-kr");
          convFileName  = new String(downName.getBytes("euc-kr"), resCharset);
        } else {
          request.setCharacterEncoding("utf-8");
          convFileName  = StringUtils.replace(URLEncoder.encode(downName, "utf-8"), "+", " ");
        }
      } else {
        request.setCharacterEncoding("utf-8");
        convFileName  = StringUtils.replace(URLEncoder.encode(downName, "utf-8"), "+", " ");
      }
    } else {
      request.setCharacterEncoding("utf-8");
      convFileName  = new String(downName.getBytes("utf-8"), "iso-8859-1");
    }

    response.setContentType(mime);
    response.setHeader("Content-Length", String.valueOf(fileLen));
    response.setHeader("Pragma", "public");
    response.setHeader("Cache-Control", "no-store, max-age=0, no-cache, must-revalidate");
    response.setHeader("Cache-Control", "post-check=0, pre-check=0");
    response.setHeader("Cache-Control", "private");
    response.setHeader("P3P", "CP='ALL IND DSP COR ADM CONo CUR CUSo IVAo IVDo PSA PSD "
                    + "TAI TELo OUR SAMo CNT COM INT NAV ONL PHY PRE PUR UNI'");

    if ((null != strClient) && ( -1 < strClient.indexOf("MSIE") || -1 < strClient.indexOf("Trident") || -1 < strClient.indexOf("Edge")) ) {
      response.setHeader("Content-Disposition", "attachment; filename=" + convFileName);
      response.setHeader("Content-Type", mime + "; name=" + convFileName);
    } else {
      response.setHeader("Content-Disposition", "attachment; filename=\"" + convFileName + "\"");
      response.setHeader("Content-Type", mime + "; name=\"" + convFileName + "\"");
    }

    response.setHeader("Content-Transfer-Encoding", "binary");
  }

  /**
   * MS Office 파일 여부를 판단(파일 확장자로만 판단).
   *
   * @param downName String
   * @return true, if is ms office file
   */
  private static boolean isMsOfficeFile(String downName) {
    if (null == downName) {
      return false;
    }

    String  fileName  = downName.toLowerCase();

    return fileName.endsWith(".doc") || fileName.endsWith(".xls") || fileName.endsWith(".ppt")
        || fileName.endsWith(".docx") || fileName.endsWith(".xlsx") || fileName.endsWith(".pptx");
  }
}
