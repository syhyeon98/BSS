<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<security:authentication property="principal.realUser" var="authEmployee" />

<style>
#atteStimeClock {
   padding-top: 10px;
   margin-right: 10px;
   font-family: auto;
   color: black;
}
/* 알림 아이콘에 적용될 스타일 */
@keyframes pulse-red {
  0% {
    transform: scale(1); /* 1배 크기로 시작 */
    color: red;
  }
  50% {
    transform: scale(1.2); /* 1.2배 크기로 중간에 도달 */
    color: inherit; /* 기존 색상으로 복원 */
  }
  100% {
    transform: scale(1); /* 1배 크기로 돌아옴 */
    color: red;
  }
}

.pulse-red-icon {
  animation: pulse-red 2s infinite;
  animation-fill-mode: forwards; /* 애니메이션 종료 후 최종 스타일 유지 */
  display: inline-block; /* 텍스트가 줄 바꿈 없이 크기 변화에 따라 영향을 받도록 인라인 블록 요소로 설정 */
}
</style>

<!-- Topbar -->
<nav
	class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- Sidebar Toggle (Topbar) -->
	<button id="sidebarToggleTop"
		class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	<!-- Topbar Menu -->
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link text-primary fs-5"
					href="${pageContext.request.contextPath }/main.do">
					<i class="fa fa-home" aria-hidden="true"></i>
					&nbsp;공동서비스</a></li>
				<li class="nav-item"><a class="nav-link text-primary fs-5"
					href="${pageContext.request.contextPath }/deposit/regDeposit">
					<i class="fa fa-university" aria-hidden="true"></i>
					&nbsp;실시간금융정보</a>
				</li>
				<li class="nav-item"><a class="nav-link text-primary fs-5"
					href="${pageContext.request.contextPath}/ed/document/documentMain.do">
					<i class="fa fa-file" aria-hidden="true"></i>
					&nbsp;전자결재</a>
				</li>
				<li class="nav-item"><a class="nav-link text-primary fs-5"
					href="${pageContext.request.contextPath}/mypage/myBusinessTrip">
					<i class="fa fa-suitcase" aria-hidden="true"></i>
					&nbsp;업무보고</a>
				</li>
				<li class="nav-item"><a class="nav-link text-primary fs-5"
					href="${pageContext.request.contextPath}/employee/mypageMain.do">
					<i class="fa fa-user" aria-hidden="true"></i>
					&nbsp;개인화서비스</a>
				</li>
				<security:authentication property="principal.realUser"
					var="authEmployee" />
				<c:choose>
					<c:when
						test="${authEmployee != null and authEmployee.empRole =='ROLE_PMUSER' }">
						<li class="nav-item"><a class="nav-link text-primary fs-5"
							href="${pageContext.request.contextPath}/pm/appointments/main.do">
							<i class="fa fa-users" aria-hidden="true"></i>
							&nbsp;인사관리</a>
						</li>
					</c:when>
				</c:choose>
		</div>
		<h5 id="atteStimeClock"></h5>
	</div>
	<div id="attendBtn"></div>

	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">

		<!-- Nav Item - Search Dropdown (Visible Only XS) -->
		<li class="nav-item dropdown no-arrow d-sm-none"><a
			class="nav-link dropdown-toggle" href="#" id="searchDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
		</a> <!-- Dropdown - Messages -->
			<div
				class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" 
				aria-labelledby="searchDropdown">
				<form class="form-inline mr-auto w-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small"
							placeholder="Search for..." aria-label="Search"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div></li>

		<div id="msgStack" class="position-fixed top-0 end-0 translate-middle-x" style="z-index: 11"></div>
		
