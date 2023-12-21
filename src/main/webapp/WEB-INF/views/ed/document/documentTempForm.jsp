<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js"></script> 

<script src="${pageContext.request.contextPath}/resources/js/fancytree/jquery.fancytree-all-deps.min.js"></script>

    <link href="${pageContext.request.contextPath}/resources/js/fancytree/skin-win8/ui.fancytree.min.css" rel="stylesheet">
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
	<div class="container m-auto row border border-black">
		<div class="col-md-12">
		
		<!-- controller -->
		<form:form modelAttribute="documentVO" method="post" enctype="multipart/form-data" name="reqForm"> 
		<input type="hidden" value="${documentVO.docNo }" name="docNo">
		<div id="test"></div>
			<div class="row justify-content-end mar">
				<div class="col-auto">
					<div class="btn-group">
					  <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
					    결재선
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" id="signPath" data-bs-toggle="modal" data-bs-target="#staticBackdrop1" href="#staticBackdrop1">신규</a></li>
					    <li><a class="dropdown-item" id="saveSignPath" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" href="#staticBackdrop2" >불러오기</a></li>
					  </ul>
					</div>
					<a type="button" id="helpBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop3" href="#staticBackdrop3" class="btn btn-outline-secondary">참조</a>
					<button id="reqButton" type="button" class="btn btn-primary">결재요청</button>
					<button id="tempButton" type="button" class="btn btn-outline-secondary">임시저장</button>
					<button type="button" class="btn btn-outline-secondary"
						onclick="goBack()">작성취소</button>
				</div>
			</div>
			<div class="row textCen">
				<div class="col-md-3">
					<table class="table table-bordered mb-4">
						<!-- mb-4: 아래쪽 간격 추가 -->
						<tr class="textCenter">
							<td class="table-secondary">결재번호</td>
						</tr>
						<tr class="textCenter">
<!-- 							<td class="textGray">승인 시 자동채번</td> -->
							<td  class="textGray">
								<form:hidden path="docSign"/>승인 시 자동채번 
								<form:errors path="docSign" class="error" />
							</td>
						</tr>
					</table>
				</div>
				<div class="col-md-9">
					<table class="table table-bordered" id="signpathTable">
						<!-- mb-4: 아래쪽 간격 추가 -->
						<tr class="textCenter">
							<!-- 나중에 br없애고 세로가운데 정렬하기 -->
							<td rowspan="2" class="table-secondary "></br>결</br> </br>재</td>
							<c:forEach items="${signpathEmpList }" var="sighPath" varStatus="i">
								<input type="hidden" name="signpathNo" value="${sighPath.signpathNo}"/> 
								<td id="apprMethod${i.index }">${sighPath.codeMethodName}</td>
							</c:forEach>
						</tr>
						<tr class="textCenter">
							<c:forEach items="${signpathEmpList }" var="sighPath" varStatus="i">
								<td id="apprEmp${i.index}">${sighPath.empName} ${sighPath.poName}</td>
							</c:forEach>
						</tr>
						<tr class="textCenter">
							<td class="table-secondary ">참조</td>
							<td id="SD_03" colspan="5"></td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class="row" id="depCondition">
						<div class="col-md-1"> 수신처</div>
						<div class="col-md-11">
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="checkbox"  id="department_chkAll" value="">
							  <label class="form-check-label" for="department_chkAll">전체</label>
							 </div>
							 <c:forEach items="${departmentList}" var="department">
							    <div class="form-check form-check-inline">
							        <input class="form-check-input" type="checkbox" id="department_${department.depCd}" name="depCdList" value="${department.depCd}"
							        <c:forEach items="${selectDepDocumentList}" var="selectDep">
							            <c:if test="${selectDep.depCd eq department.depCd}">
							                checked
							            </c:if>
							        </c:forEach>
							        >
       							 <label class="form-check-label" for="department_${department.depCd}">${department.depName}</label>
							    </div>
							</c:forEach>
						</div>
			</div>
			
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="table-secondary cellWidth">문서유형</td>
						<td>${DocumentCont.dtName }</td>
						<input type="hidden" value="${DocumentCont.dtNo }" name="dtNo"/>
						<input type="hidden" value="${DocumentCont.dtGroup }" name="docType" >
						<td class="table-secondary cellWidth">기안일자</td>
						<td class="textGray">
							<form:hidden path="docSign"/>기안 시 자동부여
							<form:errors path="docSign" class="error" />
						</td>
					</tr>
					<tr>
						<security:authentication property="principal.realUser"
							var="authEmployee" />
						<td class="table-secondary cellWidth">기 안 자</td>
						<input type="hidden" name="empCd" value="${authEmployee.empCd }">
						<td>
						    <form:input path="empName" class="form-control" 
						    	value="${authEmployee.empName}" readonly="true"/>
						    <form:errors path="empName" class="error" />
						</td>
						

						<td class="table-secondary cellWidth">기안부서</td>
						<td>
							<form:input path="depName" class="form-control" 
						    	value="${authEmployee.depName}" readonly="true"/>
						    <form:errors path="depName" class="error" />
						</td>
					</tr>
					<tr>
						<td class="table-secondary cellWidth">문서제목</td>
							<td colspan="3">
						        <form:input path="docTitle" class="form-control"/>
						        <form:errors path="docTitle" class="error" />
						    </td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td colspan="4" class="table-secondary textCenter">문서내용</td>
					</tr>
					<tr>
						<td colspan="4">
							<!-- 에디터를 삽입할 textarea --> <c:if test="${not empty documentVO }">
								<textarea name="docContent" id="docContent">${documentVO.docContent}</textarea>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table table-bordered">
				<tr>
					<td><label for="exampleInputFile">File input</label> <input
						type="file" class="form-control-file" name="documentFiles" id="exampleInputFile" multiple /></td>
				</tr>
			</table>
			</form:form>
		</div>
	</div>
