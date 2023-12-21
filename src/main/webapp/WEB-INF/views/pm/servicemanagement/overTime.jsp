<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>

<style>
* {
	font-family: 'MICEGothic Bold';
}
.btn-group, .btn-group-vertical {
    position: relative;
    display: block;
    vertical-align: middle;
}

.pagination{
	justify-content: center
}

.card{
	padding-top: 20px;
    padding-bottom: 30px;
    margin: 35px 10px 10px 10px;
}

</style>

<h5>초과근무 조회</h5>
<hr color="black">
<div class="container-fluid">
    <div class="card" >
    	<div class="card-body">
        <div class="col-md-12" id="selectDiv">
            <!-- 검색/조회 입력하는 폼 -->
            <form class="form-inline" name="searchForm" id="searchForm" method="post" >
            <input type="hidden" id="pageNo" name="page" />
                <div id="category">
                    <div class="form-group">
                        <label for="trainDate">교육일</label>
                        <input type="date" class="form-control" id="trainDate" name="trainDate"/>
                     
                        <label for="trainName">교육명</label>
                        <input type="text" class="form-control" id="trainName" name="trainName" value="" />

                        <label for="lectorName">강사명</label>
                        <input type="text" class="form-control" id="lectorName" name="lectorName" value="" />
	                </div>
	                <div id="searchBtn">
	                    <button type="button" class="btn btn-primary" id="selectBtn">조회</button>
	                    <input type="reset" class="btn btn-secondary" id="resetBtn" />
		         	</div>
	    	     </div>
	      	</form>
      	<!-- 검색/조회 입력하는 폼 끝 -->
      	<input type="button" class="btn btn-primary" value="교육등록" onClick="location.href='${pageContext.request.contextPath}/pm/training/trainingInsert.do'"/>
       </div>
    </div>
    </div>
</div>
<div class="container-fluid" id="businessTripListArea">
	<form id="saveForm">
		<div class="table">
			<div class="col-md-12">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>사번</th>
							<th>초과근무시작시간</th>
							<th>초과근무종료시간</th>
							<th>총 시간</th>
							<th>초과근무내용</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty overTimeList }">
							<tr>
								<td id="col" colspan="6">해당조건에 일치하는 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty overTimeList }">
							<c:forEach items="${overTimeList }" var="overTime">
								<tr>
									<td>${overTime.atteNo }</td>
									<td>${overTime.empName }</td>
									<td>${overTime.empCd }</td>
									<td>${overTime.overStart.toString().replace('T',' ')  }</td>
									<td>${overTime.overEnd.toString().replace('T',' ')  }</td>
									<td>${overTime.time } 시간 ${overTime.minute } 분</td>
									<td>${overTime.overCont }</td>
									<td><input type="checkbox" /></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	<form:form id="searchForm" modelAttribute="simpleCondition">
		<input type="hidden" name="page" />
	</form:form>
	<!-- 초과근무조회 폼 끝-->
</div>

<script>
	
	//초과근무 조회 실행 함수
	function searchOverTime() {
		let overStartValue = $("#overStartInput").val(); // 입력 필드의 값 가져오기
		let overEndValue = $("#overEndInput").val(); // 입력 필드의 값 가져오기

		let setting = {
			url : `${pageContext.request.contextPath}/pm/servicemanagement/overTimeSearch.do`,
			method : "POST",
			dataType : "html",
			data : {
				overStart : overStartValue,
				overEnd : overEndValue
			},
			success : function(resp) {
				$('#overTimeList').html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		};
		$.ajax(setting);
	}
</script>