<!-- 		<div id="docStack" class="position-fixed start-50 translate-middle-x" style="top: 0; transform: translateX(-50%); z-index: 11"></div> -->
		<!-- Nav Item - Alerts -->
		<li class="nav-item dropdown no-arrow mx-1">
			<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
				<i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
					<span class="badge badge-danger badge-counter"></span>
			</a> <!-- Dropdown - Alerts -->
			<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
				<h6 class="dropdown-header">알림</h6>
				<div id="docStack"></div>
				<a class="dropdown-item text-center small text-gray-500" href="${pageContext.request.contextPath}/ed/document/documentMain.do">결재 요청</a>
			</div>
		</li>

		<!-- Nav Item - Messages -->
		<li class="nav-item dropdown no-arrow mx-1">
			<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/mail/allMail.do"  id="messagesDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false">
				
				<!-- Counter - Messages -->
				<i class="fa fa-commenting" aria-hidden="true" onclick="openChat()"></i>
				<!-- <span class="badge badge-danger badge-counter"></span> -->
			</a> 
		</li>

		<div class="topbar-divider d-none d-sm-block"></div>

		<security:authentication property="principal.realUser" var="authEmployee" />
		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <span
				class="mr-2 d-none d-lg-inline text-gray-600 small">
				${authEmployee.depName } ${authEmployee.empName }</span> <!-- <img class="img-profile rounded-circle" src="img/undraw_profile.svg"> -->
		</a> <!-- Dropdown - User Information -->
			<div
				class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="userDropdown">
				<a class="dropdown-item"
					href="${pageContext.request.contextPath}/employee/mypage"> <i
					class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile <!--<a class="dropdown-item" href="#"> 
                     <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                     Settings
                 </a>
                 <a class="dropdown-item" href="#">
                     <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                     Activity Log
                 </a>-->
				</a>

				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#" data-toggle="modal"
					data-target="#logoutModal"> <i
					class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
					Logout
				</a>
			</div></li>

	</ul>

