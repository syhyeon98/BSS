<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>

<style>

* {
	font-family: 'MICEGothic Bold';
}

.card {
    margin: 25px 35px 25px 35px;
}

.form-inline{
    display: flex;
    flex-flow: row wrap;
    align-items: center;
    flex-wrap: wrap;
    justify-content: space-around;
}

button {
	display: inline-block;
}

th, #col {
	text-align : center;
}

#table{
	padding-top: 15px;
	text-align : center;
}

#button{
	padding-top: 20px;
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

.group2 {
	float: right;
	margin: 15px 10px 0px 0px;
}
.group {
	float: left;
	margin: 15px 10px 0px 0px;
}

label{
	font-weight: bold;
    font-size: larger;
}

#searchForm{
	display: block;
}
</style>

<h5>☗ 인사관리 ▸ 복무관리 ▸ 출장현황</h5>
<hr color="black">
<div class="container-fluid">
	<div class="card">
		<div class="card-body">
			<div class="col-md-12">
				<!-- 검색/조회 입력하는 폼 -->
				<form class="form-inline" name="searchForm" id="searchForm"	method="post">
					<div id="category">
						<div class="form-group">
							<label for="tripDate">출장일</label>
							<input type="date" class="form-control" id="tripDate" name="tripDate" />
							
							<label for="empName">이름</label>
							<input type="text" class="form-control" id="empName" name="empName"/>
							
							<label for="tripPlace">장소</label>
							<input type="text" class="form-control" id="tripPlace" name="tripPlace" />
							
							<label for="tripPurpose">출장목적</label>
							<input type="text" class="form-control" id="tripPurpose" name="tripPurpose" />
						</div>
					</div>
					<div class="group2">
						<input type="reset" class="btn btn-secondary" />
						<button type="submit" class="btn btn-primary" id="selectBtn">조회</button>
					</div>
				</form>
				<!-- 검색/조회 입력하는 폼 끝 -->
			</div>
		</div>
	</div>
</div>






<!-- 조회하면 값이 출력되는 테이블   -->
<div class="container-fluid" id="table">
	<form id="saveForm">
		<div class="table">
			<div class="col-md-12">
				<table class="table table-bordered table-hover">
					<thead>
						<tr class="table-secondary">
							<th>선택&nbsp;&nbsp;<input type="checkbox" onclick='selectAll(this)' /></th>
							<th>번호</th>
							<th>이름</th>
							<th>출장일</th>
							<th>출장목적</th>
							<th>장소</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty bTripList }">
							<tr>
								<td id="col" colspan="7">해당조건에 일치하는 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty bTripList }">
							<c:forEach items="${bTripList }" var="bTripVO">
								<tr>
									<td><input type="checkbox" name="choice" /></td>
									<td class="tripNo">${bTripVO.tripNo }</td>
									<td>${bTripVO.empName }</td>
									<td>${bTripVO.tripDate }</td>
									<td>${bTripVO.tripPurpose }</td>
									<td>${bTripVO.tripPlace }</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<div class="group">
			<button id="insertBtn" class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#bTripInsert">출장등록</button>
			<button id="modifyBtn" class="btn btn-secondary" type="button" data-bs-toggle="modal" data-bs-target="#bTripUpdate">선택수정</button>
			<button id="deleteBtn" class="btn btn-danger" type="button">선택삭제</button>
		</div>
	</form>
</div>
<!-- 조회하면 값이 출력되는 테이블 끝 -->

<!-- [출장수정]하면 뜨는 모달  -->
<div class="modal fade" data-url="${viewURL}" id="bTripUpdate" tabindex="-1">
	<div class="modal-dialog modal-fullscreen-sm-down">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">출장 수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>

