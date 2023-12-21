<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<style>
.detailTable{
 	background-color: #e7edf4;
}
.modal-dialog{
	max-width:100%;
}
</style>

<div class="container-fluid">
	<div class="d-flex justify-content-center mb-4">
		<h5>검색된 금융 상품은 총 ${paging.totalRecord }건 입니다.</h5>
	</div>
	<div class="row">	
		<div class="col-md-12">
			<table class="table table-hover table-sm table-bordered ">
				<thead>
					<tr>
						<th class="align-middle text-center">금융회사</th>
						<th class="align-middle text-center">대출종류</th>
						<th class="align-middle text-center">금리방식</th>
						<th class="align-middle text-center">900점<br>초과</th>
						<th class="align-middle text-center">801~<br> 900 </th>
						<th class="align-middle text-center">701~<br> 800 </th>
						<th class="align-middle text-center">601~<br> 700 </th>
						<th class="align-middle text-center">501~<br> 600 </th>
						<th class="align-middle text-center">401~<br> 500 </th>
						<th class="align-middle text-center">301~<br> 400 </th>
						<th class="align-middle text-center">300점<br>이하 </th>
						<th class="align-middle text-center">평균금리</th>
						<th class="align-middle text-center">CB<br>회사명</th>
						<th class="align-middle text-center">금융상품 문의</th>
						<th class="align-middle text-center">상세정보</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${paging.dataList }" var="creditLoan" >
					<c:set  var="i" value="${i+1 }"/>
						<tr>
							<td class="align-middle text-center">${creditLoan.korCoNm}</td>						
							<td class="align-middle text-center">${creditLoan.crdtLendRateTypeNm}</td>						
							<td class="align-middle text-center">${creditLoan.crdtPrdtTypeNm}</td>
							<td class="align-middle text-center">${creditLoan.crdtGrad1}%</td>						
							<td class="align-middle text-center">${creditLoan.crdtGrad4}%</td>						
							<td class="align-middle text-center">${creditLoan.crdtGrad5}%</td>						
							<td class="align-middle text-center">${creditLoan.crdtGrad6}%</td>						
							<td class="align-middle text-center">${creditLoan.crdtGrad10}%</td>						
							<td class="align-middle text-center">${creditLoan.crdtGrad11}%</td>						
							<td class="align-middle text-center">${creditLoan.crdtGrad12}%</td>	
							<td class="align-middle text-center">${creditLoan.crdtGrad13}%</td>	
							<td class="align-middle text-center">${creditLoan.crdtGradAvg}%</td>	
							<td class="align-middle text-center">${creditLoan.cbName}</td>	
							<td class="align-middle text-center">
								<div> <a href="${rentHouse.hompUrl }" target="_blank"> ${rentHouse.korCoNm}</a></div>
								<div>(홈페이지)</div>
								<div>${rentHouse.calTel }</div>
								<div>(대표번호)</div>
							</td>						
							<td class="align-middle text-center">
								<p class="d-inline-flex gap-1 justify-content-center align-items-center">
								  <a class="btn btn-primary align-middle text-center" data-bs-toggle="collapse" href="#collapse${i }" role="button" aria-expanded="false" aria-controls="collapse${i }">
								    상세정보
								  </a>
								</p>
							</td>						
						</tr>
					
						<tr class="addTable">
							<td colspan="15">
							<div id="collapse${i }" class="collapse" aria-labelledby="heading${i }" data-parent="#accordion">
									<table class="row detailTable">
									<c:set var="showTable" value="false" />
									<c:forEach items="${allCreditLoanList}" var="allCredit">
									    <c:if test="${creditLoan.finCoNo eq allCredit.finCoNo and creditLoan.finPrdtCd eq allCredit.finPrdtCd and allCredit.crdtLendRateType != 'A'}">
									        <c:set var="showTable" value="true" />
									         <!-- 조건을 만족하면 더 이상 반복하지 않음 -->
									    </c:if>
									</c:forEach>
									
									<c:if test="${showTable}">
									    <thead>
									        <tr class="row">
									            <th class="col-md-1 align-middle text-center"></th>
									            <th class="col-md-1 align-middle text-center">대출종류</th>
									            <th class="col-md-1 align-middle text-center">900점<br>초과</th>
									            <th class="col-md-1 align-middle text-center">801~<br> 900 </th>
									            <th class="col-md-1 align-middle text-center">701~<br> 800 </th>
									            <th class="col-md-1 align-middle text-center">601~<br> 700 </th>
									            <th class="col-md-1 align-middle text-center">501~<br> 600 </th>
									            <th class="col-md-1 align-middle text-center">401~<br> 500 </th>
									            <th class="col-md-1 align-middle text-center">301~<br> 400 </th>
									            <th class="col-md-1 align-middle text-center">300점<br>이하 </th>
									            <th class="col-md-1 align-middle text-center">평균금리</th>
									            <th class="col-md-1 align-middle text-center"></th>
									        </tr>
									    </thead>
									    <c:forEach items="${allCreditLoanList}" var="allCredit">
									        <c:if test="${creditLoan.finCoNo eq allCredit.finCoNo and creditLoan.finPrdtCd eq allCredit.finPrdtCd and allCredit.crdtLendRateType != 'A'}">
									            <tbody>
									                <tr class="row">
									                    <th class="col-md-1 align-middle text-center"></th>
									                    <td class="col-md-1 align-middle text-center">${allCredit.crdtLendRateTypeNm}</td>
									                    <td class="col-md-1 align-middle text-center">${allCredit.crdtGrad1}%</td>
									                    <td class="col-md-1 align-middle text-center">${allCredit.crdtGrad4}%</td>
									                    <td class="col-md-1 align-middle text-center">${allCredit.crdtGrad5}%</td>
									                    <td class="col-md-1 align-middle text-center">${allCredit.crdtGrad6}%</td>
									                    <td class="col-md-1 align-middle text-center">${allCredit.crdtGrad10}%</td>
									                    <td class="col-md-1 align-middle text-center">${allCredit.crdtGrad11}%</td>
									                    <td class="col-md-1 align-middle text-center">${allCredit.crdtGrad12}%</td>
									                    <td class="col-md-1 align-middle text-center">${allCredit.crdtGrad13}%</td>
									                    <td class="col-md-1 align-middle text-center">${allCredit.crdtGradAvg}%</td>
									                    <td class="col-md-1 align-middle text-center"></td>
									                </tr>
									            </tbody>
									        </c:if>
									    </c:forEach>
									</c:if>
										<thead>
											<tr class="row">
												<th class="col-md-6 align-middle text-center">담당부서 및 연락처</th>																			
												<th class="col-md-6 align-middle text-center">가입방법</th>																			
											</tr>
										</thead>
										<tbody>
											<tr class="row">
												<td class="col-md-6  align-middle text-center">${creditLoan.dclsChrgMan}</td>
												<td class="col-md-6  align-middle text-center">${creditLoan.joinWay}</td>
											</tr>
										</tbody>	
									</table>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				
				<tfoot>
					<tr>
						<td colspan="15">
							${paging.pagingHTML }
						</td>
					</tr>
				</tfoot>	
			</table>
			<form:form id="searchForm" modelAttribute="simpleCondition">
				<form:hidden path="searchType" />
				<form:hidden path="searchWord"/>
				<input type="hidden" name="page"/>
			</form:form>
		</div>
	</div>
</div>


    