</nav>
<!-- soketJS -->
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
	var socket = null;

	$(document).ready(function() {
		sock = new SockJS("<c:url value='/chat'/>");
		socket = sock;

		sock.onmessage = onMessage;
	});

	function onMessage(evt) {
		var data = JSON.parse(evt.data);
		//var msgStackContent = $("#msgStack").html();
		var authEmpCd = "${authEmployee.empCd}";
		
		if(data.Type === 'CHAT_REQ'){
			var msgStackContent = $("#msgStack").html();
			
			if(data.senderId !== authEmpCd){
				// toast
				let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
				toast += "<div class='toast-header'>";
				toast += "<strong class='me-auto'>" + data.roomName
						+ "</strong><small class='text-muted'>" + data.getSendTime
						+ "</small>";
				toast += "<button type='button' class='btn-close' data-bs-dismiss='toast' aria-label=Close'></button>";
				toast += "</div> <div class='toast-body'>" + data.empNm + " : "
						+ data.msgContent + "</div></div>";
						
				$(".toast").toast('hide').remove(); // 이전에 보이던 toast를 숨겨줌
				$("#msgStack").append(toast); // msgStack div에 생성한 toast 추가

				$(".toast").toast({
					"animation" : true,
					"autohide": true, // true로 설정하여 자동으로 사라지도록 함
		            "delay": 2000 // 2000 밀리초(2초) 후에 자동으로 사라짐
				});
				$('.toast').toast('show');
			}
		}else if(data.Type == 'DOC_REQ'){
			var docStackContent = $("#docStack").html();
			
			if(data.senderId !== authEmpCd){
				let toast = "<div role='alert' aria-live='assertive' aria-atomic='true' data-bs-autohide='false'>";
				toast += "<div class='toast-header'>";
				toast += "<strong class='me-auto'>결재 요청 알림</strong>";
				toast += "<button type='button' class='btn-close' data-bs-dismiss='toast' aria-label=Close'></button>";
				toast += "</div> <div class='toast-body'>" + data.empNm + " : "
						+ data.msg + "</div></div>";
				
				$(".fa-bell").addClass("pulse-red-icon");
				$(".toast").toast('hide').remove(); // 이전에 보이던 toast를 숨겨줌
				$("#docStack").append(toast); // msgStack div에 생성한 toast 추가

				$(".toast").toast({
					"animation" : true,
					"autohide": false // false로 설정하여 자동으로 사라지지 않게
				});
				$('.toast').toast('show');
			}
		}
		
	};

	function openChat() {
		var url = "${pageContext.request.contextPath}/chatRoom/chatRoom.do";
		var popupWindow = window.open(url, "popupWindow",
				"width=1250,height=700");
	};

		/* 실시간 시간 */
	   let atteStimeClock = document.getElementById("atteStimeClock");

	   function getAtteStimeClock() {
	      let today = new Date();
	      
	      let year = today.getFullYear();
	      let month = ('0' + (today.getMonth() + 1)).slice(-2);
	      let day = ('0' + today.getDate()).slice(-2);
	      
	      let h = String(today.getHours()).padStart(2, "0");
	      let m = String(today.getMinutes()).padStart(2, "0");
	      let s = String(today.getSeconds()).padStart(2, "0");

	      let atteStime = `\${h}시 \${m}분 \${s}초`;
	      atteStimeClock.innerHTML = atteStime;
	   }
	   getAtteStimeClock(); //맨처음에 한번 실행
	   setInterval(getAtteStimeClock, 1000); //1초 주기로 새로실행
	   
	   /* 로그인 여부 확인 및 출근 버튼 설정 */
	    let setting = {
	        url: "${pageContext.request.contextPath}/mypage/headerAttend",
	        method: "GET",
	        dataType: "json",
	        success: function (resp) {
	            let html = "";
	            console.log("resp", resp);
	            if (resp.haveAtteStime != null && resp.haveAtteStime.atteStime != null) {
	                // 출근시간이 있으면 퇴근 버튼
	                html += `<button class="btn btn-danger" id="attendEndBtn" style="width:70px">퇴근</button>`;
	            } else {
	                // 출근시간이 없으면 출근 버튼
	                html += `<button class="btn btn-primary" id="attendStimeBtn" style="width:70px">출근</button>`;
	            }
	            $("#attendBtn").html(html);

	            // 출근 버튼 클릭 시 서버로 요청 보내기
	            $("#attendStimeBtn").on("click", function () {
	               Swal.fire({
	                   title:   '출근 등록',         // Alert 제목
	                   text: '출근시간이 등록되었습니다.',  // Alert 내용
	                   icon: 'success',                         // Alert 타입
	                   timer: 10000,
	                   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
	                   
	                   confirmButtonText: '닫기', // 버튼 텍스트 설정
					}).then((result) => {
					    if (result.isConfirmed) {
					        // 사용자가 "닫기" 버튼을 클릭하면 실행될 코드
					    	location.reload();    
					    }
					    
					});
	                $.ajax({
	                    method: "POST",
	                    url: "${pageContext.request.contextPath}/mypage/mypageAttendInsert.do",
	                    dataType: "json",
	                    data: {},
	                    success: function (response) {
	                        // 서버 응답을 처리하는 코드 추가
	                        console.log(response);
	                    },
	                    error: function (jqXHR, status, error) {
	                        console.log(jqXHR);
	                        console.log(status);
	                        console.log(error);
	                    },
	                });
	            });
	            
	            
	            // 퇴근 버튼 클릭 시 서버로 요청 보내기
	            $("#attendEndBtn").on("click", function () {
	               Swal.fire({
	                  title:   '퇴근 등록',         // Alert 제목
	                  text: '퇴근시간이 등록되었습니다.',  // Alert 내용
	                  icon: 'success',                         // Alert 타입
					  timer: 10000,
	                  
	                  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
	                  confirmButtonText: '닫기', // 버튼 텍스트 설정
					}).then((result) => {
					    if (result.isConfirmed) {
					        // 사용자가 "닫기" 버튼을 클릭하면 실행될 코드
					    }
					});

	                $.ajax({
	                    method: "POST",
	                    url: "${pageContext.request.contextPath}/mypage/mypageAttendEnd.do",
	                    dataType: "json",
	                    data: {},
	                    success: function (response) {
	                        // 서버 응답을 처리하는 코드 추가
	                        console.log(response);
	                    },
	                    error: function (jqXHR, status, error) {
	                        console.log(jqXHR);
	                        console.log(status);
	                        console.log(error);
	                    },
	                });
	            });
	            
	            
	            
	            
	        },
	        error: function (jqXHR, status, error) {
	            console.log(jqXHR);
	            console.log(status);
	            console.log(error);
	        },
	    };

	    $.ajax(setting);
</script>