<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.docCount {
	width: 20%
}

.card-title {
	font-size: 14px;
}

.card-text {
	height: 300px;
	overflow-x: auto;
}
</style>


<h5>☗ 메일함 ▸ 전체 메일함</h5>
<hr color="black">
<div class="container mt-4">
	<!-- 받은메일, 보낸메일, 내게쓴 메일 ,휴지통 -->
	<div class="d-flex justify-content-between mb-4">
		<div class="p-3 docCount rounded bg-primary-subtle">
			<div class="docCountHeader">받은메일</div>
			<div>
				<span class="fs-3"><a
					href="${pageContext.request.contextPath }/mailBox/receiveList.do">${receiveMailCount}</a></span>
				건
			</div>
		</div>
		<div class="p-3 docCount rounded bg-warning-subtle">
			<div class="docCountHeader">보낸메일</div>
			<div>
				<span class="fs-3"><a
					href="${pageContext.request.contextPath }/mailBox/sendList.do">${sendMailCount}</a></span>
				건
			</div>
		</div>
		<div class="p-3 docCount rounded  bg-success-subtle">
			<div class="docCountHeader">내게쓴 메일</div>
			<div>
				<span class="fs-3"><a
					href="${pageContext.request.contextPath }/mailBox/tomeList.do">${toMeMailCount}</a></span>
				건
			</div>
		</div>
		<div class="p-3 docCount rounded bg-danger-subtle">
			<div class="docCountHeader">휴지통</div>
			<div>
				<span class="fs-3"><a
					href="${pageContext.request.contextPath }/mailDelete/wasteList.do">${deletMailCount}</a></span>
				건
			</div>
		</div>
	</div>
	<div>
		<div class="d-flex justify-content-between mb-4">
			<div class="card" style="width: 48%;">
				<div class="card-body">
					<div>
						<span class="p-2 mb-1 rounded bg-primary-subtle ">받은메일</span>
					</div>
					<div class="card-text">
						<table class="table table-hover table-sm">
							<thead>
								<tr>
									<th>No</th>
									<th>제목</th>
									<th>보낸사람</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody class="listBody">
								<c:choose>
									<c:when test="${receiveMailList.size()>0 }">
										<c:forEach items="${receiveMailList}" var="receiveMail">
											<tr class="datatr" data-source="${receiveMail.receiveMailNo}">
												<td>${receiveMail.rnum}</td>
												<td>${receiveMail.receiveMailTitle}</td>
												<td>${receiveMail.receiveMailSender}</td>
												<td>${receiveMail.receiveMailDate}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">
												<h5 class="text-center">받은메일이 없습니다</h5>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="card" style="width: 48%;">
				<div class="card-body">
					<div>
						<span class="p-2 mb-1 rounded bg-warning-subtle ">보낸메일</span>
					</div>
					<div class="card-text">
						<table class="table table-hover table-sm">
							<thead>
								<tr>
									<th>No</th>
									<th>제목</th>
									<th>받는사람</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody class="listBody">
								<c:choose>
									<c:when test="${sendMailList.size()>0 }">
										<c:forEach items="${sendMailList}" var="sendMail">
											<tr class="datatr" data-source="${sendMail.receiveMailNo}">
												<td>${sendMail.rnum}</td>
												<td>${sendMail.receiveMailTitle}</td>
												<td>${sendMail.receiveMailReceiver}</td>
												<td>${sendMail.receiveMailDate}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">
												<h5 class="text-center">받은메일이 없습니다</h5>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-between mt-4">
			<div class="card" style="width: 48%;">
				<div class="card-body">
					<div>
						<span class="p-2 mb-1 rounded bg-success-subtle ">내게쓴 메일</span>
					</div>
					<div class="card-text">
						<table class="table table-hover table-sm">
							<thead>
								<tr>
									<th>No</th>
									<th>제목</th>
									<th>보낸사람</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody class="listBody">
								<c:choose>
									<c:when test="${toMeMailList.size()>0 }">
										<c:forEach items="${toMeMailList}" var="toMeMail">
											<tr class="datatr" data-source="${toMeMail.receiveMailNo}">
												<td>${toMeMail.rnum}</td>
												<td>${toMeMail.receiveMailTitle}</td>
												<td>${toMeMail.receiveMailSender}</td>
												<td>${toMeMail.receiveMailDate}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">
												<h5 class="text-center">받은메일이 없습니다</h5>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="card" style="width: 48%;">
				<div class="card-body">
					<div>
						<span class="p-2 mb-1 rounded bg-danger-subtle  ">휴지통</span>
					</div>
					<div class="card-text">
						<table class="table table-hover table-sm">
							<thead>
								<tr>
									<th>No</th>
									<th>제목</th>
									<th>보낸사람</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody class="deleteListBody">
								<c:choose>
									<c:when test="${deletMailList.size()>0 }">
										<c:forEach items="${deletMailList}" var="deletMail">
											<tr class="datatr" data-source="${deletMail.receiveMailNo}">
												<td>${deletMail.rnum}</td>
												<td>${deletMail.receiveMailTitle}</td>
												<td>${deletMail.receiveMailSender}</td>
												<td>${deletMail.receiveMailDate}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">
												<h5 class="text-center">받은메일이 없습니다</h5>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    $(".listBody").on("click", "tr.datatr", function() {
        let mailNo = $(this).data("source");
        location.href = "receiveView.do?mailNo=" + mailNo;
        console.log("mailNo : " + mailNo);
    });
});
document.addEventListener("DOMContentLoaded", function() {
    $(".deleteListBody").on("click", "tr.datatr", function() {
        let mailNo = $(this).data("source");
        location.href = "receiveView.do?mailNo=" + mailNo;
        console.log("mailNo : " + mailNo);
    });
});
</script>