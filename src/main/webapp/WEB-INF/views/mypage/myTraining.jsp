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

<h5>☗ 업무보고 ▸ 교육내역 ▸ 직원교육</h5>
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

<!-- 신청한 교육 조회되는 폼 -->
<div class="container-fluid">
	<div class="card">
		<div id="btngroup">
<%-- 			<input type="button" class="btn btn-primary" value="교육등록" onClick="location.href='${pageContext.request.contextPath}/pm/training/trainingInsert.do'"/> --%>
			<button class="btn btn-primary" type="button" id="myPaperBtn">이수증 출력</button>
			<button class="btn btn-secondary" type="button" id="myDeleteBtn">신청취소</button>
		</div>
		<div class="card-body" id="overtimeSelect">
			<div class="table" id="table">
				<div class="col-md-12">
		
			<!-- 이수증 출력 form -->
			<form action="${pageContext.request.contextPath}/mypage/trainingPaper" method="post" id="trainingPaper">
				<input type="hidden" name="trainNo">
				<input type="hidden" name="empCd">
			</form>			
				
					<table class="table table-bordered table-hover">
						<thead>
							<tr class="table-secondary">
								<th>No</th>
								<th id="trainName">교육명</th>
								<th>강사명</th>
								<th>교육일</th>
								<th>소요시간</th>
								<th>교육장소</th>
<!-- 								<th>신청마감일</th> -->
								<th>신청일자</th>
								<th>진행상태</th>
								<th>선택</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="trainAppList" value="${paging.dataList }" />
							<c:if test="${empty trainAppList }">
								<tr class="textCenter">
									<td id="col" colspan="9">조회된 직원교육이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty trainAppList }">
								<c:forEach items="${trainAppList }" var="mytrain">
<!-- 									<tr class="clickable-row textCenter"> -->
									<tr class="clickable-row textCenter" data-trainno="${mytrain.trainNo }" data-empcd="${mytrain.empCd}">
										<td style="display: none">${mytrain.trainNo}</td>
										<td style="display: none">${mytrain.empCd}</td>
										<td>${mytrain.rnum}</td>
										<td class="textLeft">${mytrain.trainName}</td>
										<td>${mytrain.lectorName}</td>
										<td>${mytrain.trainDate.toString().replace('T',' ')}</td>
										<td>${mytrain.trainTime}</td>
										<td>${mytrain.trainPlace}</td>
<%-- 										<td>${mytrain.trainPeriod.toString().replace('T',' ')}</td> --%>
										<td>${mytrain.taDate}</td>
										<td>${mytrain.appCheck}</td>
										<c:choose>
											<c:when test="${mytrain.appCheck == '신청'}">
												<td><input type="checkbox" class="clickApp">
												</td>
											</c:when>
											<c:when test="${mytrain.appCheck == '완료'}">
												<td><input type="checkbox" class="clickCom"></td>
											 </c:when>
										</c:choose>
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
<!-- 신청한 교육 조회되는 폼 끝-->


<script>
// 수료증 출력 해보기!!! 
$(document).ready(function() {
	$('#myPaperBtn').click(function(e) {
	    e.stopPropagation();
	    
	    var selectedCheckboxes = $('input[type="checkbox"]:checked');
		if (selectedCheckboxes.length === 0) { // 선택 교육 없다면 return
		     Swal.fire({
		         title: '교육을 선택해주세요.',
		         icon: 'warning',
		         showConfirmButton: false, // 확인 버튼을 표시하지 않음
		         timer: 1000, // 알림창 표시시간
		      })
		     return; 
		 }
	
	    
//         // 버튼이 클릭된 행에서 데이터 가져오기
// // 	    let salNo = $(this).data("trainno");  
// // 	    let empCd = $(this).data("empcd"); 
//         let trainNo = $(this).closest('tr').data("trainno");  
//         let empCd = $(this).closest('tr').data("empcd");  
//         console.log("trainNo, empCd - ", trainNo, empCd)
// 		// 값 설정
// 	    $('input[name=trainNo]').val(trainNo);
// 	    $('input[name=empCd]').val(empCd);
// 	    $('#salaryDetailView').submit(); 
	    var selectedRow = selectedCheckboxes.first().closest('tr');
        var trainNo = selectedRow.data("trainno");  
        var empCd = selectedRow.data("empcd");

        $('input[name=trainNo]').val(trainNo);
        $('input[name=empCd]').val(empCd);
	    
	    
        // 폼 제출
        $('#trainingPaper').submit();
		
	});
});


