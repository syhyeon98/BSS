<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="${pageContext.request.contextPath }/resources/js/pdf/html2canvas.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/pdf/jspdf.plugin.autotable.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/pdf/jspdf.min.js"></script>
	
<style>
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
<c:set value="${salaryDetailList[0] }" var="salaryDetail" />
<div class="container-fluid">
<!-- 	<button id="downloadPdf" class="btn btn-primary">PDF저장</button> -->
<!-- 	<button id="showPdf" class="btn btn-primary">PDF저장</button> -->
	<div class="row">
		<div class="row col-md-12">

	<div class="col-md-6">		
	<h5>[${salaryDetail.employeeVO.empName }]님의 급여지급명세서</h5>
	<hr color="black">
	
	<div><button id="downloadPdf" class="btn btn-primary" style="margin-bottom:10px">급여지급명세서 출력</button></div>

	<!-- PDF 시작 -->
	<div id="pdfContent" style="background-color: white;">
	
	<div class="WordSection1">
	<p class=a><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	<p class=a><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<p class=a align=center style='text-align:center;word-break:normal'><b><span
	lang=ZH-CN style='font-size:18.0pt;line-height:103%;font-family:"Dotum",sans-serif'>급여지급명세서</span></b></p>
	
	<p class=a><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	<p class=a><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	<p class=a><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	<p class=a><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	<div align=center>
	<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
	 style='border-collapse:collapse;border:none'>
	 <tr style='height:17.4pt'>
	  <td width=559 colspan=4 style='width:419.5pt;border:none;
	  border-top:none;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:17.4pt'>
	  <p class=a align=center style='text-align:right;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>산정기간 : ${salaryDetail.salaryVO.salCalcStart }~${salaryDetail.salaryVO.salCalcEnd }</span></p>
	  </td>
	 </tr>
	</table>
	</div>
	<p class=a><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	
	<div align=center>
	<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
	 style='border-collapse:collapse;border:none'>
	 
	 <tr style='height:17.4pt'>
	  <td width=559 colspan=4 style='width:419.5pt;border:none;border-bottom:solid black 1.0pt;
	  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.4pt'>
	  <p class=a align=left style='text-align:left;word-break:normal'><span
	  style='font-family:"Dotum",sans-serif'><span lang=ZH-CN>1. 사원정보</span></span></p>
	  <p class=a align=left style='text-align:left;word-break:normal'><span
	  style='font-size:4.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	  </td>
	 </tr>
	 
	 <tr style='height:17.4pt'>
	  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
	  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>성명</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${salaryDetail.employeeVO.empName }</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
	  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>부서</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${salaryDetail.employeeVO.busName }</span></p>
	  </td>
	 </tr>
	 
	 <tr style='height:17.4pt'>
	  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
	  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>지급일</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${salaryDetail.giveYmd }</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
	  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>직급</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${salaryDetail.employeeVO.poName }</span></p>
	  </td>
	 </tr>
	</table>
	</div>
	
	
	<p class=MsoNormal><span style='font-size:1.0pt'>&nbsp;</span></p>
	<p class=a align=center style='text-align:center;word-break:normal'><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	<p class=a><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	<p class=a><span style='font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	
	
	<div align=center>
	<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
	 style='border-collapse:collapse;border:none'>
	 <tr style='height:17.4pt'>
	  <td width=559 colspan=4 style='width:419.5pt;border:none;border-bottom:solid black 1.0pt;
	  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.4pt'>
	  <p class=a><span style='font-family:"Dotum",sans-serif'><span lang=ZH-CN>2. 급여
	  및 공제내역</span></span></p>
	  <p class=a align=left style='text-align:left;word-break:normal'><span
	  style='font-size:4.0pt;line-height:103%;font-family:"Dotum",sans-serif'>&nbsp;</span></p>
	  </td>
	 </tr>
	 
	 <tr style='height:17.4pt'>
	  <td width=559 colspan=4 style='width:419.5pt;border:solid black 1.0pt;
	  border-top:none;background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>급여 및 공제내역</span></p>
	  </td>
	 </tr>
	 
	 <tr style='height:17.4pt'>
	  <td width=280 colspan=2 style='width:209.75pt;border:solid black 1.0pt;
	  border-top:none;background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>지급내역</span></p>
	  </td>
	  <td width=280 colspan=2 style='width:209.75pt;border-top:none;border-left:
	  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
	  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>공제내역</span></p>
	  </td>
	 </tr>
	 
	 <tr style='height:17.4pt'>
	  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
	  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>지급항목</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
	  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>지급액</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
	  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>공제항목</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
	  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>공제액</span></p>
	  </td>
	 </tr>
	 						<c:if
								test="${salaryDetail.allowHistoryList.size() > salaryDetail.ddcHistoryList.size()}">
								<c:set value="${salaryDetail.allowHistoryList.size()}"
									var="rowCount" />
							</c:if>
							<c:if
								test="${salaryDetail.allowHistoryList.size() < salaryDetail.ddcHistoryList.size()}">
								<c:set value="${salaryDetail.ddcHistoryList.size()}"
									var="rowCount" />
							</c:if>
							<c:set value="0" var="allowAmt" />
							<c:set value="0" var="ddcAmt" />	
					<c:forEach begin="0" end="${rowCount}" var="i">
	 
	  <tr style='height:17.4pt'>
	  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
	  padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${salaryDetail.allowHistoryList[i].allowVO.allowNm}</span></p>
	  </td>
	  
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:17.4pt'>
	  <p class=a align=right style='text-align:right;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'><fmt:formatNumber
											value="${salaryDetail.allowHistoryList[i].allowAmt}"
											type="currency" /> <c:set
											value="${allowAmt + salaryDetail.allowHistoryList[i].allowAmt }"
											var="allowAmt" /></span></p>
	  </td>
	  
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:17.4pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>${salaryDetail.ddcHistoryList[i].ddcVO.ddcNm}</span></p>
	  </td>
	  
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:17.4pt'>
	  <p class=a align=right style='text-align:right;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'><fmt:formatNumber
											value="${salaryDetail.ddcHistoryList[i].ddcAmt}"
											type="currency" /> <c:set
											value="${ddcAmt + salaryDetail.ddcHistoryList[i].ddcAmt }"
											var="ddcAmt" /></span></p>
	  </td>
	 </tr>
	 				</c:forEach>
	 
	 
	 <tr style='height:17.45pt'>
	  <td width=140 style='width:104.85pt;border:solid black 1.0pt;border-top:none;
	  background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.45pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>지급액 계</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:17.45pt'>
	  <p class=a align=right style='text-align:right;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'><fmt:formatNumber value="${allowAmt }" type="currency" /></span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
	  #F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;height:17.45pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>공제액 계</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:17.45pt'>
	  <p class=a align=right style='text-align:right;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'><fmt:formatNumber value="${ddcAmt }" type="currency" /></span></p>
	  </td>
	 </tr>
	 
	 <tr style='height:17.5pt'>
	  <td width=419 colspan=3 style='width:314.6pt;border:solid black 1.0pt;
	  border-top:none;background:#F2F2F2;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:17.5pt'>
	  <p class=a align=center style='text-align:center;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'>차인지급액</span></p>
	  </td>
	  <td width=140 style='width:104.85pt;border-top:none;border-left:none;
	  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:1.4pt 5.1pt 1.4pt 5.1pt;
	  height:17.5pt'>
	  <p class=a align=right style='text-align:right;word-break:normal'><span
	  lang=ZH-CN style='font-family:"Dotum",sans-serif'><fmt:formatNumber value="${allowAmt - ddcAmt}" type="currency" /></span></p>
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
	<p class=a align=center style='text-align:center;word-break:normal'><b><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></b></p>
	<p class=a align=center style='text-align:center;word-break:normal'><b><span
	style='font-family:"Dotum",sans-serif'>&nbsp;</span></b></p>
	</div>
	</div>
	</div>
	<!-- PDF 끝 -->
	
	
	<div class="col-md-6">		
	<h5>[${salaryDetail.employeeVO.empName }]님의 전체 급여 목록</h5>
	<hr color="black">
	<div><button class="btn btn-primary" style="margin-bottom:10px; visibility: hidden;">공간맞추기</button></div>		
		<div id="salaryList">	
