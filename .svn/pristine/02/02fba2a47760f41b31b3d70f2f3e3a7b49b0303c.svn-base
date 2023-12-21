<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--     댓글 입력 폼 -->
    <div id="comment" style="border: 1px solid white">
        <form:input path="rcmntCn" />
        <input type="button" value="댓글 등록" onclick="createComment();" />
    </div>

<!--     댓글 목록 -->
    <div id="commentList">
        <h6>댓글 목록</h6>
        <c:forEach var="comment" items="${comments}">
            <p>댓글 내용: ${comment.rcmntCn }</p>
            <p>댓글 작성일: ${comment.rcnmtDt }</p>
            <hr>
        </c:forEach>
    </div>

</body>
</html>