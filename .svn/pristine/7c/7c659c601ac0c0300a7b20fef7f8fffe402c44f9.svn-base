package kr.or.ddit.finapi.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.finapi.vo.ManageBankVO;
import kr.or.ddit.finapi.vo.StatisticsInfoVO;
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
class ManageInfoDAOTest {

	@Inject
	ManageInfoDAO dao;
	
	@Test
	void test() {
		StatisticsInfoVO statistic = new StatisticsInfoVO();
		statistic.setFinanceCd("0010927");
		statistic.setAccountCd("C");
		statistic.setAccountNm("회원조합");
		List<ManageBankVO> mblist= dao.selectStatisticInfoList(statistic);
		System.out.println(mblist.get(0).getStatisticsInfo());
	}

}
