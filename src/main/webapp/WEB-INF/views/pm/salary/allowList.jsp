 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		<h5>☗ 인사관리 ▸ 급여관리 ▸ 수당관리</h5>
		<hr color="black">
			<div class="card">
				<div class="container-fluid">
					<div class="card-header">
					    <span style="font-size: 20px;">■ 수당 추가, 수정, 삭제 처리를 동시에 할 수 있습니다. </span><br>
					    ① <span style="color: coral;">[입력칸추가]</span>를 클릭하면 수당 상세내역을 입력할 수 있는 입력창이 열려 내용을 입력할 수 있습니다. <br>
					    ② 내용 입력 후 <span style="color: coral;">[저장]</span>을 클릭하면 작성한 수당이 저장됩니다<br>
					    ③ 입력된 수당 내용은 급여 계산시 수당추가 항목으로 선택가능 합니다. <br>
					    ④ <span style="color: coral;">[선택 삭제] </span>클릭시 선택된 수당항목을 삭제합니다<br>
					    ⑤ <span style="color: coral;">[선택 수정] </span>클릭시 하나의 선택 사항에 대해 수당항목을 수정합니다<br>
					     ※ 수당 관련된 궁금한 사항은 ☎ 042-252-2251(인사부 담당 이준호)로 문의바랍니다.
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
					<form id="allowForm" method="post" action="allowInsert.do">
							<table class="table table-hover table-bordered textCenter">
								<thead>
									<tr>
										<th class="col-md-2">체크</th>
										<th class="col-md-2">수당항목코드</th>
										<th class="col-md-2">수당항목명</th>
										<th class="col-md-2">산출방법</th>
										<th class="col-md-2">계산식</th>
									</tr>
								</thead>
								<tbody id="allowList">
								<c:if test="${!empty allowList}">
									<c:forEach items="${allowList }" var="allow">
										<tr>
											<td class="col-md-2"><input type="checkbox" name="checkBox"></td>
											<td class="col-md-2 allowCd">${allow.allowCd }</td>
											<td class="col-md-2">${allow.allowNm }</td>
											<td class="col-md-2">${allow.allowCrtr }</td>
											<td class="col-md-2">${allow.allowCalc }</td>
										</tr>
									</c:forEach>
								</c:if>	
								<c:if test="${empty allowList}">
										<tr>
											<td colspan="4">
												<h3>수당내역 없음</h3>
											</td>
										</tr>
								</c:if>	
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
			<div class="btn-group btn-group-md" role="group">
				<button id="addForm" class="btn btn-secondary" type="button">입력칸추가</button>
				<button id="insertBtn" class="btn btn-secondary" type="button">저장</button>
				<button id="deleteRow" class="btn btn-secondary" type="button">선택삭제</button>
				<button id="modifyRow" class="btn btn-secondary" type="button"
					data-bs-toggle="modal" data-bs-target="#staticBackdrop">선택수정</button>
			</div>
		</div>
	</div>
</div>

<div class="modal" data-url="${viewURL}" id="staticBackdrop"
	tabindex="-1">
	<div class="modal-dialog modal-fullscreen-sm-down">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">수당수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script>
	
	$('#insertBtn').on('click',function(){
		Swal.fire({
			  title: '작성하신 수당을 추가하시겠습니까?',
			  showCancelButton: true,
			  showClass: {
			    popup: 'animate__animated animate__fadeInDown'
			  },
			  hideClass: {
			    popup: 'animate__animated animate__fadeOutUp'
			  }
			}).then((result)=>{
				if(result.isConfirmed){
					$('#allowForm').submit();
				}
			})
	})
	
	let counter = 0;

	$('#addForm').on('click', function() {
	  let modifiedHtml = `<tr>
	    <td></td>
	    <td></td>
	    <td><input type="text" required name="allowList[\${counter}].allowNm"></td>
	    <td><input type="text" required name="allowList[\${counter}].allowCrtr"></td>
	    <td><input type="text" required name="allowList[\${counter}].allowCalc"></td>
	  </tr>`;
	  
	  $('#allowList').append(modifiedHtml);
	  counter++;
	});
	
	$('#deleteRow').on('click',function(){
		let $checkAllowCd= $("input:checked").parent('td').siblings('.allowCd');
		let allowCd=[];
		for(let i = 0;i<$checkAllowCd.length;i++){
			allowCd.push($checkAllowCd[i].innerText);
		}
		
		Swal.fire({
			  title: '선택 수당을 삭제하시겠습니까?',
			  showCancelButton: true,
			  showClass: {
			    popup: 'animate__animated animate__fadeInDown'
			  },
			  hideClass: {
			    popup: 'animate__animated animate__fadeOutUp'
			  }
			}).then((result)=>{
				if(result.isConfirmed){
					let setting = {
							url : "allowDelete.do",
							method : "post",
							dataType : "text",
							traditional: true,
							data : {
								allowCd : allowCd
							},
							success : function(resp) {
								if(resp=="success"){
									Swal.fire('삭제되었습니다!', '', 'success')
									$("input:checked").parents('tr').remove();
								}else{
									alert("실행중 실패");
								}
							},
							error : function(jqXHR, status, error) {
								console.log(jqXHR)
								console.log(status)
								console.log(error)
							}
						}

						$.ajax(setting);
				}
			})
	})
	
	
	/*수정을 위한*/
	$(staticBackdrop).on('show.bs.modal',function(event){
 		let $checkDdcCd= $("input:checked").parent('td').siblings('.allowCd');
 		if($checkDdcCd.length==1){
 	 		let $modalBody = $(this).find(".modal-body");
 	 		let allowCd = $checkDdcCd.text();
 	 		console.log(allowCd);
 	 		if(allowCd){
 	 			let setting = {
 					url : `${pageContext.request.contextPath}/allow/allowModify.do`,
 					dataType : "html",
 					data : {
 						allowCd:allowCd
 					},
 					success : function(resp) {
 						$modalBody.html(resp);
 					}
 				}

 				$.ajax(setting);
 	 		}
 		}else{
 			alert("수정은 한개씩 가능합니다.");
 			 event.preventDefault(); 
 			return;
 		}
 	}).on('hidden.bs.modal',function(){
 		let $modalBody = $(this).find(".modal-body");
 		$modalBody.empty();
 	})
	
</script>
