<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>


<h5>☗ 인사관리 ▸ 급여관리 ▸ 급여계산/대장</h5>
			<hr color="black">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">

			<button  class="btn btn-success" id="newSalaryBtn">신규</button>
			<table class="table table-bordered table-hover textCenter">
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
							<tr class="datatr" data-salno="${salary.salNo}">
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
    let salNo = $(this).data("salno"); 
    location.href = "salaryDetail.do?salNo=" + salNo;
});

$(newSalaryBtn).on("click",function(){
	event.preventDefault();
	let today = new Date();
	if(today.getDate()>25){
		alert("매달 1일부터 24일 사이에 계산이 가능합니다");
	}else{
		location.href = `${pageContext.request.contextPath}/salary/salaryInsert.do`
	}
})
</script>
