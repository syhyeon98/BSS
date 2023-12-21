<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>

<style>
* {
	font-family: 'MICEGothic Bold';
}
table {
   F width: 100%;
   border: 1px solid #444444;
   border-collapse: collapse;
}

.title {
   width:150px;
}

.errors{
	color:red;
}

th {
   text-align: center;
}

.form-control {
   padding: 0;
}

th, td {
   color: black;
   border: 1px solid #444444;
}

#img {
	width: 300px;
	height: 300px;
}

</style>



<form id="empCardPaper">
<table class="table table-bordered" style="width: 90%; , background-color: white;" id="table">
	<tr>
		<th colspan="7" style="background-color: aliceblue;" ><h3>
		<security:authentication property="principal.realUser" var="authEmployee" />[${authEmployee.empName}]님의 마이페이지</h3></th>
	</tr>
	<tr>
		<th rowspan="7" style="width:100px;">
		<img src="${ pageContext.request.contextPath}/resources/empProfile/${authEmployee.outAtchNm }" alt="직원 프로필 사진" id="img" ></th>
<%-- 		${authEmployee.proFile}</th> --%>
	</tr>
	
	<tr>
		<th style="background-color: aliceblue;">성명</th>
		<td colspan="2">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empName}</td>
		
		<th style="background-color: aliceblue;">생년월일</th>
		<td colspan="2">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empId1}</td>
	</tr>
	<tr>
		<th style="background-color: aliceblue;">입사일자</th>
		<td colspan="2">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.enpStart}</td>
		
		<th style="background-color: aliceblue;">근무부서</th>
		<td colspan="2">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.department.depName}</td>
	</tr>
	<tr>
		<th style="background-color: aliceblue;">직책</th>
		<td colspan="2">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.position.poName}</td>

		<th style="background-color: aliceblue;">이메일</th>
		<td colspan="2">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empMail}</td>
	</tr>
	<tr>
		<th style="background-color: aliceblue;">핸드폰</th>
		<td colspan="2">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empHp}</td>

		<th style="background-color: aliceblue;">퇴직여부</th>
		<c:choose>
		<c:when test='${authEmployee.empResignation eq "N"}'>
			<td colspan="2">
			재 직 
			</td>
		</c:when>
		<c:otherwise>
		<td colspan="2">
			퇴 직
			</td>
		</c:otherwise>
		</c:choose>
	</tr>
	<tr>
		<th style="background-color: aliceblue;">주소</th>
		<td colspan="5">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empAdd1} - ${authEmployee.empAdd2}</td>
	</tr>
	<tr>
		<th style="background-color: aliceblue;">결혼여부</th>
		<c:choose>
		<c:when test='${authEmployee.empMarry eq "Y"}'>
   		 <td colspan="2">
   			기 혼
   		 </td>
		</c:when>
		<c:otherwise>
		<td colspan="2">
			미 혼
			</td>
		</c:otherwise>
		</c:choose>
		
		<th style="background-color: aliceblue;">병역여부</th>
		<c:if test='${authEmployee.empMilitary eq "Y"}'>
			<td colspan="2">
			 복 무
			</td>
		</c:if>
		<c:if test='${authEmployee.empMilitary eq "N"}'>
			<td colspan="2">
			 미 필
			</td>
		</c:if>
		<c:if test='${authEmployee.empMilitary eq "A"}'>
		<td colspan="2">
			해당없음
			</td>
		</c:if>	
	</tr>
	
	<tr>
		<th colspan="7" style="background-color: aliceblue;"><h6>자격증</h6></th>
	</tr>
	<tr>
		<th style="background-color: aliceblue;">자격증명</th>
		<th colspan="3" style="background-color: aliceblue;">발급일시</th>
		<th colspan="3" style="background-color: aliceblue;">발급기관</th>
	</tr>
	<c:if test="${empty liList }">
