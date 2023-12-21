<%@page contentType="application/vnd.ms-excel;charset=utf-8" %>
<%
    //중요한 사항 : "attachment; filename=excel.xls" 로 적으면 excel.xls 파일이 생성되고 다운로드된다.
    //의심하지 말고 아래줄은 그냥 적어요
    //모든 HTML은 Excel 파일형식으로 변환됨 (편하지 않나요?)
    
    response.setHeader("Content-Disposition", "attachment; filename=excel.xls");
    response.setHeader("Content-Description", "JSP Generated Data");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<table class="table table-hover align-middle  table-bordered">
				<colgroup>
					<col style="width: 65px;">
					<col style="width: 65px;">
					<c:forEach items="${depositList }" var="deposit">
						<col style="width: 153px;">
					</c:forEach>
				</colgroup>

				<tr class="table-primary excelRow">
					<th class="text-center" colspan="2">금융회사</th>
					<c:forEach items="${depositList }" var="deposit">
						<th class="text-center">${deposit.korCoNm }</th>
					</c:forEach>
				</tr>
				<tr class="excelRow">
					<th class="text-center" colspan="2">상품명</th>
					<c:forEach items="${depositList }" var="deposit">
						<td class="text-center">${deposit.finPrdtNm }</td>
					</c:forEach>
				</tr>
				<tr class="excelRow">
					<th class="text-center" colspan="2">금융권역</th>
					<c:forEach items="${depositList }" var="deposit">
						<td class="text-center">${deposit.topFinGrpNm}</td>
					</c:forEach>
				</tr>
				<tr class="excelRow">
					<th class="text-center align-middle" rowspan="3">이자율</th>
					<th class="text-center">세전</th>
					<c:forEach items="${depositList }" var="deposit">
						<td class="text-center">${deposit.intrRate }</td>
					</c:forEach>
				</tr>
				<tr class="excelRow">
					<th class="text-center">세후</th>
					<c:forEach items="${depositList }" var="deposit">
						<td class="text-center">${deposit.afterTexIntrRate  }</td>
					</c:forEach>
				</tr>
				<tr class="excelRow">
					<th class="text-center">최고우대금리</th>
					<c:forEach items="${depositList }" var="deposit">
						<td class="text-center">${deposit.intrRate2 }</td>
					</c:forEach>
				</tr>
				<tr class="excelRow">
					<th class="text-center align-middle" rowspan="2">만기시<br>실수령액
					</th>
					<th class="text-center">이자</th>
					<c:forEach items="${depositList }" var="deposit">
						<td class="text-center">${deposit.dispIntrAmount }</td>
					</c:forEach>
				</tr>
				<tr class="excelRow" >
					<th class="text-center">실수령액</th>
					<c:forEach items="${depositList }" var="deposit">
						<td class="text-center">${deposit.totalMoney }</td>
					</c:forEach>
				</tr>
				<tr class="excelRow">
					<th colspan="2" class="text-center">이자계산방식</th>
					<c:forEach items="${depositList }" var="deposit">
						<td class="text-center">${deposit.intrRateTypeNm }</td>
					</c:forEach>
				</tr>
				<tr class="excelRow">
					<th class="text-center" colspan="2">금융상품 문의</th>
					<c:forEach items="${depositList }" var="deposit">
						<td class="text-center">${deposit.dclsChrgMan }</td>
					</c:forEach>
				</tr>
				<tr class="excelRow">
					<th class="text-center" colspan="2">가입방법</th>
					<c:forEach items="${depositList }" var="deposit">
						<td class="text-center">${deposit.joinWay }</td>
					</c:forEach>
				</tr>
				<tr class="excelRow">
					<th class="text-center" colspan="2">우대조건</th>
					<c:forEach items="${depositList }" var="deposit">
						<td class="text-center">${deposit.spclCnd }</td>
					</c:forEach>
				</tr>
				<tr class="excelRow">
					<th class="text-center" colspan="2">만기후 이자율</th>
					<c:forEach items="${depositList }" var="deposit">
						<td class="text-center">${deposit.mtrtInt }</td>
					</c:forEach>
				</tr>
				<tr class="excelRow">
					<th class="text-center" colspan="2">가입대상</th>
					<c:forEach items="${depositList }" var="deposit">
						<td class="text-center">${deposit.joinMember }</td>
					</c:forEach>
				</tr>
				</tbody>
			</table>

