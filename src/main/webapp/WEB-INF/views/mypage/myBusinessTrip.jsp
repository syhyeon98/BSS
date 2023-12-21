<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<style>
* {
	font-family: 'MICEGothic Bold';
}

/* .card { */
/* 	margin: 25px 35px 25px 35px; */
/* } */

.form-inline {
	display: flex;
	flex-flow: row wrap;
	align-items: center;
	flex-wrap: wrap;
}

button {
	display: inline-block;
}

th, #col {
	text-align: center;
}

#table {
	padding-top: 15px;
	text-align: center;
}

#button {
	padding-top: 20px;
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
}

#category {
	display: flex;
	justify-content: space-evenly;
}

.form-inline label {
	display: flex;
	align-items: center;
	justify-content: center;
}

.group2 {
	float: right;
	margin: 15px 10px 0px 0px;
}

/* .group { */
/* 	float: left; */
/* 	margin: 10px 25px 10px ; */
/* } */

label {
	font-weight: bold;
	font-size: larger;
}

#searchForm {
	display: block;
}

/* .trip { */
/* 	display: flex; */
/* 	justify-content: space-around; */
/* 	align-items: stretch; */
/* } */

#bTripThisMonth {
	font-size: larger;
	text-align: center;
}

#attendthisMonth {
	text-align: center;
	font-weight: bold;
	color: mediumblue;
	font-size: large;
}

#attends {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
}

.tripNo {
	display: none;
}
</style>

<h5>☗ 업무보고 ▸ 복무정보 ▸ 금융정책 업무보고</h5>
<hr color="black">

<!-- 안내글 start -->
<div class="card">
	<div class="container-fluid">
		<div class="card-header">
		    <span style="font-size: 20px;">■ 출장신청과 출장신청보고서 기안작성을 동시에 처리할 수 있습니다. </span><br>
		    ① <span style="color: coral;">[출장등록]</span>을 클릭하면 출장의 상세내역을 입력할 수 있는 입력창이 열려 내용을 입력할 수 있습니다. <br>
		    ② 내용 입력 후 <span style="color: coral;">[출장보고]</span>를 클릭하면 "<span style="color: coral;">출장신청보고서</span>"가 생성되며, 출장과 보고를 연계하여 기안할 수 있습니다. <br>
		    ③ 작성된 내용은 결재/임시저장 하여 보관할 수 있고, 결재상태를 확인할 수 있습니다. <br>
		    ④ 당월 출장일수의 총계는 <span style="color: coral;">[당월 출장일수]</span>에서 확인할 수 있습니다.<br>
		     ※ 출장과 관련된 궁금한 사항은 ☎ 042-252-2251(인사부 담당 이준호)로 문의바랍니다.
		</div>
	</div>
</div>
<!-- 안내글 end -->



