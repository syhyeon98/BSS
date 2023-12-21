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
/* table { */
/*    F width: 100%; */
/*    border: 1px solid #444444; */
/*    border-collapse: collapse; */
/*    background-color: white; */
/* } */

/* .title { */
/*    width:150px; */
/* } */

/* .errors{ */
/* 	color:red; */
/* } */

/* th { */
/*    text-align: center; */
/* } */

/* .form-control { */
/*    padding: 0; */
/* } */

/* th, td { */
/*    color: black; */
/*    border: 1px solid #444444; */
/* } */
/* img { */
/* 	width: 300px; */
/* 	height: 280px; */
/* } */
/* #empCardPaper { */
/*  	margin-left: 30%; */
/* } */

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
	{font-family:"Malgun Gothic";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
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
	{font-family:"\@Dotum";
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"\@Malgun Gothic";}
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
	margin:99.15pt 62.35pt 85.0pt 62.35pt;}
div.WordSection1
	{page:WordSection1;}
 /* List Definitions */
 ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
-->
</style>



<button id="downloadPdf" class="btn btn-primary">PDF저장</button>
<div class="col-md-6" id="empCardPaper">
<security:authentication property="principal.realUser" var="authEmployee" />

<div class=WordSection1>

<div align=center>

<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
 style='border-collapse:collapse;border:none'>
 <tr style='height:45.5pt'>
  <td width=620 colspan=15 style='width:464.85pt;border:none;border-bottom:
  solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:45.5pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><b><span
  lang=ZH-CN style='font-size:19.0pt;line-height:103%;font-family:"Dotum",sans-serif'>인사기록카드</span></b></p>
  <p class=a align=center style='text-align:center;word-break:normal'><b><span
  style='font-family:"Dotum",sans-serif'>&nbsp;</span></b></p>
  </td>
 </tr>
 <tr style='height:26.95pt'>
  <td width=146 colspan=3 rowspan=4 style='width:109.35pt;border:solid black 1.0pt;
  border-top:none;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
  </td>
  <td width=97 colspan=4 style='width:72.55pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>성명</span></p>
  </td>
  <td width=146 colspan=4 style='width:109.35pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${authEmployee.empName}</span></p>
  </td>
  <td width=89 colspan=2 style='width:66.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>생년월일</span></p>
  </td>
  <td width=142 colspan=2 style='width:106.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${authEmployee.empId1}</span></p>
  </td>
 </tr>
 <tr style='height:26.95pt'>
  <td width=97 colspan=4 style='width:72.55pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>주소</span></p>
  </td>
  <td width=377 colspan=8 style='width:282.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a style='margin-left:2.7pt'><span lang=ZH-CN style='font-family:
  "Dotum",sans-serif'>>${authEmployee.empAdd1} - ${authEmployee.empAdd2}</span></p>
  </td>
 </tr>
 <tr style='height:25.7pt'>
  <td width=97 colspan=4 style='width:72.55pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:25.7pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>입사일자</span></p>
  </td>
  <td width=146 colspan=4 style='width:109.35pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:25.7pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${authEmployee.enpStart}</span></p>
  </td>
  <td width=89 colspan=2 style='width:66.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:25.7pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>업무상태</span></p>
  </td> 
  
  		<c:choose>
		<c:when test='${authEmployee.empResignation eq "N"}'>
  <td width=142 colspan=2 style='width:106.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:25.7pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>재직</span></p>
  </td>
		</c:when>
		<c:otherwise>
  <td width=142 colspan=2 style='width:106.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:25.7pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>퇴직</span></p>
  </td>
		</c:otherwise>
		</c:choose>
 
  
  
  
 </tr>
 <tr style='height:25.7pt'>
  <td width=97 colspan=4 style='width:72.55pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:25.7pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>근무부서</span></p>
  </td>
  <td width=146 colspan=4 style='width:109.35pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:25.7pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${authEmployee.department.depName}</span></p>
  </td>
  <td width=89 colspan=2 style='width:66.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:25.7pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>직책</span></p>
  </td>
  <td width=142 colspan=2 style='width:106.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:25.7pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${authEmployee.position.poName}</span></p>
  </td>
 </tr>
 <tr style='height:25.7pt'>
  <td width=146 colspan=3 style='width:109.35pt;border:solid black 1.0pt;
  border-top:none;background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:25.7pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>이메일</span></p>
  </td>
  <td width=179 colspan=6 style='width:134.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:25.7pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${authEmployee.empMail}</span></p>
  </td>
  <td width=117 colspan=3 style='width:87.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:25.7pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>핸드폰</span></p>
  </td>
  <td width=178 colspan=3 style='width:1.85in;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:25.7pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${authEmployee.empHp}</span></p>
  </td>
 </tr>
 <tr style='height:26.95pt'>
 
  <td width=146 colspan=3 style='width:109.35pt;border:solid black 1.0pt;
  border-top:none;background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>결혼여부</span></p>
  </td>
  		<c:choose>
		<c:when test='${authEmployee.empMarry eq "Y"}'>
  <td width=179 colspan=6 style='width:134.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>기혼</span></p>
  </td>
		</c:when>
		<c:otherwise>
  <td width=179 colspan=6 style='width:134.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>미혼</span></p>
  </td>
		</c:otherwise>
		</c:choose>
  
  <td width=117 colspan=3 style='width:87.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>병역여부</span></p>
  </td>
  		<c:if test='${authEmployee.empMilitary eq "Y"}'>
  <td width=178 colspan=3 style='width:1.85in;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>복무</span></p>
  </td>
		</c:if>
		<c:if test='${authEmployee.empMilitary eq "N"}'>
  <td width=178 colspan=3 style='width:1.85in;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>미필</span></p>
  </td>
		</c:if>
		<c:if test='${authEmployee.empMilitary eq "A"}'>
  <td width=178 colspan=3 style='width:1.85in;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>해당없음</span></p>
  </td>
		</c:if>	
  
 </tr>
 
 
 <tr style='height:7.8pt'>
  <td width=620 colspan=15 style='width:464.85pt;border:none;border-bottom:
  solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:7.8pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  style='font-size:5.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
  </td>
 </tr>
 <tr style='height:21.3pt'>
  <td width=620 colspan=15 style='width:464.85pt;border:solid black 1.0pt;
  border-top:none;background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:21.3pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>자격증</span></p>
  </td>
 </tr>
 <tr style='height:26.95pt'>
  <td width=166 colspan=5 style='width:124.55pt;border:solid black 1.0pt;
  border-top:none;background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>자격증명</span></p>
  </td>
  <td width=222 colspan=6 style='width:166.8pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>발급일시</span></p>
  </td>
  <td width=231 colspan=4 style='width:173.5pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>발급기관</span></p>
  </td>
 </tr>

 	<c:if test="${empty liList }">
		<tr>
  <td width=620 colspan=15 style='width:464.85pt;border:solid black 1.0pt;
  border-top:none;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:21.3pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>입력된 정보가 없습니다</span></p>
  </td>
		</tr>
	</c:if>
	<c:if test="${not empty liList }">
		<c:forEach items="${liList }" var="li">
			<tr>
  <td width=166 colspan=5 style='width:124.55pt;border:solid black 1.0pt;
  border-top:none;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${li.licenseName }</span></p>
  </td>
  <td width=222 colspan=6 style='width:166.8pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${li.licenseDate }</span></p>
  </td>
  <td width=231 colspan=4 style='width:173.5pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${li.licenseAgency }</span></p>
  </td>
			</tr>
		</c:forEach>
	</c:if>
 
 
 
 <tr style='height:7.8pt'>
  <td width=620 colspan=15 style='width:464.85pt;border:none;border-bottom:
  solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:7.8pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  style='font-size:5.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
  </td>
 </tr>
 
 
 <tr style='height:21.3pt'>
  <td width=620 colspan=15 style='width:464.85pt;border:solid black 1.0pt;
  border-top:none;background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:21.3pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>가족관계</span></p>
  </td>
 </tr>
 
 <tr style='height:26.95pt'>
  <td width=79 style='width:59.4pt;border:solid black 1.0pt;border-top:none;
  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>관계</span></p>
  </td>
  <td width=79 colspan=3 style='width:59.4pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>성명</span></p>
  </td>
  <td width=95 colspan=4 style='width:71.25pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>생년월일</span></p>
  </td>
  <td width=99 colspan=2 style='width:74.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>직업</span></p>
  </td>
  <td width=90 colspan=2 style='width:67.4pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>학위</span></p>
  </td>
  <td width=91 colspan=2 style='width:.95in;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>동거여부</span></p>
  </td>
  <td width=86 style='width:.9in;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;background:#F2F2F2;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>비고</span></p>
  </td>
 </tr>
 
 
 <tr style='height:26.95pt'>
  <td width=79 style='width:59.4pt;border:solid black 1.0pt;border-top:none;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>ㄱㄱ관계</span></p>
  </td>
  <td width=79 colspan=3 style='width:59.4pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>ㄱㄱ성명</span></p>
  </td>
  <td width=95 colspan=4 style='width:71.25pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>ㄱㄱ생년월일</span></p>
  </td>
  <td width=99 colspan=2 style='width:74.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>ㄱㄱ직업</span></p>
  </td>
  <td width=90 colspan=2 style='width:67.4pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>ㄱㄱ학위</span></p>
  </td>
  <td width=91 colspan=2 style='width:.95in;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>ㄱㄱ동거</span></p>
  </td>
  <td width=86 style='width:.9in;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>ㄱㄱ비고</span></p>
  </td>
 </tr>
 
 	<c:if test="${empty famList }">
 <tr style='height:21.3pt'>
  <td width=620 colspan=15 style='width:464.85pt;border:solid black 1.0pt;
  border-top:none;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:21.3pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>입력된 정보가 없습니다.</span></p>
  </td>
 </tr>
	</c:if>	
	<c:if test="${not empty famList }">
		<c:forEach items="${famList }" var="fam">
 <tr style='height:26.95pt'>
  <td width=79 style='width:59.4pt;border:solid black 1.0pt;border-top:none;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${fam.famClassify}</span></p>
  </td>
  <td width=79 colspan=3 style='width:59.4pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${fam.famName}</span></p>
  </td>
  <td width=95 colspan=4 style='width:71.25pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${fam.famBir}</span></p>
  </td>
  <td width=99 colspan=2 style='width:74.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${fam.famJob}</span></p>
  </td>
  <td width=90 colspan=2 style='width:67.4pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${fam.famEdu}</span></p>
  </td>
  <td width=91 colspan=2 style='width:.95in;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${fam.stateNm}</span></p>
  </td>
  <td width=86 style='width:.9in;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${fam.famNote}</span></p>
  </td>
 </tr>	
		</c:forEach>
	</c:if>	
 
 
 
 <tr style='height:7.8pt'>
  <td width=620 colspan=15 style='width:464.85pt;border:none;border-bottom:
  solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:7.8pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  style='font-size:5.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
  </td>
 </tr>
 
 
 <tr style='height:21.3pt'>
  <td width=620 colspan=15 style='width:464.85pt;border:solid black 1.0pt;
  border-top:none;background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:21.3pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>경력사항</span></p>
  </td>
 </tr>
 
 <tr style='height:26.95pt'>
  <td width=166 colspan=5 style='width:124.55pt;border:solid black 1.0pt;
  border-top:none;background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>회사명</span></p>
  </td>
  <td width=222 colspan=6 style='width:166.8pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>담당업무</span></p>
  </td>
  <td width=231 colspan=4 style='width:173.5pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>근무연차</span></p>
  </td>
 </tr>
 
 	<c:if test="${empty carList }">
 <tr style='height:21.3pt'>
  <td width=620 colspan=15 style='width:464.85pt;border:solid black 1.0pt;
  border-top:none;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:21.3pt'><p class=a align=center style='text-align:center;word-break:normal'>
  <span lang=ZH-CN style='font-family:"Dotum",sans-serif'>입력된 정보가 없습니다.</span></p>
  </td>
 </tr>
	</c:if>	
	<c:if test="${not empty carList }">
		<c:forEach items="${carList }" var="car">
 <tr style='height:26.95pt'>
  <td width=166 colspan=5 style='width:124.55pt;border:solid black 1.0pt;
  border-top:none;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${car.carNm }</span></p>
  </td>
  <td width=222 colspan=6 style='width:166.8pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${car.carPo }</span></p>
  </td>
  <td width=231 colspan=4 style='width:173.5pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${car.carDate }</span></p>
  </td>
 </tr>
		</c:forEach>
	</c:if>	
 
 
 <tr style='height:7.8pt'>
  <td width=620 colspan=15 style='width:464.85pt;border:none;border-bottom:
  solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:7.8pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  style='font-size:5.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
  </td>
 </tr>
 <tr style='height:26.95pt'>
  <td width=101 colspan=2 rowspan=3 style='width:75.5pt;border:solid black 1.0pt;
  border-top:none;background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;
  height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>학력사항</span></p>
  </td>
  <td width=101 colspan=4 style='width:75.5pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>학교명</span></p>
  </td>
  <td width=418 colspan=9 style='width:313.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${authEmployee.uniersity.uniName}</span></p>
  </td>
 </tr>
 <tr style='height:26.95pt'>
  <td width=101 colspan=4 style='width:75.5pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>전공</span></p>
  </td>
  <td width=418 colspan=9 style='width:313.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${authEmployee.uniersity.uniMajor}</span></p>
  </td>
 </tr>
 <tr style='height:26.95pt'>
  <td width=101 colspan=4 style='width:75.5pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>졸업여부</span></p>
  </td>
  <td width=418 colspan=9 style='width:313.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:26.95pt'>
  <p class=a align=center style='text-align:center;word-break:normal'><span
  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${authEmployee.stateNm}</span></p>
  </td>
 </tr>
 <tr height=0>
  <td width=79 style='border:none'></td>
  <td width=21 style='border:none'></td>
  <td width=45 style='border:none'></td>
  <td width=13 style='border:none'></td>
  <td width=8 style='border:none'></td>
  <td width=35 style='border:none'></td>
  <td width=41 style='border:none'></td>
  <td width=11 style='border:none'></td>
  <td width=71 style='border:none'></td>
  <td width=27 style='border:none'></td>
  <td width=36 style='border:none'></td>
  <td width=54 style='border:none'></td>
  <td width=36 style='border:none'></td>
  <td width=56 style='border:none'></td>
  <td width=87 style='border:none'></td>
 </tr>
</table>

</div>

<p class=MsoNormal><span style='font-size:1.0pt'>&nbsp;</span></p>

<p class=a align=center style='text-align:center;word-break:normal'><span
style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>

</div>


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


















