<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid">
	<div>
		<div id="pdfArea">
			<table  class="table table-hover align-middle table-bordered">
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
				<th style="display:none"></th>
					<th class="text-center">세후</th>
					<c:forEach items="${depositList }" var="deposit">
						<td class="text-center">${deposit.afterTexIntrRate  }</td>
					</c:forEach>
				</tr>
				<tr class="excelRow">
					<th style="display:none"></th>
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
					<th style="display:none"></th>
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
		<div style="float: right;">
		<button id="downloadExcel" class="btn btn-primary">엑셀저장</button>
		<button id="downloadPdf" class="btn btn-primary">PDF저장</button>
		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		</div>
		</div>
	</div>
</div>
