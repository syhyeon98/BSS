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
/* 	th { */
/* 		text-align:center; */
/* 		width:150px; */
/* 	} */
	
/* 	#cont { */
/* 		height: 30vh; */
/* 	} */
/* 	#trainingPaper { */
/*  	margin-left: 30%; */
/* 	} */
	
	
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
	margin:99.2pt 85.0pt 85.0pt 85.0pt;}
div.WordSection1
	{page:WordSection1;}
 /* List Definitions */
 ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
-->
	
	
	
</style>

<%-- list로 받고 있어서 ${trainAppList[0].trainNo}이런식으로 가져와야함 --%>
<!-- 테이블 스타일 필요할지도 style="width: 90%; , background-color: white;" -->


<button id="downloadPdf" class="btn btn-primary">PDF저장</button>
<div class="col-md-6" id="trainingPaper">
<c:if test="${not empty trainAppList }">

<!-- security -->
<security:authentication property="principal.realUser" var="authEmployee" />

	<div class=WordSection1 style="background:white;">
	
	<p class=a align=center style='text-align:center;word-break:normal'><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	<p class=a align=center style='text-align:center;word-break:normal'><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	<p class=a align=center style='text-align:center;word-break:normal'><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	<p class=a align=center style='text-align:center;word-break:normal'><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	<p class=a align=center style='text-align:center;word-break:normal'><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><b><span
	lang=ZH-CN style='font-size:16.0pt;line-height:103%;font-family:"Dotum",sans-serif'>교육이수증</span></b></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	<p class=a align=center style='text-align:center;word-break:normal'><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	<p class=a align=center style='text-align:center;word-break:normal'><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	<p class=a align=center style='text-align:center;word-break:normal'><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	<p class=a align=center style='text-align:center;word-break:normal'><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<div align=center>
	
	<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
	 style='border-collapse:collapse;border:none'>
	 <tr style='height:17.4pt'>
	  <td width=559 colspan=4 style='width:419.5pt;border:none;border-bottom:solid black 1.0pt;
	  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.4pt'>
	  <p class=a align=left style='text-align:left;word-break:normal'><span
	  style='font-family:"Dotum",sans-serif'>1. <span lang=ZH-CN>직원정보</span></span></p>
	  <p class=a align=left style='text-align:left;word-break:normal'><span
	  style='font-size:4.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	  </td>
	 </tr>
	 <tr style='height:21.3pt'>
	  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
	  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:21.3pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>성명</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:21.3pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${authEmployee.empName}</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
	  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:21.3pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>생년월일</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:21.3pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${authEmployee.empId1}</span></p>
	  </td>
	 </tr>
	 <tr style='height:21.3pt'>
	  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
	  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:21.3pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>부서</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:21.3pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${authEmployee.depName}</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
	  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:21.3pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>직급</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:21.3pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${authEmployee.position.poName}</span></p>
	  </td>
	 </tr>
	</table>
	
	</div>
	
	<p class=MsoNormal><span style='font-size:1.0pt'>&nbsp;</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<p class=a><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<div align=center>
	
	<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
	 style='border-collapse:collapse;border:none'>
	 <tr style='height:17.4pt'>
	  <td width=559 colspan=2 style='width:419.5pt;border:none;border-bottom:solid black 1.0pt;
	  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.4pt'>
	  <p class=a><span style='font-family:"Dotum",sans-serif'>2. <span lang=ZH-CN>교육정보</span></span></p>
	  <p class=a align=left style='text-align:left;word-break:normal'><span
	  style='font-size:4.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	  </td>
	 </tr>
	 <tr style='height:21.3pt'>
	  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
	  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:21.3pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>강사명</span></p>
	  </td>
	  <td width=419 style='width:314.6pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:21.3pt'>
	  <p class=a><span lang=ZH-CN style='font-family:"Dotum",sans-serif'>${trainAppList[0].lectorName }</span></p>
	  </td>
	 </tr>
	 <tr style='height:21.3pt'>
	  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
	  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:21.3pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>교육일자</span></p>
	  </td>
	  <td width=419 style='width:314.6pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:21.3pt'>
	  <p class=a><span lang=ZH-CN style='font-family:"Dotum",sans-serif'>${trainAppList[0].trainDate} [이거 수정하기]</span></p>
	  </td>
	 </tr>
	 <tr style='height:21.3pt'>
	  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
	  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:21.3pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>교육명</span></p>
	  </td>
	  <td width=419 style='width:314.6pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:21.3pt'>
	  <p class=a><span lang=ZH-CN style='font-family:"Dotum",sans-serif'>${trainAppList[0].trainName}</span></p>
	  </td>
	 </tr>
	 <tr style='height:184.1pt'>
	  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
	  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:184.1pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>교육내용</span></p>
	  </td>
	  <td width=419 style='width:314.6pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:184.1pt'>
	  <p class=a><span lang=ZH-CN style='font-family:"Dotum",sans-serif'>${trainAppList[0].trainContent}</span></p>
	  </td>
	 </tr>
	</table>
	
	</div>
	
	<p class=MsoNormal><span style='font-size:1.0pt'>&nbsp;</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><span
	lang=ZH-CN style='font-family:"Dotum",sans-serif'>상기인은 위와 같이 사내 교육을 이수하였음을 증명합니다</span><span
	style='font-family:"Dotum",sans-serif'>.</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><b><span
	style='font-size:13.0pt;line-height:103%;font-family:"Dotum",sans-serif'>B S S</span></b></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><b><span
	lang=ZH-CN style='font-family:"Dotum",sans-serif'>대표자 현 성 윤</span></b></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	</div>
</c:if>
</div>

<script>
	
	$("#downloadPdf").on("click", function() {
		const quality = 1;
		html2canvas($('#trainingPaper')[0], {
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
			doc.addImage(imgData, 'PNG', margin, position, 210, 230 );
			doc.save('교육이수증.pdf');
		});
	});
	
	
</script>

