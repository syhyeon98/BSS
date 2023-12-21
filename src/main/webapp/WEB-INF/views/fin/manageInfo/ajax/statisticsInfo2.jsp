<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>${bankList}</h1>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th class="align-middle text-center">금융회사</th>
						<th class="align-middle text-center">구분</th>
						<c:forEach items="${infoList[0].statisticsInfo}" var="stInfo">
							<th class="align-middle text-center">${stInfo.formatBaseMonth }</th>
						</c:forEach>
					</tr>
<!-- 					<tr> -->
<%-- 						<c:forEach items="${infoList[0].statisticsInfo}" var="stInfo"> --%>
<%-- 							<c:forEach items="${stInfo.descriptionList }" var="description"> --%>
<%-- 								<td class="align-middle text-center">${description}</td> --%>
<%-- 							</c:forEach> --%>
<%-- 							<td>${stInfo.descriptionList }</td> --%>
<%-- 						</c:forEach> --%>
<!-- 					</tr> -->
				</thead>
				<tbody>
					<c:forEach items="${bankList }" var="bank">
						<tr>
							<td class="align-middle text-center"
								rowspan="${infoList.size()/bankList.size()+1}">${bank.financeNm }</td>
							<c:forEach items="${infoList }" var="info" varStatus="i">
								<c:set var="financeName" value="${info.financeNm}" />
								<c:if test="${financeName eq bank.financeNm }">
									<tr>
										<td class="align-middle text-center">${info.statisticsInfo[0].accountNm}</td>
										<c:forEach items="${info.statisticsInfo}" var="statisticsInfo">
											<td class="align-middle text-center">${statisticsInfo.a}</td>
										</c:forEach>
									</tr>
								</c:if>
							</c:forEach>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
