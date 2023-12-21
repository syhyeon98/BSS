package kr.or.ddit.businesstrip.controller;


import java.time.LocalDate;

import javax.inject.Inject;

import org.springframework.core.convert.ConversionService;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.common.TemplateParserContext;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.expression.spel.support.StandardTypeConverter;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.businesstrip.service.BusinessTripService;
import kr.or.ddit.businesstrip.vo.BusinessTripVO;
import kr.or.ddit.edDocument.service.DocumentService;
import kr.or.ddit.edDocument.vo.DocumentTypeVO;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.validate.groups.InsertGroup;

/**
 * 출장 신청(등록)
 * 
 */
@Controller
public class BusinessTripInsertController {
	
	@Inject
	private BusinessTripService service;
	
	@Inject
	private DocumentService docService;

	@Inject
	private ConversionService conService;
	
	/**
	 * 출장등록에서 [등록]버튼 클릭하면 insert처리하는 컨트롤러
	 * @param bTrip
	 * @param errors
	 * @param model
	 * @param principal
	 * @return
	 */
	@RequestMapping("/pm/servicemanagement/businessTripInsert.do")
	public String businessTripInsert(
			@Validated(InsertGroup.class) @ModelAttribute("bTrip") BusinessTripVO bTrip
			, Errors errors
			, Authentication authentication
			, Model model
	) {
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String emp = wrapper.getRealUser().getEmpCd();
		bTrip.setEmpCd(emp); //사원번호
		
		if(!errors.hasErrors()) {
			boolean success = service.createBusinessTrip(bTrip);
			if(success) {
				return "redirect:/pm/servicemanagement/businessTrip";
			}else {
				model.addAttribute("message", "출장등록 중 문제 발생");
			}
		}
		return "pm/servicemanagement/businessTrip";
	}
	
	
	/**
	 * [마이페이지] 출장 등록
	 * @param bTrip
	 * @param errors
	 * @param model
	 * @param principal
	 * @return
	 */
	@PostMapping("/mypage/myBusinessTripInsert.do")
	public String myBusinessTripInsert(
			@Validated(InsertGroup.class) @ModelAttribute("bTrip") BusinessTripVO bTrip
			, Errors errors
			, Authentication authentication
			, Model model
	) {
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String emp = wrapper.getRealUser().getEmpCd();
		bTrip.setEmpCd(emp); //사원번호
		
		if(!errors.hasErrors()) {
			boolean success = service.createBusinessTrip(bTrip);
			if(success) {
				return "redirect:/mypage/myBusinessTrip";
			}else {
				model.addAttribute("message", "출장등록 중 문제 발생");
			}
		}
		return "mypage/myBusinessTrip";
	}
	
	/**
	 * [마이페이지] 출장 등록 후 기안문 작성하기
	 * @param bTrip
	 * @param errors
	 * @param model
	 * @param principal
	 * @return
	 */
	@PostMapping("/mypage/myBusinessTripDocInsert.do")
	public String myBusinessTripDocInsert(
			@Validated(InsertGroup.class) @ModelAttribute("bTrip") BusinessTripVO bTrip
			, Errors errors
			, Authentication authentication
			, Model model
			) {
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		bTrip.setEmpCd(employee.getEmpCd()); //사원번호
		bTrip.setDepName(employee.getDepName()); //부서명
		bTrip.setPoName(employee.getPoName()); // 직급명
		bTrip.setEmpPh(employee.getEmpHp()); // 핸드폰번호
		bTrip.setEmpName(employee.getEmpName()); // 사원명
		bTrip.setDate(LocalDate.now()); // 사원명
		bTrip.setDocTitle(LocalDate.now().toString()+"출장보고서");
		String docNo ="";
		if(!errors.hasErrors()) {
			// 양식을 받아온다
			DocumentTypeVO documentCont = docService.retrieveDtCont(81); // 만들어놓은 출장양식을 가져옴
			
			// 받은 양식을 파싱해서 값을 넣는다
			String tmplSrc = documentCont.getDtCont();
			StandardEvaluationContext context = new StandardEvaluationContext(bTrip); 
			context.setTypeConverter(new StandardTypeConverter(conService));
			
			ExpressionParser parser = new SpelExpressionParser();
			String docContent = parser.parseExpression(tmplSrc, new TemplateParserContext("{", "}")).getValue(context, String.class);
			
			// 넣은값으로 문서를 생성한다 -> 임시저장으로 들어감
			DocumentVO documentVO = new DocumentVO();
			documentVO.setEmpCd(employee.getEmpCd());
			documentVO.setDocContent(docContent);
			documentVO.setDtNo(81);
			documentVO.setDocTitle(LocalDate.now().toString()+"출장보고서");
			documentVO.setDocType("공무");
			
			docService.createDocument(documentVO,employee.getDepCd());
			//임시저장된 문서의 문서번호를 btrip에 넣어준다
			docNo = documentVO.getDocNo();//임시저장된 문서 번호
			bTrip.setDocNo(docNo);
			
			//출장을 생성한다
			boolean success = service.createBusinessTrip(bTrip);
			if(success) {
				return "redirect:/ed/document/documentTempForm.do?docNo=" + docNo;
			}else {
				model.addAttribute("message", "출장등록 중 문제 발생");
			}
		}
		return "redirect:/ed/document/documentTempForm.do?docNo=" + docNo;
	}
	
	
}