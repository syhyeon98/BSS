<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>

<style>
* {
	font-family: 'MICEGothic Bold';
}
#atteStimeClock, #atteEndColck{
	text-align : center;

}
.btn-group, .btn-group-vertical {
	position: relative;
	display: block;
	vertical-align: middle;
}

.pagination {
	justify-content: center
}

#button {
	display: flex;
	justify-content: flex-end;
}

#searchForm {
	display: block;
}

.row {
    display: flex;
    margin-right: -0.75rem;
    margin-left: -5.75px;
    flex-wrap: nowrap;
}

.attendInsert{
	display: flex;
    justify-content: space-evenly;
}
.form-control {
	width: 30%;
    display: inline-block;
}

/* 출력되는 테이블 스타일 */
#attendList{
	display: flex;
    flex-wrap: wrap;
    
}

/* 출근부 등록 모달 */
.modal-header > h5 {
    text-align: center;
    margin-top: 10px;
}

#modal > .form-control {
    width: 100%;
}

h4 {
    color: black;
    font-size: 45px;
    text-align: center;
}

#searchType{
	height: 39px;
}

.card {
    margin: 0px 22px 22px 22px;
}

#overtimeSelect {
	margin-right: 50px;
}


#overEndInput, #overStartInput{
	width: 18%;
}

table {
	margin: 0px 25px 25px 25px;
}

#btn {
	margin: 15px 25px 15px;
}

#attendStimeForm {
	margin-right: 50px;
}

.progress{
    width: 50%;
    height: 35px;
    margin-right: 10px;
    margin-left: 10px;
}

.attends{
	display:flex;
}

.attends > input {
	width: 75%;
}

.attends > label {
	margin-right: 10px;
    font-weight: bold;
    font-size: larger;
}

#searchUI {
	margin-left: 250px;
}

#overTimeSearchForm{
    margin-left: 25px;
}

#attendSearchList{
	display: flex;
	justify-content: space-evenly;
	margin-bottom: 10px;
}

#att {
	display: flex;
    margin: 15px 0px 40px 0px;
    justify-content: center;
}

#attends {
	margin: 0px 10px 0px 10px;
}
</style>

<h5>☗ 인사관리 ▸ 복무관리 ▸ 근태현황</h5>
<hr color="black">

<!-- 출근부 검색 부분 start  -->
<div class="container-fluid">
	<div class="card">
		<div class="card-header">
				<!-- 검색 입력하는 부분 start  -->
				<div class="form-group" id="attends">
					<div>
						<form class="form-inline" id="attendSearchList">
							<input type="hidden" id="pageNo" name="page" />
							<div class="attends">
								<label for=atteDate>출근일</label> <input type="date" class="form-control" id="atteDate" name="atteDate" />
							</div>
							<div class="attends">
								<label for="empName">이름</label> <input type="text" class="form-control" id="empName" name="empName" />
							</div>
							<div class="attends">
								<label for="depName">부서</label> <input type="text" class="form-control" id="depName" name="depName" />
							</div>
							<button type="button" class="btn btn-secondary" id="selectBtn">조회</button>
							<input type="reset" class="btn btn-secondary" id="resetBtn" />
						</form>
					</div>
				</div>
				<!-- 검색 입력하는 부분 end  -->
				
			
		</div>
		<!-- card-header end  -->
		
			<!-- 출근부 조회되는 폼  -->
			<div class="card-body">
				<div id="attendList"></div>
				<form:form id="searchForm"
					action="${pageContext.request.contextPath }/pm/servicemanagement/attendList" modelAttribute="simpleCondition">
					<form:hidden path="searchType" />
					<form:hidden path="searchWord" />
					<input type="hidden" name="page" />
				</form:form>
			</div>
			<!-- 출근부 조회되는 폼 끝-->
		
	</div>
</div>
<!-- 출근부 검색 부분 끝  -->


	<!-- 초과근무 검색이 조회되는 폼  -->
	<div class="container-fluid">
		<div class="card">
			<div class="card-header" style="height: 100px; padding-top: 30px;">
				<div>
					<form:form modelAttribute="overTimeSearchForm" method="post" action="${pageContext.request.contextPath }/pm/servicemanagement/overTimeSearch.do">
						<input type="datetime-local" class="form-control" name="overStart" id="overStartInput" value="2023-08-01T12:00" />
						<input type="datetime-local" class="form-control" name="overEnd" id="overEndInput" value="2023-09-01T12:00" />
						<button type="submit" class="btn btn-secondary" id="selectOverTimeBtn">초과근무조회</button>
					</form:form>
				</div>
			</div>
			<div class="card-body" id = "overtimeSelect">
				<div id="overTimeList"></div>
			</div>
		</div>
	</div>
	<!-- 초과근무 검색이 조회되는 폼 -->
	
	
	<!-- 출근시간 등록 모달  -->
	<div class="modal fade" id="attendInsertModal" data-bs-backdrop="static" tabindex="-1">
		<div class="modal-dialog modal-fullscreen-sm-down">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">출근시간 등록</h5>
				</div>
				<div class="modal-body">
				<h2 id="atteStimeClock"></h2>
					<form:form id="attendStimeForm" modelAttribute="attend" method="post" action="${pageContext.request.contextPath }/pm/servicemanagement/attendInsert.do">
						<input type="hidden" name="atteNo" value="${attend.atteNo }" />
						<table class="table table-bordered table-hover">
							<tr>
								<th>이름</th>
								<td id="modal">
								<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empName}</td>
							</tr>
							<tr>
								<th>사번</th>
								<td id="modal">
								<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empCd}</td>
							</tr>
							<tr>
								<td id="modalBtn" colspan="2">
									<button type="submit" class="btn btn-success" id="attendStimeBtn" value="출근">출근</button>
								</td>
							</tr>
						</table>
					</form:form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 출근시간 등록 모달 끝  -->

	<!-- 퇴근시간 등록 모달  -->
	<div class="modal fade" id="attendUpdateModal" data-bs-backdrop="static" tabindex="-1">
		<div class="modal-dialog modal-fullscreen-sm-down">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">퇴근시간 등록</h5>
				</div>
				<div class="modal-body">
				<h2 id="atteEndColck"></h2>
					<form:form id="attendEndForm" modelAttribute="attend" method="post" action="${pageContext.request.contextPath }/pm/servicemanagement/attendEnd.do">
						<input type="hidden" name="atteNo" value="${haveAtteEnd.atteNo }" />
						<input type="hidden" name="empCd" value="${authEmployee.empCd}" />
						<table class="table table-bordered table-hover">
							<tr>
								<th>이름</th>
								<td id="modal">
								<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empName}</td>
							</tr>
							<tr>
								<th>사번</th>
								<td id="modal">
								<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empCd}</td>
							</tr>
							<tr>
								<td id="modalBtn" colspan="2">
									<button type="submit" class="btn btn-success" id="attendEndBtn"  value="퇴근">퇴근</button>
								</td>
							</tr>
						</table>
					</form:form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 퇴근시간 등록 모달 끝  -->
