package ony.framework.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.stereotype.Service;

import ony.cmm.common.bean.FileBean;
import ony.framework.BaseConfig;

@Service("ftpUtil")
public class FtpMngUtil {
	protected final Log logger = LogFactory.getLog(getClass());

	public boolean fileUpload(String localFilePath, String saveFilePath, String [] files) throws Exception {

		  FTPClient ftp = null; 								// FTP Client 객체
		  FileInputStream fis = null; 						// File Input Stream
		  boolean isSuccess = false;
		  String remoteFilePath =  BaseConfig.getValue("FTP_IMG_PATH")+saveFilePath;

		  String url  = BaseConfig.getValue("FTP_IMG_URL");
		  String id  = BaseConfig.getValue("FTP_IMG_ID");
		  String pwd  = BaseConfig.getValue("FTP_IMG_PWD");
		  String port = BaseConfig.getValue("FTP_IMG_PORT");

		  try{
		      ftp = new FTPClient(); 											// FTP Client 객체 생성
		      ftp.setControlEncoding("UTF-8"); 							// 문자 코드를 UTF-8로 인코딩
		      ftp.connect(url, Integer.parseInt(port)); 					// 서버접속 " "안에 서버 주소 입력 또는 "서버주소", 포트번호

		      System.out.println("########## Connected to " + url + " on "+ftp.getRemotePort());
		      int  reply = ftp.getReplyCode();
		      if (!FTPReply.isPositiveCompletion(reply)) {
	                ftp.disconnect();
	                System.err.println("FTP server refused connection.");
	                System.exit(1);
	          }

		      if(!ftp.login(id, pwd)) {
	                ftp.logout();
	                throw new Exception("ftp 서버에 로그인하지 못했습니다.");
	          }

		      ftp.setFileType(FTP.BINARY_FILE_TYPE);					// 업로드 파일 타입 셋팅
	          ftp.enterLocalPassiveMode(); 									// Passive Mode 접속일때


	          try{
	                ftp.makeDirectory(remoteFilePath);
	          }catch(Exception e){
	                e.printStackTrace();
	          }
	          ftp.changeWorkingDirectory(remoteFilePath);				// 작업 디렉토리 변경
	          System.out.println(" ftp.printWorkingDirectory() : " + ftp.printWorkingDirectory());

		      try{
		    	  for(int i = 0; i < files.length; i++) {
		                String tempFileName = new String(files[i].getBytes("utf-8"),"iso_8859_1");
		                String sourceFile = localFilePath+"/"+tempFileName;
		                File uploadFile = new File(sourceFile);
		                try {
		                    fis = new FileInputStream(uploadFile);
		                    System.out.println(sourceFile + " : 전송시작 = >");

		                     //tempFileName 업로드 될 타겟의 풀 경로가 들어가야 함.  ex) /A/A01/A001/aa.zip   파일명만 들어갈경우 unix에서 전송 실패하는 경우가 생김.
		                    isSuccess = ftp.storeFile(tempFileName, fis);
		                    System.out.println(sourceFile + " : 전송결과 = >" + isSuccess);
		                } catch(IOException e) {
		                    e.printStackTrace();
		                    isSuccess = false;
		                } finally {
		                    if (fis != null) {
		                        try {fis.close(); } catch(IOException e) {}
		                    }
		                }
		            }

		    	  if(isSuccess){
		    	     FileUtil.delete(localFilePath);
		    	  }

		      } catch(IOException ex){
		          System.out.println("IO Exception : " + ex.getMessage());
		      }finally{
		          if (fis != null){
		              try{
		                  fis.close(); // Stream 닫기
		                  return isSuccess;

		              }
		              catch(IOException ex){
		                  System.out.println("IO Exception : " + ex.getMessage());
		              }
		          }
		      }
		      ftp.logout(); // FTP Log Out
		  }catch(IOException e){
		      System.out.println("IO:"+e.getMessage());
		  }finally{
		      if (ftp != null && ftp.isConnected()){
		          try{
		              ftp.disconnect(); // 접속 끊기
		              return isSuccess;
		          }
		          catch (IOException e){
		              System.out.println("IO Exception : " + e.getMessage());
		          }
		      }
		  }
		  return isSuccess;
	}


