<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<security:authentication property="principal.realUser" var="authEmployee" />
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

/* th, td { */
/*    color: black; */
/*    border: 1px solid #444444; */
/* } */
/* #reEmp { */
/*  	margin-left: 30%; */
/* } */

table {
   width: 80%;
   background-color: white;
}

table th {
	 class="table-secondary"
}

<!--
 /* Font Definitions */
 @font-face
	{font-family:Dotum;
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Arial Unicode MS";
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:"\@Dotum";
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Malgun Gothic";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
@font-face
	{font-family:"\@Malgun Gothic";}
@font-face
	{font-family:宋?;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:함초롬바탕;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:함초롬돋움;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"\@宋?";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"\@함초롬돋움";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"\@함초롬바탕";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	text-autospace:none;
	word-break:break-all;
	font-size:11.0pt;
	font-family:"Malgun Gothic",sans-serif;}
p.a, li.a, div.a
	{mso-style-name:바탕글;
	margin:0in;
	text-align:justify;
	text-justify:inter-ideograph;
	line-height:103%;
	text-autospace:none;
	word-break:break-all;
	font-size:10.0pt;
	font-family:"함초롬바탕",serif;
	color:black;}
.MsoChpDefault
	{font-family:"Malgun Gothic",sans-serif;}
 /* Page Definitions */
 @page WordSection1
	{size:595.25pt 841.85pt;
	margin:99.2pt 85.0pt 85.0pt 85.0pt;
	}
	/* 위 오 아 왼 */
div.WordSection1
	{page:WordSection1;}
 /* List Definitions */
 ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
-->

</style>

<%-- <c:set value="${salaryDetailList[0] }" var="salaryDetail" /> --%>


<!-- PDF 및 퇴사직원 정보 -->
<%-- <h3>[${reEmp.empName }]님의 페이지</h3> --%>
<!-- <hr color="black"> -->

<!-- <div class="container-fluid"> -->
<!-- 	<button id="downloadPdf" class="btn btn-primary">PDF저장</button> -->
<!-- <div class="row"> -->
<div class="row col-md-12">

<!-- PDF영역 -->		
	<div class="col-md-6">
		<h5>[${reEmp.empName }]님의 경력증명서</h5>
<!--         <div class="d-flex align-items-center"> 제목과 버튼을 가로로 정렬하기 위해 flexbox를 사용합니다 -->
<%--             <h5 class="mr-2">[${reEmp.empName }]님의 경력증명서</h5> --%>
<!--             <button id="downloadPdf" class="btn btn-primary">경력증명서 PDF 출력</button> -->
<!--         </div> -->
	<hr color="black">

	<div><button id="downloadPdf" class="btn btn-primary">경력증명서 출력</button></div>
		
<!-- PDF 시작 -->
<!-- 	<div id="carPaper" class="WordSection1"> -->
	<div id="carPaper"  class="WordSection1" >
		<div align=center>
		
		<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
		 style='border-collapse:collapse;border:none'>
		 
		 <p class=a align=center style='text-align:center;word-break:normal'><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
		 <p class=a align=center style='text-align:center;word-break:normal'><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
		
		 <tr style='height:45.5pt'>
		  <td width=559 colspan=4 style='width:419.5pt;border:solid black 1.0pt;
		  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:45.5pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><b><span
		  lang=ZH-CN style='font-size:18.0pt;line-height:103%;font-family:"Dotum",sans-serif'>경력증명서</span></b></p>
		  </td>
		 </tr>
		 <tr style='height:28.55pt'>
		  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
		  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:28.55pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>성명</span></p>
		  </td>
		  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
		  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
		  height:28.55pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'>
		  <span lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>${reEmp.empName }</span></p>
		  </td>
		  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
		  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
		  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:28.55pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>생년월일</span></p>
		  </td>
		  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
		  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
		  height:28.55pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>${employee.empId1 }</span></p>
		  </td>
		 </tr>
		 <tr style='height:28.55pt'>
		  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
		  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:28.55pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>주소</span></p>
		  </td>
		  <td width=419 colspan=3 style='width:314.6pt;border-top:none;border-left:
		  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
		  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:28.55pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>${employee.empAdd1 } ${employee.empAdd2 }</span></p>
		  </td>
		 </tr>
		 <tr style='height:28.55pt'>
		  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
		  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:28.55pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>부서</span></p>
		  </td>
		  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
		  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
		  height:28.55pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>${employee.depName }</span></p>
		  </td>
		  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
		  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
		  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:28.55pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>직책</span></p>
		  </td>
		  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
		  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
		  height:28.55pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>${employee.poName }</span></p>
		  </td>
		 </tr>
		 <tr style='height:28.55pt'>
		  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
		  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:28.55pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>주요업무</span></p>
		  </td>
		  <td width=419 colspan=3 style='width:314.6pt;border-top:none;border-left:
		  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
		  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:28.55pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>${employee.busName }</span></p>
		  </td>
		 </tr>
		 <tr style='height:28.55pt'>
		  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
		  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:28.55pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>재직기간</span></p>
		  </td>
		  <td width=419 colspan=3 style='width:314.6pt;border-top:none;border-left:
		  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
		  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:28.55pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
<%-- 		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>${employee.enpStart} ~ ${employee.resignation.reDate }</span></p> --%>
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>${employee.enpStart} ~ ${employee.reDate }</span></p>
		  </td>
		 </tr>
		 <tr style='height:345.5pt'>
		  <td width=559 colspan=4 style='width:419.5pt;border:solid black 1.0pt;
		  border-top:none;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:345.5pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>상기와
		  같이 재직하였음을 증명합니다.</span></p>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
		  <p class=a align=center style='text-align:left;word-break:normal'><span
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;&nbsp;용도 : 제출용</span></p>
		  </td>
		 </tr>
		 <tr style='height:111.65pt'>
		  <td width=559 colspan=4 style='width:419.5pt;border:solid black 1.0pt;
		  border-top:none;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:111.65pt'>
		  <p class=a align=center style='text-align:center;word-break:normal'><b><span
		  style='font-size:13.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></b></p>
		  <p class=a align=center style='text-align:center;word-break:normal'><b><span
		  style='font-size:13.0pt;line-height:103%;font-family:"Dotum",sans-serif'>BSS</span></b></p>
		  <p class=a align=center style='text-align:center;word-break:normal'><span
		  style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
		  <p class=a align=center style='text-align:center;word-break:normal'><b><span
		  lang=ZH-CN style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>대표자
		  현 성 윤</span></b></p>
		  <p class=a align=center style='text-align:center;word-break:normal'><b><span
		  style='font-size:11.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></b></p>
		  </td>
		 </tr>
		</table>
		
		</div>

<p class=MsoNormal><span style='font-size:1.0pt'>&nbsp;</span></p>

<p class=a align=center style='text-align:center;word-break:normal'><span
style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>

</div>
	 
	 
	</div>
<!-- PDF 끝 -->
			
<!-- 퇴사직원 정보 시작 -->	
	<div class="col-md-6" id="reEmp">
	<h5>[${reEmp.empName }]님의 정보</h5>
	<hr color="black">
	<div><button class="btn btn-primary" style="margin-bottom:10px; visibility: hidden;">공간맞추기</button></div>	
	
	<table class="table table-bordered" style="width: 90%; , background-color: white;">
			<tr>
				<th rowspan="2">사진</th>
				<th>성명</th>
				<td colspan="2">${reEmp.empName }</td>
				<th>생년월일</th>
				<td colspan="2">${employee.empId1 }</td>
			</tr>
			<tr>
				<th>입사날짜</th>
				<td colspan="2">${employee.enpStart }</td>
				<th>퇴사날짜</th>
				<td colspan="2">${reEmp.reTreatment }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="3">${employee.empMail }</td>
				<th>직책</th>
				<td colspan="2">${employee.poName }</td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td colspan="3">${employee.empHp }</td>
				<th>퇴직여부</th>
				<c:choose>
			<c:when test='${employee.empResignation eq "N"}'>
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
				<th>우편번호</th>
				<td colspan="2">${employee.empAdd }</td>
				<th>주소</th>
				<td colspan="3">${employee.empAdd1 } - ${employee.empAdd2 }</td>
			</tr>
			<tr>
				<th>결혼여부</th>
				<c:choose>
			<c:when test='${employee.empMarry eq "Y"}'>
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
			
				<th>병역여무</th>
				<c:if test='${employee.empMilitary eq "Y"}'>
				<td colspan="3">
				 복 무
				</td>
			</c:if>
			<c:if test='${employee.empMilitary eq "N"}'>
				<td colspan="3">
				 미 필
				</td>
			</c:if>
			<c:if test='${employee.empMilitary eq "A"}'>
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
					<td>${li.licenseName }</td>
					<td>${li.licenseDate }</td>
					<td>${li.licenseAgency }</td>
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
					<td>${fam.famClassify}</td>
					<td>${fam.famName}</td>
					<td>${fam.famBir}</td>
					<td>${fam.famJob}</td>
					<td>${fam.famEdu}</td>
					<td>${fam.stateNm}</td>
					<td>${fam.famNote}</td>
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
					<td>${car.carNm }</td>
					<td>${car.carPo }</td>
					<td>${car.carDate }</td>
				</tr>
			</c:forEach>
		</c:if>	
		<tr>
			<th rowspan="4" class="align-middle"><h6>학력사항</h6></th>
		</tr>
		<tr>
			<th>학교명</th>
			<td colspan="6">${reEmp.uniName}</td>
		</tr>
		<tr>
			<th>전공</th>
			<td colspan="6">${reEmp.uniMajor}</td>
		</tr>
		<tr>
			<th>졸업여부</th>
			<td colspan="6">${reEmp.stateNm}</td>
		</tr>	
			
		</table>
	</div>
<!-- 퇴사직원 정보 끝 -->				
			
			
</div>
</div>
</div>



<%-- <form --%>
<%-- 	action="${pageContext.request.contextPath}/mypage/salaryDetailView.do" --%>
<%-- 	method="post" id="salaryDetailView"> --%>
<!-- 	<input type="hidden" name="salNo"> <input type="hidden" -->
<!-- 		name="empCd"> -->
<%-- </form> --%>
<script>
// $(document).ready(function() {
//     $("th").addClass("table-secondary");
// });
	
	// PDF 변환
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


