<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    

	<div class="row paddingRL">
	<h5>▶ 교육 상세내용</h5>
		<div class="col-md-12">
			<form:form method="post" modelAttribute="training" enctype="multipart/form-data">
			<input type="hidden" name="trainNo" value="${selectedTrainNos}" />
			<table class="table table-bordered table-hover" id="traingDetail">
			<div class="container-fluid">
				<thead>
					<tr class="table-secondary align-middle">
						<th style="display: none">No</th>
						<th>강사명</th>
						<th>교육시작일시</th>
						<th>소요시간</th>
						<th>교육장소</th>
						<th>교육대상</th>
						<th>교육정원</th>
						<!-- <th>교육명</th> -->
						<!-- <th>교육내용</th> -->
						<th>신청마감일</th>
						<th>신청방법</th>
						<!-- <th>선택</th> -->
					</tr>
				</thead>
					<tbody>
						<c:if test="${empty trainDetail }">
							<tr>
								<td id="col" colspan="10">조회된 직원교육이 없습니다.</td>
							</tr>
						</c:if>
						<tr class="textCenter">
							<c:url value="/pm/training/lectorDetail?what=lectorId" var="viewURL">
								<c:param name="lectorId" value="${trainDetail.lectorId }" />
							</c:url>
								<td style="display: none">${trainDetail.trainNo }</td>
								<td><a href="#" class="lector-link" data-lector-id="${trainDetail.lectorId}">${trainDetail.lectorName}</a></td>
								<td>${trainDetail.trainDate.toString().replace('T',' ')}</td>
								<td>${trainDetail.trainTime}</td>
								<td>${trainDetail.trainPlace}</td>
								<td>${trainDetail.trainTarget}</td>
								<td>${trainDetail.capacity}</td>
								<%-- <td>${trainDetail.trainName}</td> --%>
								<%-- <td>${trainDetail.trainContent}</td> --%>
								<td>${trainDetail.trainPeriod}</td>
								<td>${trainDetail.trainSign}</td>
								<!-- <td><input type="checkbox" id="checkAll"></td> -->
						</tr>
						<tr class="table-secondary textCenter">
							<th colspan="9">교육내용</th>
						</tr>
						<tr>
							<td colspan="9">${trainDetail.trainContent}</td>
<%-- 							<td colspan="9"><c:out value="${fn:replace(trainDetail.trainContent, '\n', '<br>')}" escapeXml="false" /></td> --%>
<%-- 							<td colspan="9"><c:out value="${training.trainContent}" escapeXml="false" var="formattedContent" /> --%>
<%-- 							<c:set var="formattedContent" value="${fn:replace(formattedContent, '\n', '<br>')}" /></td> --%>
<!-- 							<td colspan="9" id="trainContent"></td> -->
						</tr>
					</tbody>
				</table>
<!-- 				<div class="btn-group" role = "group"> -->
<!-- 					<button type="button" class="btn btn-primary" id="trainingApply" >교육신청하기</button> -->
<!-- 				</div> -->
			</form:form>
		</div>
	</div>
</div>

<!-- 강사 상세 정보 모달 -->
<div class="modal" id="lectorDetailModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">강사 상세 정보</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="modalBody">
                <!-- 모달 내용을 여기에 동적으로 채워 넣을 예정 -->
            </div>
            <div class="modal-footer">
            	<button class="btn btn-outline-secondary" type="button" onClick="location.href='${pageContext.request.contextPath}/pm/training/trainingList'">교육목록으로</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script>
//     const trainContent = `${trainDetail.trainContent}`; // trainDetail.trainContent를 가져와서 문자열로 저장
//     const formattedContent = trainContent.replace(/\n/g, "<br>"); // 줄바꿈을 <br>로 치환
//     const trainContent = document.getElementById('trainContent'); // td 요소 가져오기
//     trainContent.innerHTML = formattedContent; // td 요소의 내용을 변경



//강사명을 클릭했을 때 모달을 표시하도록 이벤트 리스너 추가
$(".lector-link").on("click", function(event) {
    event.preventDefault(); // 링크의 기본 동작 방지

    // 강사 아이디를 데이터 속성에서 가져옴
    var lectorId = $(this).data("lector-id");
   
    var $modalBody = $("#modalBody");
    if (lectorId) {
        let setting = {
            url: `${pageContext.request.contextPath}/pm/training/lectorDetail.do`,
            dataType: "html",
            data: { what: lectorId },
            method: "get",
            success: function(resp) {
                // 강사 상세 정보를 모달 내용에 삽입
               	 $modalBody.html(resp);
                
               	 var $form = $modalBody.find("form");
	                if ($form.length > 0) {
	                    $form.appendTo($modalBody);
                }
	                
                $("#lectorDetailModal").modal("show");
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("Error:", textStatus, errorThrown);
            }
        };
        // 강사 상세 정보를 가져오는 Ajax 요청
        $.ajax(setting);
    }
});

</script>