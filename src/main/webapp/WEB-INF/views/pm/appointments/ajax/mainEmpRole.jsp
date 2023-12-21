<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.ri {
	text-align: right;
}

.cen {
	text-align: center;
}

.select option {
	background: black;
	color: #fff;
	padding: 3px 0;
}
</style>

<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary" style="text-align: center;">
			<th>사번</th>
			<th>성명</th>
			<th>부서명</th>
			<td>권한</td>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty empRoleList }">
			<tr>
				<td colspan="3">새로 입사한 직원이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty empRoleList }">
				<c:forEach items="${empRoleList }" var="role">
					<tr>
						<td class="cen">${role.empCd }</td>
						<td class="cen">${role.empName }</td>
						<td class="cen">${role.depName }</td>
						<td>
				<form id="roleForm" method="POST" action="<c:url value='/empRoleUpdate'/>">
							<input type="hidden" name="empRole" class="roleCheck">
							<input type="hidden" name="empCd" value="${role.empCd }" />
							<input type="hidden" name="empName" value="${role.empName }" />
							
							<div>
								<select class="selRole">
									<option>권한선택</option>
									<option value="ROLE_PMUSER">인사직원</option>
									<option value="ROLE_GUSER">일반직원</option>
									<option value="ROLE_ADMIN">관리자</option>
								</select> <span class="plusR">
									<button id="role" class="btn btn-primary">권한부여</button>
								</span>
							</div>
						</form>
					</td>
					</tr>
				</c:forEach>
			</c:if>
	</tbody>
</table>
<script>
// var selectElement = document.getElementById("selRole");

// selectElement.addEventListener("change", function() {
//   var selectValue = this.value;
//   document.getElementById("roleCheck").value = selectValue;
//   console.log(selectValue);

//   // 변경된 선택 상자와 관련된 roleCheck 클래스를 가진 요소를 찾습니다.
//   var relatedRoleCheck = this.parentNode.querySelector("input[name='empRole']");
//   if (relatedRoleCheck) {
//     relatedRoleCheck.value = selectValue;
//     console.log(relatedRoleCheck.value);
//   }
// });

// 	var selectElements = document.getElementById("selRole");
	
// 	document.getElementById[]("selRole").addEventListener("change", function() {
// 		var selectValue = this.value;
// 		document.getElementById("roleCheck").value = selectValue;
// 		console.log(selectValue)
// 	});

var selectElements = document.getElementsByClassName("selRole");

// NodeList의 각 요소에 대한 변경 이벤트를 처리합니다.
for (var i = 0; i < selectElements.length; i++) {
  selectElements[i].addEventListener("change", function() {
    var selectValue = this.value;
    console.log("sel", selectValue);

    // 변경된 선택 상자와 관련된 roleCheck 클래스를 가진 요소를 찾습니다.
    var relatedRoleCheck = this.closest("form").querySelector(".roleCheck");
    if (relatedRoleCheck) {
      relatedRoleCheck.value = selectValue;
      console.log("re", relatedRoleCheck.value);
    }
  });
}
</script>