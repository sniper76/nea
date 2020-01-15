package ony.cmm.common.util;

import java.text.DateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

// AbstractExcelView {//AbstractXlsxStreamingView {
public class ExcelDownloadView extends AbstractXlsxView {

	private static final DateFormat DATE_FORMAT = DateFormat.getDateInstance(DateFormat.SHORT);

//	@Override
//	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
//			HttpServletResponse response) throws Exception {
//		// TODO Auto-generated method stub
//        // TODO Auto-generated method stub
//        String sCurTime = null;
//        sCurTime = new SimpleDateFormat("yyyyMMdd", Locale.KOREA).format(new Date());
//
//        String excelName = sCurTime + "_샘플엑셀다운로드.xlsx";
//        Sheet worksheet = null;
//        Row row = null;
//        CellStyle style = workbook.createCellStyle(); // 셀 스타일을 위한 변수
//
//
//		@SuppressWarnings("unchecked")
//		Map<String, Object> modelMap = (Map<String, Object>) model.get("excelMap");
//
//		String fileName = (String) modelMap.get("fileName");
//
//		@SuppressWarnings("unchecked")
//		TreeMap<Integer, String> headers = (TreeMap<Integer, String>) modelMap.get("header");
//
//		@SuppressWarnings("unchecked")
//		List<Map<String, Object>> datas = (List<Map<String, Object>>) modelMap.get("data");
//
//
//        // 새로운 sheet를 생성한다.
//        worksheet = workbook.createSheet("엑셀 목록");
//
//        // 가장 첫번째 줄에 제목을 만든다.
//        row = worksheet.createRow(0);
//
//        // 칼럼 길이 설정
//        int columnIndex = 0;
//        while (columnIndex < 7) {
//
//            if(columnIndex == 0) {
//                worksheet.setColumnWidth(columnIndex, 3000);
//            } else if (columnIndex == 1) {
//                worksheet.setColumnWidth(columnIndex, 4000);
//            } else if (columnIndex == 2) {
//                worksheet.setColumnWidth(columnIndex, 6000);
//            } else if (columnIndex == 3) {
//                worksheet.setColumnWidth(columnIndex, 4000);
//            } else if (columnIndex == 4) {
//                worksheet.setColumnWidth(columnIndex, 7000);
//            } else if (columnIndex == 5) {
//                worksheet.setColumnWidth(columnIndex, 3000);
//            } else if (columnIndex == 6) {
//                worksheet.setColumnWidth(columnIndex, 3000);
//            }
//            columnIndex++;
//        }
//
//        // 헤더 설정
//        row = worksheet.createRow(0);
//        row.createCell(0).setCellValue("ID");
//        row.createCell(1).setCellValue("제목");
//        row.createCell(2).setCellValue("내용");
//        row.createCell(3).setCellValue("작성자");
//        row.createCell(4).setCellValue("등록일시");
//        row.createCell(5).setCellValue("조회 수");
//        row.createCell(6).setCellValue("댓글 수");
//
//        int rowIndex = 1;
//
//        // 각 해당하는 셀에 값과 스타일을 넣음
//        for(Map<String, Object> board : datas) {
//            row = worksheet.createRow(rowIndex);
//            row.createCell(0).setCellValue(board.get("COMPNY_NM").toString());
//            row.createCell(1).setCellValue(board.get("COMPNY_NM").toString());
//            row.createCell(2).setCellValue(board.get("COMPNY_NM").toString());
//            row.createCell(3).setCellValue(board.get("COMPNY_NM").toString());
//            row.createCell(4).setCellValue(board.get("COMPNY_NM").toString());
//            row.createCell(5).setCellValue(board.get("COMPNY_NM").toString());
//            row.createCell(6).setCellValue(board.get("COMPNY_NM").toString());
//
//            rowIndex++;
//        }
//
//        // 셀 병합 CellRangeAddress(시작 행, 끝 행, 시작 열, 끝 열)
////        worksheet.addMergedRegion(
////                new CellRangeAddress(listExcel.size() + 1, listExcel.size() + 1, 0, 6));
//
//        // 병합 테스트를 위한 설정
////        row = worksheet.createRow(listExcel.size() + 1);
////        row.createCell(0).setCellValue("셀 병합 테스트");
////        row.getCell(0).setCellStyle(style); // 지정한 스타일을 입혀준다.
//
//
//        try {
//            response.setHeader("Content-Disposition", "attachement; filename=\""
//                + java.net.URLEncoder.encode(excelName, "UTF-8") + "\";charset=\"UTF-8\"");
//          } catch (UnsupportedEncodingException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//          }
//
//	}

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		@SuppressWarnings("unchecked")
		Map<String, Object> modelMap = (Map<String, Object>) model.get("excelMap");

