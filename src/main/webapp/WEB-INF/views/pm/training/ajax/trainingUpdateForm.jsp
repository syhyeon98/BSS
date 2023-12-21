<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
.form-control {
	width: 100%;
}
</style>

<form:form modelAttribute="training" action="${pageContext.request.contextPath }/pm/training/trainingUpdate.do" method="post" id="trainUpdatePost">
<table class="table table-bordered table-hover">
<form:input type="hidden" name="lectorId" path="lectorId" />
<tr>
	<th>No</th>
	<td><form:input readonly="true" class="form-control" type="number" path="trainNo" />
		<form:errors class="error" path="trainNo" /></td>
</tr>
<tr>
	<th>강사명</th>
	<td><form:input readonly="true" class="form-control" type="text" path="lectorName" />
		<form:errors class="error" path="lectorName" /></td>
</tr>
<tr>
	<th>교육일시</th>
	<td><form:input class="form-control" type="datetime-local" path="trainDate" />
		<form:errors class="error" path="trainDate" /></td>
</tr>
<tr>
	<th>교육장소</th>
	<td><form:input class="form-control" type="text" path="trainPlace" />
		<form:errors class="error" path="trainPlace" /></td>
</tr>
<tr>
	<th>소요시간(시간)</th>
	<td><form:input class="form-control" type="number" path="trainTime" />
		<form:errors class="error" path="trainTime" /></td>
</tr>
<tr>
	<th>교육대상</th>
	<td><form:input class="form-control" type="text" path="trainTarget" />
		<form:errors class="error" path="trainTarget" /></td>
</tr>
<tr>
	<th>교육정원</th>
	<td><form:input class="form-control" type="number" path="capacity" />
		<form:errors class="error" path="capacity" /></td>
</tr>
<tr>
	<th>교육명</th>
	<td><form:input class="form-control" type="text"  path="trainName" />
		<form:errors class="error" path="trainName" /></td>
</tr>
<tr>
	<th>교육내용</th>
	<td><form:textarea class="form-control" type="text" name="trainContent" path="trainContent" style="height: 300px;" />
		<form:errors class="error" path="trainContent" /></td>
</tr>
<tr>
	<th>신청마감일</th>
	<td><form:input class="form-control" type="date"  path="trainPeriod" />
		<form:errors class="error" path="trainPeriod" /></td>
</tr>
<tr>
	<th>신청방법</th>
	<td><form:input class="form-control" type="text"  path="trainSign" />
		<form:errors class="error" path="trainSign" /></td>
</tr>
<tr>
<td colspan="2"><button type="submit" class="btn btn-primary" id="trainUpdateBtn">수정</button></td>
</tr>
</table>
</form:form>


<script>
//수정 버튼을 누르면 엔터로 인한 줄띄움(\n)을 <br>태그로 변경하여 db에 저장
$("#trainUpdateBtn").on("click",function(){
// 	event.preventDefault();
	let content = $('textarea[name="trainContent"]').val().replace(/\n/g, "<br>");
	$('textarea[name="trainContent"]').val(content);
// 	console.log($('textarea[name="trainContent"]').val())
})

$("#trainUpdateBtn").on('click', function (e) {
    e.preventDefault(); // 기본 폼 제출 동작을 막음
    
    var successMessage = "<%= request.getAttribute("message") %>";
    if (successMessage) {
       Swal.fire({
          title: '교육 수정이 완료되었습니다.',        
          icon: 'success',
          timer:1000
       }).then(function() {
          $('#trainUpdatePost').submit();
       });
    };
});

</script>