// $(document).ready(function() {
//     $('#myPaperBtn').click(function() {
//     	console.log("여기는 오나?")
    	
//         var selectedCheckboxes = $('input[type="checkbox"]:checked');
        
//         if (selectedCheckboxes.length === 0) {
//             Swal.fire({
//                 title: '교육을 선택해주세요.',
//                 icon: 'warning',
//                 showConfirmButton: false, // 확인 버튼을 표시하지 않음
//                 timer: 1000, // 알림창 표시시간
//              })
//             return;
//         }
//         if (selectedCheckboxes.length > 1) {
//             Swal.fire({
//                 title: '수료증 출력은 1개씩 선택이 가능합니다.',
//                 icon: 'info',
//                 showConfirmButton: false, // 확인 버튼을 표시하지 않음
//                 timer: 1000, // 알림창 표시시간
//              })
//             return;
//         }

//         var selectedRow = selectedCheckboxes.first().closest('tr');
//         // 선택한 인풋박스가 .clickApp(신청상태)인 것 변수에 저장
//         var isClickApp = selectedRow.find('input[type="checkbox"]').hasClass('clickApp');
    	
//         if (!isClickApp) { // 교육 이수 완료상태이면
//         	console.log('버튼이 클릭되었습니다.')
//     		var empCd = selectedRow.find('td:eq(1)').text();
//             var selectedTrainNo = selectedRow.find('td:first').text();
//         	console.log('selectedTrainNo : ', selectedTrainNo)
//         	console.log('empCd : ', empCd)
//             $.ajax({
//                 type: 'POST',
//                 url: '${pageContext.request.contextPath}/papers/trainingPaper',
//                 data: {
//                     trainNo: selectedTrainNo,
//                     empCd: empCd
//                 },
//                 success: function(response) {
// // 					data : data
//                 	console.log('수료증 성공, 응답 데이터 :', response);
//                 },
//                 error: function(error) {
//                     Swal.fire({
//                         title: '수료증 출력 화면으로 이동을 실패하였습니다.',
//                         icon: 'warning',
//                         showConfirmButton: false, // 확인 버튼을 표시하지 않음
//                         timer: 1000, // 알림창 표시시간
//                      })
//                     selectedCheckboxes.prop("checked", false);
//                 }
//             });
//         } else {
//         	// .clickApp가 아니면 완료된 교육이므로 alert
//             Swal.fire({
//                 title: '아직 수료되지 않은 교육입니다.\n교육이 끝난 후 신청 바랍니다.',
//                 icon: 'info',
//                 showConfirmButton: false, // 확인 버튼을 표시하지 않음
//                 timer: 1500, // 알림창 표시시간
//              })
//          	// 체크박스 초기화
//             selectedCheckboxes.prop("checked", false);
//         }
//     });
// });


