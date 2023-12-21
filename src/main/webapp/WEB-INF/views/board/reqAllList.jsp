<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>   
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>

<!-- 현재 로그인 사용자  -->
<security:authentication property="principal.realUser" var="authEmployee"/>
<h5>☗ 공동서비스 ▸ 게시판 ▸ 문의사항</h5>
<hr color="black">

<div>
	<a href="<c:url value='/board/reqInsert'/>"class="btn btn-primary btn-sm">등록</a>
	<div style="height: 15px;"></div>

<div id="reqList"></div>
</div>



<form:form id="searchForm"
			action="${pageContext.request.contextPath }/board/reqList" modelAttribute="simpleCondition">
				<input type="hidden" name="page" />
		</form:form>

<!-- Modal -->
<div id="reqpass" style="display: none;">
<div class="reqpass" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">비밀번호를 입력하세요</h5>
        <input id="no" name="reqNo" type="hidden" value=""/>
        
        <input id="pass" name="reqPw" type="hidden" value=""/>
      
      </div>
      <div class="modal-body">
     	  <!-- 로그인된 사용자가 시스템관리자일 경우 패스워드 자동입력 -->
     	  <c:choose>
        	<c:when test="${authEmployee != null and authEmployee.empRole =='ROLE_ADMIN' }">
		       저장된 비밀번호 : <input id="checkPass" readonly name="reqPw" type="number" value=""/>
        	</c:when>
        	<c:otherwise>
		       게시물 비밀번호 : <input id="checkPass" type="password" placeholder="****">
        	</c:otherwise>
        </c:choose>

      </div>
      <div class="modal-footer">
        <button id="close" type="button" class="btn btn-secondary">닫기</button>
        <button id="passcheck" onclick="passCk()" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>
</div>

<script>
	let reqNo;
	function modal(reqNo, reqPw){
		onclick = function(){
			reload();
		};
		reqNo = reqNo
		let change = document.getElementById('reqpass');
		change.style.display = 'block'
		console.log("저장된비번 " + reqPw);
		$('input[name=reqPw]').attr('value',reqPw);
		$('input[name=reqNo]').attr('value',reqNo);
		
		document.getElementById("close").onclick = function () {
	      change.style.display = 'none'
	    };
	};
	
	function passCk(){  
		console.log(reqNo)
		var No = $('#no').val();
		
		if(document.getElementById('checkPass').value == $('#pass').val()){
			console.log("비번일치");
			location.href = '/BSS/board/reqDetail?what=' + No;
		}else{
			alert("비밀번호가 틀렸습니다");
			$('#checkPass').val() = null;
		}
	};
	
	$(function() {
		searchEmp();
	});
	
	let data = {};
	
	function searchEmp() {
		let setting = {
			url : `${pageContext.request.contextPath }/board/reqList`,
			method : "",
			dataType : "text",
			data : data,
			success : function(resp) {
				$('#reqList').html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	}

	
	function fn_paging(page) {
		searchForm.page.value = page;
		data.page = page;
		searchEmp();
	}

</script>


