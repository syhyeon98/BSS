<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!-- c3.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/c3.css">

<!-- c3.js -->
<script src="${pageContext.request.contextPath }/resources/js/c3/c3.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/c3/d3-5.8.2.min.js"></script>
<div class="d-flex">
	<div class=" d-flex flex-column align-items-center border p-3 me-4  bg-white rounded" style="width:49%">
		<h5>근무</h5>
		<div
			class="d-flex justify-content-center border p-3  bg-white rounded">
			<div
				class="d-flex flex-column align-items-center me-4 p-2 rounded bg-primary-subtle">
				<div>이번달 총 근무일</div>
				<div>${totalWeekDay}</div>
			</div>
			<div
				class="d-flex flex-column align-items-center me-4 p-2 rounded bg-success-subtle">
				<div>이번달 근무일</div>
				<div>${totalAttendance}</div>
			</div>
			<div
				class="d-flex flex-column align-items-center me-4 p-2 rounded bg-warning-subtle">
				<div>이번달 남은근무일</div>
				<div>${remainingDays}</div>
			</div>
		</div>
		<div class="progress mt-4 " style="width: 80%; height: 50px"
			role="progressbar" aria-label="Animated striped example"
			aria-valuenow="${percentageDay}" aria-valuemin="0"
			aria-valuemax="100">
			<div class="progress-bar progress-bar-striped progress-bar-animated"
				style="width: ${percentageDay}%">${percentageDay}%</div>
		</div>
		<a class="mt-2" href="${pageContext.request.contextPath}/mypage/myAttend">+더보기</a>
	</div>
	<div class=" d-flex flex-column align-items-center border p-3  bg-white rounded" style="width:49%">
		<h5>이번달 초과근무</h5>
		<table class="mt-2 table table-hover   ">
			<thead>
				<tr>
<!-- 					<th class="text-center">No</th> -->
					<th class="text-center">초과근무내용</th>
					<th class="text-center">초과근무시작시간</th>
					<th class="text-center">초과근무종료시간</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${overTimeList !=null && overTimeList.size()>0}">
						<c:forEach items="${overTimeList}" var="overTime">
							<tr>
<%-- 								<td class="text-center">${overTime.rnum }</td> --%>
								<td class="text-center">${overTime.overCont }</td>
								<td class="text-center">${overTime.formattedOverStart }</td>
								<td class="text-center">${overTime.formattedOverEnd }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan="4"><h6>이번달 초과근무가 없습니다</h6></td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<a class="mt-2" href="${pageContext.request.contextPath}/mypage/myAttend">+더보기</a>
	</div>
</div>

<div class="d-flex mt-4">
	<div class=" d-flex flex-column align-items-center border p-3 me-4  bg-white rounded" style="width:49%">
		<h5>급여</h5>
		<div id="salaryChart"></div>
		<a class="mt-2" href="${pageContext.request.contextPath}/mypage/salaryMyList.do">+더보기</a>
	</div>
	<div class=" d-flex flex-column align-items-center border p-3 me-4  bg-white rounded" style="width:49%">
	<h5>내결재문서</h5>
	<table class="mt-2 table table-hover ">
			<thead>
				<tr>
<!-- 					<th class="text-center">No</th> -->
					<th class="text-center">결재명</th>
					<th class="text-center">결재상태</th>
					<th class="text-center">기안일자</th>
				</tr>
			</thead>
			<tbody class="listBody">
				<c:choose>
					<c:when test="${documentList !=null && documentList.size()>0}">
						<c:forEach items="${documentList}" var="document">
							<tr class="datatr" data-docno="${document.docNo}">
<%-- 								<td class="text-center">${document.rnum }</td> --%>
								<td class="text-center">${document.docTitle }</td>
								<td class="text-center">
									<c:if test="${document.code =='D_01'}">
										<span class="rounded-5 p-2 bg-primary-subtle ">${document.codeKoName}</span>
									</c:if>
									<c:if test="${document.code =='D_02'}">
										<span class="rounded-5 p-2 bg-success-subtle">${document.codeKoName}</span>
									</c:if>
									<c:if test="${document.code =='D_03'}">
										<span class="rounded-5 p-2 bg-warning-subtle">${document.codeKoName}</span>
									</c:if>
									<c:if test="${document.code =='D_04'}">
										<span class="rounded-5 p-2 bg-danger-subtle">${document.codeKoName}</span>
									</c:if>
								</td>
								<td class="text-center">${document.formatDocUpdate }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan="5"><h6>이번달 신청한 교육이없습니다</h6></td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
			<a class="mt-2" href="${pageContext.request.contextPath}/ed/document/myDocument.do">+더보기</a>
	</div>
</div>

<div class="d-flex mt-4">
	<div class=" d-flex flex-column align-items-center border p-3 me-4  bg-white rounded" style="width:32%">
	<h5>예정된 출장</h5>
	<table class="mt-2 table table-hover   ">
			<thead>
				<tr>
