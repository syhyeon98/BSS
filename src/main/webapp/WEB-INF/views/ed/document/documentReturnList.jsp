<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<style>
.reject-comment {
	display: none;
}
</style>

<h5>☗ 전자결재 ▸ 결재문서 ▸ 반려문서함</h5>
<hr color="black" />
<button class="btn btn-outline-primary mb-2"  id="delete">선택삭제</button>
<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary textCenter">
			<th></th>
			<th>No.</th>
			<th>문서유형</th>
			<th>문서제목</th>
			<th>기안자</th>
			<th>기안일시</th>
			<th>반려자</th>
			<th>반려일시</th>
			<th>반려의견</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty documentReturnList}">
			<tr class="textCenter">
				<td colspan="9">현재 반려된 문서가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty documentReturnList}">
			<c:forEach items="${documentReturnList}" var="ret" varStatus="loop">
				<tr class="textCenter">
					<td><input class="form-check-input prdtCheckBox" type="checkbox"
										name="docNo" value="${ret.docNo }">
					</td>
					<td><c:out value="${loop.index + 1}" /></td>
					<td>${ret.docType }</td>
					<td class="textLeft"><a href="${pageContext.request.contextPath}/ed/document/documentFormView.do?docNo=${ret.docNo}">${ret.docTitle }</a></td>
					<td>${ret.empName }</td>
					<td>${ret.docUpdatedate.toString().replace('T',' ') }</td>
					<td>${ret.approvalEmpName }</td>
					<td>${ret.seDate.toString().replace('T',' ') }</td>
					<td><a href="javascript:;" class="view-link">보기</a></td>
				</tr>
				<tr class="reject-comment">
					<td colspan="8" class="table-active">[${ret.approvalEmpName }] ${ret.seReject }</td>
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

