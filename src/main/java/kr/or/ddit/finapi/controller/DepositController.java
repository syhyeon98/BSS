package kr.or.ddit.finapi.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Table;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.AreaReference;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFTable;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.finapi.dao.BankOptionDAO;
import kr.or.ddit.finapi.service.DepositService;
import kr.or.ddit.finapi.vo.BankOptionVO;
import kr.or.ddit.finapi.vo.DepositVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;

@Controller
@RequestMapping("/deposit/")
public class DepositController {

	@Inject
	private BankOptionDAO bankOptionDao;

	@Inject
	private DepositService depositService;

	@ModelAttribute("simpleCondition")
	public SimpleCondition setSimpleCondition() {
		return new SimpleCondition();
	}

	/**
	 * 정기예금 클릭시 폼 띄워주는 역할
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("regDeposit")
	public String regDeposit(Model model) {

		List<BankOptionVO> bankOptionList = bankOptionDao.selectBankOptionList();
		model.addAttribute("bankOptionList", bankOptionList);
		return "fin/prdt/regDeposit";
	}

	/**
	 * ajax를 이용하여 데이터를 불러오기 위함
	 * 
	 * @param map
	 * @param model
	 * @return
	 */
	@PostMapping("depositList.do")
	public String depositList(@RequestBody HashMap<String, Object> map, Model model) {
		int currentPage = (int) map.get("page");
		long saveMoney = Long.parseLong((String) map.get("saveMoney"));
		PaginationInfo<DepositVO> paging = new PaginationInfo<>(10, 10);
		paging.setDetailCondition(map);
		paging.setCurrentPage(currentPage);
		SimpleCondition simpleCondition = new SimpleCondition();
		System.out.println(map.get("searchWord"));
		if (map.get("searchWord") != null && map.get("searchWord") != "") {
			simpleCondition.setSearchType(map.get("searchType").toString());
			simpleCondition.setSearchWord(map.get("searchWord").toString());
		}
		paging.setSimpleCondition(simpleCondition);
		List<DepositVO> depositList = depositService.retrieveDepositList(paging);
		for (DepositVO deposit : depositList) {
			deposit.setSaveMoney(saveMoney);
		}
		paging.setDataList(depositList);
		model.addAttribute("paging", paging);
		return "fin/prdt/ajax/depositAjax";
	}

	@PostMapping("compareDepoist.do")
	public String compareDeposit(@RequestBody HashMap<String, Object> map, Model model) {
		List<String> arrFinPrdtCd = (List<String>) map.get("finPrdtCdList");
		List<String> intrRateTypeList = (List<String>) map.get("intrRateTypeList");
		List<String> finCoNoList = (List<String>) map.get("finCoNoList");
		List<String> saveTrmList = (List<String>) map.get("saveTrmList");
		long saveMoney = Long.parseLong((String) map.get("saveMoney"));
		List<DepositVO> depositList = new ArrayList<DepositVO>();
		for (int i = 0; i < arrFinPrdtCd.size(); i++) {
			DepositVO deposit = new DepositVO();
			deposit.setFinPrdtCd(arrFinPrdtCd.get(i));
			deposit.setIntrRateType(intrRateTypeList.get(i));
			deposit.setFinCoNo(finCoNoList.get(i));
			deposit.setSaveTrm(Integer.parseInt(saveTrmList.get(i)));
			deposit = depositService.retrieveDeposit(deposit);
			deposit.setSaveMoney(saveMoney);
			depositList.add(deposit);
		}
		model.addAttribute("depositList", depositList);
		return "fin/prdt/ajax/compareDeposit";
	}
//	@PostMapping("downloadExcel")
//	public String downloadExcel(@RequestBody HashMap<String, Object> map, Model model) {
//		List<String> arrFinPrdtCd = (List<String>) map.get("finPrdtCdList");
//		List<String> intrRateTypeList = (List<String>) map.get("intrRateTypeList");
//		List<String> finCoNoList = (List<String>) map.get("finCoNoList");
//		List<String> saveTrmList = (List<String>) map.get("saveTrmList");
//		long saveMoney = Long.parseLong((String) map.get("saveMoney"));
//		List<DepositVO> depositList = new ArrayList<DepositVO>();
//		for (int i = 0; i < arrFinPrdtCd.size(); i++) {
//			DepositVO deposit = new DepositVO();
//			deposit.setFinPrdtCd(arrFinPrdtCd.get(i));
//			deposit.setIntrRateType(intrRateTypeList.get(i));
//			deposit.setFinCoNo(finCoNoList.get(i));
//			deposit.setSaveTrm(Integer.parseInt(saveTrmList.get(i)));
//			deposit = depositService.retrieveDeposit(deposit);
//			deposit.setSaveMoney(saveMoney);
//			depositList.add(deposit);
//		}
//		model.addAttribute("depositList", depositList);
//		return "fin/prdt/ajax/compareDeposit";
//	}

