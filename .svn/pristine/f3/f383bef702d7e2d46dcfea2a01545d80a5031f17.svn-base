package kr.or.ddit.employee;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import kr.or.ddit.salary.dao.AllowDAO;
import kr.or.ddit.salary.vo.AllowVO;

public class EmployeeDAOTest {
	public static void main(String[] args) {
//		ApplicationContext context = new ClassPathXmlApplicationContext(
//					new String[] {"kr/or/ddit/spring/conf/root-context.xml"});
		
		ApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] {
//						"kr/or/ddit/employee/test-context.xml"
						"kr/or/ddit/spring/conf/root-context.xml"
						, "kr/or/ddit/spring/conf/mapper-context.xml"
						, "kr/or/ddit/spring/conf/datasource-context.xml"
				});
	
		AllowDAO allowDAO = (AllowDAO)context.getBean("allowDAO");
		
		List<AllowVO> allowVOList = allowDAO.selectAllowList();
		for(AllowVO listAllowVO:allowVOList) {
			System.out.println(listAllowVO);
		}
	}
}
