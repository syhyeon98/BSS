<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!-- 임시 -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js"></script> 

<script src="${pageContext.request.contextPath}/resources/js/fancytree/jquery.fancytree-all-deps.min.js"></script>

    <link href="${pageContext.request.contextPath}/resources/js/fancytree/skin-win8/ui.fancytree.min.css" rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/fancytree/jquery.fancytree-all-deps.min.js"></script>

<style>
.mar {
	margin-bottom: 15px;
}
</style>
<div class="row">
	<div class="col-md-7">
		<h5>☗ 전자결재 ▸ 기타설정 ▸ 결재선 관리</h5>
		<hr color="black"/>
		<div class="p-3">
			<div class="row justify-content-end mar">
				<div class="col-auto">
					<a class="btn btn-primary" id="addPathBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop1" href="#staticBackdrop1">추가</a>
					<button id="deletePathBtn" type="button" class="btn btn-secondary">
						삭제
					</button> 
				</div>
			</div>		
			<div  id="tableContainer">
				
			</div>
		</div>
	</div>
	<div class="col-md-1"></div>
	<div class="col-md-4">
			<h5>☗ 전자결재 ▸ 기타설정 ▸ 도장관리</h5>
			<hr color="black"/>
		<div class="p-3">
			<h5>도장관리</h5>
			<div class="row justify-content-end mar">
				<div class="col-auto">
				<c:if test="${atchFileDetailList !=null && atchFileDetailList.size()>0 }">
					<a class="btn btn-primary" id="updateSignBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop3" href="#staticBackdrop3">수정</a>
				</c:if>
				<c:if test="${atchFileDetailList ==null ||  atchFileDetailList.size()<1}">
					<a class="btn btn-primary" id="addSignBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" href="#staticBackdrop2">추가</a>
				</c:if>
					<button id="deleteSignBtn" type="button" class="btn btn-secondary">
						삭제
					</button> 
				</div>
			</div>
			<div id="currentImg" class="text-center">
				<c:if test="${atchFileDetailList !=null && atchFileDetailList.size()>0 }">
					<h5>현재 도장</h5>
					<img width="200px" alt="도장" src="${ pageContext.request.contextPath}/resources/docFile/${atchFileDetailList[0].outAtchNm }">
				</c:if>
			</div>
		</div>
	</div>
</div>



<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">결재선 선택</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div >
						<div id="modalEmpFancyTree"
							style="overflow-y: auto; max-height: 600px;">
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" id="createFinish" class="btn btn-primary">선택완료</button>
			</div>
		</div>
	</div>
</div>

<!-- 도장추가 모달 -->
<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">도장추가</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="d-flex justify-content-center">
						<form id="uploadForm">
							<input type="file" name="signImgFiles" id="signImgFiles" onchange="setThumbnail(event);">
						</form>
					</div>
					<div id="image_container"></div>
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" id="createSignImg" class="btn btn-primary">선택완료</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">도장수정</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="d-flex justify-content-center">
						<form id="uploadForm2">
							<input type="file" name="signImgFiles" id="signImgFiles" onchange="setThumbnail2(event);">
						</form>
					</div>
					
					<div id="image_container2" class="d-flex justify-content-center mt-2">
						<h5 class="text-center">미리보기</h5>
					</div>
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" id="uploadSignImg" class="btn btn-primary">선택완료</button>
			</div>
		</div>
	</div>
</div>

<script>

let data;

$(document).ready(function() {
	data ={
			currentPage:1
		}
	callDocumentList(data);
});

// 페이지 선택시
function fn_paging(page){
	data ={
		currentPage:page
	}
	callDocumentList(data)
};

function callDocumentList(data){
	let setting = {
			url : `${pageContext.request.contextPath}/ed/approval/signpathSaveList.do`,
			method : "POST",
			dataType : "text",
			data : JSON.stringify(data),
			contentType:"application/json",
			success : function(resp) {
				$("#tableContainer").html(resp)
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	}


	$("#addPathBtn").click(function() 
		{$.ajax({
			url : "${pageContext.request.contextPath}/ed/approval/empfancytree.do",
			method : "GET",
			success : function(data) {
				// 가져온 페이지 내용을 모달 내부에 삽입
				$("#modalEmpFancyTree").html(data);
				// 모달 열기
				$("#staticBackdrop1").modal("show");
			},
			error : function() {
			console.error("Failed to load");
			}
		});
	});

	$("#createFinish").on("click",function(){
		if($("#modalEmpFancyTree").find("#signpathNm").val() == null || $("#modalEmpFancyTree").find("#signpathNm").val()==""){
			alert("결재선명을 입력해주세요")
			return;
		}
		let count =0;
		let selectEmps = $("#modalEmpFancyTree").find(".selectEmp");
		let selectMethods = $("#modalEmpFancyTree").find(".selectMethod");
		let signpathNm = $("#modalEmpFancyTree").find("#signpathNm").val();
		let formInput="";		
		
		let selectEmpCodes = [];
		let selectMethodsCodes =[];
		let selectSn=[];
		
		for(let i = 0 ; i< selectEmps.length;i++){
			
			let selectEmp = selectEmps[i]; 
			let selectMethod = selectMethods[i];
			
			console.log(selectEmp.dataset.empcd)
			console.log("selectMethod :" + selectMethod.selectedIndex)
			
			selectEmpCodes.push(selectEmp.dataset.empcd);
			selectMethodsCodes.push(selectMethod.value);
			selectSn.push(i);
			
		}
		//$("#test").append(formInput)
		
		
		let data={
			signpathNm : signpathNm,
			selectEmpCodes:selectEmpCodes,
			selectMethodsCodes:selectMethodsCodes,
			selectSn:selectSn
		}
		
		// ajax로 결재선 생성
		let setting = {
			url : `${pageContext.request.contextPath}/ed/document/signPathCreate.do`,
			method : "POST",
			dataType : "json",
			data : JSON.stringify(data),
			contentType:"application/json",
			success : function(resp) {
				data ={
						currentPage:1
					}
				callDocumentList(data);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
		$("#staticBackdrop1").modal("hide");
	})
	
	
	$("#deletePathBtn").on("click",function(){
		let checkSignNo = $("input[name=checkSignNo]:checked");
		let signNoArr =[];
		checkSignNo.each(function(idx,value){
			signNoArr.push(value.value)
		})
		data ={
			signpathNo:signNoArr
		}
		
		// ajax로 결재선 생성
		let setting = {
			url : `${pageContext.request.contextPath}/ed/approval/signPathDelete.do`,
			method : "POST",
			dataType : "json",
			data : JSON.stringify(data),
			contentType:"application/json",
			success : function(resp) {
				data ={
						currentPage:1
					}
				callDocumentList(data);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	})
	
	$("#createSignImg").on("click",function(){
		let form = $("#uploadForm")[0];
		let  formData = new FormData(form);
		let setting = {
			url : `${pageContext.request.contextPath}/ed/approval/signImageInsert.do`,
			method : "POST",
			data : formData,
	        contentType : false,
	        processData : false,
			success : function(resp) {
				console.log(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}

		$.ajax(setting);
	})
	$("#uploadSignImg").on("click",function(){
		let form = $("#uploadForm2")[0];
		let  formData = new FormData(form);
		let setting = {
			url : `${pageContext.request.contextPath}/ed/approval/signImageInsert.do`,
			method : "POST",
			data : formData,
	        contentType : false,
	        processData : false,
			success : function(resp) {
				console.log(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}

		$.ajax(setting);
	})
	
	
	// 이미지 미리보기
	function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
	
	// 이미지 미리보기
	function setThumbnail2(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container2").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
	
</script>