<!-- 		<tr> -->
<!-- 			<td colspan="7">입력된 정보가 없습니다.</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td colspan="7"><label for="exampleInputFile">첨부파일</label>  -->
<!-- 			<input -->
<!-- 			type="file" class="form-control-file" name="documentFiles" id="exampleInputFile" multiple /></td> -->
<!-- 		</tr> -->
	</c:if>
	<c:if test="${not empty liList }">
		<c:forEach items="${liList }" var="li">
			<tr>
				<td><security:authentication property="principal.realUser" var="authEmployee" />${li.licenseName }</td>
				<td colspan="3"><security:authentication property="principal.realUser" var="authEmployee" />${li.licenseDate }</td>
				<td colspan="3"><security:authentication property="principal.realUser" var="authEmployee" />${li.licenseAgency }</td>
			</tr>
		</c:forEach>
	</c:if>

		
	<tr>
		<th colspan="7" style="background-color: aliceblue;"><h6>가족관계</h6></th>
	</tr>
	<tr style="background-color: aliceblue;">
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
			<td colspan="7">입력된 정보가 없습니다.</td>
		</tr>
	</c:if>	
	<c:if test="${not empty famList }">
		<c:forEach items="${famList }" var="fam">
			<tr>
				<td><security:authentication property="principal.realUser" var="authEmployee" />${fam.famClassify}</td>
				<td><security:authentication property="principal.realUser" var="authEmployee" />${fam.famName}</td>
				<td><security:authentication property="principal.realUser" var="authEmployee" />${fam.famBir}</td>
				<td><security:authentication property="principal.realUser" var="authEmployee" />${fam.famJob}</td>
				<td><security:authentication property="principal.realUser" var="authEmployee" />${fam.famEdu}</td>
				<td><security:authentication property="principal.realUser" var="authEmployee" />${fam.stateNm}</td>
				<td><security:authentication property="principal.realUser" var="authEmployee" />${fam.famNote}</td>
			</tr>		
		</c:forEach>
	</c:if>	
	
	
	
	
	<tr>
		<th colspan="7" style="background-color: aliceblue;"><h6>경력사항</h6></th>
	</tr>
	<tr>
		<th style="background-color: aliceblue;">회사명</th>
		<th colspan="3" style="background-color: aliceblue;">담당업무</th>
		<th colspan="3" style="background-color: aliceblue;">근무연차</th>
	</tr>	
	<c:if test="${empty carList }">
		<tr>
			<td colspan="7">입력된 정보가 없습니다.</td>
		</tr>
	</c:if>	
	<c:if test="${not empty carList }">
		<c:forEach items="${carList }" var="car">
			<tr>
				<td><security:authentication property="principal.realUser" var="authEmployee" />${car.carNm }</td>
				<td colspan="3"><security:authentication property="principal.realUser" var="authEmployee" />${car.carPo }</td>
				<td colspan="3"><security:authentication property="principal.realUser" var="authEmployee" />${car.carDate }</td>
			</tr>
		</c:forEach>
	</c:if>	
	
	<tr>
		<th rowspan="5" style="background-color: aliceblue;"><h6>학력사항</h6></th>
	</tr>
	<tr>
		<th style="background-color: aliceblue;">학교명</th>
		<td colspan="6">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.uniersity.uniName}</td>
	</tr>
	<tr>
		<th style="background-color: aliceblue;">전공</th>
		<td colspan="6">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.uniersity.uniMajor}</td>
	</tr>
	<tr>
		<th style="background-color: aliceblue;">학위</th>
		<td colspan="6">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.uniersity.uniDegree}</td>
	</tr>
	<tr>
		<th style="background-color: aliceblue;">졸업여부</th>
		<td colspan="6">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.stateNm}</td>
	</tr>
		
	
</table>
<c:url value="/ed/document/documentForm.do?dtNo=46" var="reForm"></c:url>
<c:url value="/pm/appointments/employeeDetail" var="upForm">
	<c:param name="who" value="${empView.empCd }"></c:param>
</c:url>
<div>
	<a class="btn btn-success" href="${upForm }">정보수정</a>
	<a class="btn btn-success" href="${reForm }">퇴사신청</a>
</div>
</form>


















