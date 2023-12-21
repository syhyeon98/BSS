<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>

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

<h5>☗ 전자결재</h5>
<hr color="black">
<div class="container mt-4">
	<!-- 대기문서, 진행문서, 반려문서 ,완료문서 -->
	<div class="d-flex justify-content-between mb-4">
		<div class="p-3 docCount rounded bg-primary-subtle">
			<div class="docCountHeader">대기(결재해야할) 문서</div>
			<div>
				<span class="fs-3"><a
					href="${pageContext.request.contextPath }/ed/document/documentWaitList.do">${waitCount}</a></span>
				건
			</div>
		</div>
		<div class="p-3 docCount rounded bg-warning-subtle">
			<div class="docCountHeader">진행(결재선에 포함된) 문서</div>
			<div>
				<span class="fs-3"><a
					href="${pageContext.request.contextPath }/ed/document/documentIngList.do">${ingCount}</a></span>
				건
			</div>
		</div>
		<div class="p-3 docCount rounded bg-danger-subtle ">
			<div class="docCountHeader">수신(수신처) 문서</div>
			<div>
				<span class="fs-3"><a
					href="${pageContext.request.contextPath }/ed/document/documentRegReceptionList.do">${depDocCount}</a></span>
				건
			</div>
		</div>
		<div class="p-3 docCount rounded bg-success-subtle">
			<div class="docCountHeader">참조(참조) 문서</div>
			<div>
				<span class="fs-3"><a
					href="${pageContext.request.contextPath }/ed/document/documentRefList.do">${refCount}</a></span>
				건
			</div>
		</div>
	</div>
	<!-- 요청함, 대기함 -->
	<div>
		<div class="d-flex justify-content-between mb-4">
			<div class="card" style="width: 48%;">
				<div class="card-body">
					<div><span class="p-2 mb-1 rounded bg-primary-subtle ">대기 문서</span></div>
					<div class="card-text">
						<table class="table table-hover table-sm">
							<thead>
								<tr>
									<th>결재요청일</th>
									<th>부서</th>
									<th>결재제목</th>
									<th>기안자</th>
								</tr>
							</thead>
							<tbody class="listBody">
								<c:choose>
									<c:when test="${waitDocList.size()>0 }">
										<c:forEach items="${waitDocList}" var="waitDoc">
											<tr class="datatr" data-docno="${waitDoc.docNo}">
												<td>
													<c:if test="${waitDoc.docRead == 'N' }">
														<span class="p-1 text-danger animate__animated animate__flash me-1">${waitDoc.docRead}ew</span>
													</c:if>
													${waitDoc.formatDocUpdate}
												</td>
												<td>${waitDoc.depName}</td>
												<td>${waitDoc.docTitle}</td>
												<td>${waitDoc.empName}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">
												<h5 class="text-center">결재 대기 문서가 없습니다</h5>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<div class="textCenter">
						<a href="${pageContext.request.contextPath}/ed/document/documentWaitList.do" class="btn btn-primary mt-3">더보기</a>
					</div>
				</div>
			</div>
			<div class="card" style="width: 48%;">
				<div class="card-body">
					<div><span class="p-2 mb-1 rounded bg-warning-subtle ">진행 문서</span></div>
					<div class="card-text">
						<table class="table table-hover table-sm">
							<thead>
								<tr>
									<th>결재요청일</th>
									<th>부서</th>
									<th>결재제목</th>
									<th>기안자</th>
								</tr>
							</thead>
							<tbody class="listBody">
								<c:choose>
									<c:when test="${ingDocList.size()>0 }">
										<c:forEach items="${ingDocList}" var="intDoc">
											<tr class="datatr" data-docno="${intDoc.docNo}">
												<td>${intDoc.formatDocUpdate}</td>
												<td>${intDoc.depName}</td>
												<td>${intDoc.docTitle}</td>
												<td>${intDoc.empName}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">
												<h5 class="text-center">결재 진행 문서가 없습니다</h5>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<div class="textCenter">
						<a href="${pageContext.request.contextPath}/ed/document/documentIngList.do" class="btn btn-primary mt-3">더보기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-between mt-4">
			<div class="card" style="width: 48%;">
				<div class="card-body">
					<div><span class="p-2 mb-1 rounded bg-danger-subtle ">수신 문서</span></div>
					<div class="card-text">
						<table class="table table-hover table-sm">
							<thead>
								<tr>
									<th>결재요청일</th>
									<th>부서</th>
									<th>결재제목</th>
									<th>기안자</th>
								</tr>
							</thead>
							<tbody class="listBody">
								<c:choose>
									<c:when test="${depDocList.size()>0 }">
										<c:forEach items="${depDocList}" var="depDoc">
											<tr class="datatr" data-docno="${depDoc.docNo}">
												<td>${depDoc.formatDocUpdate}</td>
												<td>${depDoc.depName}</td>
												<td>${depDoc.docTitle}</td>
												<td>${depDoc.empName}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">
												<h5 class="text-center">결재 수신 문서가 없습니다</h5>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<div class="textCenter">
						<a href="${pageContext.request.contextPath}/ed/document/documentRegReceptionList.do" class="btn btn-primary mt-3">더보기</a>
					</div>
				</div>
			</div>
			<div class="card" style="width: 48%;">
				<div class="card-body">
					<div><span class="p-2 mb-1 rounded bg-success-subtle ">참조 문서</span></div>
					<div class="card-text">
						<table class="table table-hover table-sm">
							<thead>
								<tr>
									<th>결재요청일</th>
									<th>부서</th>
									<th>결재제목</th>
									<th>기안자</th>
								</tr>
							</thead>
							<tbody class="listBody">
								<c:choose>
									<c:when test="${refDocList.size()>0 }">
										<c:forEach items="${refDocList}" var="refDoc">
											<tr class="datatr" data-docno="${refDoc.docNo}">
												<td>${refDoc.formatHdDate}</td>
												<td>${refDoc.depName}</td>
												<td>${refDoc.docTitle}</td>
												<td>${refDoc.empName}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">
												<h5 class="text-center">참조 문서가 없습니다</h5>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>

							</tbody>
						</table>
					</div>
					<div class="textCenter">
						<a href="${pageContext.request.contextPath}/ed/document/documentRefList.do" class="btn btn-primary mt-3">더보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(".listBody")
			.on(
					"click",
					"tr.datatr",
					function(event) {
						let docNo = $(this).data("docno");
						location.href = `${pageContext.request.contextPath}/ed/document/documentFormView.do?docNo=\${docNo}`;
					});
</script>