// 교육 취소
$(document).ready(function() {
    $('#myDeleteBtn').click(function() {
        var selectedCheckboxes = $('input[type="checkbox"]:checked');
        
        if (selectedCheckboxes.length === 0) {
            Swal.fire({
                title: '교육을 선택해주세요.',
                icon: 'warning',
                showConfirmButton: false, // 확인 버튼을 표시하지 않음
                timer: 1000, // 알림창 표시시간
             })
            return;
        }

        var selectedRow = selectedCheckboxes.first().closest('tr');
        // 선택한 인풋박스가 .clickApp(신청상태)인 것 변수에 저장
        var isClickApp = selectedRow.find('input[type="checkbox"]').hasClass('clickApp');
        var empCd = $(this).data("empCd");

        if (isClickApp) {
            var selectedTrainNo = selectedRow.find('td:first').text();

            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/pm/training/trainingApplyDelete.do',
                data: {
                    trainNo: selectedTrainNo,
                    empCd: empCd
                },
                success: function(response) {
                    Swal.fire({
                        title: '교육 취소가 완료되었습니다.',
                        icon: 'success',
                        showConfirmButton: false, // 확인 버튼을 표시하지 않음
                        timer: 1000, // 알림창 표시시간
                     }).then(function() {
                         location.reload();
                     });
                },
                error: function(error) {
                    Swal.fire({
                        title: '신청 취소에 실패하였습니다.',
                        icon: 'warning',
                        showConfirmButton: false, // 확인 버튼을 표시하지 않음
                        timer: 1000, // 알림창 표시시간
                     })
                    selectedCheckboxes.prop("checked", false);
                }
            });
        } else {
        	// .clickApp가 아니면 완료된 교육이므로 alert
            Swal.fire({
                title: '이미 완료된 교육입니다.',
                icon: 'warning',
                showConfirmButton: false, // 확인 버튼을 표시하지 않음
                timer: 1000, // 알림창 표시시간
             })
         	// 체크박스 초기화
            selectedCheckboxes.prop("checked", false);
        }
    });
});


// 페이징 시에 호출되는 함수
function fn_paging(page) {
    searchForm.page.value = page;
    console.log(page);
    // search 함수를 호출하여 AJAX 요청 수행
    search(page);
    

    function search(page) {
	    let empCd = ${paging.empCd};
// 	    let empCd = ${empCd};
	    console.log(empCd);
	    
        let setting = {
            url: "${pageContext.request.contextPath}/mypage/mytrainingPaging",
            method: "get", 
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: {page: page , empCd : empCd
            },
            success: function(response) {
                console.log(response);

                var trainAppList = response.trainAppList;
                var paging = response.paging;

                var resultsHtml = "";
                
                resultsHtml += 
                	`
    				<div class="col-md-12">
					<table class="table table-bordered table-hover">
						<thead>
							<tr class="table-secondary">
								<th>No</th>
								<th>교육명</th>
								<th>강사명</th>
								<th>교육일</th>
								<th>소요시간</th>
								<th>교육장소</th>
// 								<th>신청마감일</th>
								<th>신청일자</th>
								<th>진행상태</th>
							</tr>
						</thead>
						<tbody>
                	`;

				if(trainAppList && trainAppList.length > 0){
	                for (var i = 0; i < trainAppList.length; i++) {
	                    var mytrain = trainAppList[i];
	                    
	                    resultsHtml += 
	                    "<tr class='textCenter'>" +
	                    "<input type='hidden' name='empCd' value= "+ mytrain.empCd + "/>" +
	                    "<td style='display: none'>" + mytrain.trainNo + "</td>" +
	                    "<td>" + mytrain.rnum + "</td>" +
	                    "<td class='textLeft'>" + mytrain.trainName + "</td>" +
	                    "<td>" + mytrain.lectorName + "</td>" +
	                    "<td>" + mytrain.trainDate.toString().replace('T',' ') + "</td>" +
	                    "<td>" + mytrain.trainPlace + "</td>" +
	                    "<td>" + mytrain.trainTime + "</td>" +
// 	                    "<td>" + mytrain.trainPeriod.toString().replace('T',' ') + "</td>" +
	                    "<td>" + mytrain.taDate + "</td>" +
	                    "<td>" + mytrain.appCheck + "</td>"
// 	                    +
// 	                    "<td class='exclude-click'><input type='checkbox' id='checkAll' class='exclude-click'></td>" +
// 	                    "</tr>"
	                    ;
	                }
	                resultsHtml += "<tr><td colspan='8'>" + response.paging.pagingHTML + "</td></tr></tbody>";
	
	                $("#table").html(resultsHtml);
	
	                // 체크박스 상태 다시 설정
// 	                setCheckboxStates(trainAppList);
	                
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