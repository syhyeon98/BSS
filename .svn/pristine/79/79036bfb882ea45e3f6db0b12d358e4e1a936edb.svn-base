<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!-- 기안문 작성폼 -->

<!-- 임시 -->
<style>
.mar {
	margin-top: 15px;
}
</style>

<script
	src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/fancytree/jquery.fancytree-all-deps.min.js"></script>

<!-- 로그인객체 -->
<security:authentication property="principal.realUser" var="authEmployee" />
<div class="container-fluid">
	<div class="container m-auto row border border-black">
		<div class="col-md-12">
			<div class="row justify-content-end">
				<c:if test="${authEmployee.empCd == documentFormView.empCd and documentFormView.code=='D_04' }">
					<div class="col-auto">
						<button type="button" class="btn btn-outline-secondary"
							onclick="redirectToDocumentTempForm()">재기안</button>
					</div>
				</c:if>
				<div class="col-auto">
					<button type="button" class="btn btn-outline-secondary"
						onclick="goBack()">뒤로가기</button>
				</div>
				
			</div>
			<div class="row textCen mar">
				<div class="col-md-3">
					<table class="table table-bordered mb-4">
						<!-- mb-4: 아래쪽 간격 추가 -->
						<tr class="textCenter">
							<td class="table-secondary">결재번호</td>
						</tr>
						<tr class="textCenter">
							<td class="textGray">승인 시 자동채번</td>
						</tr>
					</table>
				</div>
				<div class="col-md-9">
					<table id="signpathTable" class="table table-bordered">
						<!-- mb-4: 아래쪽 간격 추가 -->
						<tr class="textCenter">
							<!-- 나중에 br없애고 세로가운데 정렬하기 -->
							<td rowspan="3" class="table-secondary "></br>결</br> </br>재</td>
							<c:forEach items="${ signpathEmpList}" var="signpathEmp">
								<td>${signpathEmp.codeMethodName }</td>
							</c:forEach>
						</tr>
						<tr class="textCenter">
							<c:forEach items="${ signpathEmpList}" var="signpathEmp">
								<td>${signpathEmp.empName} ${signpathEmp.poName }
									<c:if test="${signpathEmp.codeStatus == 'SE_02'}">
										<span>
											<c:if test="${atchSignImg!=null && atchSignImg.size()>0}">
												<c:forEach items="${atchSignImg}" var="signImg">
													<c:if test="${signImg.atchNo == signpathEmp.signImg }">
														<img width="50px" alt="도장" src="${ pageContext.request.contextPath}/resources/docFile/${signImg.outAtchNm }">
													</c:if>
												</c:forEach>
											</c:if>
										</span>
									</c:if>
								</td>
							</c:forEach>
						</tr>
						<tr class="textCenter">
							<c:forEach items="${ signpathEmpList}" var="signpathEmp">
								<!-- 현재 로그인한 사용자와 결재자가 같을때 -->
								<c:if test="${authEmployee.empCd == signpathEmp.empCd}"> 
									<c:choose>
										<c:when test="${signpathEmp.sdTurn == signpathEmp.currentTurn}">
											<td><div class="btn-group">
												  <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
												    승인/반려
												  </button>
												  <ul class="dropdown-menu">
												    <li><a class="dropdown-item" id="approveBtn" data-sdturn="${signpathEmp.sdTurn}">승인</a></li>
												    <li><a class="dropdown-item" id="rejectBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop" href="#staticBackdrop" >반려</a></li>
												  </ul>
												</div>
											</td>
										</c:when>
										<c:when test="${signpathEmp.sdTurn != signpathEmp.currentTurn}">
											<c:choose>
												<c:when test="${not empty signpathEmp.seDate and signpathEmp.seDate != null and signpathEmp.codeStatus =='SE_02'}">
													<td>${signpathEmp.seDate}</td>
												</c:when>
												
												<c:when test="${signpathEmp.codeStatus =='SE_03'}">
													<td>반려</td>
												</c:when>
												<c:when test="${not empty signpathEmp.seDate and signpathEmp.seDate != null}">
													<td>${signpathEmp.seDate}</td>
												</c:when>
												<c:otherwise>
													<td>${signpathEmp.codeStatusName }</td>
												</c:otherwise>
											</c:choose>
										</c:when>
										
									</c:choose>
								</c:if>
								<c:if test="${authEmployee.empCd != signpathEmp.empCd}"> 
									<c:choose>
										<c:when test="${not empty signpathEmp.seDate and signpathEmp.seDate != null and signpathEmp.codeStatus =='SE_02'}">
													<td>${signpathEmp.seDate}</td>
										</c:when>
										<c:when test="${signpathEmp.codeStatus =='SE_03'}">
													<td>반려</td>
										</c:when>
										<c:otherwise>
													<td>${signpathEmp.codeStatusName }</td>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
						</tr>
					</table>
				</div>
			</div>

			<table class="table table-bordered">
