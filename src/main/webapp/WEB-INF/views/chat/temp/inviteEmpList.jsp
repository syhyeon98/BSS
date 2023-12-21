<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방 생성</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.container-fluid {
	max-width: 1200px;
	margin: auto;
	padding: 20px;
}

.table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.table th, .table td {
	padding: 10px;
	text-align: center;
}

.thead-dark {
	background-color: #343a40;
	color: white;
}

.data:hover {
	background-color: #f8f9fa;
}

.chat-invite {
	float: left; /* Float the chat invite section to the left */
	margin-right: 20px; /* Add some spacing between the sections */
}

.search-form {
	overflow: hidden; /* Clear floats within the search form */
}

.search-form label {
	display: block; /* Display each form element on a new line */
	margin-bottom: 5px; /* Add spacing between elements */
}

.btn-invite {
	text-align: right; /* Right-align content */
	background-color: gray;
	margin-left: 50px;
}
</style>
</head>
<body>
	<div class="container-fluid mt-4">
		<div id="searchUI" class="chat-invite">
			<h4>채팅방 초대</h4>
			<form:select path="simpleCondition.searchType" class="form-select">
				<form:option value="" label="전체" />
				<form:option value="empName" label="이름" />
				<form:option value="empDept" label="부서" />
				<form:option value="empPo" label="직급" />
			</form:select>
			<form:input path="simpleCondition.searchWord" class="form-control" />
			<input type="button" value="검색" id="searchBtn" class="btn btn-success" />
			<input  type="button" value="초대" id="invite" class="btn btn-invite"/>
			<br>
			<br>
		</div>
		<!-- 검색 폼 -->
        <form:form id="searchForm" modelAttribute="simpleCondition">
            <form:hidden path="searchType" />
            <form:hidden path="searchWord" />
            <input type="hidden" name="page" />
        </form:form>
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead class="thead-dark">
					<tr>
						<th></th>
						<th>이름</th>
						<th>부서</th>
						<th>직급</th>
					</tr>
				</thead>
				<tbody id="listBody">
					<c:forEach items="${empList}" var="emp">
						<tr class="data" data-source="${emp.empCd}">
							<td><input type="checkbox" class="empCheckBox"
								value="${emp.empCd}"></td>
							<td>${emp.empName }</td>
							<td>${emp.depName}</td>
							<td>${emp.poName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#searchBtn").on("click", function(event) {
                $(searchUI).find(":input[name]").each(function(idx, input) {
                    let name = input.name;
                    let value = $(input).val();
                    $(searchForm).find(`[name=\${name}]`).val(value);
                });
                $(searchForm).submit();
            });

            $("#listBody").on("click", "tr.data", function(event) {
                if (!$(event.target).is('input:checkbox')) {
                    let empCd = $(this).data("source");
                    location.href = "chatRoomInviteEmp.do?empCd=" + empCd;
                }
            });

            $("#listBody").on("change", ".empCheckBox", function(event) {
                event.stopPropagation();
                let selectedEmpCd = $(this).val();
                console.log("Selected Emp Cd:", selectedEmpCd);
            });

            $("#invite").click(function(){
                let selectEmpCds = [];

                $(".empCheckBox:checked").each(function(){
                    selectEmpCds.push($(this).val());
                });

                if(selectEmpCds.length > 0){
                    location.href = "/BSS/chatRoom/chatRoomInviteEmp.do?empCds=" + selectEmpCds.join(",");
                }else{
                    alert("초대할 사원을 선택해 주세요.");
                }
            });
        });
    </script>
</body>
</html>