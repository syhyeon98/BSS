<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

.card {
	padding-top: 20px;
    padding-bottom: 30px;
}

.form-inline{
    display: flex;
    flex-flow: row wrap;
    align-items: center;
    flex-wrap: wrap;
    justify-content: space-around;
}

#button{
	margin-left: 10px;
	display: flex;
    flex-direction: row;
    justify-content: flex-end;
}

#category{
	display:flex; 
	justify-content: space-evenly;
}

.form-inline label {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 20px;
    margin-left: 20px;
}

#searchBtn {
	float:right;
	margin-left: 10px;
}

#selectDiv{
	display:flex; 
	justify-content: space-evenly;
}

/* .modal-body2 { */
/* 	padding: 0px 20px; */
/* } */

.card{
	padding-top: 20px;
    padding-bottom: 30px;
    margin: 35px 10px 10px 10px;
    
}

label{
	font-weight: bold;
    font-size: larger;
}

table>thead, #center{
	text-align : center;
}

.modal-content {
    width: 120%;
}

#btngroup {
	place-self: flex-end;
    margin-right: 30px;
}
</style>
<h5>☗ 공동서비스 ▸ 기타업무 ▸ 직원교육</h5>
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
                        <label for="trainDate">교육시작일시</label>
                        <input type="date" class="form-control" id="trainDate" name="trainDate"/>
                     
                        <label for="trainName">교육명</label>
                        <input type="text" class="form-control" id="trainName" name="trainName" value="" />

                        <label for="lectorName">강사명</label>
                        <input type="text" class="form-control" id="lectorName" name="lectorName" value="" />
	                </div>
	                <div id="searchBtn">
	                    <button type="button" class="btn btn-info" id="selectBtn">조회</button>
	                    <input type="reset" class="btn btn-outline-secondary" id="resetBtn" />
		         	</div>
	    	     </div>
	      	</form>
      	<!-- 검색/조회 입력하는 폼 끝 -->
       </div>
    </div>
    </div>
</div>

<!-- 직원교육 조회되는 폼 -->
<div class="container-fluid">
	<div class="card">
		<div class="card-body" id="overtimeSelect">
			<div class="table" id="table">
				<div class="col-md-12">
					<table class="table table-bordered table-hover">
						<thead>
							<tr class="table-secondary">
								<th>No</th>
								<th id="trainName">교육명</th>
								<th>교육정원</th>
								<th>신청인원</th>
								<th>교육시작일시</th>
								<th>소요시간</th>
								<th>신청마감일</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="trainList" value="${paging.dataList }" />
							<c:if test="${empty trainList }">
								<tr>
									<td id="col" colspan="6" class="textCenter">조회된 직원교육이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty trainList }">
							
								<c:forEach items="${trainList }" var="trainVO">
									<tr class="clickable-row textCenter">
										<td class="trainNo" style="display: none">${trainVO.trainNo}</td>
										<td>${trainVO.rnum}</td>
										<td id="trainName" class="textLeft">${trainVO.trainName}</td>
										<td>${trainVO.capacity}</td>
										<td>${trainVO.applyCount}</td>
										<td>${trainVO.trainDate.toString().replace('T',' ')}</td>
										<td>${trainVO.trainTime}</td>
										<td>${trainVO.trainPeriod.toString().replace('T',' ')}</td>
									</tr>
								</c:forEach>
								
							</c:if>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="9">${paging.pagingHTML }</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<input type="hidden" name="page" />
			</div>
		</div>
	</div>
</div>


<!-- 직원 교육 상세조회(제목) 눌렀을 때 모달  -->
<div class="modal fade" id="trainingOne" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title textColBlack" id="myModalLabel"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" id="modalTrainingDetail"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="trainingApply">교육신청</button>
				<button type="button" class="btn btn-success" id="trainingApplyDelete">신청취소</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달 끝 -->

<script>
//체크박스 선택되었을 때 
$('input#checkAll').on('change', function () {
    if ($(this).is(':checked')) {
        $('#updateBtn').prop('disabled', false);
    }
});

/* 직원교육 상세조회  */
$(document).ready(function() {
    
    // 클릭 이벤트 위임을 사용하여 동적으로 생성된 요소에 대한 클릭 이벤트 처리
    $("#table").on("click", ".clickable-row", function(event) {
    	
    	// 선택한 행에서 trainNo, trainName 가져오기
        var $row = $(this).closest('tr');
        var trainNo = $row.find(".trainNo").text();
        var trainName = $row.find("#trainName").text();
        
    	// 직원교육 상세정보        
        // AJAX 요청을 통해 모달 내용 로드 - trainingDetail.jsp
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/pm/training/trainingDetailApp",
            dataType: "html",
            data: { trainNo: trainNo },
            success: function(response) {
                $("#trainingOne .modal-title").text(trainName);
                $("#modalTrainingDetail").html(response);
                $("#trainingOne").modal("show"); // 모달 열기
            },
            error: function(error) {
                console.error("직원교육 상세조회 중 오류가 발생했습니다.");
            }
        });
    });
});

//체크박스를 DISABLE 또는 ENABLE 상태로 설정하는 함수
function toggleCheckboxState(checkbox, disabled) {
    checkbox.prop("disabled", disabled);
}

