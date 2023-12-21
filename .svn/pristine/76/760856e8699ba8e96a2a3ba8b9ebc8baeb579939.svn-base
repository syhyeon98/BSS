<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>

<style>
* {
	font-family: 'MICEGothic Bold';
}

table {
	margin: 0px 25px 25px 25px;
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

/* h4 { */
/*     color: black; */
/*     font-size: 45px; */
/*     text-align: center; */
/* } */

#searchType{
	height: 39px;
}

#overtimeSelect {
	margin-right: 50px;
}

#overEndInput, #overStartInput{
	width: 18%;
}

/* #btn { */
/* 	margin: 15px 25px 15px; */
/* } */

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
	flex-direction: row;
	width: 100%;
}

.attends > input {
	width: 75%;
}

.attends > label {
	margin-right: 10px;
    font-weight: bold;
    font-size: larger;
}

#overTimeSearchForm{
    margin-left: 25px;
}

#attendSearchList{
	display: flex;
	justify-content: column;
	margin-bottom: 10px;
}

#attends {
	margin: 15px 10px 15px 10px;
}

#thisMonth, #thisMonthOver {
	text-align: center;
    font-weight: bold;
    color: mediumblue;
    font-size: large;
}

#thisMonthTitle, #thisMonthOverTitle{
	font-size: larger;
    text-align: center;
}
</style>



<h5>☗ 업무보고 ▸ 복무정보 ▸ 나의 출퇴근</h5>
<hr color="black">

<!-- 안내글 start -->
<div class="card">
	<div class="container-fluid">
		<div class="card-header">
			<span style="font-size: 20px;">■ 당월의 출퇴근 내역과 근무일수, 초과근무시간을 확인할 수 있습니다.</span><br>
			① <span style="color: coral;">[초과근무신청]</span>을 클릭하면 해당 근무일에 초과근무를 신청할 수 있습니다.<br>
			  * 초과근무는 근무시간 09:00 ~ 18:00 이후부터 신청이 가능하고 사전에 신청해야 급여에 반영됩니다.<br>
			② 내용 입력 후 <span style="color: coral;">[신청하기]</span>를 클릭하면 신청한 초과근무 시간이 등록됩니다. <br>
			③ 당월 초과근무일수의 총계는 <span style="color: coral;">[당월 초과근무]</span>에서 확인할 수 있습니다.<br>
			④ 초과근무시간은 기간 설정을 통해 검색하여 내역을 확인할 수 있습니다.<br>
			※ 급여와 관련된 궁금한 사항은 ☎ 042-252-2251(인사부 담당 이준호)로 문의바랍니다.
		</div>
	</div>
</div>
<!-- 안내글 end -->
		
		
<div class="card">
<div class="card-header">

	<!-- 출근부 검색 부분 start  -->
	<div class="container-fluid">
	
		<!-- card-header start  -->
		<div class="card-header">	
		
			<!-- 근무일수, 초과근무시간 총계 start  -->
			<div id="att">
				<div style="display: flex;" >
					<div class="card">
						<div class="card-header2" id="thisMonthTitle">근무일수 (일)</div>
						<input type="text" id="thisMonth" class="form-control" value="">
					</div>
					
					<div class="card">
						<div class="card-header2" id="thisMonthOverTitle">당월 초과근무 (시간)</div>
						<input type="text" id="thisMonthOver" class="form-control" value="${totalOver }">
					</div>
				</div>
			</div>
			<!-- 근무일수, 초과근무시간 총계 end  -->
				
			<!-- 검색 입력하는 부분 start  -->
			<div id="att">		
				<div class="form-group" id="attends">
					<form class="form-inline" id="attendSearchList" >
						<input type="hidden" id="pageNo" name="page" />
							<label for=atteMonth style="margin: 14px; font-size: x-large;">출근 월별 검색</label>
							<input type="month" class="form-control" id="atteMonth" name="atteMonth" value="2023-09"/>
							<button type="button" class="btn btn-info" id="selectBtn" style="margin: 10px;">조회</button>
						<div>
							<button type="button" class="btn btn-outline-secondary" id="attendThisMonth" style="margin-right: 5px;">이번달</button>
							<button type="button" class="btn btn-outline-secondary" id="attendbeforeMonth">지난달</button>
						</div>
					</form>
				</div>
			</div>
			<!-- 검색 입력하는 부분 end  -->
		</div>
		<!-- card-header end  -->
			
		<!-- 출근부 조회되는 폼  -->
<!-- 		<div class="card-body"> -->
		
			<div id="attendList"></div>
			
				<form:form id="searchForm"
					action="${pageContext.request.contextPath }/mypage/myAttendList" modelAttribute="simpleCondition">
						<form:hidden path="searchType" />
						<form:hidden path="searchWord" />
						<input type="hidden" name="page" />
				</form:form>
