package kr.or.ddit.myt.test;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.WorkbookUtil;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class POITest {

	
	public static void main(String[] args) throws FileNotFoundException, IOException {
		
		Workbook wb = new XSSFWorkbook();  // or new XSSFWorkbook();
//		Sheet sheet1 = wb.createSheet("new sheet");
//		Sheet sheet2 = wb.createSheet("second sheet");
//		String safeName = WorkbookUtil.createSafeSheetName("[O'Brien's sales*?]"); // returns " O'Brien's sales   "
//		Sheet sheet3 = wb.createSheet(safeName);
//		try (OutputStream fileOut = new FileOutputStream("workbook.xlsx")) {
//		    wb.write(fileOut);
//		}
//		
//		try (OutputStream fileOut = new FileOutputStream("D:/test/workbook.xlsx")) {
//		    wb.write(fileOut);
//		}
		
		CreationHelper createHelper = wb.getCreationHelper();
		Sheet sheet = wb.createSheet("new sheet");
		// Create a row and put some cells in it. Rows are 0 based.
		Row row = sheet.createRow(0);
		Row row2= sheet.createRow(1);
		// Create a cell and put a value in it.
		Cell cell = row.createCell(0);
		cell.setCellValue(1);
		// Or do it on one line.
		row.createCell(1).setCellValue(1.2);
		row.createCell(2).setCellValue(
		     createHelper.createRichTextString("This is a string"));
		row.createCell(3).setCellValue(true);

		row2.createCell(1).setCellValue(1.2);
		row2.createCell(2).setCellValue(
				createHelper.createRichTextString("nextline"));
		row2.createCell(3).setCellValue(true);
		row2.createCell(4).setCellValue(createHelper.createRichTextString("한국말되나여"));
		
		// Write the output to a file
		try (OutputStream fileOut = new FileOutputStream("D:/test/workbook2.xlsx")) {
		    wb.write(fileOut);
		}
	}}