	/**
	 * imgDelete
	 * 2015. 9. 4.
	 *
	 * @param localFilePath
	 * @param saveFilePath
	 * @param fileName
	 * @param files
	 * @return
	 * @throws Exception
	 * @Description FTP 서버에 업로드 되었던 파일을 삭제한다.
	 */
	public boolean imgDelete(String localFilePath, String saveFilePath, String fileName, String [] files) throws Exception {

		  FTPClient ftp = null; // FTP Client 객체
		  FileInputStream fis = null; // File Input Stream
		  boolean isSuccess = false;
		  String remoteFilePath = BaseConfig.getValue("FTP_IMG_PATH")+saveFilePath+"/";

      String url  = BaseConfig.getValue("FTP_IMG_URL");
      String id  = BaseConfig.getValue("FTP_IMG_ID");
      String pwd  = BaseConfig.getValue("FTP_IMG_PWD");
      String port = BaseConfig.getValue("FTP_IMG_PORT");

		  try{
		      ftp = new FTPClient(); // FTP Client 객체 생성
		      ftp.setControlEncoding("UTF-8"); // 문자 코드를 UTF-8로 인코딩
		      ftp.connect(url, Integer.parseInt(port)); // 서버접속 " "안에 서버 주소 입력 또는 "서버주소", 포트번호

		      System.out.println("########## Connected to " + url + " on "+ftp.getRemotePort());
		      int  reply = ftp.getReplyCode();
		      if (!FTPReply.isPositiveCompletion(reply)) {
	                ftp.disconnect();
	                System.err.println("FTP server refused connection.");
	                System.exit(1);
	          }

		      ftp.login(id, pwd); // FTP 로그인 ID, PASSWORLD 입력

		      if(!ftp.login(id, pwd)) {
	                ftp.logout();
	                throw new Exception("ftp 서버에 로그인하지 못했습니다.");
	          }

		      ftp.enterLocalPassiveMode(); // Passive Mode 접속일때
		      ftp.setFileType(FTP.BINARY_FILE_TYPE); // 업로드 파일 타입 셋팅

		      ftp.changeWorkingDirectory(remoteFilePath);		 // 작업 디렉토리 변경
	          System.out.println(" ftp.printWorkingDirectory() : " + ftp.printWorkingDirectory());
		      try{

		    	  for(int i = 0; i < files.length; i++) {
		                //ftp서버에 한글파일을 쓸때 한글깨짐 방지
		                String tempFileName = new String(files[i].getBytes("utf-8"),"iso_8859_1");
	                	isSuccess = ftp.deleteFile(files[i]);//파일삭제
	                	System.out.println("파일 삭제 =>  : " + isSuccess);
		            }//end for


		          if (isSuccess){
		          }else{
				     throw new Exception("파일을 삭제 할 수 없습니다.");
				  }
		      } catch(IOException ex){
		          System.out.println("IO Exception : " + ex.getMessage());
		      }finally{
		          if (fis != null){
		              try{
		                  fis.close(); // Stream 닫기
		                  return isSuccess;

		              }
		              catch(IOException ex){
		                  System.out.println("IO Exception : " + ex.getMessage());
		              }
		          }
		      }
		      ftp.logout(); // FTP Log Out
		  }catch(IOException e){
		      System.out.println("IO:"+e.getMessage());
		  }finally{
		      if (ftp != null && ftp.isConnected()){
		          try{
		              ftp.disconnect(); // 접속 끊기
		              return isSuccess;
		          }
		          catch (IOException e){
		              System.out.println("IO Exception : " + e.getMessage());
		          }
		      }
		  }
		  return isSuccess;
	}

