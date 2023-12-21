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

#allVocation, #useVocation{
	 font-size: larger;
	 text-align: center;
}

#allVocation-1, #useVocation-2 {
    text-align: center;
    font-weight: bold;
    color: mediumblue;
    font-size: large;
}

#right{
	text-align: right;
}

#center {
	text-align: center;
}

.completed-row {
    background-color: yellow;
}

</style>

<h5>☗ 업무보고 ▸ 복무정보 ▸ 나의 연가</h5>
<hr color="black">

<!-- 안내글 start -->
<div class="card">
	<div class="container-fluid">
		<div class="card-header">
		    <span style="font-size: 20px;">■ 연가신청과 사용내역을 검색하여 확인할 수 있습니다.</span><br>
		    ① <span style="color: coral;">[연가신청]</span>을 클릭하면 연가를 신청하기 위한 상세내역 입력창이 열려 내용을 입력할 수 있습니다.<br>
		    ② 내용 입력 후 <span style="color: coral;">[저장]</span>를 클릭하면 연가가 신청되며, 잔여일수가 자동산입되어 확인할 수 있습니다.<br>
		    ③ 총 보유연가(총연가)와 잔여연가 수를 확인할 수 있습니다.<br>
		     ※ 연가와 관련된 궁금한 사항은 ☎ 042-252-2251(인사부 담당 이준호)로 문의바랍니다.
		</div>
	</div>
</div>
<!-- 안내글 end -->



<div class="card">
<div class="card-header">

	<div class="container-fluid">
		<div class="card-header">
		
				<!-- 총 연가, 잔여 연가  -->
				<div id="att">
				<div style="display: flex;">
					<div class="card">
						<div class="card-header2" id="allVocation">총 연가 (일)</div>
						<input type="text" id="allVocation-1" class="form-control" value="${totalVocation}">
					</div>

					<div class="card">
						<div class="card-header2" id="useVocation">잔여 연가 (일)</div>
						<input type="text" id="useVocation-2" class="form-control" value="${restVocation}">
					</div>
				</div>
				</div>  
				<!-- 총 연가, 잔여 연가  -->
				
			<div class="col" id="selectDiv">
				
				<!-- 검색/조회 입력하는 폼 -->
				<form class="form-group" name="searchForm" id="searchForm" method="post">
					<input type="hidden" id="pageNo" name="page" />
					<div id="category">
						<div class="form-inline">
							<label for="period" style="color: black;">기간 검색</label> <input type="date" class="form-control" id="vocationSday" name="vocationSday" />
								<input type="date" class="form-control" id="vocationEday" name="vocationEday" />
						<div id="searchBtn">
							<button type="button" class="btn btn-info" id="selectBtn">검색</button>
							<input type="reset" class="btn btn-outline-secondary" id="resetBtn" />
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#vocationInsert">연가신청</button>
						</div>
					</div>
				</div>
			</form>
			<!-- 검색/조회 입력하는 폼 끝 -->
			</div>
		</div>
		
		<div class="group">
			<div id="btn">
				<button type="button" id="modifyBtn" class="btn btn-success" data-bs-target="#modifyVocation" data-bs-toggle="modal">선택수정</button>
				<button type="button" id="removeBtn" class="btn btn-secondary">선택삭제</button>
			</div> 
		</div> 
	
	<!-- 연가조회 폼  -->
	<div class="container-fluid">
		<div class="table">
			<table class="table table-bordered table-hover">
				<thead>
						<tr class="table-secondary">
							<th>선택&nbsp;&nbsp;&nbsp;<input type="checkbox" onclick='selectAll(this)'></th>
							<th>번호</th>
							<th>구분</th>
							<th>신청일</th>
							<th>연가시작일</th>
							<th>연가종료일</th>
							<th>사용연가 (일)</th>
							<th>잔여연가 (일)</th>
							<th>총연가 (일)</th>
						</tr>
				</thead>
				<tbody id="insert">
					<c:set var="vocation" value="${paging.dataList }"/>
						 <c:if test="${not empty vocation }">
							<c:forEach items="${vocation }" var="vocation">
								<tr class="clickable-row">
									<td id="center"><input type="checkbox" class="row-checkbox"/>
									<td id="center">${vocation.rnum }</td>
									<td id="vocationCode">${vocation.vocationCode }</td>
									<td id="center">${vocation.vocationAddDate }</td>
									<td id="center">${vocation.vocationSday }</td>
									<td id="center">${vocation.vocationEday }</td>
									<td id="right">${vocation.vocationUse }</td>
									<td id="right">${vocation.vocationUseable}</td>
									<td id="right">${vocation.vocationAll }</td>
								</tr>
							</c:forEach>
						</c:if>
							<tr>
								<td colspan="9">${paging.pagingHTML }</td>
							</tr>
					</tbody>
			</table>
		</div>
		<div>
			<input type="hidden" name="page" />
		</div>

		<!-- 연가조회 폼 End  -->
	</div>
	</div>
