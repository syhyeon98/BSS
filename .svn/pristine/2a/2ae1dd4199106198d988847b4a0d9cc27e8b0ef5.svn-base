package kr.or.ddit.vocation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;
import kr.or.ddit.vocation.service.VocationService;
import kr.or.ddit.vocation.vo.VocationVO;

@Controller
public class VocationController {
	@Inject
	private VocationService service;

	/**
	 * 페이징 조건부분에 쓰는 부분
	 * @return
	 */
	@ModelAttribute("simpleCondition")
	public SimpleCondition simpleCondition() {
	      return new SimpleCondition();
	}
	
	/**
	 * 연가 전체 조회 페이징
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@GetMapping("/pm/servicemanagement/vocation")
	public String vocationPage(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("searchVocation") VocationVO searchVocation
			, Model model
	) {
		PaginationInfo<VocationVO> paging = new PaginationInfo<>(10, 5);
		paging.setCurrentPage(currentPage);
		
		List<VocationVO> vocation = service.retrieveVocationPageList(paging);
		paging.setDataList(vocation);
		model.addAttribute("paging", paging);
		
		return "pm/servicemanagement/vocation";
	}
	/**
	 * 연가 검색 조회 페이징
	 * @param currentPage
	 * @param searchVocation
	 * @param model
	 * @return
	 */
	@PostMapping("/pm/servicemanagement/vocation")
	public String vocationSearch(
			 @RequestBody VocationVO searchVocation
			, Model model
	) {
		
		PaginationInfo<VocationVO> paging = new PaginationInfo<>(10, 5);
		paging.setCurrentPage(searchVocation.getCurrentPage());
		
		paging.setDetailConditionVO(searchVocation);
		
		List<VocationVO> vocation = service.retrieveVocationPageList(paging);
		paging.setDataList(vocation);
		model.addAttribute("paging", paging);
		
		return "jsonView";
	}
	
	/**
	 * 연가 직원 선택 조회(모달)
	 * @param vocationOne
	 * @param authentication
	 * @param model
	 * @return
	 */
	@RequestMapping("/pm/servicemanagement/vocationOne.do")
	public String vocationOne(
			@RequestParam(name="empCd", required = true) String empCd
			, Model model
			
	) {
		List<VocationVO> vocationOne = service.retrieveOneVocation(empCd);
		
		model.addAttribute("vocationOne", vocationOne);
		return "pm/servicemanagement/ajax/vocationOne";
	}
	
	/**
	 * 연가 추가된 후 추가된 데이터 가지고 간 전체조회화면
	 * header : json타입 , ajax-dataType : json
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/pm/servicemanagement/vocation1", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<VocationVO> vocationJson(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
	) {
		PaginationInfo<VocationVO> paging = new PaginationInfo<>(10, 5);
		paging.setCurrentPage(currentPage);
	
		return service.retrieveVocationPageList(paging);
	}

	/**
	 * modifiedData에 수정된 휴가(시작/종료일)데이터들이 JSON 형식으로 전송해서 수정 처리하는 컨트롤러
	 * @param modifiedData
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/pm/servicemanagement/vocationUpdate.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean vocationUpdate(@RequestBody List<VocationVO> modifiedData) {
	    boolean success = true; // 업데이트 성공 여부
	    
	    for (VocationVO vocationVO : modifiedData) {
	        boolean result = service.modifyVocation(vocationVO);
	        
	        if (!result) {
	            success = false;
	            break; // 업데이트 중 오류가 발생하면 반복문 중단
	        }
	    }
	    return success;
	}
	
	/**
	 * 연가 삭제
	 * @param vocationCodes
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/pm/servicemanagement/vocationDelete.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String, String> vocationDelete(@RequestBody List<String> vocationCodes) {
	    Map<String, String> response = new HashMap<>();
	    boolean success = service.removeVocation(vocationCodes);
	    if (success) {
	        response.put("status", "success");
	    } else {
	        response.put("status", "fail");
	    }
	    return response;
	}
	
	/**
	 * [마이페이지] 연가 전체조회 페이징
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@GetMapping("/mypage/myVocation")
	public String myVocationPage(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, Authentication authentication
			, @ModelAttribute("searchVocation") PaginationInfo<VocationVO> searchVocation
			, Model model
	) {
		PaginationInfo<VocationVO> paging = new PaginationInfo<>(10, 5);
		paging.setCurrentPage(currentPage);

		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String emp = wrapper.getRealUser().getEmpCd();
		searchVocation.setEmpCd(emp); //사원번호
		
		List<VocationVO> vocation = service.mySelectVocationPageList(searchVocation);
		paging.setDataList(vocation);
		
		//총 연가
		Integer totalVocation = service.totalMonthVocation(emp);
		//잔여 연가
		Integer restVocation = service.restVocation(emp);
		
		if(totalVocation == null || restVocation == null) {
			model.addAttribute("totalVocation", 0);
			model.addAttribute("restVocation", 0);
		}else {
			model.addAttribute("totalVocation", totalVocation);
			model.addAttribute("restVocation", restVocation);
		}
		
		model.addAttribute("paging", paging);
		
		return "mypage/myVocation";
		
	}
	
	
	
	/**
	 * [마이페이지] 연가 추가된 후 추가된 데이터 가지고 간 전체조회화면
	 * header : json타입 , ajax-dataType : json
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/mypage/myVocation1", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<VocationVO> myVocationJson(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
	) {
		PaginationInfo<VocationVO> paging = new PaginationInfo<>(10, 5);
		paging.setCurrentPage(currentPage);
	
		return service.mySelectVocationPageList(paging);
	}
	
	
	/**
	 * [마이페이지] 연가 삭제
	 * @param vocationCodes
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/mypage/myVocationDelete.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String, String> myVocationDelete(@RequestBody List<String> vocationCodes) {
	    Map<String, String> response = new HashMap<>();
	    boolean success = service.removeVocation(vocationCodes);
	    if (success) {
	        response.put("status", "success");
	    } else {
	        response.put("status", "fail");
	    }
	    return response;
	}
	
	
	/**
	 * [마이페이지] 연가 선택조회(모달)
	 * @param vocationOne
	 * @param authentication
	 * @param model
	 * @return
	 */
	@GetMapping("/mypage/myVocationOne.do")
	public String myVocationOne(
			@RequestParam(name="vocationCode", required = true) String vocationCode
			, Authentication authentication
			, Model model
			
	) {
		VocationVO vocationVO = new VocationVO();
		
		vocationVO.setEmpCd(authentication.getName());
		vocationVO.setVocationCode(vocationCode);
		
		List<VocationVO> vocationOne = service.mySelectOneVocation(vocationVO);
		
		model.addAttribute("vocationOne", vocationOne);
		return "mypage/ajax/myVocationOne";
	}
	
	/**
	 * [마이페이지] modifiedData에 수정된 휴가(시작/종료일)데이터들이 JSON 형식으로 전송해서 수정 처리하는 컨트롤러
	 * @param modifiedData
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/mypage/myVocationUpdate.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean myVocationUpdate(@RequestBody List<VocationVO> modifiedData) {
	    boolean success = true; // 업데이트 성공 여부
	    
	    for (VocationVO vocationVO : modifiedData) {
	        boolean result = service.modifyVocation(vocationVO);
	        
	        if (!result) {
	            success = false;
	            break; // 업데이트 중 오류가 발생하면 반복문 중단
	        }
	    }
	    return success;
	}
	
}
