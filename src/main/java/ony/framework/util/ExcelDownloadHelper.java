package ony.framework.util;

import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import ony.framework.bean.ExcelDownloadHelperBean;
import ony.framework.util.download.DownloadHelper;

public class ExcelDownloadHelper {
  /**
   * @ author Sung-Gyum, Kim(elka2001@nate.com)
   *  2016. 3. 8.
   */

  public static  int ExcelDown(HttpServletRequest request, HttpServletResponse response, String defaultPath, String serverfileName, String originalFileName, int columnCnt, ExcelDownloadHelperBean excelDownloadHelperBean) throws Exception{

    /* ==================== FILE DOWN LOG ====================*/
    JSONObject dataJson = (JSONObject)request.getSession().getAttribute("loginData");
//    String userId = (String)dataJson.getJSONObject("data").get("userId");

//      Connection con = null;
//      Statement stmt = null;
//      String SQL ="INSERT INTO VM_FILE_DOWN_LOG (ID,ATTACH_ID,DOWN_TYPE,ORIGINAL_NM,SAVE_NM,CRT_DATE)VALUES('"+userId+"', "+0+", "+545+", '"+originalFileName+"',' "+serverfileName+"', SYSDATE)";
//      try{
//            Class.forName("oracle.jdbc.driver.OracleDriver");
//            String url = "";
//            con = DriverManager.getConnection(url, "", "");
//            stmt = con.createStatement();
//            stmt.executeQuery(SQL);
//      }catch(Exception e){
//        System.out.println(e);
//          return 0;
//      }finally{
//         try{
//             if(stmt != null)stmt.close();
//             if(con != null)con.close();
//         }catch(Exception e){
//           System.out.println(e);
//         }
//       }
      /* ==================== FILE DOWN LOG ==================== */



    try{
      FileUtil.delete();
      // 엑셀데이터
      ArrayList<ExcelDownloadHelperBean> list = (ArrayList<ExcelDownloadHelperBean>) excelDownloadHelperBean.getList();

      //1차로 workbook을 생성
      Workbook workbook = new SXSSFWorkbook(100);


      //2차는 sheet생성
      Sheet sheet = workbook.createSheet();

      //엑셀의 행
      //XSSFRow row=null;
      Row row = null;

      //엑셀의 셀
      ///XSSFCell cell=null;
      Cell cell = null;

      //폰트 설정
      Font fontTitle = workbook.createFont();
      fontTitle.setFontName("맑은 고딕");                  // 폰트 이름
      //fontTitle.setBoldweight(Font.BOLDWEIGHT_BOLD);
      fontTitle.setFontHeightInPoints((short)12);          // 폰트 크기

      Font font = workbook.createFont();
      font.setFontName("맑은 고딕");                  // 폰트 이름



      CellStyle cellTitleStyle = workbook.createCellStyle();
      // Cell 색깔, 무늬 채우기
      cellTitleStyle.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
      //cellTitleStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
      cellTitleStyle.setFont(fontTitle);
      //cellTitleStyle.setBorderLeft(cellTitleStyle.BORDER_THIN);
      //cellTitleStyle.setBorderRight(cellTitleStyle.BORDER_THIN);
      //cellTitleStyle.setBorderBottom(cellTitleStyle.BORDER_THIN);
      //cellTitleStyle.setBorderTop(cellTitleStyle.BORDER_THIN);
      cellTitleStyle.setTopBorderColor(HSSFColor.BLACK.index);
      cellTitleStyle.setTopBorderColor(HSSFColor.BLACK.index);
      cellTitleStyle.setTopBorderColor(HSSFColor.BLACK.index);
      cellTitleStyle.setTopBorderColor(HSSFColor.BLACK.index);


      //  셀 스타일
      CellStyle style = workbook.createCellStyle();
      //  셀 스타일 적용
      //style.setBorderLeft(style.BORDER_THIN);
      //style.setBorderRight(style.BORDER_THIN);
      //style.setBorderBottom(style.BORDER_THIN);
      //style.setBorderTop(style.BORDER_THIN);
      style.setTopBorderColor(HSSFColor.BLACK.index);
      style.setTopBorderColor(HSSFColor.BLACK.index);
      style.setTopBorderColor(HSSFColor.BLACK.index);
      style.setTopBorderColor(HSSFColor.BLACK.index);
      style.setFont(font);

      //임의의 DB데이터 조회
      if(list.size() > 0){
          for(int i = 0; i< list.size(); i++){
             //시트에 하나의 행을 생성한다(i 값이 0이면 첫번째 줄에 해당)
              row=sheet.createRow(i);

              if(i == 0){
                row.setHeight((short) 350);
              }

              ExcelDownloadHelperBean bean = list.get(i);
              Object obj= bean;
                  int j = 0;
                  for (Field field : obj.getClass().getDeclaredFields()){
                     if(j < columnCnt){
                          field.setAccessible(true);
                          Object value=field.get(obj);
                          cell=row.createCell(j);
                          if(String.valueOf(value) == null || String.valueOf(value).equals("null")){
                            cell.setCellValue("");
                          }else{
                            cell.setCellValue(String.valueOf(value));
                          }
                          if(i == 0){
                            //title 스타일적용
                            cell.setCellStyle(cellTitleStyle); // 셀 스타일 적용
                          }else{
                            cell.setCellStyle(style);
                          }
                          int widthCol = (short)(String.valueOf(value).length())*1000;
                          if(widthCol > 63000){
                            widthCol = 63000;
                          }
                          sheet.setColumnWidth((short)j, widthCol); // 셀넓이 지정
                     }
                      j++;
                  }
          }
      }
      FileUtil.makeFolder(defaultPath);

      FileOutputStream fileoutputstream=new FileOutputStream(defaultPath+"\\"+serverfileName);

      //파일을 쓴다
      workbook.write(fileoutputstream);
      //필수로 닫아주어야함
      fileoutputstream.flush();
      fileoutputstream.close();
      System.out.println("엑셀파일생성성공");

      /* ==================== FILE DOWN LOG ==================== */

      URLEncoder.encode(serverfileName, "UTF-8");

      DownloadHelper.download(
          request,
          response,
          defaultPath,
          serverfileName,
          originalFileName
     );
      return 1;
    }catch(Exception ex){
          System.out.println(ex);
          return 0;
    }
    }
}
