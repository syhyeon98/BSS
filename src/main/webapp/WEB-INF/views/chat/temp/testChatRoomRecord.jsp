<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
<div class="col-12 col-lg-7 col-xl-9" style="width: 100%; height: 100%;">
	<div class="py-2 px-4 border-bottom d-none d-lg-block">
		<div class="d-flex align-items-center py-1">
			<div class="flex-grow-1 pl-3">
				<strong>${roomName}</strong>
				<div class="text-muted small"></div>
			</div>
			<div>
				<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
					id="dropdownMenuLink" data-bs-toggle="dropdown"
					aria-expanded="false"> Ξ </a>

				<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<li><a class="dropdown-item" data-bs-toggle="modal"
						data-bs-target="#inviteEmp">대화 상대 초대하기</a></li>
					<li><a class="dropdown-item" data-bs-toggle="modal"
						data-bs-target="#empList">채팅 맴버 확인</a></li>
					<li><a class="dropdown-item" data-bs-toggle="modal"
						data-bs-target="#outChatRoom">채팅방 나가기</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="position-relative" style="height: 85%;">
		<div class="chat-messages p-4">
		<div id="divChatData">
			<c:forEach items="${chatList}" var="chatList">
					<c:choose>
						<c:when test="${chatList.empCd eq empCd }">
							<div class="chat-message-right mb-4">
								<div>
									<div class="font-weight-bold mb-1">${chatList.empName }</div>
								</div>
								<div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3" style="margin-right: 10px; max-width:400px; ">
									${chatList.messengerContent }
									<div class="text-muted small text-nowrap mt-2">${chatList.messengerTime }</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="chat-message-left mb-4">
								<div>
									<div class="font-weight-bold mb-1">${chatList.empName }</div>
								</div>
								<div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3" style="margin-left: 10px; max-width:400px;">
									${chatList.messengerContent }
									<div class="text-muted small text-nowrap mt-2"> ${chatList.messengerTime }</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
			</c:forEach>
			</div>
		</div>
	</div>
	</div>
<div class="flex-grow-0 py-3 px-4 border-top">
		<div class="input-group">
			<input type="text" id="message-input" class="form-control" placeholder="전송할 메시지를 입력하시오" onkeydown="handlerKeyPress(event)">
			<button id="send-button" onclick="webSocket.sendChat()" class="btn btn-primary">전송</button>
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
		$(document).ready(function(){
			scrollToBottom();
		});

	 	$("#listBody").on("change", ".empCheckBox", function(event){
	 		event.stopPropagation();
	 		let selectEmpCd = $(this).val();
	 	});
	 	
	 	$("#listBody").on("change", ".empCheckBox", function(event){
	 		event.stopPropagation();
	 	});
	 	
	 	$("#outRoomButton").click(function(){
  	 		let roomNo = ${roomNo};
	        location.href = "${pageContext.request.contextPath}/chatRoom/chatRoomOut.do?&roomNo=" + roomNo;
	 		alert("채팅방을 나갔습니다.");
	 	});
	 	
	 	$("#inviteEmpButton").click(function(){
	 		let selectedEmpNos = [];
	 		$(".empCheckBox:checked").each(function(){
				selectedEmpNos.push($(this).val());	
	 		});
	 		
	 		if(selectedEmpNos.length > 0){
	 	        let roomNo = ${roomNo};
	 	        let redirectUrl = "${pageContext.request.contextPath}/chatRoom/chatRoom.do";

	 	        function redirectToChatRoom() {
	 	            window.location.href = redirectUrl;
	 	        }

	 	        let inviteUrl = "${pageContext.request.contextPath}/chatUser/inviteEmpList.do?empCds=" + selectedEmpNos.join(",") + "&roomNo=" + roomNo;

	 	        $.get(inviteUrl, function(data) {
	 	            redirectToChatRoom();
	 	        });
	 		}else{
	 			alert("초대할 사원을 선택해주세요.");
	 		}
	 	});
	 	
	    function handlerKeyPress(event) {
	        if (event.key === 'Enter') {
	            event.preventDefault();
	            webSocket.sendChat();
	        }
	    }
</script>