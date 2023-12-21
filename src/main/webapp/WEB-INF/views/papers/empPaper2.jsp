<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<script
	src="${pageContext.request.contextPath }/resources/js/pdf/html2canvas.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/pdf/jspdf.plugin.autotable.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/pdf/jspdf.min.js"></script>
<style>
table {
   F width: 100%;
   border: 1px solid #444444;
   border-collapse: collapse;
   background-color: white;
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
img {
	width: 300px;
	height: 280px;
}
#empCardPaper {
 	margin-left: 30%;
}
</style>



<button id="downloadPdf" class="btn btn-primary">PDF저장</button>
<div class="col-md-6" id="empCardPaper">
<table class="table table-bordered" style="width: 90%; , background-color: white;">
	<tr>
		<th colspan="7"><h3>
		<security:authentication property="principal.realUser" var="authEmployee" />인 사 기 록 카 드</h3></th>
	</tr>
	<tr>
		<td rowspan="3" >
<%-- 		<img src="${ pageContext.request.contextPath}/resources/empProfile/${authEmployee.outAtchNm }" alt="직원 프로필 사진"> --%>
		</td>
	</tr>
	
	<tr>
		<th>성명</th>
		<td colspan="2">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empName}</td>
		
		<th>생년월일</th>
		<td colspan="2">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empId1}</td>
	</tr>
	<tr>
		<th>입사일자</th>
		<td colspan="2">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.enpStart}</td>
		
		<th>근무부서</th>
		<td colspan="2">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.department.depName}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td colspan="3">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empMail}</td>
		
		<th>직책</th>
		<td colspan="2">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.position.poName}</td>
	</tr>
	<tr>
		<th>핸드폰</th>
		<td colspan="3">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empHp}</td>

		<th>퇴직여부</th>
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
		<th>주소</th>
		<td colspan="6">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empAdd1} - ${authEmployee.empAdd2}</td>
	</tr>
	<tr>
		<th>결혼여부</th>
		<c:choose>
		<c:when test='${authEmployee.empMarry eq "Y"}'>
   		 <td colspan="2">
   			 기혼
   		 </td>
		</c:when>
		<c:otherwise>
		<td colspan="2">
			미 혼
			</td>
		</c:otherwise>
		</c:choose>
		
		<th>병역여부</th>
		<c:if test='${authEmployee.empMilitary eq "Y"}'>
			<td colspan="3">
			 복 무
			</td>
		</c:if>
		<c:if test='${authEmployee.empMilitary eq "N"}'>
			<td colspan="3">
			 미 필
			</td>
		</c:if>
		<c:if test='${authEmployee.empMilitary eq "A"}'>
		<td colspan="3">
			해당없음
			</td>
		</c:if>	
	</tr>
	
	<tr>
		<th colspan="7"><h6>자격증</h6></th>
	</tr>
	<tr>
		<th>자격증명</th>
		<th colspan="3">발급일시</th>
		<th colspan="3">발급기관</th>
	</tr>
	<c:if test="${empty liList }">
		<tr>
			<td colspan="7">입력된 정보가 없습니다.</td>
		</tr>
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
		<th colspan="7"><h6>가족관계</h6></th>
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
		<th colspan="7"><h6>경력사항</h6></th>
	</tr>
	<tr>
		<th>회사명</th>
		<th colspan="3">담당업무</th>
		<th colspan="3">근무연차</th>
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
		<th rowspan="4"><h6>학력사항</h6></th>
	</tr>
	<tr>
		<th>학교명</th>
		<td colspan="6">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.uniersity.uniName}</td>
	</tr>
	<tr>
		<th>전공</th>
		<td colspan="6">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.uniersity.uniMajor}</td>
	</tr>
	<tr>
		<th>졸업여부</th>
		<td colspan="6">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.stateNm}</td>
	</tr>
		
	
</table>
</div>
<div>
	<input class="btn btn-success" type="submit" value="저장"/>
</div>


<script>
	
	
	$("#downloadPdf").on("click", function() {
		const quality = 1;
		html2canvas($('#empCardPaper')[0], {
			scale : 4
		}).then(function(canvas) {
			var imgData = canvas.toDataURL('image/png');
			var imgWidth = 200;
			var imgHeight = canvas.height * imgWidth / canvas.width;

			var doc = new jsPDF('p', 'mm', 'a4'); // Use 'a4' as the third parameter for default A4 size

			var position = 0;
			var pageHeight = imgHeight;
			var margin = 5;
			console.log(imgWidth)
			console.log(imgHeight)
			doc.addImage(imgData, 'PNG', margin, position, 210, 297 );
			doc.save('인사기록카드.pdf');
		});
	});
	
	
</script>


















