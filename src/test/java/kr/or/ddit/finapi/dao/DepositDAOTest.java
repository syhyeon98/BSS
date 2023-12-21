package kr.or.ddit.finapi.dao;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.finapi.vo.BankVO;
import kr.or.ddit.finapi.vo.DepositOptionVO;
import kr.or.ddit.finapi.vo.DepositVO;

@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
class DepositDAOTest {
	
	@Inject
	private DepositDAO dao;
	
	@Test
	void test() {
		
//		for(DepositVO deposit:dao.selectDepositList()) {
//			System.out.println(deposit.getKorCoNm()+ ", " + deposit.getFinPrdtNm());
//		}
		
	
	}

}
