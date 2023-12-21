 package kr.or.ddit.edApproval.fancytree.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.edApproval.fancytree.DepartmentFancyTreeNode;
import kr.or.ddit.edApproval.fancytree.DepartmentFancyTreeNode2;
import kr.or.ddit.edApproval.fancytree.EmployeeFancyTreeNode;
import kr.or.ddit.edApproval.fancytree.FancyTreeNode;
import kr.or.ddit.edApproval.service.ApprovalService;

@Controller
@RequestMapping("/ed/approval/empfancytree2.do")
public class EmpFancyTreeController2 {

    @Inject
	private ApprovalService approvalService;
    
    @RequestMapping
	public String fancyTreeview() {
//		return "ed/approval/empFancyTree";
		return "ed/approval/ajax/empFancyTree2";
	}
    
    @RequestMapping(produces=MediaType.APPLICATION_JSON_VALUE) 
    @ResponseBody
    public List<FancyTreeNode<DepartmentVO>> fancyTree() {
        List<DepartmentVO> empList = approvalService.retrieveEmpList(null); // 데이터 조회
		return empList.stream()
				.map(DepartmentFancyTreeNode2::new)
				.collect(Collectors.toList()); 
    }

}       




