<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<style>
.fro {
	margin-left: 20px;
}
img {
	width: 80px;
	height: 60px;
}
#num {
	margin-left: 72rem; 
}
.plusR {
  	margin-left: 34rem; 
}
</style>

<!-- Footer -->
<footer class="sticky-footer bg-white">
	<div class="fro">
		이용약관 | 개인정보처리방침 | 
			<span id="num">
				<select name="fruit">
					<option>상담전용 1800-1800</option>
					<option>기업전용 1899-1899</option>
					<option>외국인전용 1895-1895</option>
				</select>
			</span>
	</div>

	<div class="fro">
		<div>
			<hr color="black">
			<span> 
			Copyright 
			<i class="fas fa-laugh-wink"></i> 
			BSS &copy; ddit.co.kr 2023 | 지점장 현성윤 | 대표전화 1999-9999 
			폰뱅킹 1500-7000 (해외 82-2-3700-7777) 
			<span class="plusR">
				<img alt="" src="${pageContext.request.contextPath }/resources/img/Title Icon.png">
				<img alt="" src="${pageContext.request.contextPath }/resources/img/wa.jpg">
			</span>
			</span>
			<div>
			인터넷뱅킹 02-3700-7788 | 신용카드 1500-1000 (해외 82-2-2000-1000)
			</div>
			
			
		</div>
	</div>

	<div id="msgStack"></div>
</footer>
<!-- End of Footer -->
<script>
	

    
	var socket = null;

	$(document).ready(function() {
		sock = new SockJS("<c:url value='/chat'/>");
		socket = sock;

		sock.onmessage = onMessage;
		
		
		
	});

	function onMessage(evt) {
		var data = evt.data;
		var msgStackContent = $("#msgStack").html();

		console.log("메시지", data)
		// toast
		let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
		toast += "<div class='toast-header'><img src="..." class='rounded me-2' alt=''...''>";
		toast += "<strong class='me-auto'>"+ data.empNm +"</strong><small class='text-muted'>" + data.getSendTime + "</small>";
		toast += "<button type='button' class='btn-close' data-bs-dismiss='toast' aria-label=Close'></button>";
		toast += "</div> <div class='toast-body'>" + data.msgContent + "</div></div>";
		$("#msgStack").append(toast); // msgStack div에 생성한 toast 추가
		$(".toast").toast({
			"animation" : true,
			"autohide" : false
		});
		$('.toast').toast('show');
		// alert띄워서 확인하는 게 편함!
	};
</script>
