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

<h5>직원교육 신청 1명만 조회하는 곳</h5>
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
                        <label for="trainName">교육명</label>
                        <input type="text" class="form-control" id="trainName" name="trainName" />
                     
                        <label for="trainDate">교육기간</label>
                        <input type="date" class="form-control" id="vocationSday" name="trainDate1" />
                        <input type="date" class="form-control" id="vocationEday" name="trainDate2" />
		                
		                <div id="searchBtn">
		                    <button type="button" class="btn btn-primary" id="selectBtn">조회</button>
		                    <input type="reset" class="btn btn-secondary" id="resetBtn" />
			         	</div>
		         	 </div>
	    	     </div>
	      	</form>
      	<!-- 검색/조회 입력하는 폼 끝 -->
       </div>
    </div>
    </div>
</div>
<div class="container-fluid">
	<div class="trainingTable">
		<div class="col-md-12">
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="table-secondary">
						<th>No</th>
						<th>사번</th>
						<th>이름</th>
						<th>부서</th>
						<th>교육명</th>
						<th>신청날짜</th>
					</tr>
				</thead>
				<tbody>
				<c:set var="trainAppList" value="${paging.dataList }" />
					<c:if test="${empty trainAppList }">
						<tr>
							<td id="col" colspan="6">조회된 신청자가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty trainAppList }">
						<c:forEach items="${trainAppList }" var="trainAppVO">
							<tr>
								<c:url value="/pm/training/trainingDetail" var="viewURL">
									<c:param name="trainNo" value="${trainAppVO.trainNo }" />
								</c:url>
								<td><a href="${viewURL }">${trainAppVO.trainNo}</a></td>
								<td>${trainAppVO.empCd}</td>
								<td>${trainAppVO.empName}</td>
								<td>${trainAppVO.depName}</td>
								<td>${trainAppVO.trainName}</td>
								<td>${trainAppVO.taDate}</td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<td colspan="9">${paging.pagingHTML }</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="page" />
		</div>
	</div>
</div>

<script>
function fn_paging(page) {
    searchForm.page.value = page;
    console.log(page);
};


</script>