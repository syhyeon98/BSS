package kr.or.ddit.mail.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.mail.dao.MailBoxMainDAO;
import kr.or.ddit.mail.vo.MailBoxVO;

@Controller
@RequestMapping("/mailBox/")
public class MailBoxMainController {

	@Inject
	private MailBoxMainDAO mailDao;
	
	@RequestMapping("mailBoxMain.do")
	public String MailBoxMain(Authentication authentication, Model model) {
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		
		// 받은메일리스트, 갯수
		List<MailBoxVO> receiveMailList = mailDao.selectReceiveMailList(employee);
		int receiveMailCount = mailDao.selectReceiveMailCount(employee);
		
		// 보낸메일리스트, 갯수
		List<MailBoxVO> sendMailList = mailDao.selectSendMailList(employee);
		int sendMailCount = mailDao.selectSendMailCount(employee);
		
		// 내게쓴 메일 리스트, 갯수
		List<MailBoxVO> toMeMailList = mailDao.selectToMeMailList(employee);
		int toMeMailCount = mailDao.selectToMeMailCount(employee);
		
		// 휴지통 메일리스트, 갯수
		List<MailBoxVO> deletMailList = mailDao.selectDeleteMailList(employee);
		int deletMailCount = mailDao.selectDeleteMailCount(employee);
		
		model.addAttribute("receiveMailList", receiveMailList);
		model.addAttribute("receiveMailCount", receiveMailCount);
		model.addAttribute("sendMailList", sendMailList);
		model.addAttribute("sendMailCount", sendMailCount);
		model.addAttribute("toMeMailList", toMeMailList);
		model.addAttribute("toMeMailCount", toMeMailCount);
		model.addAttribute("deletMailList", deletMailList);
		model.addAttribute("deletMailCount", deletMailCount);
		
		
		return "mail/main/mailMain";
	}
	
}
