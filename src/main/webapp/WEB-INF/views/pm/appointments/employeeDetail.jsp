<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

#img {
	text-align: center;
	width: 300px;
	height: 280px;
}
#imgTh {
	width: 1px;
}
</style>
<h3>[${empView.empName }] 님의 상세페이지</h3>
<table class="table table-bordered table-hover" style="width: 90%; , background-color: white;">
	<tr>
		<th id="imgTh" rowspan="7">
		<img src="${ pageContext.request.contextPath}/resources/empProfile/${authEmployee.outAtchNm }" alt="직원 프로필 사진"></th>
	</tr>
	<tr>
		<th>사번</th>
		<td colspan="5">${empView.empCd }</td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td colspan="5">${empView.empId1 }</td>
	</tr>
	<tr>
		<th>성명</th>
		<td colspan="5">${empView.empName }</td>
	</tr>
	<tr>
		<th>부서</th>
		<td colspan="5">${empView.department.depName }</td>
	</tr>
	<tr>
		<th>직급</th>
		<td colspan="5">${empView.position.poName }</td>
	</tr>
	<tr>
		<th>담당업무</th>
		<td colspan="5">${empView.business.busName }</td>
	</tr>
	<tr>
		<th>입사일자</th>
		<td colspan="6">${empView.enpStart }</td>
	</tr>
	<tr>
		<th>핸드폰번호</th>
		<td colspan="6">${empView.empHp }</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td colspan="6">${empView.empMail }</td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td colspan="6"> ${empView.empAdd }</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="6">${empView.empAdd1 } - ${empView.empAdd2 }</td>
	</tr>
	<tr>
		<th>내선번호</th>
		<td colspan="6">${empView.department.depNum }</td>
	</tr>
	<tr>
		<th colspan="7" style="text-align: center;">가족관계</th>
	</tr>
	<tr>
		<th>관계</th>
		<th>성명</th>
		<th>생년월일</th>
		<th>직업</th>
		<th>학위</th>
		<th>동거여부</th>
		<th>비고</th>
	</tr>
	<c:if test="${empty famList }">
		<tr>
			<td colspan="7"></td>
		</tr>
	</c:if>

	<c:if test="${not empty famList }">
		<c:forEach items="${famList }" var="fam">
			<tr>
				<td>${fam.famClassify }</td>
				<td>${fam.famName }</td>
				<td>${fam.famBir }</td>
				<td>${fam.famJob }</td>
				<td>${fam.famEdu }</td>
				<td>${fam.stateNm }</td>
				<td>${fam.famNote }</td>
			</tr>
		</c:forEach>
	</c:if>
	<tr>
		<th colspan="7" style="text-align: center;">자격증</th>
	</tr>
	<tr>
		<th>자격증명</th>
		<th colspan="3">자격증 발급일자</th>
		<th colspan="3">자격증 발급기관</th>
	</tr>
	<c:if test="${empty liList }">
<!-- 		<tr> -->
<!-- 			<td colspan="7"><label for="exampleInputFile">첨부파일</label> <input -->
<!-- 				type="file" class="form-control-file" name="documentFiles" id="exampleInputFile" multiple /></td> -->
<!-- 		</tr> -->
	</c:if>

	<c:if test="${not empty liList }">
		<c:forEach items="${liList }" var="li">
			<tr>
				<td>${li.licenseNm }</td>
				<td colspan="3">${li.licenseDate }</td>
				<td colspan="3">${li.licenseAgency }</td>
			</tr>
		</c:forEach>
	</c:if>
	<!-- 	<table class="table table-bordered table-hover" id="license"></table> -->
	<tr>
		<th colspan="7" style="text-align: center;">경력사항</th>
	</tr>
	<tr>
		<th>회사명</th>
		<th colspan="3">담당업무</th>
		<th colspan="3">근무연차</th>
	</tr>
		<c:if test="${empty carList }">
		<tr>
			<td colspan="7">경력이 없습니다.</td>
		</tr>
	</c:if>

	<c:if test="${not empty carList }">
		<c:forEach items="${carList }" var="car">
			<tr>
				<td>${car.carNm }</td>
				<td colspan="3">${car.carPo }</td>
				<td colspan="3">${car.carDate }</td>
			</tr>
		</c:forEach>
	</c:if>
	<tr>
		<th rowspan="4">학력사항</th>
	</tr>
	<tr>
		<th>학교명</th>
		<td  colspan="5">${empView.uniersity.uniName }</td>
	</tr>
	<tr>
		<th>전공</th>
		<td colspan="5">${empView.uniersity.uniMajor }</td>
	</tr>
	<tr>
		<th>졸업여부</th>
		<td colspan="5">${empView.stateNm }</td>
	</tr>
	<tr>
		<c:url value="/pm/appointments/employeeUpdate" var="updateForm">
			<c:param name="who" value="${empView.empCd }"></c:param>
		</c:url>
		<td colspan="7" style="text-align: right;"><a
			href="${updateForm }" class="btn btn-primary">정보 수정</a></td>
	</tr>
</table>
