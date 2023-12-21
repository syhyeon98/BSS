<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h5>☗ 인사관리 ▸ 급여관리 ▸ 공제관리</h5>
			<hr color="black">
			<div class="card">
				<div class="container-fluid">
					<div class="card-header">
					    <span style="font-size: 20px;">■ 공제 추가, 수정, 삭제 처리를 동시에 할 수 있습니다. </span><br>
					    ① <span style="color: coral;">[입력칸추가]</span>를 클릭하면 공제 상세내역을 입력할 수 있는 입력창이 열려 내용을 입력할 수 있습니다. <br>
					    ② 내용 입력 후 <span style="color: coral;">[저장]</span>을 클릭하면 작성한 공제가 저장됩니다<br>
					    ③ 입력된 공제 내용은 급여 계산시 자동 계산됩니다. <br>
					    ④ <span style="color: coral;">[선택 삭제]</span>클릭시 선택된 공제항목을 삭제합니다<br>
					    ⑤ <span style="color: coral;">[선택 수정]</span>클릭시 하나의 선택 사항에 대해 공제항목을 수정합니다<br>
					     ※ 공제 관련된 궁금한 사항은 ☎ 042-252-2251(인사부 담당 이준호)로 문의바랍니다.
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<form id="ddcForm" method="post" action="ddcInsert.do">
							<table class="table table-hover table-bordered textCenter">
								<thead>
									<tr>
										<th class="col-md-3">선택</th>
										<th class="col-md-3">공제항목코드</th>
										<th class="col-md-3">공제항목명</th>
										<th class="col-md-3">공제율</th>
									</tr>
								</thead>
								<tbody id="ddcList">
									<c:forEach items="${ddcList}" var="ddc">
										<tr>
											<td class="col-md-3"><input type="checkbox"
												name="checkBox"></td>
											<td class="col-md-3 ddcCd">${ddc.ddcCd }</td>
											<td class="col-md-3">${ddc.ddcNm }</td>
											<td class="col-md-3">${ddc.ddcCrtr }%</td>
										</tr>
									</c:forEach>
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
				<h5 class="modal-title">공제수정</h5>
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
// 	let html=`<tr>
// 		<td></td>
// 		<td></td>
// 		<td><input type="text" name="ddcNm"></td>
// 		<td><input type="text" name="ddcCrtr"></td>
// 			</tr>`;
// 	$('#addForm').on('click',function(){
// 		$('#ddcList').append(html);
		
// 	})
	
	$('#insertBtn').on('click',function(){
		Swal.fire({
			  title: '작성하신 공제를 추가하시겠습니까?',
			  showCancelButton: true,
			  showClass: {
			    popup: 'animate__animated animate__fadeInDown'
			  },
			  hideClass: {
			    popup: 'animate__animated animate__fadeOutUp'
			  }
			}).then((result)=>{
				if(result.isConfirmed){
					$('#ddcForm').submit();
				}
			})
		
	})
	
	let counter = 0;

	$('#addForm').on('click', function() {
	  let modifiedHtml = `<tr>
	    <td></td>
	    <td></td>
	    <td><input type="text" required name="ddcList[\${counter}].ddcNm"></td>
	    <td><input type="text" required name="ddcList[\${counter}].ddcCrtr"></td>
	  </tr>`;
	  
	  $('#ddcList').append(modifiedHtml);
	  
	  counter++;
	});
	
	$('#deleteRow').on('click',function(){
		let $checkDdcCd= $("input:checked").parent('td').siblings('.ddcCd');
		let ddcCd=[];
		for(let i = 0;i<$checkDdcCd.length;i++){
			ddcCd.push($checkDdcCd[i].innerText);
		}
		
		Swal.fire({
			  title: '선택 공제를 삭제하시겠습니까?',
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
							url : "ddcDelete.do",
							method : "post",
							dataType : "text",
							traditional: true,
							data : {
								ddcCd : ddcCd
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
 		let $checkDdcCd= $("input:checked").parent('td').siblings('.ddcCd');
 		if($checkDdcCd.length==1){
 	 		let $modalBody = $(this).find(".modal-body");
 	 		let ddcCd = $checkDdcCd.text();
 	 		if(ddcCd){
 	 			let setting = {
 					url : `${pageContext.request.contextPath}/ddc/ddcModify.do`,
 					dataType : "html",
 					data : {
 						ddcCd:ddcCd
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