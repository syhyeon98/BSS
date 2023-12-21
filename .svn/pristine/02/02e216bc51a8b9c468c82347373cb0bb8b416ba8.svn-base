<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<style>
.table-centered td {
	text-align: center;
}

.table-centered td {
        text-align: center;
    }

/* 특정 부분의 스타일 변경 */
    .gray-text {
     color: gray; /* 텍스트 색상을 회색으로 지정 */
    }
</style>
<meta charset="UTF-8">
<title>채팅방 목록</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h4 class="mt-3">"${empName}"님의채팅방</h4>
		<input type="button" value="채팅방 생성" id="createChatRoom"class="btn btn-success mt-2" data-toggle="modal"data-target="#myModal" />
		<div class="table-responsive mt-3">
			<table class="table table-bordered table-centered">
				<thead class="thead-dark">
					<tr>
						<th>채팅방 이름</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody id="listBody">
					<c:choose>
						<c:when test="${empty chatRoomList}">
							<tr>
								<td colspan="3" class="text-center">채팅방이 존재하지 않습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${chatRoomList}" var="chatRoom">
								<tr class="data" data-source="${chatRoom.roomNo }">
								    <td>${chatRoom.roomName} <span class="gray-text">(${chatRoom.cntEmp})</span></td>
								    <td></td>
								    <td></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	<form:form method="post" modelAttribute="chatRoom">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<form id="createChatRoomForm" action="${pageContext.request.contextPath}/chatRoomCreate.do" method="post">
							<div class="form-group">
								<label for="privateRoom">채팅방 설정</label>
								<div class="form-check">
									<input type="radio" class="form-check-input" id="keepRoom"
										name="roomType" value="public" required> <label
										class="form-check-label" for="publicRoom">일반</label>
								</div>
								<div class="form-check">
									<input type="radio" class="form-check-input" id="onceRoom"
										name="roomType" value="private" required> <label
										class="form-check-label" for="privateRoom">일회성</label>
								</div>
							</div>
							<div class="form-group">
								<label for="roomName">채팅방 이름</label> <input type="text"
									class="form-control" id="roomName" name="roomName" required>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary"
							id="createChatRoomButton">생성</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</form:form>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
// 		$(searchBtn).on("click", function(event) {
// 			$(searchUI).find(":input[name]").each(function(idx, input) {
// 				let name = input.name;
// 				let value = $(input).val();
// 				$(searchForm).find(`[name=\${name}]`).val(value);
// 			});
// 			$(searchForm).submit();
// 		});
		$(document).ready(function() {
			$("tr.data").on("click", function() {
	            var roomNo = $(this).data("source");
	            var url = "<%= request.getContextPath() %>/chatRoomDetail/selectChatRoomDetail.do?roomNo=" + roomNo;
	            var chatRoomDetail = window.open(url, "chatRoomDetail", "width=550,height=800");
	        });
			
			$("createChatRoomButton").click(function() {
				var selectedRoomType = $(
						"input[name='roomType']:checked")
						.val();
				var roomName = $("#roomName")
						.val();
	
				if (selectedRoomType) {
					if (roomName) {
						location.href = "chatRoom.do?roomType="
								+ selectedRoomType+ "&roomName="
								+ encodeURIComponent(roomName);
					} else {
						alert("채팅방 이름을 입력해주세요.");
					}
				} else {
					alert("채팅방 설정을 선택해주세요.");
				}
			});
		});
	</script>
</body>
</html>