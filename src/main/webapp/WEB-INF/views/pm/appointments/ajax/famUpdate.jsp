<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form:form modelAttribute="famUpdate" 
action="${pageContext.request.contextPath }/family/famUpdate" method="post">

<input type="hidden" name="empCd" value="${empCd}" />
<input type="hidden" name="famNo" value="${famUpdate.famNo }" />
<tr>
      <th>관계</th>
      <td>
         <form:input readonly="true" path="famClassify" class="form-control" type="text" /> 
         <form:errors path="famClassify" class="errors" /> 
      </td> 
      
      <th>성명</th>
      <td> 
         <form:input path="famName" class="form-control" type="text" /> 
         <form:errors path="famName" class="errors" /> 
      </td> 
      
      <th>생년월일</th>
      <td> 
         <form:input path="famBir" class="form-control" type="text" /> 
         <form:errors path="famBir" class="errors" /> 
      </td>
      
      <th>직업</th>
      <td> 
         <form:input path="famJob" class="form-control" type="text" /> 
         <form:errors path="famJob" class="errors" /> 
      </td>
      
      <th>학위</th> 
      <td> 
         <form:input  path="famEdu" class="form-control" type="text" /> 
         <form:errors path="famEdu" class="errors" /> 
      </td>
      
      <th>동거여부</th>
      <br>
     	 <th>
    	  <label>동거<input type="radio" name="code" value="F_01" /></label></th>
    	  <th>
    	  <label>비동거<input type="radio" name="code" value="F_02" /></label></th>
   	  <br> 	  
      <th>비고</th>
      <td> 
         <form:input path="famNote" class="form-control" type="text" /> 
         <form:errors path="famNote" class="errors" /> 
      </td>
      </tr>
      <button type="submit" class="btn btn-primary" >수정하기</button>
</form:form>