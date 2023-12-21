<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<div class="container-fluid">
	<div >
		<div > 
			<table class="table table-hover align-middle  table-bordered">
				<colgroup>
					<col style="width: 65px;">
					<col style="width: 65px;">
					<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<col style="width: 153px;">
					</c:forEach>
				</colgroup>
				<tbody>
					<tr class="table-primary">
						<th class="text-center align-middle" colspan="2">금융회사</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<th class="text-center align-middle">${mortagageLoan.korCoNm }</th>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">상품명</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle">${mortagageLoan.finPrdtNm }</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">금융권역</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle">${mortagageLoan.topFinGrpNm}</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">주택종류</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle">${mortagageLoan.mrtgTypeNm}</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">금리방식</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle">${mortagageLoan.lendRateTypeNm}</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">상환방식</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle">${mortagageLoan.rpayTypeNm}</td>
						</c:forEach>
					</tr>
			
					<tr>
						<th class="text-center align-middle" rowspan="2">금리</th>
						<th class="text-center align-middle">최저</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle">
								${mortagageLoan.lendRateMin }
							</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle">최고</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle">
								${mortagageLoan.lendRateMax }
							</td>
						</c:forEach>
					</tr>
					<tr>
						<th colspan="2" class="text-center align-middle">전월 평균금리</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle"> ${mortagageLoan.lendRateAvg }</td>
						</c:forEach>
					</tr>
					<tr>
						<th colspan="2" class="text-center align-middle">월평균 상환액</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle"> ${mortagageLoan.dispMonthlyPayment } </td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">총대출비용</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle">${mortagageLoan.disptotalLoanAmount }</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">금융상품 문의</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle">${mortagageLoan.dclsChrgMan }</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">가입방법</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle">${mortagageLoan.joinWay }</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">대출부대비용</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle">${mortagageLoan.loanInciExpn}</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">중도상환<br>수수료</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle">${mortagageLoan.erlyRpayFee }</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">연체이자율</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle">${mortagageLoan.dlyRate }</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">대출한도</th>
						<c:forEach items="${mortagageLoanList }" var="mortagageLoan">
							<td class="text-center align-middle">${mortagageLoan.loanLmt }</td>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>