	/**
   * imgUploadPersonnel
   * 2016. 5. 11.
   *
   * @param localFilePath
   * @param saveFilePath
   * @param files
   * @return
   * @throws Exception
   * @Description 인사정보등록 관련 사진 FTP 업로드
   */
  public boolean imgUploadPersonnel(String localFilePath, String saveFilePath, List<Map<String,Object>> files) throws Exception {

      FTPClient ftp = null;                 // FTP Client 객체
      FileInputStream fis = null;             // File Input Stream
      //File uploadfile = new File(localFilePath);
      boolean isSuccess = false;
      String remoteFilePath = BaseConfig.getValue("FTP_IMG_PATH")+saveFilePath;  // /image/upload/지정폴더명으로 저장됨.

        String url  = BaseConfig.getValue("FTP_IMG_URL");
        String id  = BaseConfig.getValue("FTP_IMG_ID");
        String pwd  = BaseConfig.getValue("FTP_IMG_PWD");
        String port = BaseConfig.getValue("FTP_IMG_PORT");

      try{
          ftp = new FTPClient();                      // FTP Client 객체 생성
          ftp.setControlEncoding("UTF-8");              // 문자 코드를 UTF-8로 인코딩
          ftp.connect(url, Integer.parseInt(port));           // 서버접속 " "안에 서버 주소 입력 또는 "서버주소", 포트번호

          System.out.println("########## Connected to " + url + " on "+ftp.getRemotePort());
          int  reply = ftp.getReplyCode();
          if (!FTPReply.isPositiveCompletion(reply)) {
                  ftp.disconnect();
                  System.err.println("FTP server refused connection.");
                  System.exit(1);
            }

          if(!ftp.login(id, pwd)) {
                  ftp.logout();
                  throw new Exception("ftp 서버에 로그인하지 못했습니다.");
            }

          ftp.setFileType(FTP.BINARY_FILE_TYPE);          // 업로드 파일 타입 셋팅
            ftp.enterLocalPassiveMode();                  // Passive Mode 접속일때


            try{
                makeRemoteDirectory(remoteFilePath, ftp);   //ftp 서버에 폴더 생성
            }catch(Exception e){
                  e.printStackTrace();
            }

            ftp.changeWorkingDirectory(remoteFilePath);
            System.out.println(" ftp.printWorkingDirectory() : " + ftp.printWorkingDirectory());

          try{
            for(int i = 0; i < files.size(); i++) {
                    //ftp서버에 한글파일을 쓸때 한글깨짐 방지
                Map<String, Object> map = files.get(i);
                String saveNm = (String)map.get("saveNm");
                    String tempFileName = new String(saveNm.getBytes("utf-8"),"iso_8859_1");
                    String sourceFile = localFilePath + "/" + saveNm; // File 객체
                    File uploadFile = new File(sourceFile);
                    try {
                        fis = new FileInputStream(uploadFile);
                        System.out.println(sourceFile + " : 전송시작 = >");

                         //tempFileName 업로드 될 타겟의 풀 경로가 들어가야 함.  ex) /A/A01/A001/aa.zip   파일명만 들어갈경우 unix에서 전송 실패하는 경우가 생김.
                        isSuccess = ftp.storeFile(tempFileName, fis);
                        System.out.println(sourceFile + " : 전송결과 = >" + isSuccess);
                    } catch(IOException e) {
                        e.printStackTrace();
                        isSuccess = false;
                    } finally {
                        if (fis != null) {
                            try {fis.close(); } catch(IOException e) {}
                        }
                    }//end try
                }//end for
          } catch(IOException ex){
              System.out.println("IO Exception : " + ex.getMessage());
          }finally{
              if (fis != null){
                  try{
                      fis.close(); // Stream 닫기
                      return isSuccess;

                  }
                  catch(IOException ex){
                      System.out.println("IO Exception : " + ex.getMessage());
                  }
              }
          }
          ftp.logout(); // FTP Log Out
      }catch(IOException e){
          System.out.println("IO:"+e.getMessage());
      }finally{
          if (ftp != null && ftp.isConnected()){
              try{
                  ftp.disconnect(); // 접속 끊기
                  return isSuccess;
              }
              catch (IOException e){
                  System.out.println("IO Exception : " + e.getMessage());
              }
          }
      }
      return isSuccess;
  }

	/**
	 * download
	 * 2015. 9. 17.
	 *
	 * @param filePath : ftp에 저장된 파일 경로
	 * @param fileName : ftp에 저장된 파일명
	 * @param saveFilePath	: ftp서버로 부터 다운받아 local에 저장될 경로
	 * @return
	 * @throws Exception
	 * @Description
	 */
	public int download(String filePath, String fileName, String saveFilePath) throws Exception {

	    FileUtil.deleteDown();
	    FileUtil.makeFolder(saveFilePath);

		  FTPClient client = null;
		  BufferedOutputStream bos = null;
		  File fPath  = null;
		  File fDir = null;
		  File f   = null;

		  String downloadPath = saveFilePath;
		  String remoteFilePath = filePath+"/";


      String url  = BaseConfig.getValue("FTP_IMG_URL");
      String id  = BaseConfig.getValue("FTP_IMG_ID");
      String pwd  = BaseConfig.getValue("FTP_IMG_PWD");
      String port = BaseConfig.getValue("FTP_IMG_PORT");



		  //String downloadPath = request.getSession().getServletContext().getRealPath("/") + PropertiesHandler.getValue("FTP_PATH"); //다운로드 경로
		  int result = -1;

		  try{
		   // download 경로에 해당하는 디렉토리 생성
		   fPath     = new File(downloadPath);
		   fDir   = fPath;
		   fDir.mkdirs();

		   f = new File(downloadPath, fileName);

		   client = new FTPClient();
		   client.setControlEncoding("UTF-8");
		   client.connect(url, Integer.parseInt(port));

		   int resultCode = client.getReplyCode();

		   if (FTPReply.isPositiveCompletion(resultCode) == false){
		    client.disconnect();
		    throw new Exception("FTP 서버에 연결할 수 없습니다.");
		   }else{
			    client.setSoTimeout(5000);
			    boolean isLogin = client.login(id, pwd);

			    if (isLogin == false){
			     throw new Exception("FTP 서버에 로그인 할 수 없습니다.");
			    }

			    client.setFileType(FTP.BINARY_FILE_TYPE);
			    client.changeWorkingDirectory(remoteFilePath);

			    bos = new BufferedOutputStream(new FileOutputStream(f));
			    boolean isSuccess = client.retrieveFile(fileName, bos);
			    System.out.println(" 전송 상황 : => " + isSuccess);
		    if (isSuccess){
		    	result = 1; // 성공
		    }else{
		    	throw new Exception("파일 다운로드를 할 수 없습니다.");
		    }

		    client.logout();
		   } // if ~ else
		  }
		  catch (Exception e){
		   throw new Exception("FTP Exception : " + e);
		  }
		  finally{
			  if (bos != null) try {bos.close();} catch (Exception e) {}
			  if (client != null && client.isConnected()) try {client.disconnect();} catch (Exception e) {}

			  return result;
		  } // try ~ catch ~ finally
		 } // download()

