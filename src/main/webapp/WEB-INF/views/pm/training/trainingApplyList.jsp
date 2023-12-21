<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>

label {
	margin-right: 10px;
}

input {
	margin-right: 10px;
}

#category {
	display: flex;
}

.trainingTable {
	margin-top: 15px;
}

.card {
	padding-top: 20px;
	padding-bottom: 30px;
	margin: 35px 10px 10px 10px;
}
</style>

<h5>☗ 인사관리 ▸ 직원교육 ▸ 교육신청자현황</h5>
<hr color="black">
<div class="container-fluid">
    <div class="card" >
    	<div class="card-body">
        <div class="col-md-12" id="selectDiv">
            <!-- 검색/조회 입력하는 폼 -->
            <form class="form-inline" name="searchForm" id="searchForm" method="post" >
            <input type="hidden" id="pageNo" name="page" />
                <div id="category">
                    <div class="form-group">
                        <label for="empCd">사번</label>
                        <input type="number" class="form-control" id="empCd" name="empCd" />
                     
                        <label for="empName">이름</label>
                        <input type="text" class="form-control" id="empName" name="empName"/>

                        <label for="depName">부서</label>
                        <input type="text" class="form-control" id="depName" name="depName" />
                        <label for="trainName">교육명</label>
                        <input type="text" class="form-control" id="trainName" name="trainName" />
                     
                        <label for="trainDate">교육기간</label>
                        <input type="date" class="form-control" id="trainDate1" name="trainDate1" />
                        <input type="date" class="form-control" id="trainDate2" name="trainDate2" />
                     </div>
		             <div id="searchBtn">
		                <button type="button" class="btn btn-primary" id="selectBtn">조회</button>
		                <input type="reset" class="btn btn-secondary" id="resetBtn" />
			         </div>
	    	     </div>
	      	</form>
      	<!-- 검색/조회 입력하는 폼 끝 -->
       </div>
    </div>
    </div>
</div>
<!-- 교육신청자 리스트 폼 -->
<div class="container-fluid">
	<div class="trainingTable" id="pagingTable">
		<div class="col-md-12">
			<table class="table table-bordered table-hover">
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
								<c:url value="/pm/training/trainingDetail" var="viewURL">
									<c:param name="trainNo" value="${trainAppVO.trainNo }" />
								</c:url>
								<td><a href="${viewURL }">${trainAppVO.rnum}</a></td>
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
        let setting = {
            url: "${pageContext.request.contextPath}/pm/training/trainingApplySearchList",
            method: "get", 
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: {page: page},
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




