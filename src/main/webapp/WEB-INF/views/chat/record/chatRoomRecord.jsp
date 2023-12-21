=<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html style="height: 100%;">
<head>
<meta charset="UTF-8">
<title>채팅방</title>

<style>
body {
	background-color: #f5f5f5;
	margin: 0;
	font-family: Arial, sans-serif;
}

.container {
	max-width: 1200px;
	height: 100vh;
	display: flex;
	flex-direction: column;
}

#chat-container {
	flex: 1;
	border: 1px solid #ccc;
	overflow: auto;
	padding: 20px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

#message-input {
	flex: 1;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 8px;
}

#send-button {
	width: 80px;
	margin-left: 10px;
	border: none;
	border-radius: 8px;
	background-color: #007bff;
	color: white;
	cursor: pointer;
}

.input-container {
	display: flex;
	align-items: center;
	margin-top: 10px;
}

#chat-title {
	font-size: 24px;
	margin-bottom: 20px;
	margin-top: 5%; /* 여기에 추가 */
}

#chat-title {
	font-size: 24px;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<h4 id="chat-title">${roomName}(${cntEmp})</h4>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#exampleModal">초대</button>
			</div>
		</div>
		<div id="chat-container">
			<div id="chat-messages"></div>
		</div>
		<div class="input-container">
			<input type="text" id="message-input" placeholder="메시지를 입력하세요">
			<button id="send-button">전송</button>
		</div>
	</div>
	<!-- Button trigger modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
						title</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
					<div class="modal-body">
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
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>