<%-- 			<h3 class="text-center">${salaryDetail.employeeVO.empName}님의 전체 급여 목록</h3> --%>
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="table-secondary text-center">
						<th>순번</th>
						<th>급여번호</th>
						<th>지급기준일</th>
						<th>급여계산일</th>
						<th>정산완료</th>
					</tr>
				</thead>
				<tbody id="listBody">
					<c:if test="${not empty salaryList }">
						<c:forEach items="#{salaryList }" var="salary" varStatus="i">
							<tr class="datatr text-center" data-salno="${salary.salNo}"
								data-empcd="${salaryDetail.employeeVO.empCd}">
								<td>${i.index +1}</td>
								<td>${salary.salNo}</td>
								<td>${salary.salCalcStart}~${salary.salCalcEnd}</td>
								<td>${salary.salCalcYmd }</td>
								<td><c:if test="${salary.giveYmd !=null}">
									완료
								</c:if></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
	</div>
</div>
</div>



<form
	action="${pageContext.request.contextPath}/mypage/salaryDetailView.do"
	method="post" id="salaryDetailView">
	<input type="hidden" name="salNo"> <input type="hidden"
		name="empCd">
</form>
<script>
	$(listBody).on("click", "tr.datatr", function(event){ 
	    event.stopPropagation();
	    let salNo = $(this).data("salno");  
	    let empCd = $(this).data("empcd");  
	    $('input[name=salNo]').val(salNo);
	    $('input[name=empCd]').val(empCd);
	    $('#salaryDetailView').submit();
	})
	
	$("#downloadPdf").on("click", function() {
		const quality = 1;
		html2canvas($('#pdfContent')[0], {
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
			doc.addImage(imgData, 'PNG', margin, position, 200, 290);
			doc.save('급여명세서.pdf');
		});
	});
	
// 	$("#showPdf").on("click", function(){
// 		$(showSalayrPdf).submit();
// 	})
	
	</script>
