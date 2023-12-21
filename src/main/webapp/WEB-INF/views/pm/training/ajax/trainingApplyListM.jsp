<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 교육신청자 리스트 폼 -->
	<div class="row trainingTable paddingRL" id="pagingTable">
	<h5>▶ 신청자 목록</h5>
		<div class="col-md-12">
			<table class="table table-bordered table-hover">
			<div class="container-fluid">
				<thead>
					<tr class="table-secondary textCenter">
						<th>No</th>
						<th>교육명</th>
						<th>사번</th>
						<th>부서</th>
						<th>이름</th>
						<th>신청일자</th>
					</tr>
				</thead>
				<tbody>
				<c:set var="trainAppList" value="${paging.dataList }" />
					<c:if test="${empty trainAppList }">
						<tr class="textCenter">
							<td id="col" colspan="6">조회된 신청자가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty trainAppList }">
						<c:forEach items="${trainAppList }" var="trainAppVO">
							<tr class="textCenter">
								<td>${trainAppVO.rnum}</td>
								<td class="textLeft">${trainAppVO.trainName}</td>
								<td>${trainAppVO.empCd}</td>
								<td>${trainAppVO.depName}</td>
								<td>${trainAppVO.empName}</td>
								<td>${trainAppVO.taDate}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">${paging.pagingHTML }
					</tr>
				</tfoot>
			</table>
			<input type="hidden" name="page" />
		</div>
	</div>
</div>
<!-- 교육신청자 리스트 폼 -->

<!-- 직원 교육 상세조회(tr 한 줄) 눌렀을 때 모달  -->
<!-- <div class="modal fade" id="trainingOne" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true"> -->
<!-- 	<div class="modal-dialog modal-xl"> -->
<!-- 		<div class="modal-content"> -->
<!-- 			<div class="modal-header"> -->
<!-- 				<h5 class="modal-title" id="myModalLabel"></h5> -->
<!-- 				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
<!-- 			</div> -->
<!-- 			<div class="modal-body2"></div> -->
<!-- 			<div class="modal-footer"> -->
<!-- 				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- 모달 끝 -->





<script>
// function fn_paging(page) {
//     searchForm.page.value = page;
//     data.page=page;
//     console.log(page);
// };





// 페이징 시에 호출되는 함수
function fn_paging(page) {
    searchForm.page.value = page;
    console.log(page);
    // search 함수를 호출하여 AJAX 요청 수행
    search(page);
	
    function search(page) {
    	let trainNo = ${paging.trainNo};
    	console.log(trainNo);
        let setting = {
            url: "${pageContext.request.contextPath}/pm/training/trainingApplyMPaging",
            method: "get", 
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: {page: page,
            	trainNo:trainNo	
            },
            success: function(response) {
                console.log(response);

                var trainAppList = response.trainAppList;
                var paging = response.paging;

                var resultsHtml = "";
                
                resultsHtml += `
                    <div class='col-md-12'>
                        <table class='table table-bordered table-hover'>
                            <thead>
                                <tr class='table-secondary textCenter'>
                                    <th>No</th>
                                    <th>교육명</th>
                                    <th>사번</th>
                                    <th>부서</th>
                                    <th>이름</th>
                                    <th>신청일자</th>
                                </tr>
                            </thead>
                            <tbody>
                `;

				if(trainAppList && trainAppList.length > 0){
	                for (var i = 0; i < trainAppList.length; i++) {
	                    var trainApp = trainAppList[i];
	                    resultsHtml += 
	                    "<tr class='textCenter'>" +
	                    "<c:url value='/pm/training/trainingDetail' var='viewURL'>" +
	                    "<c:param name='trainNo' value=" + trainApp.trainNo +"/>" +
	                    "</c:url>" +
	                    "<td><a href='${viewURL }'>" + trainApp.rnum + "</a></td>"+
	                    "<td class='textLeft'>" + trainApp.trainName + "</td>"+
	                    "<td>" + trainApp.empCd + "</td>" +
	                    "<td>" + trainApp.depName + "</td>" +
	                    "<td>" + trainApp.empName + "</td>" +
	                    "<td>" + trainApp.taDate + "</td>" +
	                    "</tr>";
	                }
	                resultsHtml += "<tr><td colspan='8'>" + response.paging.pagingHTML + "</td></tr></tbody>";
	
	                $("#pagingTable").html(resultsHtml);
	
	                // 체크박스 상태 다시 설정
	//                 setCheckboxStates(trainAppList);
	                
				}else{
					resultsHtml = "<tr><td colspan='6'>조회된 신청자가 없습니다.</td></tr>";
					
				}
            }, // success 끝
            error: function(xhr, status, error) {
                console.error("Error:", error); 
            }
        }; // setting 끝

        $.ajax(setting); // AJAX 요청 실행
    }
} 
// 페이징 시에 호출되는 함수

</script>