	public int downloadZip(String filePath, String saveFilePath, List<FileBean> fileList) throws Exception {

	    FileUtil.deleteDown();
	    FileUtil.makeFolder(saveFilePath);

	    FTPClient client = null;
	    BufferedOutputStream bos = null;
	    File fPath  = null;
	    File fDir = null;
	    File f   = null;

	    String downloadPath = saveFilePath;
	    String remoteFilePath = filePath+"/";

	    String url  = BaseConfig.getValue("FTP_IMG_URL");
	    String id  = BaseConfig.getValue("FTP_IMG_ID");
	    String pwd  = BaseConfig.getValue("FTP_IMG_PWD");
	    String port = BaseConfig.getValue("FTP_IMG_PORT");

	    //String downloadPath = request.getSession().getServletContext().getRealPath("/") + PropertiesHandler.getValue("FTP_PATH"); //다운로드 경로
	    int result = -1;

	    try{
	     // download 경로에 해당하는 디렉토리 생성
	     fPath     = new File(downloadPath);
	     fDir   = fPath;
	     fDir.mkdirs();

	     client = new FTPClient();
	     client.setControlEncoding("UTF-8");
	     client.connect(url, Integer.parseInt(port));

	     int resultCode = client.getReplyCode();

	     if (FTPReply.isPositiveCompletion(resultCode) == false){
	      client.disconnect();
	      throw new Exception("FTP 서버에 연결할 수 없습니다.");
	     }else{
	        client.setSoTimeout(5000);
	        boolean isLogin = client.login(id, pwd);

	        if (isLogin == false){
	         throw new Exception("FTP 서버에 로그인 할 수 없습니다.");
	        }
	        client.setFileType(FTP.BINARY_FILE_TYPE);
	        client.changeWorkingDirectory(remoteFilePath);

	        FileBean bean = new FileBean();
	        boolean isSuccess = false;

	        for(int i=0; i<fileList.size(); i++){
	          f = new File(downloadPath, fileList.get(i).getSaveNm());
	          bos = new BufferedOutputStream(new FileOutputStream(f));
	          isSuccess = client.retrieveFile(fileList.get(i).getSaveNm(), bos);
	          System.out.println(" 전송 상황 : => " + isSuccess);
	        }

	      if (isSuccess){
	        result = 1; // 성공
	      }else{
	        throw new Exception("파일 다운로드를 할 수 없습니다.");
	      }

	      client.logout();
	     } // if ~ else
	    }
	    catch (Exception e){
	     throw new Exception("FTP Exception : " + e);
	    }
	    finally{
	      if (bos != null) try {bos.close();} catch (Exception e) {}
	      if (client != null && client.isConnected()) try {client.disconnect();} catch (Exception e) {}

	      return result;
	    } // try ~ catch ~ finally
	   } // download()

	protected void makeRemoteDirectory(String remotePath, FTPClient ftp){
		try{
			String [] folders = remotePath.split("/");
			String folder_str = "";
			for(int i=0; i<folders.length; i++) {
	            folder_str += folders[i] + "/";
	            boolean check = ftp.makeDirectory( folder_str );
	            //System.out.println("check : " + check);
	        }
		}catch(Exception e){
			e.printStackTrace();
		}

	}
}
