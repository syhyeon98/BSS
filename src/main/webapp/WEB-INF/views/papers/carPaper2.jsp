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
	th {
		text-align:center;
		width:150px;
	}
	
	#cont {
		height: 30vh;
	}
	#carPaper {
 	margin-left: 30%;
}
	
</style>
<button id="downloadPdf" class="btn btn-primary">PDF저장</button>
<div class="col-md-6" id="carPaper">
<table class="table table-bordered" style="width: 90%; , background-color: white;">
	<tr>
		<th colspan="4"><h3>경력증명서</h3></th>
	</tr>
	<tr>
		<th>성명</th>
		<td>
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empName}</td>

		<th>입사 일자</th>
		<td>
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.enpStart}</td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td colspan="3">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empId1}</td>
	</tr>
	<tr>
		<th>직급</th>
		<td colspan="3">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.poName}</td>
	</tr>
	<tr>
		<th>주소</th>
		<td><security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empAdd1} - ${authEmployee.empAdd2 }</td>
		<th>근무부서</th>
		<td><security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.business.busName}</td>
	</tr>
	<tr>
		<th>재직기간</th>
		<td colspan="3">
		<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.enpStart} ~ ${authEmployee.resignation.reDate }</td>
	</tr>

	<tr>
		<th>용도</th>
		<td colspan="3">제출용</td>
	</tr>
	<tr id="cont">
		<th colspan="4" class="align-middle">상기와 같이 경력을 증명합니다.</th>
	</tr>
	<tr>
		<th colspan="4">회사명 : BSS</th>
	</tr>
	<tr>
		<th colspan="4">대표자 : 현성윤</th>
	</tr>
</table>
</div>

<script>
	
	
	$("#downloadPdf").on("click", function() {
		const quality = 1;
		html2canvas($('#carPaper')[0], {
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
			doc.save('경력증명서.pdf');
		});
	});
	
	
</script>