<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h5>☗ 전자결재 ▸ 기안 ▸ 임시보관함</h5>
<hr color="black"/>
<button class="btn btn-outline-primary mb-2"  id="delete">선택삭제</button>
<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary textCenter">
			<th></th>
			<th>No.</th>
			<th>문서유형</th>
			<th>문서제목</th>
			<th>저장일시</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty documentKeepList }">
		<tr class="textCenter">
			<td colspan="5">임시저장된 문서가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${not empty documentKeepList }">
		<c:forEach items="${documentKeepList }" var="keep" varStatus="loop">
			<tr class="textCenter">
				<td><input class="form-check-input prdtCheckBox" type="checkbox"
										name="docNo" value="${keep.docNo }">
					</td>
				<td><c:out value="${loop.index + 1}" /></td> <!-- 1번부터 부여하기 위해 +1-->
				<td>${keep.dtName }</td>
				<td class="textLeft"><a href="${pageContext.request.contextPath}/ed/document/documentTempForm.do?docNo=${keep.docNo}">${keep.docTitle }</a></td>
				<td>${keep.docUpdatedate.toString().replace('T',' ') }</td>
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
</table>

<script>
	
	$("#delete").on("click",function(){
	    let selectDocNo = $('input[name="docNo"]:checked');
	    let docNo = [];
	    selectDocNo.each(function(index, value) {
	        console.log(value);
	        console.log($(value).parent("tr"))
	        docNo.push(value.value); // value는 DOM 엘리먼트이므로 .value로 실제 값을 가져와야 합니다.
	    });
	    console.log("docNo", docNo);
	    let data = {
	        docArrayNo: docNo
	    };
	    console.log(data);
		let setting = {
			url : "${pageContext.request.contextPath}/ed/document/documentTempDelete.do",
			method : "POST",
			dataType : "json",
			headers: {'Content-Type': 'application/json'},
			data : JSON.stringify(data),
			success : function(resp) {
				console.log(resp.result)
				if(resp.result){
					alert("임시저장 결재서류가 삭제되었습니다.")
					selectDocNo.each(function(index, value) {
						value.parentElement.parentElement.remove();
				    });
				}
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}

		$.ajax(setting);
	})
</script>

<!-- 
	<tbody>
	<c:set var="memberList" value="${paging.dataList }" />
	<c:if test="${empty memberList }">
		<tr>
			<td colspan="7">등록된 회원 없음.</td>
		</tr>
	</c:if>
	<c:if test="${not empty memberList }">
		<c:forEach items="${memberList }" var="member">
			<tr>
				<td>${member.rnum }</td>
				<td><a href="javascript:;" data-who="${member.memId }" data-bs-toggle="modal" data-bs-target="#exampleModal">${member.memName }</a></td>
				<td>${member.memId }</td>
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
-->