	@PostMapping("downloadExcel")
    public String downloadExcel(@RequestBody HashMap<String, Object> map, Model model){
    	
		List<String> arrFinPrdtCd = (List<String>) map.get("finPrdtCdList");
		List<String> intrRateTypeList = (List<String>) map.get("intrRateTypeList");
		List<String> finCoNoList = (List<String>) map.get("finCoNoList");
		List<String> saveTrmList = (List<String>) map.get("saveTrmList");
		long saveMoney = Long.parseLong((String) map.get("saveMoney"));
		List<DepositVO> depositList = new ArrayList<DepositVO>();
		for (int i = 0; i < arrFinPrdtCd.size(); i++) {
			DepositVO deposit = new DepositVO();
			deposit.setFinPrdtCd(arrFinPrdtCd.get(i));
			deposit.setIntrRateType(intrRateTypeList.get(i));
			deposit.setFinCoNo(finCoNoList.get(i));
			deposit.setSaveTrm(Integer.parseInt(saveTrmList.get(i)));
			deposit = depositService.retrieveDeposit(deposit);
			deposit.setSaveMoney(saveMoney);
			depositList.add(deposit);
		}
		model.addAttribute("depositList", depositList);
    	
    	return "fin/prdt/ajax/excelView";
    }
    
    
//    @PostMapping("downloadExcel")
//    public ResponseEntity<byte[]> downloadExcel(@RequestBody List<List<String>> excelRowData) throws IOException {
//    	Workbook workbook = new XSSFWorkbook();
//    	XSSFSheet sheet = (XSSFSheet) workbook.createSheet("Sheet1");
//    	
//    	// Define a region for the table
//    	int firstRow = 0;
//    	int lastRow = excelRowData.size() - 1;
//    	int firstCol = 0;
////    	    int lastCol = excelRowData.get(0).size() - 1;
//    	int lastCol = excelRowData.get(0).size();
//    	CellRangeAddress region = new CellRangeAddress(firstRow, lastRow, firstCol, lastCol);
//    	
//    	AreaReference area = workbook.getCreationHelper().createAreaReference( new CellReference(firstRow, lastRow),  new CellReference(lastRow, lastCol));
//    	
//    	// Add a table to the sheet
//    	sheet.setAutoFilter(region);
//    	sheet.createFreezePane(1, 1); // Freeze the header row
//    	Table table = sheet.createTable(area);
//    	((XSSFTable) table).setDisplayName("MyTable");
//    	
//    	CellStyle titleStyle = workbook.createCellStyle();
//    	Font font = workbook.createFont();
//    	font.setBold(true);
//    	titleStyle.setFont(font);
//    	titleStyle.setFillForegroundColor(IndexedColors.ROYAL_BLUE.getIndex());
//    	titleStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
//    	
//    	// Add center alignment to all cells
//    	CellStyle centerStyle = workbook.createCellStyle();
//    	centerStyle.setAlignment(HorizontalAlignment.CENTER);
//    	centerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
//    	
//    	for (int i = 0; i < excelRowData.size(); i++) {
//    		Row row = sheet.createRow(i);
//    		List<String> rowData = excelRowData.get(i);
//    		for (int j = 0; j < rowData.size(); j++) {
//    			Cell cell = row.createCell(j);
//    			cell.setCellValue(rowData.get(j));
//    			cell.setCellStyle(centerStyle); // Apply center alignment to all cells
//    			if (i == 0) {
//    				cell.setCellStyle(titleStyle);
//    			}
//    		}
//    	}
//    	
//    	sheet.setAutoFilter(region);
//    	sheet.createFreezePane(1, 1); // Freeze the header row
//    	
//    	ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//    	workbook.write(outputStream);
//    	workbook.close();
//    	
//    	byte[] excelBytes = outputStream.toByteArray();
//    	outputStream.close();
//    	
//    	return ResponseEntity
//    			.ok()
//    			.header("Content-Disposition", "attachment; filename=excel_file.xlsx")
//    			.contentType(org.springframework.http.MediaType.APPLICATION_OCTET_STREAM)
//    			.body(excelBytes);
//    }

}
