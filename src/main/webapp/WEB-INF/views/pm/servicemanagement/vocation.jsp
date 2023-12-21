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

#table{
	padding-top: 30px;
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
}

#selectBtn {
	margin-left: 10px;
}

#selectDiv{
	display:flex; 
	justify-content: space-evenly;
}

.modal-body2 {
	padding: 0px 20px;
}

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

#nothing {
	text-align : center;
}
</style>

<h5>☗ 인사관리 ▸ 복무관리 ▸ 연가현황</h5>
<hr color="black">
<div class="container-fluid">
    <div class="card" >
    	<div class="card-header">
    	<div class="card-body">
        <div class="col-md-12" id="selectDiv">
            <!-- 검색/조회 입력하는 폼 -->
            <form class="form-inline" name="searchForm" id="searchForm" method="post" >
            <input type="hidden" id="pageNo" name="page" />
                <div id="category">
                    <div class="form-group">
                        <label for="empCd">사번</label>
                        <input type="number" class="form-control" id="empCd" name="empCd" placeholder="ex)9901001"/>
                     
                        <label for="empName">이름</label>
                        <input type="text" class="form-control" id="empName" name="empName" placeholder="ex)홍길동"/>
                     
                        <label for="period">기간</label>
                        <input type="date" class="form-control" id="vocationSday" name="vocationSday" />
                        <input type="date" class="form-control" id="vocationEday" name="vocationEday" />
	                </div>
	                <div id="searchBtn">
	                    <button type="button" class="btn btn-primary" id="selectBtn">조회</button>
	                    <input type="reset" class="btn btn-secondary" id="resetBtn" />
		         	</div>
	    	     </div>
	      	</form>
      	<!-- 검색/조회 입력하는 폼 끝 -->
      	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#vocationInsert" >연가등록</button>
       </div>
    </div>
    </div>
    </div>
</div>

<!-- 연가조회 폼  -->
<div class="container-fluid">

		<div class="table">
			<div class="col-md-12">
				<table class="table table-bordered table-hover">
					<thead>
						<tr class="table-secondary">
							<th>구분</th>
							<th>이름</th>
							<th>사번</th>
							<th>부서</th>
							<th>연가시작일</th>
							<th>연가종료일</th>
							<th>신청일</th>
						</tr>
					</thead>
					<tbody id="insert">
					<c:set var="vocation" value="${paging.dataList }"/>
						 <c:if test="${not empty vocation }">
							<c:forEach items="${vocation }" var="vocation">
								<tr class="clickable-row">
									<td>${vocation.vocationCode }</td>
									<td id="center">${vocation.empName }</td>
									<td id="center">${vocation.empCd }</td>
									<td id="center">${vocation.depName }</td>
									<td>${vocation.vocationSday }</td>
									<td>${vocation.vocationEday }</td>
									<td>${vocation.vocationAddDate }</td>
								</tr>
							</c:forEach>
						</c:if>
							<tr>
								<td colspan="9">${paging.pagingHTML }</td>
							</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div>
			<input type="hidden" name="page" />
		</div>
</div>

<!-- 연가 등록 모달  -->
	<div class="modal fade" id="vocationInsert" data-bs-backdrop="static" tabindex="-1">
		<div class="modal-dialog modal-fullscreen-xl-down">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">연가 등록</h5>
				</div>
				<div class="modal-body">
					<form:form id="vocationInsertForm" modelAttribute="vocation" >
						<table class="table table-bordered table-hover">
							<tr>
								<th>사번</th>
								<td>
									<security:authorize access="isAuthenticated()">
									<security:authentication property="principal.realUser" var="authEmployee" />
									<input type="hidden" name="empCd" value="${authEmployee.empCd }" />${authEmployee.empCd }</security:authorize>
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>
									<security:authorize access="isAuthenticated()">
									<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empName }</security:authorize>
								</td>
							</tr>
							<tr>
								<th>연가시작일</th>
								<td><input type="date" class="form-control" name="vocationSday"/></td>
							</tr>
							<tr>
								<th>연가종료일</th>
								<td><input type="date" class="form-control" name="vocationEday"/></td>
							</tr>
							<tr>
								<td colspan="2"><button type="submit" class="btn btn-success" value="등록">등록</button></td>
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
<!-- 연가 등록 모달 끝  -->

<!-- 직원 연가 상세조회(tr 한 줄) 눌렀을 때 모달  -->
<div class="modal fade" id="vocationOne" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body2"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달 끝 -->

<script>


/* 전체페이지 조회  */
function fn_paging(page){
	searchForm.page.value= page;
	//searchForm.submit();
	$("#selectBtn").trigger('click');
}


