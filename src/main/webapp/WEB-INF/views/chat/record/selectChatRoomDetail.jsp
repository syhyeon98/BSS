<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html style="height: 100%;">
<head>
<meta charset="UTF-8">
<title>채팅방</title>
<!-- Bootstrap CSS 링크 추가 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<script
	src="${pageContext.request.contextPath }/resources/template/vendor/jquery/jquery.min.js"></script>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath }/resources/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> --%>
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

.row>* {
    max-width: 100%;
    padding-right: auto;
    padding-left: auto;
    margin-top: auto;
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

.member {
    background-color: orange; /* 회색 배경색 설정 */
    color: white; /* 텍스트 색상을 회색으로 설정 */
}
</style>
</head>
<body>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script type="text/javascript">

	var webSocket = {
	 		init : function(param){
	 			this._initSocket();
	 		},
	 		sendChat : function(){
	 			console.log("val:", $('#message-input').val());
	 			this._sendMessage('CHAT_REQ', '${roomNo}', $('#message-input').val());
				$('#message-input').val('');
	 		},
	 		receiveMessage : function(msgData){
	 			let newDiv = $('<div>').text(msgData.msg).addClass("message");
				if (msgData.sender == ${empCd }) {
					newDiv.addClass("mine");
				} else {
					newDiv.addClass("other");
				}
				$('#divChatData').append(newDiv);
				scrollToBottom();
	 		},
				_initSocket: function() {
				    console.log("소캣 연결");
				    this._socket = new SockJS("<c:url value='/chat'/>");
				    
				    this._socket.onmessage = function(evt) {
				        webSocket.receiveMessage(JSON.parse(evt.data));
				    };
				},
				_sendMessage : function(type, roomNo, msg){
					console.log("type:", type);
					console.log("roomNo:", roomNo);
					console.log("msg:", msg);
					if(msg==""){
						alert("메시지를 입력해주세요.");
						return;
					}
					var msgData={
						type : type,
						roomNo : roomNo,
						msg : msg
					};
					var jsonData = JSON.stringify(msgData);
					this._socket.send(jsonData);
				}
	 		};
	
	$(window).on('load', function() {
	      webSocket.init({
	         url : '<c:url value="/chat" />'
	      });
	   });

</script>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<h4 id="chat-title">${roomName}</h4>
					<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-bs-toggle="dropdown"
						aria-expanded="false"> Ξ </a>

					<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#inviteEmp">대화 상대 초대하기</a></li>
						<li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#empList">채팅 맴버 확인</a></li>
						<li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#outChatRoom">채팅방 나가기</a></li>
					</ul>
			</div>
		</div>
		<div id="chat-container">
			<div id="chat-messages"></div>
		</div>
		<div class="input-container">
			<input type="text" id="message-input" placeholder="메시지를 입력하세요" onkeydown="handleKeyPress(event)">
			<button id="send-button" onclick="webSocket.sendChat()">전송</button>
		</div>
	</div>

<!-- 초대모달 -->
<div class="modal fade" id="inviteEmp" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">사원 목록</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 검색창 -->
                <div class="row mb-3">
                    <div id="searchUI" class="col-auto">
			                <form:select path="simpleCondition.searchType" class="form-select">
			                    <form:option value="" label="전체" />
			                    <form:option value="empName" label="이름" />
			                    <form:option value="empDept" label="부서" />
			                    <form:option value="empPo" label="직급" />
			                </form:select>
                    </div>
                    <div class="col-auto">
                        <input type="text" id="searchWord" class="form-control">
                    </div>
                    <div class="col-auto">
                        <input type="button" value="검색" id="searchBtn" class="btn btn-success"/>
                    </div>
                    <!-- 검색 폼 -->
			        <form:form id="searchForm" modelAttribute="simpleCondition">
			            <form:hidden path="searchType" />
			            <form:hidden path="searchWord" />
			            <input type="hidden" name="page" />
			        </form:form>
                </div>

                <!-- 사원 목록 테이블 -->
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
								<c:set var="memberFound" value="false" />
								<c:forEach var="empList" items="${chatUserList}">
									<c:if test="${emp.empCd eq empList.empCd }">
										<tr class="table-secondary" data-source="${emp.empCd}">
											<td>맴버</td>
											<td>${emp.empName }</td>
											<td>${emp.depName}</td>
											<td>${emp.poName}</td>
										</tr>
										<c:set var="memberFound" value="true" />
									</c:if>
								</c:forEach>
								<c:if test="${not memberFound }">
									<tr class="member" data-source="${emp.empCd}">
										<td><input type="checkbox" class="empCheckBox"
											value="${emp.empCd}"></td>
										<td>${emp.empName }</td>
										<td>${emp.depName}</td>
										<td>${emp.poName}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
            <div class="modal-footer">
                <button type="button" id="inviteEmpButton" class="btn btn-primary">초대</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
<!-- 맴버 확인 모달 -->
<div class="modal fade" id="empList" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">사원 목록</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 검색창 -->
                <div class="row mb-3">
                    <div id="searchUI" class="col-auto">
			                <form:select path="simpleCondition.searchType" class="form-select">
			                    <form:option value="" label="전체" />
			                    <form:option value="empName" label="이름" />
			                    <form:option value="empDept" label="부서" />
			                    <form:option value="empPo" label="직급" />
			                </form:select>
                    </div>
                    <div class="col-auto">
                        <input type="text" id="searchWord" class="form-control">
                    </div>
                    <div class="col-auto">
                        <input type="button" value="검색" id="searchBtn" class="btn btn-success"/>
                    </div>
                    <!-- 검색 폼 -->
			        <form:form id="searchForm" modelAttribute="simpleCondition">
			            <form:hidden path="searchType" />
			            <form:hidden path="searchWord" />
			            <input type="hidden" name="page" />
			        </form:form>
                </div>

                <!-- 사원 목록 테이블 -->
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
								<c:forEach var="empInfo" items="${empInfo}">
										<tr data-source="${emp.empCd}">
											<td>맴버</td>
											<td>${empInfo.empName }</td>
											<td>${empInfo.depName}</td>
											<td>${empInfo.poName}</td>
										</tr>
								</c:forEach>
						</tbody>
					</table>
				</div>
        </div>
    </div>
</div>
<!-- 나가기모달 -->
<div class="modal fade" id="outChatRoom" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <p>채팅방을 나가시겠습니까?</p>
                <button type="button" id="outRoomButton" class="btn btn-primary">확인</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<script>
	 	$("#listBody").on("change", ".empCheckBox", function(event){
	 		event.stopPropagation();
	 		let selectEmpCd = $(this).val();
	 	});
	 	
	 	$("#listBody").on("change", ".empCheckBox", function(event){
	 		event.stopPropagation();
	 	});
	 	
	 	$("#inviteEmpButton").click(function(){
	 		let selectedEmpNos = [];
	 		$(".empCheckBox:checked").each(function(){
				selectedEmpNos.push($(this).val());	
	 		});
	 		
	 		if(selectedEmpNos.length > 0){
	 			 let roomNo = ${roomNo};
	             location.href = "${pageContext.request.contextPath}/chatUser/inviteEmpList.do?empCds=" + selectedEmpNos.join(",") + "&roomNo=" + roomNo;
	 		}else{
	 			alert("초대할 사원을 선택해주세요.");
	 		}
	 	});
	 	
	 	$("#outRoomButton").click(function(){
	 		let roomNo = ${roomNo};
	        location.href = "${pageContext.request.contextPath}/chatRoom/chatRoomOut.do?&roomNo=" + roomNo;
	 		alert("채팅방을 나갔습니다.");
	 	});
	 	
	    function handleKeyPress(event) {
	        if (event.key === 'Enter') {
	            event.preventDefault(); // 엔터 키의 기본 동작을 취소합니다.
	            webSocket.sendChat();    // 전송 버튼 동작을 호출합니다.
	        }
	    }
</script>
</body>
</html>