<div class="card">
<div class="card-header">

	<div class="container-fluid">
		<div class="card-header">
		
				<!-- 출장일수 총 계  -->
				<div id="att">
					<div style="display: flex;">
						<div class="card">
							<div class="card-header2" id="bTripThisMonth">당월 출장일수 (일)</div>
							<input type="number" class="form-control" id="attendthisMonth" value="${total }">
						</div>
					</div>
				</div>
				<!-- 출장일수 총 계  -->
		
		
			<!-- 검색 입력하는 부분 start  -->
			<div id="att">
				<div class="form-group" id="attends">
					<form class="form-inline" id="attendSearchList">
						<input type="hidden" id="pageNo" name="page" />  
							<label for=tripDate style="margin: 14px; font-size: x-large;">출장기간 검색</label>
						<div class="trip">
							<input type="date" class="form-control" id="atteDate" name="atteDate" />
							<button type="button" class="btn btn-info" id="selectBtn">검색</button>
							<input type="reset" class="btn btn-outline-secondary" id="resetBtn" />
						</div>
					</form>
				</div>
			</div>
			<!-- 검색 입력하는 부분 end  -->
		</div>

		<!-- 조회하면 값이 출력되는 테이블   -->
			<div class="group">
					<button id="insertBtn" class="btn btn-primary" type="button"
						data-bs-toggle="modal" data-bs-target="#bTripInsert">출장신청</button>
					<button id="modifyBtn" class="btn btn-success" type="button"
						data-bs-toggle="modal" data-bs-target="#bTripUpdate">수정</button>
					<button id="deleteBtn" class="btn btn-secondary" type="button">삭제</button>
			</div>
		<div class="container-fluid" id="table">
			<form id="saveForm">
				<input type="hidden" id="pageNo" name="page" /> <input
					type="hidden" id="tripNo" name="tripNo" />
				<div class="table">
						<table class="table table-bordered table-hover">
							<thead>
								<tr class="table-secondary">
									<th style="width: 100px; border-left:;">선택&nbsp;&nbsp;<input
										type="checkbox" onclick='selectAll(this)' /></th>
									<th>번호</th>
									<th>출장일</th>
									<th>출장목적</th>
									<th>장소</th>
									<th>결재상태</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="bTripList" value="${paging.dataList }"></c:set>
								<c:if test="${empty bTripList }">
									<tr>
										<td id="col" colspan="7">해당조건에 일치하는 결과가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${not empty bTripList }">
									<c:forEach items="${bTripList }" var="bTripVO">
										<tr>
											<td><input type="checkbox" name="choice" /></td>
											<td>${bTripVO.rnum }</td>
											<td class="tripNo">${bTripVO.tripNo }</td>
											<td>${bTripVO.tripDate }</td>
											<td>${bTripVO.tripPurpose }</td>
											<td>${bTripVO.tripPlace }</td>
											<td><c:if test="${bTripVO.code =='D_01'}">
													<a
														href="${pageContext.request.contextPath}/ed/document/documentFormView.do?docNo=${bTripVO.docNo}">
														<span class="rounded-5 p-2 bg-primary-subtle ">진행</span>
													</a>
												</c:if> <c:if test="${bTripVO.code =='D_02'}">
													<a
														href="${pageContext.request.contextPath}/ed/document/documentFormView.do?docNo=${bTripVO.docNo}">
														<span class="rounded-5 p-2 bg-success-subtle">승인</span>
													</a>
												</c:if> <c:if test="${bTripVO.code =='D_03'}">
													<a
														href="${pageContext.request.contextPath}/ed/document/documentTempForm.do?docNo=${bTripVO.docNo}">
														<span class="rounded-5 p-2 bg-warning-subtle">임시</span>
													</a>
												</c:if> <c:if test="${bTripVO.code =='D_04'}">
													<a
														href="${pageContext.request.contextPath}/ed/document/documentFormView.do?docNo=${bTripVO.docNo}">
														<span class="rounded-5 p-2 bg-danger-subtle">반려</span>
													</a>
												</c:if></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
							<tfoot>
								<c:if test="${not empty bTripList }">
									<tr>
										<td colspan="7">${paging.pagingHTML }</td>
									</tr>
								</c:if>
							</tfoot>
						</table>
					</div>
				</form>
				</div>
		</div>
<!-- 조회하면 값이 출력되는 테이블 끝 -->
</div>
</div>


<!-- [출장수정]하면 뜨는 모달  -->
<div class="modal fade" data-url="${viewURL}" id="bTripUpdate"
	tabindex="-1">
	<div class="modal-dialog modal-fullscreen-sm-down">
		<div class="modal-content">
		
		
			<div class="modal-header">
				<h5 class="modal-title">출장 수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
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
				<h5 class="modal-title"> ☗ 금융정책 업무보고 ▸ 출장신청</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form method="post" id="insertForm"
					action="${pageContext.request.contextPath }/mypage/myBusinessTripInsert.do">
					<table class="table table-border">
						<tr>
							<th>사번</th>
							<td><security:authorize access="isAuthenticated()">
									<security:authentication property="principal.realUser"
										var="authEmployee" />
									<input type="hidden" name="empCd"
										value="${authEmployee.empCd }" />${authEmployee.empCd }</security:authorize></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><security:authorize access="isAuthenticated()">
									<security:authentication property="principal.realUser"
										var="authEmployee" />${authEmployee.empName }</security:authorize></td>
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
							<td><input class="form-control" type="date" name="tripSdate" /></input></td>
						</tr>
						<tr>
							<th>출장종료일</th>
							<td><input class="form-control" type="date" name="tripEdate"></input></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<button type="button" id="auto" class="btn btn-primary">자동완성</button>
								<button type="button" id="insertDocBtn" class="btn btn-primary">기안등록</button>
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<input type="hidden" name="page" />
			</div>
		</div>
	</div>