<!-- 				<tbody> -->
<!-- 					<tr> -->
<!-- 						<td class="table-secondary cellWidth">문서유형</td> -->
<%-- 						<td>${documentFormView.docType }</td> --%>
<!-- 						<td class="table-secondary cellWidth">기안일자</td> -->
<%-- 						<td>${documentFormView.docUpdatedate}</td> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->

<!-- 						<td class="table-secondary cellWidth">기 안 자</td> -->
<%-- 						<td>${documentFormView.empName } ${documentFormView.poName }</td> --%>

<!-- 						<td class="table-secondary cellWidth">기안부서</td> -->
<%-- 						<td>${documentFormView.depName }</td> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td class="table-secondary cellWidth">문서제목</td> -->
<%-- 						<td colspan="3"> ${documentFormView.docTitle} </td> --%>
<!-- 					</tr> -->
<!-- 				</tbody> -->
<!-- 				<tbody> -->
<!-- 					<tr> -->
<!-- 						<td colspan="4" class="table-secondary textCenter">문서내용</td> -->
<!-- 					</tr> -->
					<tr>
						<td colspan="4"> ${documentFormView.docContent}
							<!-- 에디터를 삽입할 textarea --> 
<%-- 							<c:if test="${not empty DocumentCont }">\ --%>
<%-- 								<textarea name="docContent" id="docContent">${DocumentCont.dtCont}</textarea> --%>
<%-- 							</c:if> --%>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table table-bordered">
				<tr>
					<td>
						<c:choose>
						    <c:when test="${atchfileDetailList.size() > 0}">
						        <c:forEach items="${atchfileDetailList}" var="atchFile">
						        	<c:url value="/download/download.do" var="downloadURL">
										<c:param name="atchNo" value="${atchFile.atchNo }" />
										<c:param name="outAtchCd" value="${atchFile.outAtchCd }" />
									</c:url>
									<a href="${downloadURL}">${atchFile.outOriginNm}</a>
						        </c:forEach>
						    </c:when>
						    <c:otherwise>
						        첨부파일이 없습니다
						    </c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<!-- 반려사유 작성 모달창 -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabe" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabe">반려사유</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<!-- 모달창 최대 높이, 넘으면 스크롤 적용 -->
			<div class="modal-body">
				<textarea rows="10" cols="85" id="seReject">
				
				</textarea>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" id="rejectFinishBtn" class="btn btn-primary">반려하기</button>
			</div>
		</div>
	</div>
</div>

<!-- confirm 모달을 쓸 페이지에 추가 start-->
<!--         <section class="modal modal-section type-confirm"> -->
<!--             <div class="enroll_box"> -->
<!--                 <p class="menu_msg"></p> -->
<!--             </div> -->
<!--             <div class="enroll_btn"> -->
<!--                 <button class="btn pink_btn btn_ok">확인</button> -->
<!--                 <button class="btn gray_btn modal_close">취소</button> -->
<!--             </div> -->
<!--         </section> -->
<!--         confirm 모달을 쓸 페이지에 추가 end -->

<!--         alert 모달을 쓸 페이지에 추가 start -->
<!--         <section class="modal modal-section type-alert"> -->
<!--             <div class="enroll_box"> -->
<!--                 <p class="menu_msg"></p> -->
<!--             </div> -->
<!--             <div class="enroll_btn"> -->
<!--                 <button class="btn pink_btn modal_close">확인</button> -->
<!--             </div> -->
<!--         </section> -->
<!-- alert 모달을 쓸 페이지에 추가 end-->

