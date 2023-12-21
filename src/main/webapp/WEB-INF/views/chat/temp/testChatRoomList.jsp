<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 따로 관리하는 부트스트랩 css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/js/bootstrap5/css/chatRoomStyle.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<security:authentication property="principal.realUser" var="authEmployee" />

<body>
	<script type="text/javascript">
	let selectRoomNo = 0;
	
	function scrollToBottom() {
    var divChatData = $('#divChatData');
    divChatData.scrollTop(divChatData.prop('scrollHeight'));
	}
	
	var webSocket = {
	 		init : function(param){
	 			this._initSocket();
	 		},
	 		sendChat : function(){
	 			console.log("val:", $('#message-input').val());
	 			this._sendMessage('CHAT_REQ', selectRoomNo, $('#message-input').val());
				$('#message-input').val('');
	 		},
	 		receiveMessage: function(msgData) {
	 		    let newDiv = $('<div>').addClass("mb-4");
				console.log(msgData)
	 		    let innerDiv = $('<div>').addClass("font-weight-bold mb-1").text(msgData.empNm);
	 		    newDiv.append(innerDiv);

	 		    let contentDiv = $('<div>').addClass("flex-shrink-1 bg-light rounded py-2 px-3 ml-3");
	 		    contentDiv.text(msgData.msgContent);
	 		   if (msgData.sender === '${empCd}') {
	 			    contentDiv.css("margin-left", "10px");
	 			    contentDiv.css("max-width", "400px");
	 			} else {
	 			    contentDiv.css("margin-right", "10px"); // 수정: 속성 이름 추가
	 			    contentDiv.css("max-width", "400px");
	 			}
	 		    newDiv.append(contentDiv);

	 		    let timeDiv = $('<div>').addClass("text-muted small text-nowrap mt-2").text(msgData.getSendTime);
	 		    contentDiv.append(timeDiv);
				console.log("empCd(사번)", "${authEmployee.empCd }")
	 		    if ("${authEmployee.empCd }" == msgData.senderId) {
	 		        newDiv.addClass("chat-message-right");
	 		    } else {
	 		        newDiv.addClass("chat-message-left");
	 		    }

				//let lastChatText = msgData.msgContent;
				
				if(selectRoomNo == msgData.roomNo){
					$('#divChatData').append(newDiv);
					//$('.noRead').text("");
				}else{
					// 받은 메시지와 현재 내가 있는 방의 번호가 일치하지 않을 시에는 메시지를 추가하지 않는다.
					
				    // 다른 대화방에서 온 메시지 처리
				    // 메시지를 추가하지 않음

				    // 받은 메시지가 자신이 있는 방이 아니면 msgData.roomNo인 방의 noRead를 읽어서 +1
				    var notReadChatNo = parseInt($('.noRead[data-rn="' + msgData.roomNo + '"]').text());
				    console.log("않읽은 개수", notReadChatNo);
					
				    if(isNaN(notReadChatNo)){
				    	notReadChatNo = 1;
				    }
				    notReadChatNo += 1; // +1 증가
				    var $noReadElement = $('.noRead[data-rn="' + msgData.roomNo + '"]');
				    $noReadElement.text(notReadChatNo);
				    $noReadElement.removeAttr('hidden');
				}
				
				let lastChatText = msgData.msgContent;

				let chatRoomNo = $(".lastChat");

				chatRoomNo.each(function(idx, value) {
				    let dataRN = $(value).data("rn"); // data-rn 속성 값을 가져옴
				    console.log("data-rn 값:", dataRN);
				    console.log("해당 방번호", msgData.roomNo);
				    if (dataRN == msgData.roomNo) {
				        $(value).text(lastChatText); // 해당 요소의 텍스트를 변경
				    }
				});
				
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
	<main class="content">
		<div class="container p-0">
			<div class="d-flex justify-content-between align-items-center mb-3">
				<h1 class="h3" style="margin-top: 20px;">"${empName}"님의 채팅방</h1>
				<button type="button" style="margin-top: auto;" id="createChatRoom"
					class="btn btn-success" data-toggle="modal" data-target="#myModal">채팅방
					생성</button>
			</div>
			<div class="card" style="height: 550px;">
				<div class="row g-0" style="height: 100%;">
					<div class="col-12 col-md-3 border-right">
						<div class="px-4 d-none d-md-block">
							<div class="d-flex align-items-center">
								<input type="text" class="form-control my-3"
									placeholder="Search...">
							</div>
						</div>
						<c:choose>
							<c:when test="${empty chatRoomList}">
								<div class="flex-grow-1 ml-3">채팅방이 존재하지 않습니다.</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${chatRoomList}" var="chatRoom">
									<div class="data" data-rn="${chatRoom.roomNo }">
										<div class="d-flex align-items-start dataDiv"
											style="margin-bottom: 20px;">
											<div class="flex-grow-1 ml-3" style="margin-left: 25px;">
												${chatRoom.roomName} <span class="gray-text">(${chatRoom.cntEmp})</span>
												<c:forEach items="${chatReadList}" var="chatReadList">
													<c:if
														test="${chatReadList.recoreRoomno eq chatRoom.roomNo }">
														<c:if test="${chatReadList.notReadChatNo == 0}">
															<div data-rn="${chatRoom.roomNo }"
																class="noRead badge bg-danger text-white float-right" hidden="true">${chatReadList.notReadChatNo }</div>
														</c:if>
														<c:if test="${chatReadList.notReadChatNo != 0}">
															<div data-rn="${chatRoom.roomNo }" class="noRead badge bg-danger text-white float-right"> ${chatReadList.notReadChatNo }</div>
														</c:if>
													</c:if>
												</c:forEach>
												<div class="small">
													<c:forEach items="${lastChatList }" var="lastChatList">
														<c:if test="${lastChatList.roomNo eq chatRoom.roomNo}">
															<div class="text-container">
																<span id="lastChat" data-rn="${chatRoom.roomNo }"
																	class="lastChat fas fa-circle chat-online">${lastChatList.lastChat }</span>
															</div>
														</c:if>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<hr class="d-block d-lg-none mt-1 mb-0">
					</div>
					<div id="chatDetail" class="col-md-9"
						style="width: 70%; height: 80%">
						<jsp:include page="testChatRoomRecord.jsp" />
					</div>
				</div>
			</div>
		</div>
		<form:form method="post" modelAttribute="chatRoom">
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-body">
							<form id="createChatRoomForm"
								action="${pageContext.request.contextPath}/chatRoomCreate.do"
								method="post">
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
		<script>
	$(".dataDiv").on("click", function() {
		$(".dataDiv").removeClass("selected"); // 다른 div의 select 삭제
		$(this).addClass("selected"); // 선택한 곳에 selected설정
		
		console.log("this", this);
		var selectDiv = $(this).find(".noRead")[0];
		console.log("selectDIv", selectDiv);
		$(selectDiv).text("");
		
		console.log("click", this);
		const parent = $(this).parent();
		const source = parent.data("rn");
		
		var roomNo = source;
		selectRoomNo = source;

		console.log("roomNo", roomNo);
		var url = "<%=request.getContextPath()%>/chatRoomDetail/selectChatRoomDetail.do?roomNo=" + roomNo;
								$.ajax({
											url : url,
											method : "POST",
											success : function(data) {
												$("#chatDetail").html(data);
											},
											error : function() {
												alert("채팅방 상세 내용을 가져오는 도중 오류가 발생했습니다.");
											}
										});
							})

			$("createChatRoomButton").click(
					function() {
						var selectedRoomType = $(
								"input[name='roomType']:checked").val();
						var roomName = $("#roomName").val();

						if (selectedRoomType) {
							if (roomName) {
								location.href = "chatRoom.do?roomName="
										+ encodeURIComponent(roomName);
							} else {
								alert("채팅방 이름을 입력해주세요.");
							}
						} else {
							alert("채팅방 설정을 선택해주세요.");
						}
					});

			// 	$(document).ready(function() {
			// 	    scrollToBottom();
			// 	});
		</script>
	</main>
</body>
</html>