<!-- 					<th class="text-center">No</th> -->
					<th class="text-center">출장 장소</th>
					<th class="text-center">출장 목적</th>
					<th class="text-center">출장 시작일</th>
					<th class="text-center">출장 종료일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${businessTripList !=null && businessTripList.size()>0}">
						<c:forEach items="${businessTripList}" var="businessTrip">
							<tr>
<%-- 								<td class="text-center">${businessTrip.rnum }</td> --%>
								<td class="text-center">${businessTrip.tripPlace }</td>
								<td class="text-center">${businessTrip.tripPurpose }</td>
								<td class="text-center">${businessTrip.tripSdate }</td>
								<td class="text-center">${businessTrip.tripEdate }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan="5"><h6>이번달 출장계획이 없습니다</h6></td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<a class="mt-2" href="${pageContext.request.contextPath}/mypage/myBusinessTrip">+더보기</a>	
	</div>
	<div class=" d-flex flex-column align-items-center border p-3 me-4  bg-white rounded" style="width:32%">
	<h5>예정된 휴가</h5>
	<table class="mt-2 table table-hover   ">
			<thead>
				<tr>
<!-- 					<th class="text-center">No</th> -->
					<th class="text-center">휴가 시작일</th>
					<th class="text-center">휴가 종료일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${vacationList !=null && vacationList.size()>0}">
						<c:forEach items="${vacationList}" var="vacation">
							<tr>
<%-- 								<td class="text-center">${vacation.rnum }</td> --%>
								<td class="text-center">${vacation.vocationSday }</td>
								<td class="text-center">${vacation.vocationEday }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan="3"><h6>이번달 휴가 계획이 없습니다 😢</h6></td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>	
		<a class="mt-2" href="${pageContext.request.contextPath}/mypage/myVocation">+더보기</a>
	</div>
	<div class=" d-flex flex-column align-items-center border p-3 me-4  bg-white rounded" style="width:32%">
	<h5>예정된 교육</h5>
	<table class="mt-2 table table-hover   ">
			<thead>
				<tr>
<!-- 					<th class="text-center">No</th> -->
					<th class="text-center">교육명</th>
					<th class="text-center">교육장소</th>
					<th class="text-center">교육일자</th>
					<th class="text-center">교육소요시간</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${trainingList !=null && trainingList.size()>0}">
						<c:forEach items="${trainingList}" var="training">
							<tr>
<%-- 								<td class="text-center">${training.rnum }</td> --%>
								<td class="text-center">${training.trainName }</td>
								<td class="text-center">${training.trainPlace }</td>
								<td class="text-center">${training.formatTrainDate }</td>
								<td class="text-center">${training.trainTime }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan="5"><h6>이번달 신청한 교육이없습니다</h6></td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<a class="mt-2" href="${pageContext.request.contextPath}/mypage/myTraining.do">+더보기</a>	
	</div>
</div>



<script>
	
$(document).ready(function(){
	let salaryList =[];
	let allowList = [];
	let ddcList =[];
	let setting = {
			url : `${pageContext.request.contextPath}/employee/mypageMainAjax.do`,
			method : "GET",
			dataType : "json",
			success : function(resp) {
				salaryList = (resp.salaryList)
				allowList = (resp.allowList)
				ddcList=(resp.ddcList)
				salaryChart(salaryList,allowList,ddcList);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
	$.ajax(setting);
 });
	
function salaryChart(salaryList,allowList,ddcList){
	console.log("salaryList",salaryList)
	console.log("allowList",allowList)
	console.log("ddcList",ddcList)
	let salaryColumns=[];
	let beforeSalaryColumns=[];
	let allowColumns=[];
	let beforeAllowColumns=[];
	let ddcColumns=[];
	let beforeDdcColumns=[];
	let x=["x"];
	
	for(let i = salaryList.length-1 ; i>=0; i--){
		x.push(salaryList[i].salNo);
	}
	salaryColumns.push("총급여")
	beforeSalaryColumns.push("총급여")
	allowColumns.push("총수당액")
	beforeAllowColumns.push("총수당액")
	ddcColumns.push("총공제액")
	beforeDdcColumns.push("총공제액")
	
	for(let i = salaryList.length-1 ; i>=0; i--){
		salaryColumns.push(salaryList[i].salTotal)
		beforeSalaryColumns.push(0)
		allowColumns.push(allowList[i].allowAmt)
		beforeAllowColumns.push(0)
		ddcColumns.push(ddcList[i].ddcAmt)
		beforeDdcColumns.push(0)
	}
	
	let makeSalaryChart = c3.generate({
		bindto: "#salaryChart",
		data: {
			x:"x",
	        columns: [
	        	x,salaryColumns,
	        	allowColumns,
	        	ddcColumns
	        ]
	    },
	    axis: {
	        x: {
	          type: "category", // x축 타입을 category로 설정
	        },
	      },
	    size: {
	    	  width: 550,
	    	  height:300
	    	},
	});
	
}

$(".listBody").on("click","tr.datatr",function(event) {
	let docNo = $(this).data("docno");
	location.href = `${pageContext.request.contextPath}/ed/document/documentFormView.do?docNo=\${docNo}`;
});
	
</script>