		String fileName = (String) modelMap.get("fileName");

		// change the file name
		response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+".xlsx\"");
		response.setHeader("Content-Type", "application/vnd.ms-excel; charset=UTF-8");
		response.setHeader("Content-Description", "JSP Generated Data");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Pragma", "no-cache;");

		@SuppressWarnings("unchecked")
		TreeMap<Integer, String> headers = (TreeMap<Integer, String>) modelMap.get("header");

		@SuppressWarnings("unchecked")
		List<Map<String, Object>> datas = (List<Map<String, Object>>) modelMap.get("data");

		// create excel xls sheet
		Sheet sheet = workbook.createSheet("Sheet1");
		sheet.setDefaultColumnWidth(30);

		// create style for header cells
		CellStyle style = workbook.createCellStyle();
		Font font = workbook.createFont();
		font.setFontName("Arial");
		style.setFillForegroundColor(HSSFColor.BLUE.index);
		style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		font.setBold(true);
		font.setColor(HSSFColor.WHITE.index);
		style.setFont(font);

		// create header row
		Row header = sheet.createRow(0);

		Iterator<Integer> iteratorKey = headers.keySet().iterator();

		while (iteratorKey.hasNext()) {

			Integer key = iteratorKey.next();

			header.createCell(key.intValue() - 1).setCellValue(headers.get(key));
			header.getCell(key.intValue() - 1).setCellStyle(style);
		}

		int rowCount = 1;

		for (Map<String, Object> user : datas) {
			Row userRow = sheet.createRow(rowCount++);
			while (iteratorKey.hasNext()) {

				Integer k = iteratorKey.next();

				userRow.createCell(k.intValue() - 1).setCellValue(user.get(k).toString());
			}

		}
	}

//	@SuppressWarnings("unchecked")
//    @Override
//    protected void buildExcelDocument(Map<String, Object> modelMap,
//            HSSFWorkbook workbook, HttpServletRequest request,
//            HttpServletResponse response) throws Exception {
//
//
//		String fileName = (String) modelMap.get("fileName");
//
//		TreeMap<Integer, String> headers = (TreeMap<Integer, String>) modelMap.get("header");
//
//		List<Map<String, Object>> datas = (List<Map<String, Object>>) modelMap.get("data");
//
//        //response.setContentType("application/vnd.ms-excel");
//
//        //크롬에서 다운로드시 파일명 문제. : 파일명 설정
//        response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+".xls\"");
//
//        System.out.println("EmpListExcel :::::::::::::::::::::");
//        HSSFSheet excelSheet = workbook.createSheet("Sheet1");
//        setExcelHeader(excelSheet, headers);
//
//
//        setExcelRows(excelSheet, headers, datas);
//
//    }
//
//    public void setExcelHeader(HSSFSheet excelSheet, TreeMap<Integer, String> header) {
//        HSSFRow excelHeader = excelSheet.createRow(0);
//
//		Iterator<Integer> iteratorKey = header.keySet().iterator();
//
//		while (iteratorKey.hasNext()) {
//
//			Integer key = iteratorKey.next();
//
//			excelHeader.createCell(key.intValue() - 1).setCellValue(header.get(key));
//		}
//    }
//
//    public void setExcelRows(HSSFSheet excelSheet, TreeMap<Integer, String> header, List<Map<String, Object>> data) {
//		int rowCount = 1;
//		Iterator<Integer> iteratorKey = header.keySet().iterator();
//
//		for (Map<String, Object> user : data) {
//			Row userRow = excelSheet.createRow(rowCount++);
//			while (iteratorKey.hasNext()) {
//
//				Integer k = iteratorKey.next();
//
//				userRow.createCell(k.intValue() - 1).setCellValue(user.get(k).toString());
//			}
//
//		}
//    }
}