// 체크박스 상태를 다시 설정하는 함수
function setCheckboxStates(trainList) {
    $(".clickable-row").each(function(index) {
        var $row = $(this);
        var trainPeriod = new Date(trainList[index].trainPeriod.replace(' ', 'T')); // 신청마감일
        
        if (trainPeriod < new Date()) {
            toggleCheckboxState($row.find("input[type='checkbox']"), true); // 이전일 경우 체크박스 DISABLE
        } else {
            toggleCheckboxState($row.find("input[type='checkbox']"), false); // 현재 또는 미래일 경우 체크박스 ENABLE
        }
    });
}

$(document).ready(function() {
    // 페이지 로드 시 체크박스 상태 설정
    setCheckboxStates([]);
    
    // 페이징 및 다른 요소의 클릭 이벤트 시 체크박스 상태 다시 설정
    $(document).on("click", ".pagination-link, .clickable-row", function() {
        // AJAX 요청을 통해 해당 페이지의 교육 데이터와 마감일을 가져옴
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/training/trainingSearchList",
            dataType: "json",
            data: { page: searchForm.page.value },
            success: function(response) {
                var trainList = response.trainList;
                // 체크박스 상태 다시 설정
                setCheckboxStates(trainList);
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
            }
        });
    });
});

/* 삭제 처리 */
$('#deleteBtn').on('click', function(event) {
	event.stopPropagation();
	let $checkTrainNo = $("input:checked").parent('td').siblings('.trainNo');
	let trainNo = [];
	for (let i = 0; i < $checkTrainNo.length; i++) {
		trainNo.push($checkTrainNo[i].innerText);
	}
	
	/* 요청을 보낼 때 */
	let setting = {
		url : "trainingDelete.do",
		method : "post",
		dataType : "text",
		data : {
			trainNo : trainNo
		},
		
		/* 요청이 성공했을 때 */
		success : function(resp) {
			console.log("resp", resp);
			if (resp == "success") {
				$("input:checked").parents('tr').remove();
                Swal.fire({
                    title: '삭제가 완료되었습니다.',
                    icon: 'success',
                    showConfirmButton: false, // 확인 버튼을 표시하지 않음
                    timer: 1000, // 알림창을 1.5초 동안 표시
                 }).then(function() {
					window.location.href = "${pageContext.request.contextPath}/pm/training/trainingList";
                 });
			} else { //응답이 success가 아닌경우
                Swal.fire({
                    title: '삭제를 실패하였습니다.',
                    icon: 'warning',
                    showConfirmButton: false, // 확인 버튼을 표시하지 않음
                    timer: 1000, // 알림창을 1.5초 동안 표시
                 });
			}
		},
		/* 요청이 실패했을 때 */
		error : function(jqXHR, status, error) {
			console.log(jqXHR)
			console.log(status)
			console.log(error)
		}
	}
	$.ajax(setting)
});

/* 페이징 시에 호출되는 함수 */
function fn_paging(page) {
    searchForm.page.value = page;
    console.log(page);
    // search 함수를 호출하여 AJAX 요청 수행
    search(page);

    function search(page) {
        let setting = {
            url: "${pageContext.request.contextPath}/pm/training/trainingSearchList",
            method: "get", 
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: { page: page },
            success: function(response) {
                console.log(response);

                var trainList = response.trainList;
                var paging = response.paging;

                var resultsHtml = "";
                
                resultsHtml += "<div class='col-md-12'>" +
                    "<table class='table table-bordered table-hover'>" +
                    "<thead>" +
                    "<tr class='table-secondary'>" +
                    "<th>No</th>" +
                    "<th id='trainName'>교육명</th>" +
                    "<th>교육정원</th>" +
                    "<th>신청인원</th>" +
                    "<th>교육일</th>" +
                    "<th>신청마감일</th>" +
                    "</tr>" +
                    "</thead><tbody>";
				if(trainList && trainList.length > 0){
	                for (var i = 0; i < trainList.length; i++) {
	                    var train = trainList[i];
	                    resultsHtml += "<tr class='clickable-row textCenter'>" +
	                    "<td class='trainNo' style='display: none'>" + train.trainNo + "</td>" +
	                    "<td>" + train.rnum + "</td>" +
	                    "<td id='trainName'  class='clickTrainName textLeft'>" + train.trainName + "</td>" +
	                    "<td>" + train.capacity + "</td>" +
	                    "<td>" + train.applyCount + "</td>" +
	                    "<td>" + train.trainDate + "</td>" +
	                    "<td>" + train.trainPeriod + "</td>" +
	                    "</tr>";
	                }
	                resultsHtml += "<tr><td colspan='9'>" + response.paging.pagingHTML + "</td></tr></tbody>";
	                $("#table").html(resultsHtml);
	
	                // 체크박스 상태 다시 설정
	                setCheckboxStates(trainList);
	                
				}else{
					resultsHtml = "<tr><td colspan='6'>조회된 직원교육이 없습니다.</td></tr>";
				}
            },
            error: function(xhr, status, error) {
                console.error("Error:", error); 
            }
        };
        $.ajax(setting); // AJAX 요청 실행
    }
}

</script>