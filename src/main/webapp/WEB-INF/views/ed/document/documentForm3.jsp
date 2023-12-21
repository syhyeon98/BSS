<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!-- 기안문 작성폼 -->

<!-- 임시 -->
<style>
.mar {
	margin-bottom: 15px;
}
</style>

<script
	src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/fancytree/jquery.fancytree-all-deps.min.js"></script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">

			<div class="row justify-content-end mar">
				<div class="col-auto">
					<button type="button" class="btn btn-secondary" id="signPath"
						data-bs-toggle="modal" data-bs-target="#staticBackdrop">결재선</button>
					<button type="button" class="btn btn-primary">결재요청</button>
					<button type="button" class="btn btn-outline-secondary">임시저장</button>
					<button type="button" class="btn btn-outline-secondary"
						onclick="goBack()">작성취소</button>
				</div>
			</div>
			<div id="documentArea">
				
	
			</div>
		</div>
	</div>
</div>

<!-- Modal - Static backdrop, modal-lg, centered -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">결재선 선택</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<!-- 모달창 최대 높이, 넘으면 스크롤 적용 -->
			<div class="modal-body">
				<div class="row">
					<div class="col-md-6">
						<div id="modalEmpFancyTree"
							style="overflow-y: auto; max-height: 600px;">
							<!-- 좌측 공간 - ajax 로 가져온 직원목록 팬시트리 삽입 부분 -->
						</div>
					</div>
<!-- 					<div class="col-md-6"> -->
<!-- 						가로 스크롤 없이, 가로길이 넘으면 줄바꿈처리 -->
<!-- 						<div id="modalSelectEmp" -->
<!-- 							style="overflow-y: auto; max-height: 300px; overflow-x: hidden; word-wrap: break-word;"> -->
<!-- 							우측 공간1 - 선택한 직원 배치할 부분 -->
<!-- 						</div> -->
<!-- 						<div id="modalSelectDep" -->
<!-- 							style="overflow-y: auto; max-height: 200px; overflow-x: hidden; word-wrap: break-word;"> -->
<!-- 							우측 공간2 - 선택한 수신처 배치할 부분 -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" id="selectFinish" class="btn btn-primary">선택완료</button>
			</div>
		</div>
	</div>
</div>


<script>
	// docContent 영역에 CKEditor 적용
	CKEDITOR.replace('docContent');

	// 뒤로가기 (작성취소)
	function goBack() {
		window.history.back();
	}

	// Modal 
	$(document).ready(function() {
		// ajax 로 empfancytree 내용 가져오기
		$("#signPath").click(function() 
			{$.ajax({
				url : "${pageContext.request.contextPath}/ed/approval/empfancytree.do",
				method : "GET",
				success : function(data) {
					// 가져온 페이지 내용을 모달 내부에 삽입
					$("#modalEmpFancyTree").html(data);
					// 모달 열기
					$("#staticBackdrop").modal("show");
				},
				error : function() {
				console.error("Failed to load");
				}
			});
		});
	});
	
	function documentArea(){ let setting = {
			url : "${pageContext.request.contextPath}/ed/document/",
			method : "",
			dataType : "text",
			data : "",
			success : function(resp) {
		
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		
		$.ajax(setting);
	}
	
	/* 문영택 */
// 	$("#selectFinish").on("click",function(){
// 		alert("click")
// 		console.log($("#modalEmpFancyTree").find("#select").html())
// 		$("#a")
// 	})
	
	
	
	// modalEmpFancyTree 요소 더블클릭 시 modalSelectEmp에 뜨도록 해야함!
	// FancyTree 라이브러리 - 트리 노드:fancytree-node, 선택된 노드:fancytree-selected
	// 부모 :fancytree-ico-e? 자식 : fancytree-ico-c.
	// 조건 : 자식노드만 선택 가능, 동일인물 선택 불가, text로만 가져오는게 아니라 선택도 가능해야함.

// 	$(document).on("dblclick", "#modalEmpFancyTree .fancytree-ico-c",
// 			function() {
// 				let selectedNodeText = $(this).find(".fancytree-title").text();
// 				let selectedNode = $("<div>").text(selectedNodeText);
// 				$("#modalSelectEmp").append(selectedNode);
// 			});

	// $(document).on("dblclick", "#modalEmpFancyTree .fancytree-node", function () {
	//     var node = $(this).data("node"); // 더블클릭된 노드 가져오기
	//     if (node.isFolder()) {
	//         return; // 폴더 노드는 더블클릭할 수 없음
	//     }

	//     let selectedNodeText = node.title; // 선택된 노드의 텍스트
	//     let selectedNode = $("<div>").text(selectedNodeText);
	//     $("#modalSelectEmp").append(selectedNode);
	// });
</script>




