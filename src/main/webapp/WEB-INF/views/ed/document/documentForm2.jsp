<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
documentForm.jsp 결재문서 상세 -- fancy트리완료, 노드 선택 조건 걸기 전
<script
	src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">

			<button type="button" class="btn btn-secondary" id="signPath" 
				data-bs-toggle="modal" data-bs-target="#staticBackdrop">결재선</button>
			<button type="button" class="btn btn-primary">결재요청</button>
			<button type="button" class="btn btn-outline-secondary">임시저장</button>
			<button type="button" class="btn btn-outline-secondary">작성취소</button>

			<div class="row textCen">
				<div class="col-md-3">
					<table class="table table-bordered mb-4">
						<!-- mb-4: 아래쪽 간격 추가 -->
						<tr>
							<td class="table-active">결재번호</td>
						</tr>
						<tr>
							<td>승인 시 자동채번</td>
						</tr>
					</table>
				</div>
				<div class="col-md-9">
					<table class="table table-bordered">
						<!-- mb-4: 아래쪽 간격 추가 -->
						<tr>
							<td rowspan="3" class="table-active">결</br>재  
							</td>
							<td>결재방법</td>
							<td>결재방법</td>
							<td>결재방법</td>
							<td>결재방법</td>
							<td>결재방법</td>
						</tr>
						<tr>
							<td>결재자</td>
							<td>결재자</td>
							<td>결재자</td>
							<td>결재자</td>
							<td>결재자</td>
						</tr>
						<tr>
							<td>승인일자</td>
							<td>승인일자</td>
							<td>승인일자</td>
							<td>승인일자</td>
							<td>승인일자</td>
						</tr>
					</table>
				</div>
			</div>

			<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="table-active cellWidth">문서유형</td>
						<td>${DocumentCont.dtGroup }</td>
						<td class="table-active cellWidth">기안일자</td>
						<td>기안 시 자동부여</td>
					</tr>
					<tr>
					<security:authentication property="principal.realUser" var="authEmployee"/>
						<td class="table-active cellWidth">기 안 자</td>
						<td>${authEmployee.empName }</td>
						
						<td class="table-active cellWidth">기안부서</td>
						<td>${authEmployee.depName }</td>
					</tr>
					<tr>
						<td class="table-active cellWidth">문서제목</td>
						<td colspan="3">
							<input type="text" class="form-control" id="title" />
						</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td colspan="4" class="table-active textCen">문서내용</td>
					</tr>
					<tr>
						<td colspan="4">
							<!-- 에디터를 삽입할 textarea --> 
							<c:if test="${not empty DocumentCont }">
								<textarea name="docContent" id="docContent" class="form-control" >${DocumentCont.dtCont}</textarea>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table table-bordered">
				<tr>
					<td><label for="exampleInputFile">File input</label> 
						<input type="file" class="form-control-file" id="exampleInputFile"/>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<!-- Modal - Static backdrop, modal-lg, centered -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">결재선 선택</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <!-- 모달창 최대 높이, 넘으면 스크롤 적용 -->
      <div class="modal-body">
        <div class="row">
          <div class="col-md-6">
            <div id="modalEmpFancyTree" style="overflow-y: auto; max-height: 600px;">
              <!-- 좌측 공간 - ajax 로 가져온 직원목록 팬시트리 삽입 부분 -->
            </div>
          </div>
		  <div class="col-md-6">
			<!-- 가로 스크롤 없이, 가로길이 넘으면 줄바꿈처리 -->
		    <div id="modalSelectEmp" style="overflow-y: auto; max-height: 300px; overflow-x: hidden; word-wrap: break-word;">
		        <!-- 우측 공간1 - 선택한 직원 배치할 부분 -->
<!-- 				우측공간test 1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111 -->
		    </div>
		    <div id="modalSelectDep" style="overflow-y: auto; max-height: 200px; overflow-x: hidden; word-wrap: break-word;">
		        <!-- 우측 공간2 - 선택한 수신처 배치할 부분 -->
<!-- 				우측공간test 2222222222222222222222222222222222222222222222222222222222222222222222222222 -->
		    </div>
		  </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">선택완료</button>
      </div>
    </div>
  </div>
</div>


<script>
	// docContent 영역에 CKEditor 적용
	CKEDITOR.replace('docContent');
	
	// Modal 
	$(document).ready(function () {
		// ajax 로 empfancytree 내용 가져오기
		$("#signPath").click(function() {
			$.ajax({
				url: "${pageContext.request.contextPath}/ed/approval/empfancytree.do",
				method: "GET",
				success: function (data) {
					// 가져온 페이지 내용을 모달 내부에 삽입
					$("#modalEmpFancyTree").html(data);
					// 모달 열기
					$("#staticBackdrop").modal("show");
				},
				error: function () {
					console.error("Failed to load");
				}
			});
		});
	});
	// modalEmpFancyTree 요소 더블클릭 시 modalSelectEmp에 뜨도록 해야함!
	// 조건 : 자식노드만 선택 가능, 동일인물 선택 불가, text로만 가져오는게 아니라 선택도 가능해야함.
	$(document).on("dblclick", "#modalEmpFancyTree .fancytree-node", function () {
		var selectedNodeText = $(this).find(".fancytree-title").text();
		var selectedNode = $("<div>").text(selectedNodeText);
		$("#modalSelectEmp").append(selectedNode);
	});
</script>