<script>

	//초과근무조회 버튼 클릭 이벤트 처리
	$("#selectOverTimeBtn").on("click", function() {
		event.preventDefault();
		searchOverTime(); // 조회 함수 호출
	});
	
	/* 초과근무 날짜검색 실행 함수 */
	function searchOverTime() {
		let overStartValue = $("#overStartInput").val();  //입력받은 초과근무시작시간
		let overEndValue = $("#overEndInput").val();      //입력받은 초과근무종료시간

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
	

	/* 전체조회 페이징  */
	function fn_paging(page) {
		searchForm.page.value = page;
		$(searchForm).submit();
	}

	/* 직원조회 실행함수 */
	$(function() {
		selectAttendList();
	});

	/* 전체 조회  */
	let data = {};
	function selectAttendList() {
		let setting = {
			url : `${pageContext.request.contextPath }/pm/servicemanagement/attendList`,
			method : "",
			dataType : "text",
			data : data,
			success : function(resp) {
				$('#attendList').html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	}

	/* 검색 조회 값의 페이징 */
	function fn_paging(page) {
		searchForm.page.value = page;
		data.page = page;
		console.log("page", page);
		
		selectAttendList();
	
	};
		/* 연가 검색 조회  */
		$("#selectBtn").click(function(){
			
			let currentPage = $("#pageNo").val();
			if(currentPage == ""){
				currentPage = 1;
			}
			//폼에서 입력 값 가져오기
			var searchData = {
				currentPage : currentPage, 
				atteDate : $("#atteDate").val(),
				empName : $("#empName").val(),
				depName : $("#depName").val(),
			};
			
			console.log("searchData", searchData);
			
		$.ajax({
			method: "POST",
	        url: `${pageContext.request.contextPath}/pm/servicemanagement/attendSearchList`,
	        data: JSON.stringify(searchData),
	        contentType: "application/json; charset=utf-8",
	        dataType: "json",
	        success: function(response) {
	        	
	        	console.log("response", response);
	        	
	        	var resultsHtml = "";
	            if (response.paging) {
	                var attendList = response.paging.dataList;
	                
	                console.log("attendList", attendList);
	                
	                if (attendList && attendList.length > 0) {
	                	var resultsHtml = '<table class="table table-bordered table-hover">';
	                    resultsHtml += '<thead>';
	                    resultsHtml += '<tr class="table-secondary">';
	                    resultsHtml += '<th>선택&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" onclick="selectAll(this)"/></th>';
	                    resultsHtml += '<th>번호</th>';
	                    resultsHtml += '<th>이름</th>';
	                    resultsHtml += '<th>사번</th>';
	                    resultsHtml += '<th>부서</th>';
	                    resultsHtml += '<th>근무일자</th>';
	                    resultsHtml += '<th>근무시작시간</th>';
	                    resultsHtml += '<th>근무종료시간</th>';
	                    resultsHtml += '</tr>';
	                    resultsHtml += '</thead>';
	                    resultsHtml += '<tbody>';
	                    
                        for (var i = 0; i < attendList.length; i++) {
                            var attendVO = attendList[i];
                            resultsHtml += "<tr class='clickable-row'>";
                            resultsHtml += "<td><input type='checkbox'/></td>";
                            resultsHtml += "<td class='atteNo'>" + attendVO.atteNo + "</td>";
                            resultsHtml += "<td>" + attendVO.empName + "</td>";
                            resultsHtml += "<td>" + attendVO.empCd + "</td>";
                            resultsHtml += "<td>" + attendVO.depName + "</td>";
                            resultsHtml += "<td>" + attendVO.atteDate + "</td>";
                            resultsHtml += "<td>" + attendVO.atteStime + "</td>";
                            resultsHtml += "<td>" + (attendVO.atteEnd ? attendVO.atteEnd : ' ') + "</td>";
                            resultsHtml += "</tr>";
                        }
                        resultsHtml += "<tr><td colspan='11'>" + response.paging.pagingHTML + "</td></tr></tbody>";
                        resultsHtml += '</table>';
                    } else {
                        resultsHtml = "<td id='col' colspan='11'>검색과 일치하는 출근내역이 없습니다.</td>";
                    }
                }

                // 생성된 HTML을 #attendList <div>에 넣어줌
                $('#attendList').html(resultsHtml);
	        
	        }, //성공했으면
	        
	        error: function(xhr, status, error) {
	            console.log("Error: " + error);
	        }
	    });
	});

</script>