$(document).ready(function() {
	/* 연가 검색 조회  */
	$("#selectBtn").click(function(){
		
		let currentPage = $("#pageNo").val();
		if(currentPage == ""){
			currentPage = 1;
		}
		//폼에서 입력 값 가져오기
		var searchData = {
			currentPage : currentPage,
			empCd : $("#empCd").val(),
			empName : $("#empName").val(),
			vocationSday : $("#vocationSday").val(),
			vocationEday : $("#vocationEday").val()
		};
		
		$.ajax({
	        url: `${pageContext.request.contextPath}/pm/servicemanagement/vocation`,
			method: "POST",
	        data: JSON.stringify(searchData),
	        contentType: "application/json;charset=utf-8",
	        dataType: "json",
	        success: function(response) {
	        	
	        	console.log(response);
	        	
	        	var resultsHtml = "";
	            if (response.paging) {
	                var vocationList = response.paging.dataList;
	                
	                console.log(vocationList);
	                
	                if (vocationList && vocationList.length > 0) {
	                    for (var i = 0; i < vocationList.length; i++) {
	                        resultsHtml += "<tr class='clickable-row'>";
	                        var vocation = vocationList[i];
	                        resultsHtml += "<td>" + vocation.vocationCode + "</td>";
	                        resultsHtml += "<td>" + vocation.empName + "</td>";
	                        resultsHtml += "<td>" + vocation.empCd + "</td>";
	                        resultsHtml += "<td>" + vocation.depName + "</td>";
	                        resultsHtml += "<td>" + vocation.vocationSday + "</td>";
	                        resultsHtml += "<td>" + vocation.vocationEday + "</td>";
	                        resultsHtml += "<td>" + vocation.vocationAddDate + "</td>";
	                        resultsHtml += "</tr>";
	                    }
	                    
	                    resultsHtml += "<tr><td colspan='7'>" + response.paging.pagingHTML + "</td></tr>";
	                
	                } else {
	                    resultsHtml = "<tr><td colspan='7' id='nothing'>조건에 맞는 게시글 없음</td></tr>";
	                }
	            }
	            $("#insert").html(resultsHtml);
	        
	            
	            $(document).on("click", ".clickable-row", function() {
	                var empCd = $(this).find("td:eq(2)").text();
	                $.ajax({
	                    type: "get",
	                    url: `${pageContext.request.contextPath}/pm/servicemanagement/vocationOne.do`,
	                    dataType: "html",
	                    data: { empCd: empCd },
	                    success: function(response) {
	                        var empName = $(response).find("td#empName").first().text();
	                        $("#vocationOne .modal-title").text(empName + "님의 연가 상세조회");
	                        $(".modal-body2").html(response);
	                        $("#vocationOne").modal("show");
	                    },
	                    error: function(error) {
	                        console.error("연가 상세조회 중 오류가 발생했습니다.");
	                    }
	                });
	            });
	            
	        }, //성공했으면
	        
	        error: function(xhr, status, error) {
	            console.log("Error: " + error);
	        }
	    });
	});
});

/* 연가 상세조회  */
$(document).ready(function() {
    $(".clickable-row").click(function() { //td 하나를 클릭하면 
    	var empCd = $(this).find("td:eq(2)").text(); //td의 empCd를 가져가서 조회하고 
    	$.ajax({
            type: "get",
            url: `${pageContext.request.contextPath}/pm/servicemanagement/vocationOne.do`, // empCd를 URL 파라미터로 전달해서 조회
            dataType:"html",
            data: {empCd : empCd},
            success: function(response) {
            	//서버에서 받은 empName 값 표시
            	var empName = $(response).find("td#empName").first().text();
            	$("#vocationOne .modal-title").text(empName+ "님의 연가 상세조회");
            	
                // 서버에서 받은 데이터를 모달에 표시
                $(".modal-body2").html(response);
                
                // 모달을 보여줘
                $("#vocationOne").modal("show");
            },
            error: function(error) {
                console.error("연가 상세조회 중 오류가 발생했습니다.");
            }
        });
    });
});



$(document).ready(function() {
    // 연가 등록 폼 제출 이벤트
    $("#vocationInsertForm").submit(function(event) {
        event.preventDefault(); // 기본 폼 제출 동작 중단

        var formData = $(this).serialize(); // 폼 데이터 직렬화

        $.ajax({
            type: "POST",
            url: `${pageContext.request.contextPath }/pm/servicemanagement/vocationInsert.do`,
            data: formData,
            dataType: "json",
            success: function(response) {
                if (response.message) {
                    return;
                } else {
                	console.log(response);
                    // 서버에서 다시 조회한 결과를 사용하여 테이블의 내용 갱신
                    $("#insert").empty(); // 기존 내용 비우기

                    // response 데이터를 사용하여 테이블 내용 추가
                    response.forEach(function(vocation) {
                        var row = '<tr>' +
                                  '<td>' + vocation.vocationCode + '</td>' +
                                  '<td>' + vocation.empName + '</td>' +
                                  '<td>' + vocation.empCd + '</td>' +
                                  '<td>' + vocation.depName + '</td>' +
                                  '<td>' + vocation.vocationSday + '</td>' +
                                  '<td>' + vocation.vocationEday + '</td>' +
                                  '<td>' + vocation.vocationAddDate + '</td>' +
                                  '<td><input type="checkbox" /></td>' +
                                  '</tr>';
                        $("#insert").append(row);
                        
                    });
                    
                    
                    Swal.fire({
                    	   title: '정말로 그렇게 하시겠습니까?',
                    	   text: '다시 되돌릴 수 없습니다. 신중하세요.',
                    	   icon: 'warning',
                    	   
                    	   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
                    	   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
                    	   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
                    	   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
                    	   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
                    	   
                    	   reverseButtons: true, // 버튼 순서 거꾸로
                    	   
                    	}).then(result => {
                    	   // 만약 Promise리턴을 받으면,
                    	   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
                    	   
                    	      Swal.fire('승인이 완료되었습니다.', '화끈하시네요~!', 'success');
                    	   }
                    	});
                }
            },
            error: function(error) {
                console.error("연가 등록 중 오류가 발생했습니다.");
            }
        });
    });
});


</script>
