<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>

<form:form modelAttribute="vocationOne" action="${pageContext.request.contextPath }/mypage/myVocationUpdate.do" method="post">
		<table id="vocationOneTable" class="table table-bordered table-hover">
			<thead>
				<tr class="table-secondary">
					<th>구분</th>
					<th>휴가일수</th>
					<th>사용일수</th>
					<th>잔여일수</th>
					<th>연가시작일</th>
					<th>연가종료일</th>
				</tr>
			</thead>
			<tbody id="insert">
				<c:if test="${not empty vocationOne }">
						<c:forEach items="${vocationOne }" var="vocationOne">
							<tr class="vo">
								<td class="vocationCode">${vocationOne.vocationCode}</td>
								<td id="right">
									${vocationOne.vocationAll }
								</td>
								<td id="right">
									${vocationOne.vocationUse }
								</td>
								<td id="right">
									${vocationOne.vocationUseable }
								</td>
								<td class="vSday">
									<input class="form-control" type="date" value="${vocationOne.vocationSday }"></input>
								</td>
								<td class="vEday">
									<input class="form-control" type="date" value="${vocationOne.vocationEday }"></input>
								</td>
							</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div id="btn">
			<button type="button" id="saveBtn" class="btn btn-primary">저장</button>
			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		</div>
</form:form>


<script>


//수정할 내용 입력 후 저장
$("#saveBtn").click(function() {
    var modifiedData = []; // 선택한 수정 대상의 데이터를 저장할 배열

    var row = $('.vo').closest("tr");
    
    var vocationCode = row.find(".vocationCode").text(); // 휴가 코드 가져오기
    var vocationSday = row.find(".vSday input").val();
    var vocationEday = row.find(".vEday input").val();

    //[]배열로 담아서 저장
    modifiedData.push({
        vocationCode: vocationCode,
        vocationSday: vocationSday,
        vocationEday: vocationEday
    });

	    // 수정된 데이터 서버로 전송
	    $.ajax({
	        type: "POST",
	        url: "${pageContext.request.contextPath}/mypage/myVocationUpdate.do",
	        data: JSON.stringify(modifiedData),
	        contentType: "application/json; charset=utf-8",
	        dataType: "json",
	        success: function(response) {
	            // 서버로부터의 응답 처리
	            if (response) {
	            	Swal.fire({
	            		 title: '수정이 완료되었습니다.',        
	            		 icon: 'success',
	            		 timer: 5000
	                });
	                
	            	 setTimeout(function() {
	                     location.reload();
	                 }, 1500);
	            	
	            } else {
	                alert("수정 중 오류가 발생했습니다.");
	            }
	        },
	        error: function(error) {
	            alert("서버와의 통신 중 오류가 발생했습니다.");
	        }
	    });
	});




</script>