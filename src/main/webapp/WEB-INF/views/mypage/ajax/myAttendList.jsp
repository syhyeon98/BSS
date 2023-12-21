<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>

<style>

table {
	text-align : center;
}

#btn {
	margin: 15px 25px 15px;
}

#cont {
	text-align : left;	
}

.atteNo {
	display: none;
}
</style>

<div id="btn">
<button type="button" class="btn btn-primary" id="overTimeBtn" data-bs-toggle="modal" data-bs-target="#overTime" >초과근무 신청</button>
<button type="button" class="btn btn-success" id="modifyBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop" >출퇴근 수정</button>
<button type="button" class="btn btn-success" id="overTimeUpdateBtn" data-bs-toggle="modal" data-bs-target="#overTimeUpdate" >초과근무 수정</button>
<button type="button" class="btn btn-secondary" id="deleteBtn" >삭제</button>
</div>
<table class="table table-bordered table-Rhover">
	<thead>
		<tr class="table-secondary">
			<th>선택<input type="checkbox" onclick='selectAll(this)'/></th>
			<th>번호</th>
			<th>근무일자</th>
			<th>근무시작시간</th>
			<th>근무종료시간</th>
			<th>초과근무시작시간</th>
			<th>초과근무종료시간</th>
			<th>초과근무내용</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="myAttendList" value="${paging.dataList }"></c:set>
		<c:if test="${empty myAttendList }">
			<tr>
				<td id="col" colspan="11">해당일에 일치하는 출근내역이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty myAttendList }">
			<c:forEach items="${myAttendList }" var="attendVO">
				<tr class='clickable-row'>
					<td><input type="checkbox"/></td>
					<td class="atteNo">${attendVO.atteNo }</td>
					<td>${attendVO.rnum }</td>
					<td>${attendVO.atteDate }</td>
					<td>${attendVO.atteStime.toString().replace('T',' ') }</td>
					<td>${attendVO.atteEnd.toString().replace('T',' ') }</td>
					<td>${attendVO.overStart.toString().replace('T',' ') }</td>
					<td>${attendVO.overEnd.toString().replace('T',' ') }</td>
					<td id="cont">${attendVO.overCont }</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	<tfoot>
        <c:if test="${not empty myAttendList }">
            <tr>
                <td colspan="11">${paging.pagingHTML }</td>
            </tr>
        </c:if>
    </tfoot>
</table>
<!-- 조회하면 값이 출력되는 테이블 끝 -->

<!-- 출근부 수정 모달  -->
<div class="modal fade" data-url="${viewURL}" id="staticBackdrop" tabindex="-1">
	<div class="modal-dialog modal-fullscreen-sm-down">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">출근부 수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>
<!-- 출근부 수정 모달 끝  -->

<!-- 초과근무 등록 모달  -->
<div class="modal fade" id="overTime" tabindex="-1">
	<div class="modal-dialog modal-fullscreen-sm-down">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">초과근무 신청</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>
<!-- 초과근무 등록 모달 끝  -->

<!-- 초과근무 수정 모달  -->
<div class="modal fade" id="overTimeUpdate" tabindex="-1">
	<div class="modal-dialog modal-fullscreen-sm-down">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">초과근무</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 초과근무 수정 모달 끝  -->

<script>

/*초과근무 등록 처리 모달*/  
$(overTime).on('show.bs.modal',function(event){
		let $checkOvertimeAtteNo= $("input:checked").parent('td').siblings('.atteNo');
		if($checkOvertimeAtteNo.length==1){
	 		let $modalBody = $(this).find(".modal-body");
	 		let atteNo = $checkOvertimeAtteNo.text();
	 		if(atteNo){
	 			let setting = {
					url : `${pageContext.request.contextPath}/mypage/overTimeInsert.do`, //실행할 컨트롤러 주소
					dataType : "html",
					data : {
						atteNo:atteNo
					},
					success : function(resp) {
						$modalBody.html(resp);
		            	
					}
				}

				$.ajax(setting);
	 			
	 		}
		}else{
			alert("등록은 하나씩 가능합니다.");
			 event.preventDefault(); 
			return;
		}
	}).on('hidden.bs.modal',function(){
		let $modalBody = $(this).find(".modal-body");
		$modalBody.empty();
	})
	
/*초과근무 수정 처리 모달*/  
$(overTimeUpdate).on('show.bs.modal',function(event){
		let $checkOverUpdateAtteNo= $("input:checked").parent('td').siblings('.atteNo');
		if($checkOverUpdateAtteNo.length==1){
	 		let $modalBody = $(this).find(".modal-body");
	 		let atteNo = $checkOverUpdateAtteNo.text();
	 		if(atteNo){
	 			let setting = {
					url : `${pageContext.request.contextPath}/mypage/overTimeUpdate.do`, //수정 실행할 컨트롤러 주소
					dataType : "html",
					data : {
						atteNo:atteNo
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
	
	
	
	
/*출근부 수정 처리 모달*/  
$(staticBackdrop).on('show.bs.modal',function(event){
		let $checkAtteNo= $("input:checked").parent('td').siblings('.atteNo');
		if($checkAtteNo.length==1){
	 		let $modalBody = $(this).find(".modal-body");
	 		let atteNo = $checkAtteNo.text();
	 		if(atteNo){
	 			let setting = {
					url : `${pageContext.request.contextPath}/mypage/mypageAttendUpdate.do`, //수정 실행할 컨트롤러 주소
					dataType : "html",
					data : {
						atteNo:atteNo
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
	let $checkAtteNo = $("input:checked").parent('td').siblings('.atteNo');
	let atteNo = [];
	for (let i = 0; i < $checkAtteNo.length; i++) {
		atteNo.push($checkAtteNo[i].innerText);
	}
	
	/* 요청을 보낼 때 */
	let setting = {
		url : "mypageAattendDelete.do",
		method : "post",
		dataType : "text",
		data : {
			atteNo : atteNo
		},
		
		/* 요청이 성공했을 때 */
		success : function(resp) {
			console.log("resp", resp);
			if (resp == "success") {
				$("input:checked").parents('tr').remove();
				
				Swal.fire({
				    title: '출근부 삭제가 완료되었습니다.',
				    icon: 'success',
				    showConfirmButton: true, // "닫기" 버튼 표시
				    confirmButtonText: '닫기', // 버튼 텍스트 설정
				}).then((result) => {
				    if (result.isConfirmed) {
				        // 사용자가 "닫기" 버튼을 클릭하면 실행될 코드
				        location.reload();
				    }
				});
			} else { //응답이 success가 아닌경우
				alert("삭제를 실패하였습니다.");
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

</script>