</div>

<script>
	
/* 전체조회 페이징  */
function fn_paging(page) {
	saveForm.page.value = page;
	
	$(saveForm).submit();
	
}

	/* 출장 수정 처리 모달 */  
	$(bTripUpdate).on('show.bs.modal',function(event){
 		let $checkTripNo= $("input:checked").parent('td').siblings('.tripNo');
 		if($checkTripNo.length==1){
 	 		let $modalBody = $(this).find(".modal-body");
 	 		let tripNo = $checkTripNo.text();
 	 		if(tripNo){
 	 			let setting = {
 					url : `${pageContext.request.contextPath}/mypage/myBusinessTripUpdate.do`, //수정 실행할 컨트롤러 주소
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
			url : "myBusinessTripDelete.do",
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
					window.location.href = "${pageContext.request.contextPath}/mypage/myBusinessTrip";
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
 	$().ready(function () {
// 		  $("#insertDocBtn").click(function () {
// 		    Swal.fire({
// 		      icon: 'success',
// 		      title: '기안등록',
// 		      text: '임시저장됩니다',
// 		    });
// 		    setTimeout(() => {
// 			    $("#insertForm").attr("action","${pageContext.request.contextPath}/mypage/myBusinessTripDocInsert.do").submit(); // action바꿔주기 trip 데이터 저장후 기안문 작성으로
// 			}, 1000);
// 		  })
		  
		  $("#insertDocBtn").click(function () {
			    Swal.fire({
			      title: '등록하시겠습니까?',
// 			      text: "다시 되돌릴 수 없습니다. 신중하세요.",
			      icon: 'warning',
			      showCancelButton: true,
			      confirmButtonColor: '#3085d6',
			      cancelButtonColor: '#d33',
			      confirmButtonText: '확인',
			      cancelButtonText: '취소',
			      reverseButtons: true, // 버튼 순서 거꾸로
			    }).then((result) => {
			    	console.log(result)
			    	if (result.isConfirmed) {
			        Swal.fire(
			          '기안이 등록되었습니다.',
			          '등록된 기안문으로 이동합니다.',
			          'success'
			        )
			        $(".swal2-confirm").on("click",function(){
			        	 $("#insertForm").attr("action","${pageContext.request.contextPath}/mypage/myBusinessTripDocInsert.do").submit();
			        }) 
			    }
			     
			    	
// 			      $("#insertForm").attr("action","${pageContext.request.contextPath}/mypage/myBusinessTripDocInsert.do")
			    })
// 			    setTimeout(() => {
// 				    $("#insertForm").attr("action","${pageContext.request.contextPath}/mypage/myBusinessTripDocInsert.do").submit(); // action바꿔주기 trip 데이터 저장후 기안문 작성으로
// 				}, 1000);
			  });
 	});
 	
 /* 자동완성 	 */
 document.addEventListener("DOMContentLoaded", function() {
		let autofillButton = document.getElementById("auto");

		autofillButton.addEventListener("click", function() {
			let tripDate = document.querySelector('input[name="tripDate"]');
			let tripPurpose = document.querySelector('input[name="tripPurpose"]');
			let tripPlace = document.querySelector('input[name="tripPlace"]');
			let tripSdate = document.querySelector('input[name="tripSdate"]');
			let tripEdate = document.querySelector('input[name="tripEdate"]');

			tripDate.value = "2023-09-15";
			tripPurpose.value = "『정부 금융정책 및 금융감독체계 개편방안 모색 토론회』참석";
			tripPlace.value = "국회의원관 6층 제11간담회실";
			tripSdate.value = "2023-09-15";
			tripEdate.value = "2023-09-15";
		});
	});

 
</script>