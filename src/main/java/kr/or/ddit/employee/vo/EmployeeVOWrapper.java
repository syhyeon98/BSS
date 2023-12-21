package kr.or.ddit.employee.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

public class EmployeeVOWrapper extends User{

	private EmployeeVO realUser;
	
	public EmployeeVOWrapper(EmployeeVO realUser) {
		super(realUser.getEmpCd()
				, realUser.getEmpPw()
				, true
				, true
				, true
				, true
				,AuthorityUtils.createAuthorityList(realUser.getEmpRole()));
		this.realUser = realUser;
	}
	
	public EmployeeVO getRealUser() {
		return realUser;
	}
	
}