<script>
	// 뒤로가기 (작성취소)
	function goBack() {
		window.history.back();
	}

	// 승인클릭시 
	$("#approveBtn").on("click",function(){
		console.log(${authEmployee.empCd})
		let docNo = ${documentFormView.docNo};
		let sdTurn = $(this).data("sdturn");
		let maxTurn=${signpathEmpList[0].maxTurn};
		
		Swal.fire({
			  title: '승인하시겠습니까?',
			  showCancelButton: true,
			  cancelButtonText: "취소",
			  confirmButtonText: '승인',
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire('승인되었습니다!', '', 'success').then((result)=>{
			    	
			    	if(result.isConfirmed){
			    		
			    		  let setting = {
			  					url : `${pageContext.request.contextPath}/ed/document/signpathEmpUpdate.do`,
			  					method : "POST",
			  					dataType : "json",
			  					data:{
			  						docNo : docNo,
			  						sdTurn :sdTurn,
			  						maxTurn:maxTurn,
			  						codeStatus:"SE_02"
			  					},
			  					success : function(resp) {
			  						location.reload();
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
			  
			}})
			})
	
	$("#rejectFinishBtn").on("click",function(){
		let seRejectCntn = $("#seReject").val(); // 반려사유내용
		let docNo = ${documentFormView.docNo};
		let sdTurn = $(this).data("sdturn");
		let maxTurn=${signpathEmpList[0].maxTurn};
		console.log(seRejectCntn)
		Swal.fire({
			  title: '반려하시겠습니까?',
			  showCancelButton: true,
			  cancelButtonText: "취소",
			  confirmButtonText: '반려',
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire('반려되었습니다!', '', 'success').then((result)=>{
		let setting = {
				url : `${pageContext.request.contextPath}/ed/document/signpathEmpUpdate.do`,
				method : "POST",
				dataType : "json",
				data:{
					docNo : docNo,
					sdTurn :sdTurn,
					maxTurn:maxTurn,
					codeStatus:"SE_03",
					seReject:seRejectCntn
				},
				success : function(resp) {
					location.reload();
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR)
					console.log(status)
					console.log(error)
				}
			}
			$.ajax(setting);
			    })
		    	
			    }
			  
			})
			})
	
	
	/**
	alert창 커스텀
 *  alert, confirm 대용 팝업 메소드 정의 <br/>
 *  timer : 애니메이션 동작 속도 <br/>
 *  alert : 경고창 <br/>
 *  confirm : 확인창 <br/>
 *  open : 팝업 열기 <br/>
 *  close : 팝업 닫기 <br/>
 */ 
// var action_popup = {
//     timer : 500,
//     confirm : function(txt, callback){
//         if(txt == null || txt.trim() == ""){
//             console.warn("confirm message is empty.");
//             return;
//         }else if(callback == null || typeof callback != 'function'){
//             console.warn("callback is null or not function.");
//             return;
//         }else{
//             $(".type-confirm .btn_ok").on("click", function(){
//                 $(this).unbind("click");
//                 callback(true);
//                 action_popup.close(this);
//             });
//             this.open("type-confirm", txt);
//         }
//     },

//     alert : function(txt){
//         if(txt == null || txt.trim() == ""){
//             console.warn("confirm message is empty.");
//             return;
//         }else{
//             this.open("type-alert", txt);
//         }
//     },

//     open : function(type, txt){
//         var popup = $("."+type);
//         popup.find(".menu_msg").text(txt);
//         $("body").append("<div class='dimLayer'></div>");
//         $(".dimLayer").css('height', $(document).height()).attr("target", type);
//         popup.fadeIn(this.timer);
//     },

//     close : function(target){
//         var modal = $(target).closest(".modal-section");
//         var dimLayer;
//         if(modal.hasClass("type-confirm")){
//             dimLayer = $(".dimLayer[target=type-confirm]");
//             $(".type-confirm .btn_ok").unbind("click");
//         }else if(modal.hasClass("type-alert")){
//             dimLayer = $(".dimLayer[target=type-alert]")
//         }else{
//             console.warn("close unknown target.")
//             return;
//         }
//         modal.fadeOut(this.timer);
//         setTimeout(function(){
//             dimLayer != null ? dimLayer.remove() : "";
//         }, this.timer);
//     }
// }
	
</script>

<script>
function redirectToDocumentTempForm() {
    window.location.href = `${pageContext.request.contextPath}/ed/document/documentTempForm.do?docNo=${documentFormView.docNo}`;
}
</script>


