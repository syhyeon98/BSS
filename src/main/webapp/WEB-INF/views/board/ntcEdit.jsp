<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>

<title>공지사항수정폼</title>
<h5>공지사항수정</h5>
 <hr color="black"> 
 <form:form method="post" modelAttribute="ntc"> 
 <input type="hidden" name="empCd" value="${ntc.empCd }"> 
 <input type="hidden" name="ntcNo" value="${ntc.ntcNo }">
 <table class="table table-bordered table-hover"> 
 	<tbody> 
 	<tr> 
 		<th>작성자</th> 
 		<td> 
 			${ntc.empName } 
 		</td> 
 	</tr> 
 	<tr> 
 		<th>제목</th> 
 		<td> 
 			<form:input path="ntcTtl" class="form-control" /> 
 			<form:errors path="ntcTtl" class="error" /> 
 		</td> 
 	</tr> 
 	<tr> 
 		<th>내용</th> 
 		<td> 
 			<form:textarea path="ntcCn" class="form-control"/> 
 			<form:errors path="ntcCn" class="error" /> 
 		</td> 
 	</tr> 
 </tbody> 
 </table> 
 <div style="position:absolute;right:25px;buttom:0px;"> 
 	<input type="submit" value="수정완료" class="btn btn-success btn-sm"> 
 </div> 
 </form:form> 

 <script>
	CKEDITOR.replace('ntcCn', {
 // 	    filebrowserImageUploadUrl: '${pageContext.request.contextPath }/board/uploadImage.do',
	});
 </script>