<!-- 		</div> -->
		<!-- 출근부 조회되는 폼 끝-->
	</div>
	<!-- 출근부 검색 부분 끝  -->


	<!-- 초과근무 조회되는 폼  -->
	<div class="container-fluid">
		<div class="card">
			<div class="card-header" style="height: 97px;">
				<div>
					<form:form modelAttribute="searchOverTime" method="post" action="${pageContext.request.contextPath }/mypage/overTimeList.do">
						<input type="datetime-local" class="form-control" name="overStart" id="overStartInput" value="2023-08-01T12:00" />
						<input type="datetime-local" class="form-control" name="overEnd" id="overEndInput" value="2023-08-31T12:00" />
						<button type="submit" class="btn btn-secondary" id="selectOverTimeBtn">초과근무</button>
					</form:form>
				</div>
			</div>
			<div class="card-body" id = "overtimeSelect">
				<div id="overTimeList"></div>
			</div>
		</div>
	</div>
	<!-- 초과근무 조회되는 폼 끝 -->
		
</div> <!--card-header End  -->
</div> <!--card End  -->
	
<script>
	//초과근무조회 버튼 클릭 이벤트 처리
	$("#selectOverTimeBtn").on("click", function() {
		event.preventDefault();
		searchOverTime(); // 조회 함수 호출
	});
	
	//초과근무 조회 실행 함수
	function searchOverTime() {
		let overStartValue = $("#overStartInput").val(); // 입력 필드의 값 가져오기
		let overEndValue = $("#overEndInput").val(); // 입력 필드의 값 가져오기

		let setting = {
			url : `${pageContext.request.contextPath}/mypage/overTimeList.do`,
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
			url : `${pageContext.request.contextPath }/mypage/myAttendList`,
			method : "",
			dataType : "text",
			data : data,
			success : function(resp) {
				$('#attendList').html(resp);
				
				console.log(resp);
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
		/* 이번달 출퇴근 조회  */
		$("#attendThisMonth").click(function(){
			
			let currentPage = $("#pageNo").val();
			if(currentPage == ""){
				currentPage = 1;
			}
			
			$.ajax({
			    method: "POST",
			    url: `${pageContext.request.contextPath}/mypage/myAttendthisMonth`,
			    dataType: "json",
			    data: { currentPage: currentPage },
			    success: function(response) {

			        var resHtml = "";
			        if (response) {
			            var attendThisMonthList = response.paging.dataList; //당월 출근일
			            $("#thisMonthTitle").text('당월 근무일수 (일)');
			            
			            $("#thisMonth").val(response.paging.totalRecord);
			            console.log("attendThisMonthList", attendThisMonthList);

			            if (attendThisMonthList.length > 0) {
			                resHtml += '<table class="table table-bordered table-hover" style= "text-align: center;">';
			                resHtml += '<thead>';
			                resHtml += '<tr class="table-secondary">';
			                resHtml += '<th>선택<input type="checkbox" onclick="selectAll(this)"/></th>';
			                resHtml += '<th>번호</th>';
			                resHtml += '<th>근무일자</th>';
			                resHtml += '<th>근무시작시간</th>';
			                resHtml += '<th>근무종료시간</th>';
			                resHtml += '</tr>';
			                resHtml += '</thead>';
			                resHtml += '<tbody>';

			                for (var i = 0; i < attendThisMonthList.length; i++) {
			                    var attendThisMonth = attendThisMonthList[i]; // 변수 이름 수정
			                    resHtml += "<tr class='clickable-row'>";
			                    resHtml += "<td><input type='checkbox'/></td>";
			                    resHtml += "<td>" + attendThisMonth.rnum + "</td>";
			                    resHtml += "<td>" + attendThisMonth.atteDate + "</td>";
			                    resHtml += "<td>" + attendThisMonth.atteStime + "</td>";
			                    resHtml += "<td>" + (attendThisMonth.atteEnd ? attendThisMonth.atteEnd : ' ') + "</td>";
			                    resHtml += "</tr>";
			                }
			                resHtml += "<tr><td colspan='8'>" + response.paging.pagingHTML + "</td></tr></tbody>";
			                resHtml += '</table>';
			            } else {
			                resHtml = "<td id='col' colspan='8'>검색과 일치하는 출근내역이 없습니다.</td>";
			            }
			        }

			        // 생성된 HTML을 #attendList <div>에 넣어줌
			        $('#attendList').html(resHtml);
			    },
			    error: function(xhr, status, error) {
			        console.log("Error: " + error);
			    }
	    });
	});
		
		
		/* 전 달 출퇴근 조회  */
		$("#attendbeforeMonth").click(function(){
			
			let currentPage = $("#pageNo").val();
			if(currentPage == ""){
				currentPage = 1;
			}
			
			$.ajax({
			    method: "POST",
			    url: `${pageContext.request.contextPath}/mypage/myAttendbeforeMonth`,
			    dataType: "json",
			    data: { currentPage: currentPage },
			    success: function(response) {
			        console.log("response", response);
			        console.log("response.paging", response.paging);
			
			        var resHtml = "";
			        if (response) {
			            var attendbeforeMonthList = response.paging.dataList; // 전월 출근
			            $("#thisMonthTitle").text('전월 근무일수 (일)');
						$("#thisMonth").val(response.paging.totalRecord);
			            console.log("attendbeforeMonthList", attendbeforeMonthList);

			            if (attendbeforeMonthList.length > 0) {
			                resHtml += '<table class="table table-bordered table-hover" style= "text-align: center;">';
			                resHtml += '<thead>';
			                resHtml += '<tr class="table-secondary">';
			                resHtml += '<th>선택<input type="checkbox" onclick="selectAll(this)"/></th>';
			                resHtml += '<th>번호</th>';
			                resHtml += '<th>근무일자</th>';
			                resHtml += '<th>근무시작시간</th>';
			                resHtml += '<th>근무종료시간</th>';
			                resHtml += '</tr>';
			                resHtml += '</thead>';
			                resHtml += '<tbody>';

			                for (var i = 0; i < attendbeforeMonthList.length; i++) {
			                    var attendbeforeMonth = attendbeforeMonthList[i]; // 변수 이름 수정
			                    resHtml += "<tr class='clickable-row'>";
			                    resHtml += "<td><input type='checkbox'/></td>";
			                    resHtml += "<td>" + attendbeforeMonth.rnum + "</td>";
			                    resHtml += "<td>" + attendbeforeMonth.atteDate + "</td>";
			                    resHtml += "<td>" + attendbeforeMonth.atteStime + "</td>";
			                    resHtml += "<td>" + (attendbeforeMonth.atteEnd ? attendbeforeMonth.atteEnd : ' ') + "</td>";
			                    resHtml += "</tr>";
			                }
			                resHtml += "<tr><td colspan='8'>" + response.paging.pagingHTML + "</td></tr></tbody>";
			                resHtml += '</table>';
			            } else {
			                resHtml = "<td id='col' colspan='8'>검색과 일치하는 출근내역이 없습니다.</td>";
			            }
			        }

			        // 생성된 HTML을 #attendList <div>에 넣어줌
			        $('#attendList').html(resHtml);
			    },
			    error: function(xhr, status, error) {
			        console.log("Error: " + error);
			    }
	    });
	});
		
		$(document).ready(function() {
			/* 출퇴근 검색 조회  */
			$("#selectBtn").click(function(){
				
				let currentPage = $("#pageNo").val();
				if(currentPage == ""){
					currentPage = 1;
				}
				//폼에서 입력 값 가져오기
				var searchData = {
					currentPage : currentPage,
					atteMonth : $("#atteMonth").val(),
				};
				
				$.ajax({
			        url: `${pageContext.request.contextPath}/mypage/attendMonthSearch.do`,
					method: "POST",
			        data: JSON.stringify(searchData),
			        contentType: "application/json;charset=utf-8",
			        dataType: "json",
			        success: function(response) {
			        	
			        	console.log(response);
			        	
			        	var resAttendHtml = "";
				        if (response) {
				            var attendbeforeMonthList = response.paging.dataList; // 전월 출근
							$("#thisMonth").val(response.paging.totalRecord);
				            console.log("attendbeforeMonthList", attendbeforeMonthList);

				            if (attendbeforeMonthList.length > 0) {
				                resAttendHtml += '<table class="table table-bordered table-hover" style= "text-align: center;">';
				                resAttendHtml += '<thead>';
				                resAttendHtml += '<tr class="table-secondary">';
				                resAttendHtml += '<th>선택<input type="checkbox" onclick="selectAll(this)"/></th>';
				                resAttendHtml += '<th>번호</th>';
				                resAttendHtml += '<th>근무일자</th>';
				                resAttendHtml += '<th>근무시작시간</th>';
				                resAttendHtml += '<th>근무종료시간</th>';
				                resAttendHtml += '</tr>';
				                resAttendHtml += '</thead>';
				                resAttendHtml += '<tbody>';

				                for (var i = 0; i < attendbeforeMonthList.length; i++) {
				                    var attendbeforeMonth = attendbeforeMonthList[i]; // 변수 이름 수정
				                    resAttendHtml += "<tr class='clickable-row'>";
				                    resAttendHtml += "<td><input type='checkbox'/></td>";
				                    resAttendHtml += "<td>" + attendbeforeMonth.rnum + "</td>";
				                    resAttendHtml += "<td>" + attendbeforeMonth.atteDate + "</td>";
				                    resAttendHtml += "<td>" + attendbeforeMonth.atteStime + "</td>";
				                    resAttendHtml += "<td>" + (attendbeforeMonth.atteEnd ? attendbeforeMonth.atteEnd : ' ') + "</td>";
				                    resAttendHtml += "</tr>";
				                }
				                resAttendHtml += "<tr><td colspan='8'>" + response.paging.pagingHTML + "</td></tr></tbody>";
				                resAttendHtml += '</table>';
				            } else {
				                resAttendHtml = "<td id='col' colspan='8'>검색과 일치하는 출근내역이 없습니다.</td>";
				            }
				        }

				        // 생성된 HTML을 #attendList <div>에 넣어줌
				        $('#attendList').html(resAttendHtml);
			        	
			        	
			        	
			        }, //성공했으면
			        
			        error: function(xhr, status, error) {
			            console.log("Error: " + error);
			        }
			    });
			});
		});		
		
</script>