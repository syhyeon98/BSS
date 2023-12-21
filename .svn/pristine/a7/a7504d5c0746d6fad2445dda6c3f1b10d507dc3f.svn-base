package kr.or.ddit.finapi.dao;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
class BankOptionDAOTest {
	
	@Inject
	private BankOptionDAO dao;
	
	@Test
	void test() {
		System.out.println(dao.selectBankOptionList());
	}

}
