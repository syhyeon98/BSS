<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
.form-control {
	width: 100%;
}
</style>

<form:form modelAttribute="attendVO" action="${pageContext.request.contextPath }/mypage/mypageAttendUpdate.do" method="post" id="">
<table class="table table-bordered table-hover" style="width: 88%;">
<tr>
	<th>번호</th>
	<td><form:input readonly="true" class="form-control" type="number" path="atteNo" />
		<form:errors class="error" path="atteNo" /></td>
</tr>
<tr>
	<th>이름</th>
	<td><form:input readonly="true" class="form-control" type="text" path="empName" />
		<form:errors class="error" path="empName" /></td>
</tr>
<tr>
	<th>사번</th>
	<td><form:input readonly="true" class="form-control" type="text" path="empCd" />
		<form:errors class="error" path="empCd" /></td>
</tr>
<tr>
	<th>부서</th>
	<td><form:input readonly="true" class="form-control" type="text" path="depName" />
		<form:errors class="error" path="depName" /></td>
</tr>
<tr>
	<th>출근시간</th>
	<td><form:input class="form-control" type="datetime-local" path="atteStime" />
		<form:errors class="error" path="atteStime" /></td>
</tr>
<tr>
	<th>퇴근시간</th>
	<td><form:input class="form-control" type="datetime-local" path="atteEnd" />
		<form:errors class="error" path="atteEnd" /></td>
</tr>
<tr>
	<th>출근일</th>
	<td><form:input class="form-control" type="date"  path="atteDate" />
		<form:errors class="error" path="atteDate" /></td>
</tr>
<tr>
	<td colspan = "2">
		<button type="button" class="btn btn-primary" id="atteUpdate" >수정</button>
		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	</td>

</tr>
</table>
</form:form>

<script>
$('#atteUpdate').on('click', function(e){
    e.preventDefault(); // 기본 폼 제출 동작을 막음
    var successMessage = "<%= request.getAttribute("message") %>";
    if (successMessage) {
        Swal.fire({
            title: '연가 수정이 완료되었습니다.',        
            icon: 'success',
            timer: 5000 // 5초 동안 알림창 표시
        }).then(function() {
            // SweetAlert 알림창이 닫힌 후에 폼을 제출
            $('#atteUpdate').submit();
            
            location.reload();
        });
    }
});


</script>
