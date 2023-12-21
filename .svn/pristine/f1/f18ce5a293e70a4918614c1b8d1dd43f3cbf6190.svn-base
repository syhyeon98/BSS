<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table class="table table-sm  align-middle text-center">
	<thead>
		<tr>
			<th></th>
			<th>No.</th>
			<th>결재선명</th>
			<th>상세</th>
		</tr>
	</thead>
	<tbody class="listBody align-center">
		<c:forEach items="${paging.dataList }" var="data">
			<tr class="datatr" data-pathno="${data.signpathNo}">
				<td><input type="checkbox" name="checkSignNo" value="${data.signpathNo }"></td>
				<td>${data.rnum }</td>
				<td>${data.signpathNm}</td>
				<td>
					<a class="btn btn-primary btn-sm" data-bs-toggle="collapse" href="#collapseExample${data.rnum}" role="button" aria-expanded="false" aria-controls="collapseExample${data.rnum}">
					    상세
				    </a>
				</td>
			</tr>
			<tr>
				<td colspan="4" width="300px">
					<div class="collapse" id="collapseExample${data.rnum}">
					  <div class="card card-body">
					  	<table class="table table-sm">
					  		<tr>
					  			<th>순번</th>
					  			<th>이름</th>
					  			<th>직급</th>
					  			<th>결재방법</th>
					  		</tr>
						    <c:forEach items="${signpathDetailList }" var="signpathDetail">
						    	<c:if test="${signpathDetail.signpathNo == data.signpathNo}">
						    		<tr>
						    			 <td>${signpathDetail.sdTurn + 1 }</td>
						    			 <td>${signpathDetail.empName }</td>
						    			 <td>${signpathDetail.poName }</td>
						    			 <td>결재</td>
						    		</tr>
						    	</c:if>
						    </c:forEach>
					    </table>
					  </div>
					</div>
				</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4">${paging.pagingHTML }</td>
		</tr>
	</tfoot>
</table>