</div>
</div>

	<!-- 연가 등록 모달  -->
	<div class="modal fade" id="vocationInsert" data-bs-backdrop="static" tabindex="-1">
		<div class="modal-dialog modal-fullscreen-xl-down">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" style="color: black;">연가신청</h5>
				</div>
				<div class="modal-body">
					<form:form id="vocationInsertForm" modelAttribute="vocation" method="post" action="${pageContext.request.contextPath }/mypage/myVocationInsert.do">
					
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
								<td><input type="date" class="form-control" name="vocationSday" value="2023-09-13"/></td>
							</tr>
							<tr>
								<th>연가종료일</th>
								<td><input type="date" class="form-control" name="vocationEday" value="2023-09-15"/></td>
							</tr>
							<tr>
								<td colspan="2"><button type="button" class="btn btn-success" value="등록" id="overInsert">저장</button>
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button></td>
							</tr>
						</table>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!-- 연가 등록 모달 끝  -->

<!-- 선택수정 하면 뜨는 모달  -->
<div class="modal fade" id="modifyVocation" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body2"></div>
			<div class="modal-footer">
				
			</div>
		</div>
	</div>
</div>
<!-- 모달 끝 -->

<script>

/* 체크박스 전체선택  */
function selectAll(selectAll)  {
  const checkboxes 
     = document.querySelectorAll('input[type="checkbox"]');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}

/* 전체페이지 조회  */
function fn_paging(page){
	searchForm.page.value= page;
	//searchForm.submit();
	$("#selectBtn").trigger('click');
}

    
/* 삭제 처리 */
$('#removeBtn').click(function() {
    let $checkedRows = $("input.row-checkbox:checked").closest("tr");
    
    if ($checkedRows.length === 0) {
        alert("선택된 항목이 없습니다.");
        return;
    }
    
    let vocationCodes = [];
    
    $checkedRows.each(function() {
        var vocationCode = $(this).find("td:eq(2)").text(); // 휴가 코드 가져오기
        vocationCodes.push(vocationCode);
        
        console.log(vocationCodes);
    });

    /* 요청을 보낼 때 */
    let setting = {
        type: "post",
        url: "${pageContext.request.contextPath}/mypage/myVocationDelete.do",
        data: JSON.stringify(vocationCodes),
        contentType: "application/json; charset=utf-8",
        success: function(resp) {
            if (resp.status === "success") { // 서버 응답의 status 필드를 확인
                $checkedRows.remove();
               
            	Swal.fire({
            		 title: '삭제가 완료되었습니다.',        
            		 icon: 'success',
            		 timer: 2000
                });
                
            } else {
                alert("삭제를 실패하였습니다.");
            }
        },
        error: function(jqXHR, status, error) {
            console.log(jqXHR);
            console.log(status);
            console.log(error);
        }
    };
    $.ajax(setting);
});

/* 수정버튼 눌렀을 때 누른 정보 모달뜨게 하는것  */
$(document).ready(function() {
    $('#modifyBtn').click(function() {
        let $checkedEmpCd = $("input:checked").parent('td').siblings('#vocationCode');

        if ($checkedEmpCd.length === 1) {
            let vocationCode = $checkedEmpCd.text();

            console.log(vocationCode);

            if (vocationCode) {
                let setting = {
                    type: "get",
                    url: `${pageContext.request.contextPath}/mypage/myVocationOne.do`,
                    dataType: "html",
                    data: { vocationCode: vocationCode },
                    success: function(resp) {
                        // 모달 열기 코드는 여기에서 호출
                        $('#modifyVocation').find(".modal-body2").html(resp);

                        // 모달을 열기 위한 코드는 한 번만 호출되어야 합니다.
                        $('#modifyVocation').modal('show');
                    }
                }
                $.ajax(setting);
            }
        } else {
            Swal.fire({
                title: '수정은 하나씩 가능합니다.',
                icon: 'info',
                timer: 5000
            });
        }
    });
});

	$('#overInsert').on("click", function(e){
		 e.preventDefault();
		 
		 var message = "<%= request.getAttribute("message") %>";
		 if(message){
			 Swal.fire({
		          title: '연가 등록이 완료되었습니다.',        
		          icon: 'success',
		          timer:50000
		       }).then(function() {
		          $('#vocationInsertForm').submit();
		          
		           // 등록된 연가의 행에 배경색 클래스 추가
		          $('.row-checkbox:checked').closest('tr').addClass('completed-row');
		       });
		    };
		});
</script>