</div> 

<!-- Modal - Static backdrop, modal-lg, centered -->
<!-- 결재선 만들기 -->
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
			<!-- 모달창 최대 높이, 넘으면 스크롤 적용 -->
			<div class="modal-body">
				<div class="row">
					<div >
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
				<button type="button" id="createFinish" class="btn btn-primary">선택완료</button>
			</div>
		</div>
	</div>
	
</div>

<!-- Modal - Static backdrop, modal-lg, centered -->
<!-- 결재선 불러오기 -->
<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel2" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel2">결재선 선택</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<!-- 모달창 최대 높이, 넘으면 스크롤 적용 -->
			<div class="modal-body">
				<div id="listSignPath">
				
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

<!-- 참조 -->
<div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel3" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel3">참조자 선택</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<!-- 모달창 최대 높이, 넘으면 스크롤 적용 -->
			<div class="modal-body">
				<div class="row">
					<div >
						<div id="modalEmpHelpFancyTree" style="overflow-y: auto; max-height: 600px;">
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" id="selectHelpEmp" class="btn btn-primary">선택완료</button>
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
		
		
	});
	
	// 참조자선택
	$("#helpBtn").click(function() 
		{$.ajax({
			url : "${pageContext.request.contextPath}/ed/approval/empfancytree2.do",
			method : "GET",
			success : function(data) {
				// 가져온 페이지 내용을 모달 내부에 삽입
				$("#modalEmpHelpFancyTree").html(data);
				// 모달 열기
				$("#staticBackdrop3").modal("show");
			},
			error : function() {
			console.error("Failed to load");
			}
		});
	});
		// ajax 로 empfancytree 내용 가져오기
		$("#signPath").click(function() 
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
	

	
	
	
	
	/* 문영택 
		- 결재선 -> 신규 -> 선택완료
	*/
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
			
			//var selectEmpCd  =  selectEmp.dataset.empcd; // 선택된 결재자의 사번
			//var selectedIndex = selectMethod.selectedIndex; // 선택된 option
			//var selectedCode = selectMethod[selectedIndex].value;
			//var selectedInnerText = selectMethod[selectedIndex].innerText;
			//
			//if(selectMethod.value!='SD_03'){
			//	$(`#apprEmp\${count}`).html(selectEmp);
			//	$(`#apprMethod\${count}`).html(selectedInnerText);
			//	count++;
			//}else{
			//	$("#SD_03").append(selectEmp.innerText);
			//}
			//formInput += `<input type="hidden" value="\${selectEmpCd}" name="signPathDetailList[\${i}].empCd">
            //   				<input type="hidden" value="\${selectedCode}" name="signPathDetailList[\${i}].code">`		
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
				console.log(resp);
				let table;
				let signpathDetailList = resp.signpathDetailList;
				console.log(signpathDetailList)
				// 결재방법
				table =`<input type="hidden" name="signpathNo" value="\${signpathDetailList[0].signpathNo}"> 
				<tr class="textCenter">
					<td rowspan="2" class="table-secondary "></br>결</br> </br>재</td>`
				for(let idx = 0 ; idx<signpathDetailList.length;idx++){
					let i=0;
					if(signpathDetailList[idx].codeMethod!="SD_03"){
						table+=`<td id="apprMethod\${i}">\${signpathDetailList[idx].codeMethodName}</td>`
					}
				}
				table+=`</tr>`
				// 결재자
				let appCount=0;
				table +=`<tr class="textCenter">`
					for(let idx = 0 ; idx<signpathDetailList.length;idx++){
					let i=0;
					if(signpathDetailList[idx].codeMethod!="SD_03"){
						appCount++;
						table+=`<td id="apprEmp\${i}">\${signpathDetailList[idx].empName} \${signpathDetailList[idx].poName}</td>`
					}
				}
				table+=`</tr>`
					table +=`<tr class="textCenter"><td class="table-secondary ">참조</td><td  colspan="\${appCount}">
						<div id="SD_03" class="d-flex"></div>
					`
					
					table+=`</td></tr>`
				$("#signpathTable").html(table);
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
	
	/* 불러오기 시 */
	$("#saveSignPath").on("click",function(){
		let html="";
		$("#listSignPath").text("");
		let signpathArr=[];
		let setting = {
			url : `${pageContext.request.contextPath}/ed/document/signPathList.do`,
			method : "POST",
			dataType : "json",
			success : function(resp) {
				let data = resp.signpathDetailList;
				
				const groupedData = {};

				data.forEach(item => {
				    const signpathNo = item.signpathNo;
				    if (!groupedData[signpathNo]) {
				        groupedData[signpathNo] = [];
				    }
				    groupedData[signpathNo].push(item);
				});

				for (const signpathNo in groupedData) {
				    html=`<div class="d-flex form-check" data-signpathno="\${signpathNo}"> 
				    		<input type="radio" class="form-check-input" name="savedSignpath" value="\${signpathNo}" id="select\${signpathNo}">
				    		<label class="form-check-label d-flex " for="select\${signpathNo}">
				    		<div class="me-3">\${groupedData[signpathNo][0].signpathNm}</div> `
					console.log(`signpathNo \${signpathNo}:`);
				    groupedData[signpathNo].forEach(item => {
				        console.log(item);
				        html+=`<div class="me-3"> \${item.empName} \${item.poName} (\${item.codeMethodName})</div>`
				    });
				    html+=`</label></div>`
// 				    signpathArr.push(groupedData[signpathNo])
				    console.log();
					$("#listSignPath").append(html);
				}
// 				console.log(signpathArr)
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}

		$.ajax(setting);
	})
	
	/* 불러온 결재선 선택 */
	$("#selectFinish").on("click",function(){
		
		let checkedSignpath = $("input[name='savedSignpath']:checked").val();
		if(checkedSignpath==null || checkedSignpath==""){ // 결재선을 선택 안했을 시
			alert("결재선을 선택해주세요")
		}else{ // 결재선을 선택했을시
			let setting = {
					url : `${pageContext.request.contextPath}/ed/document/signPathList.do`,
					method : "POST",
					dataType : "json",
					data:{
						signpathNo : checkedSignpath
					},
					success : function(resp) {
						console.log(resp)
						let table;
						let signpathDetailList = resp.signpathDetailList;
						console.log(signpathDetailList)
						// 결재방법
						table =`<input type="hidden" name="signpathNo" value="\${signpathDetailList[0].signpathNo}"> <tr class="textCenter">
							<td rowspan="2" class="table-secondary "></br>결</br> </br>재</td>`
						for(let idx = 0 ; idx<signpathDetailList.length;idx++){
							let i=0;
							if(signpathDetailList[idx].codeMethod!="SD_03"){
								table+=`<td id="apprMethod\${i}">\${signpathDetailList[idx].codeMethodName}</td>`
							}
						}
						table+=`</tr>`
						// 결재자
						let appCount=0;
						table +=`<tr class="textCenter">`
							for(let idx = 0 ; idx<signpathDetailList.length;idx++){
							let i=0;
							if(signpathDetailList[idx].codeMethod!="SD_03"){
								appCount++;
								table+=`<td id="apprEmp\${i}">\${signpathDetailList[idx].empName} \${signpathDetailList[idx].poName}</td>`
							}
						}
						table+=`</tr>`
// 						참조테이블
						table +=`<tr class="textCenter"><td class="table-secondary ">참조</td><td id="SD_03" colspan="\${appCount}">`
						for(let idx = 0 ; idx<signpathDetailList.length;idx++){
							let i=0;
							if(signpathDetailList[idx].codeMethod=="SD_03"){
								table+=`<span id="helpEmp\${i}">\${signpathDetailList[idx].empName} \${signpathDetailList[idx].poName}</span>`
							}
						}
						table+=`</td></tr>`
						$("#signpathTable").html(table);
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR)
						console.log(status)
						console.log(error)
					}
				}

				$.ajax(setting);
		}
		$("#staticBackdrop2").modal("hide");
	})
	
	
	$("#selectHelpEmp").on("click",function(){
		let count =0;
		let selectEmps = $("#modalEmpHelpFancyTree").find(".selectEmp");
		let formInput="";		
		
		let selectEmpCodes = [];
		let html = `<div class="d-flex">`
		for(let i = 0 ; i< selectEmps.length;i++){
			
			let selectEmp = selectEmps[i]; 
			
			console.log(selectEmp.dataset.empcd)
			
			selectEmpCodes.push(selectEmp.dataset.empcd);
			
			let selectEmpCd  =  selectEmp.dataset.empcd; // 선택된 결재자의 사번
			let selectedCode = "SD_03"
			
			console.log(selectEmpCd)
			
			html += `<div class="d-flex me-2"><div class="me-1 bg-primary-subtle rounded-4 p-1" data-empcd="\${selectEmpCd}">\${selectEmp.innerText}</div> <a href="javascript:void(0);" onclick="deleteHelp(this)">x</a></div>`
			formInput += `<input type="hidden" value="\${selectEmpCd}"  name="signPathDetailList[\${i}].empCd">
              				<input type="hidden" value="\${selectedCode}" name="signPathDetailList[\${i}].code">`
		}     
		html+=`</div>`
		console.log(html);
// 		$("#SD_03").append(selectEmp.innerText);
		$("#SD_03").append(html);
		$(reqForm).append(formInput);
		$("#staticBackdrop3").modal("hide");
	});
	
		function deleteHelp(linkElement){
			let empCd=$(linkElement).siblings().data("empcd");
			$(linkElement).parent().remove();
			let helpInpArr = $("input[class=helpInp]");
			helpInpArr.each(function(idx,value){
				if(value.value==empCd){
					$(value).parent().remove();
				}
			})
		}
		
		
		
	/* 수신처 체크박스*/
	$('#department_chkAll').on('click',function(){
		
		if($('#department_chkAll').is(':checked')){
			$('#depCondition').find("input:checkbox").prop("checked",true)
		}else{
			$('#depCondition').find("input:checkbox").prop("checked",false)
		}
	})
	$('#depCondition').find("input:checkbox").not("#department_chkAll").on('click',function(){
	// 	alert("click")
		let checkedNum = $('#depCondition').find("input:checked").not("#department_chkAll").length;
		let checkBoxAll=$('#bankCondition').find("input:checkbox").not("#department_chkAll").length;
		if(checkedNum==checkBoxAll){
			$('#department_chkAll').prop("checked",true)
		}else {
			$('#department_chkAll').prop("checked",false)
		}
	})
	
		
		
		
		
		
	/* 결재요청 */
	$("#reqButton").on("click",function(){
		let html = `<input type="hidden" name="code" value="D_01"/>`
		$(reqForm).append(html)
		$(reqForm).attr("action","${pageContext.request.contextPath}/ed/document/documentTempUpdate.do").submit();		
	})
	
	/* 임시저장 */
	$("#tempButton").on("click",function(){
		let html = `<input type="hidden" name="code" value="D_03"/>`
		$(reqForm).append(html)
		$(reqForm).attr("action","${pageContext.request.contextPath}/ed/document/documentTempUpdate.do").submit();		
	})
	
	
	
	// modalEmpFancyTree 요소 더블클릭 시 modalSelectEmp에 뜨도록 해야함!
	// FancyTree 라이브러리 - 트리 노드:fancytree-node, 선택된 노드:fancytree-selected
	// 부모 :fancytree-ico-e? 자식 : fancytree-ico-c.
	// 조건 : 자식노드만 선택 가능, 동일인물 선택 불가, text로만 가져오는게 아니라 선택도 가능해야함.

// 	$(document).on("dblclick", "#modalEmpFancyTree .fancytree-ico-c",
// 			function() {
// 				let selectedNodeText = $(this).find(".fancytree-title").text();
// 				let selectedNode = $("<div>").text(selec tedNodeText);
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




