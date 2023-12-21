<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
			<div class="row textCen">
					<div class="col-md-3">
						<table class="table table-bordered mb-4">
							<!-- mb-4: 아래쪽 간격 추가 -->
							<tr class="textCenter">
								<td class="table-secondary">결재번호</td>
							</tr>
							<tr class="textCenter">
								<td class="textGray">승인 시 자동채번</td>
							</tr>
						</table>
					</div>
					<div class="col-md-9">
						<table class="table table-bordered">
							<!-- mb-4: 아래쪽 간격 추가 -->
							<tr class="textCenter">
								<!-- 나중에 br없애고 세로가운데 정렬하기 -->
								<td rowspan="3" class="table-secondary "></br>결</br> </br>재</td>
								<td>결재방법</td>
								<td>결재방법</td>
								<td>결재방법</td>
								<td>결재방법</td>
								<td>결재방법</td>
							</tr>
							<tr class="textCenter">
								<td id="a">결재자</td>
								<td>결재자</td>
								<td>결재자</td>
								<td>결재자</td>
								<td>결재자</td>
							</tr>
							<tr class="textCenter">
								<td>승인일자</td>
								<td>승인일자</td>
								<td>승인일자</td>
								<td>승인일자</td>
								<td>승인일자</td>
							</tr>
						</table>
					</div>
				</div>
	
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="table-secondary cellWidth">문서유형</td>
							<td>${DocumentCont.dtName }</td>
							<td class="table-secondary cellWidth">기안일자</td>
							<td class="textGray">기안 시 자동부여</td>
						</tr>
						<tr>
							<security:authentication property="principal.realUser"
								var="authEmployee" />
							<td class="table-secondary cellWidth">기 안 자</td>
							<td>${authEmployee.empName }</td>
	
							<td class="table-secondary cellWidth">기안부서</td>
							<td>${authEmployee.depName }</td>
						</tr>
						<tr>
							<td class="table-secondary cellWidth">문서제목</td>
							<td colspan="3"><input type="text" class="form-control"
								id="title" /></td>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<td colspan="4" class="table-secondary textCenter">문서내용</td>
						</tr>
						<tr>
							<td colspan="4">
								<!-- 에디터를 삽입할 textarea --> <c:if test="${not empty DocumentCont }">
									<textarea name="docContent" id="docContent">${DocumentCont.dtCont}</textarea>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="table table-bordered">
					<tr>
						<td><label for="exampleInputFile">File input</label> <input
							type="file" class="form-control-file" id="exampleInputFile" /></td>
					</tr>
				</table>