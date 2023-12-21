package kr.or.ddit.employee.dao;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
class EmployeeDAOTest {

	@Inject
	private EmployeeDAO dao;
	
	@Test
	void test() {
		System.out.println(dao.empDetail("9901001").getLicenseList().get(0).getLicenseNm());
	}

}
