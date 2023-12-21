<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- edSidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="${pageContext.request.contextPath}/main.do">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">BSS</div>
	</a>

	<!--Divider -->
	<hr class="sidebar-divider my-0">
	<li class="nav-item"><a class="nav-link collapsed"
		data-toggle="collapse" data-target="#a" aria-expanded="true"
		aria-controls="collapseTwo"> <i class="fa fa-suitcase"
			aria-hidden="true"></i> </i><span>복무정보</span>
	</a>
		<div id="a" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<!-- <h6 class="collapse-header">기안관리</h6> -->
				<a class="collapse-item"
					href="${pageContext.request.contextPath}/mypage/myAttend">나의
					출퇴근</a> <a class="collapse-item"
					href="${pageContext.request.contextPath}/mypage/myBusinessTrip">나의
					출장</a> <a class="collapse-item"
					href="${pageContext.request.contextPath}/mypage/myVocation">나의
					연가</a>
			</div>
		</div></li>
	<li class="nav-item"><a class="nav-link"
		href="${pageContext.request.contextPath}/mypage/salaryMyList.do"
		aria-expanded="true" aria-controls="collapseUtilities"> <i
			class="fa fa-money" aria-hidden="true"></i> <span>급여현황</span>
	</a></li>

	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#trainMng" aria-expanded="true"
		aria-controls="collapseUtilities"> <i class="fa fa-leanpub"
			aria-hidden="true"></i> <span>직원교육</span>
	</a>
		<div id="trainMng" class="collapse" aria-labelledby="headingUtilities"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<!-- <h6 class="collapse-header">교육관리</h6> -->
				<a class="collapse-item"
					href="${pageContext.request.contextPath}/mypage/trainingListApp">교육신청</a>
				<a class="collapse-item"
					href="${pageContext.request.contextPath}/mypage/myTraining.do">나의
					교육</a>
			</div>
		</div>
	</li>

	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#mail" aria-expanded="true"
		aria-controls="collapseUtilities"> <i class="fa fa-envelope"
			aria-hidden="true"></i> <span>메일함</span>
	</a>
		<div id="mail" class="collapse" aria-labelledby="headingUtilities"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<!-- <h6 class="collapse-header">교육관리</h6> -->
				<a class="collapse-item" href="${pageContext.request.contextPath}/mail/sendMail.do">메일 전송</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/mailBox/mailBoxMain.do">전체 메일함</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/mailBox/receiveList.do">받은 메일함</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/mailBox/sendList.do">보낸 메일함</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/mailImpo/impoList.do">중요 메일함</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/mailBox/tomeList.do">내게 쓴 메일</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/mailTemp/tempList.do">임시 보관함</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/mailDelete/wasteList.do">휴지통</a>
			</div>
		</div>
	</li>

	<li class="nav-item"><a class="nav-link"
		href="${pageContext.request.contextPath}/employee/mypage/myBoard"
		aria-expanded="true" aria-controls="collapseUtilities"> <i
			class="fa fa-pencil " aria-hidden="true"></i> <span>내가 쓴 글</span>
	</a></li>
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#etcWork" aria-expanded="true"
		aria-controls="collapseUtilities"> <i class="fa fa-cog"
			aria-hidden="true"></i> <span>기타업무</span>
	</a>
		<div id="etcWork" class="collapse" aria-labelledby="headingUtilities"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">기타업무</h6>
				<a class="collapse-item"
					href="${pageContext.request.contextPath}/papers/paperList">증명서발급</a>
			</div>
		</div></li>

</ul>
<!-- End of edSidebar -->

<script>
	$(".sidebar").find("a").each(function(idx, value) {
		if (!location.href.includes("mian.do")) {
			if (value.href.includes(location.href.split("?")[0])) {
				if (value.parentElement.tagName != "LI") {
					value.parentElement.parentElement.className += " show"
					value.className += " bg-secondary-subtle"
				}
			}
		}
	})
</script>
