<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!-- <div class="container-fluid"> -->
<!-- 	<div class="row"> -->
<!-- 		<div class="col-md-12"> -->
		<h5>☗ 급여조회 ▸ [${employee.empName }]님의 급여현황</h5>
		<hr color="black">
		
		<div class="card">
			<div class="container-fluid">
				<div class="card-header">
				    <span style="font-size: 20px;">■ 개인의 급여 현황을 확인할 수 있습니다.</span><br>
				    ① 아래를 클릭하면 해당월에 지급된 급여지급명세서를 확인할 수 있습니다.<br>
				     * 기본급, 초과근무수당, 식대, 기타수당의 지급내역이 있고, 4대보험과 소득세 등의 공제내역으로 나누어 확인할 수 있습니다.<br>
				    ② <span style="color: coral;">[PDF저장]</span>를 클릭하면 클릭한 급여지급명세서를 다운로드할 수 있습니다.<br>
				    ③ 급여의 지급여부는 <span style="color: coral;">[정산완료]</span>에서 확인할 수 있습니다.<br>
				    ※ 급여와 관련된 궁금한 사항은 ☎ 042-252-2251(인사부 담당 이준호)로 문의바랍니다.
				</div>
			</div>
		</div>
		
		
<div class="card">
<div class="card-header">	
	<div class="container-fluid" id="paddingTB">
<!-- 	<div class="card-header" >	 -->
			<form action="${pageContext.request.contextPath}/mypage/salaryDetailView.do" method="post" id="salaryDetailView">
				<input type="hidden" name="salNo">
				<input type="hidden" name="empCd">
			</form>
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
							<tr class="datatr text-center" data-salno="${salary.salNo}" data-empcd="${employee.empCd}">
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
<!-- 		</div> -->
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
