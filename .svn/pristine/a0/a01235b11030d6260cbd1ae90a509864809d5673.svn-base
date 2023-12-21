package kr.or.ddit.edDocument.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.edDocument.service.DocumentService;
import kr.or.ddit.edDocument.vo.DocumentTypeVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("ed/document/")
public class DocumentTypeController {
	
	private final DocumentService service;
	
	@ModelAttribute("documentType") // Spring form 태그 사용을 위한
	public DocumentTypeVO board() {
		return new DocumentTypeVO();
	}
	
	/**
	 * 문서 양식 목록 조회
	 */
	@RequestMapping("documentTypeList.do")
	public String documentTypeList(Model model){
		
		List<DocumentTypeVO> documentTypeList = service.retrieveDocumentTypeList();
		model.addAttribute("documentTypeList", documentTypeList); // 문서 양식 데이터 넘겨주기
		
		return "ed/document/documentTypeList";
	}

	/**
	 * 문서 양식 생성 이후 redirection을 위한 요청 처리 메서드 추가
	 */
	@GetMapping("documentTypeList")
	public String handleDocumentTypeList(Model model){
	    List<DocumentTypeVO> documentTypeList = service.retrieveDocumentTypeList();
	    model.addAttribute("documentTypeList", documentTypeList); // 문서 양식 데이터 넘겨주기
	    return "ed/document/documentTypeList";
	}
	
	/**
	 * 문서 양식 생성(get) - 추후 삭제 혹은 권한
	 */
	@GetMapping("createForm.do")
	public String createForm2(Model model) {
		return "ed/document/createForm";
	}

	/**
	 * 문서 양식 생성(post)
	 */
	@PostMapping("createForm.do")
	public String createForm(
		@ModelAttribute("docTypeVO") DocumentTypeVO docTypeVO
		, Errors errors
		, Model model
//		, Authentication authentication
	) {
//		String empAuth = (String) authentication.getPrincipal();
//		model.addAttribute("empAuth", empAuth);

		String logicalViewName = null;
		boolean success = true;
		if (!errors.hasErrors()) {
			success = service.createForm(docTypeVO);

			if (success) {
				logicalViewName = "redirect:/ed/document/documentTypeList";
			} else {
				model.addAttribute("message", "잘못된 입력입니다");
				logicalViewName = "ed/document/createForm";
			}
		} else {
			logicalViewName = "ed/document/createForm";
		}
		return logicalViewName;
	}
	
}


