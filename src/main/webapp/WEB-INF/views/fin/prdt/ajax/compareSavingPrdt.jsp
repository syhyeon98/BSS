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
					<c:forEach items="${savingPrdtList }" var="savingPrdt">
							<col style="width: 153px;">
					</c:forEach>
				</colgroup>
				<tbody>
					<tr class="table-primary">
						<th class="text-center align-middle" colspan="2">금융회사</th>
						<c:forEach items="${savingPrdtList }" var="savingPrdt">
							<th class="text-center align-middle">${savingPrdt.korCoNm }</th>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">상품명</th>
						<c:forEach items="${savingPrdtList }" var="savingPrdt">
							<td class="text-center align-middle">${savingPrdt.finPrdtNm }</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">적립방식</th>
						<c:forEach items="${savingPrdtList }" var="savingPrdt">
							<td class="text-center align-middle">${savingPrdt.rsrvTypeNm}</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">금융권역</th>
						<c:forEach items="${savingPrdtList }" var="savingPrdt">
							<td class="text-center align-middle">${savingPrdt.topFinGrpNm}</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" rowspan="3">이자율</th>
						<th class="text-center align-middle">세전</th>
						<c:forEach items="${savingPrdtList }" var="savingPrdt">
							<td class="text-center align-middle">
								${savingPrdt.intrRate }
							</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle">세후</th>
						<c:forEach items="${savingPrdtList }" var="savingPrdt">
							<td class="text-center align-middle">
								${savingPrdt.afterTexIntrRate  }
							</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle">최고우대금리</th>
						<c:forEach items="${savingPrdtList }" var="savingPrdt">
							<td class="text-center align-middle">
								${savingPrdt.intrRate2 }
							</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" rowspan="2">만기시<br>실수령액</th>
						<th class="text-center align-middle">이자</th>
						<c:forEach items="${savingPrdtList }" var="savingPrdt">
								<td class="text-center align-middle">${savingPrdt.dispIntrAmount }</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle">실수령액</th>
						<c:forEach items="${savingPrdtList }" var="savingPrdt">
								<td class="text-center align-middle">${savingPrdt.totalMoney}</td>
						</c:forEach>
					</tr>
					<tr>
						<th colspan="2" class="text-center align-middle">이자계산방식</th>
						<c:forEach items="${savingPrdtList }" var="savingPrdt">
							<td class="text-center align-middle"> ${savingPrdt.intrRateTypeNm }</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">금융상품 문의</th>
						<c:forEach items="${savingPrdtList }" var="savingPrdt">
							<td class="text-center align-middle">${savingPrdt.dclsChrgMan }</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">가입방법</th>
						<c:forEach items="${savingPrdtList }" var="savingPrdt">
							<td class="text-center align-middle">${savingPrdt.joinWay }</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">우대조건</th>
						<c:forEach items="${savingPrdtList }" var="savingPrdt">
							<td class="text-center align-middle">${savingPrdt.spclCnd }</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">만기후 이자율</th>
						<c:forEach items="${savingPrdtList }" var="savingPrdt">
							<td class="text-center align-middle">${savingPrdt.mtrtInt }</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="text-center align-middle" colspan="2">가입대상</th>
						<c:forEach items="${savingPrdtList }" var="savingPrdt">
							<td class="text-center align-middle">${savingPrdt.joinMember }</td>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>