<!-- [출장등록]하면 뜨는 모달  -->
<div class="modal fade" id="bTripInsert" tabindex="-1">
	<div class="modal-dialog modal-fullscreen-sm-down">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">출장 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form method="post" name="formData" action="${pageContext.request.contextPath }/pm/servicemanagement/businessTripInsert.do">
					<table class="table table-border">
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
								<security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empName }</security:authorize></td>
						</tr>
						<tr>
							<th>출장일</th>
							<td><input class="form-control" type="date" name="tripDate"></input></td>
						</tr>
						<tr>
							<th>출장목적</th>
							<td><input class="form-control" type="text" name="tripPurpose"></input></td>
						</tr>
						<tr>
							<th>출장장소</th>
							<td><input class="form-control" type="text" name="tripPlace"></input></td>
						</tr>
						<tr>
							<th>출장시작일</th>
							<td><input class="form-control" type="date" name="tripSdate"/></input></td>
						</tr>
						<tr>
							<th>출장종료일</th>
							<td><input class="form-control" type="date" name="tripEdate"></input></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;" >
								<button type="submit" class="btn btn-primary" value="등록">등록</button>
<!-- 								<button type="button" id="insertDoc" class="btn btn-primary" >기안등록</button> -->
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				
			</div>
		</div>
	</div>
</div>

<script>
	/* 조회 누르면 나오는 출근부전체조회 처리하는 */ 
	function to_ajax() {
		var empName = $("form[name=searchForm]").serialize();

		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/pm/servicemanagement/businessTrip', //조회 or 수정 or 추가 할 컨트롤러 url
			data : empName,
			dataType : 'text',
			error : function(xhr, status, error) {
				alert(error);
			},
			success : function(json) {
				alert(json)
			}
		});
	}
	
	/* 출장 수정 처리 모달 */  
	$(bTripUpdate).on('show.bs.modal',function(event){
 		let $checkTripNo= $("input:checked").parent('td').siblings('.tripNo');
 		if($checkTripNo.length==1){
 	 		let $modalBody = $(this).find(".modal-body");
 	 		let tripNo = $checkTripNo.text();
 	 		if(tripNo){
 	 			let setting = {
 					url : `${pageContext.request.contextPath}/pm/servicemanagement/businessTripUpdate.do`, //수정 실행할 컨트롤러 주소
 					dataType : "html",
 					data : {
 						tripNo:tripNo
 					},
 					success : function(resp) {
 						$modalBody.html(resp);
 					}
 				}

 				$.ajax(setting);
 	 		}
 		}else{
 			alert("수정은 하나씩 가능합니다.");
 			 event.preventDefault(); 
 			return;
 		}
 	}).on('hidden.bs.modal',function(){
 		let $modalBody = $(this).find(".modal-body");
 		$modalBody.empty();
 	})
 	
 	
 	/* 체크박스 전체선택  */
	function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
	
 	/* 삭제 처리 */
	$('#deleteBtn').on('click', function(event) {
		event.stopPropagation();
		let $checkTripNo = $("input:checked").parent('td').siblings('.tripNo');
		let tripNo = [];
		for (let i = 0; i < $checkTripNo.length; i++) {
			tripNo.push($checkTripNo[i].innerText);
		}
		
		//요청을 보낼 때
		let setting = {
			url : "businessTripDelete.do",
			method : "post",
			dataType : "text",
			data : {
				tripNo : tripNo
			},
			
			//요청이 성공했을 때
			success : function(resp) {
				console.log("resp", resp);
				if (resp == "success") {
					$("input:checked").parents('tr').remove();
					alert("삭제가 완료되었습니다.");
					window.location.href = "${pageContext.request.contextPath}/pm/servicemanagement/businessTrip";
				} else { //응답이 success가 아닌경우
					alert("삭제를 실패하였습니다.");
				}
			},
			
			//요청이 실패했을 때
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting)
	});
 	
 	
 	// 기안등록
//  	$("#insertDoc").on("click",function(){
//  		$(formData).attr("action","${pageContext.request.contextPath}/ed/document/documentTempForm.do"); // action바꿔주기 trip 데이터 저장후 기안문 작성으로		
//  		console.log(formData);
//  	})
 	
</script>