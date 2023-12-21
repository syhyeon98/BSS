<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		<h5>☗ 인사관리 ▸ 급여관리 ▸ [${employee.empName }]님의 급여현황</h5>
		<hr color="black">
			<form action="${pageContext.request.contextPath}/salary/salaryDetailView.do" method="post" id="salaryDetailView">
				<input type="hidden" name="salNo">
				<input type="hidden" name="empCd">
			</form>
			<table class="table table-bordered table-hover ">
				<thead>
					<tr>
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
							<tr class="datatr" data-salno="${salary.salNo}" data-empcd="${employee.empCd}">
								<td>${i.index +1}</td>
								<td>${salary.salNo}</td>
								<td>${salary.salCalcStart}~${salary.salCalcEnd}</td>
								<td>
									${salary.salCalcYmd }
								</td>
								<td>
									<c:if test="${salary.giveYmd !=null}">
										완료
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
$(listBody).on("click", "tr.datatr", function(event){ 
    event.stopPropagation();
    let salNo = $(this).data("salno");  
    let empCd = $(this).data("empcd");  
    $('input[name=salNo]').val(salNo);
    $('input[name=empCd]').val(empCd);
    $('#salaryDetailView').submit();
})
</script>
