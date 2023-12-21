<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- edSidebar -->
 <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

     <!-- Sidebar - Brand -->
     <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/main.do">
         <div class="sidebar-brand-icon rotate-n-15">
             <i class="fas fa-laugh-wink"></i>
         </div>
         <div class="sidebar-brand-text mx-3">BSS</div>
     </a>

   <!--Divider -->
     <hr class="sidebar-divider my-0">
     <!-- Nav Item - Pages Collapse Menu -->
     <!-- data-target과 부모div의 id값이 동일해야함 -->
     <li class="nav-item">
         <a class="nav-link" href="${pageContext.request.contextPath}/ed/document/myDocument.do" 
             aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fa fa-clipboard" aria-hidden="true"></i>
             <span>나의 문서함</span>
         </a>
     </li>
     
     <li class="nav-item">
         <a class="nav-link collapsed"   data-toggle="collapse" data-target="#a"
             aria-expanded="true" aria-controls="collapseTwo">
           <i class="fa fa-file-text" aria-hidden="true"></i>
             <span>기안</span>
         </a>
         <div id="a" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <!-- <h6 class="collapse-header">기안관리</h6> -->
                 <a class="collapse-item" href="${pageContext.request.contextPath}/ed/document/documentTypeList.do">기안문 작성</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/ed/document/documentKeepList.do">임시보관함</a>
             </div>
         </div>
     </li>

     <!-- Nav Item - Utilities Collapse Menu -->
     <li class="nav-item">
         <a class="nav-link collapsed"   data-toggle="collapse" data-target="#b"
             aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fa fa-clipboard" aria-hidden="true"></i>
             <span>결재문서</span>
         </a>
         <div id="b" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <!-- <h6 class="collapse-header">결재관리</h6> -->
                 <a class="collapse-item" href="${pageContext.request.contextPath}/ed/document/documentReqList.do">결재요청함</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/ed/document/documentWaitList.do">결재대기함</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/ed/document/documentIngList.do">결재진행함</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/ed/document/documentRefList.do">참조문서함</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/ed/document/documentReturnList.do">반려문서함</a>
                 <%-- <a class="collapse-item" href="${pageContext.request.contextPath}/ed/document/myDocument.do">나의 문서함</a> --%>
             </div>
         </div>
     </li>
   
   <li class="nav-item">
         <a class="nav-link" href="${pageContext.request.contextPath}/ed/document/documentRegReceptionList.do" 
             aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fa fa-files-o" aria-hidden="true"></i>
             <span>수신함</span>
         </a>
     </li>
   <li class="nav-item">
         <a class="nav-link" href="${pageContext.request.contextPath}/ed/document/regPublicList.do" 
             aria-expanded="true" aria-controls="collapseUtilities">
           	<i class="fa fa-files-o" aria-hidden="true"></i>
             <span>보관함</span>
         </a>
     </li>
   <li class="nav-item">
         <a class="nav-link" href="${pageContext.request.contextPath}/ed/approval/signpathSave.do" 
             aria-expanded="true" aria-controls="collapseUtilities">
           	<i class="fa fa-files-o" aria-hidden="true"></i>
             <span>결재관리</span>
         </a>
     </li>
     
<!--      <li class="nav-item"> -->
<!--          <a class="nav-link collapsed"   data-toggle="collapse" data-target="#c" -->
<!--              aria-expanded="true" aria-controls="collapseUtilities"> -->
<!--              <i class="fa fa-cog" aria-hidden="true"></i> -->
<!--              <span>기타설정</span> -->
<!--          </a> -->
<!--          <div id="c" class="collapse" aria-labelledby="headingUtilities" -->
<!--              data-parent="#accordionSidebar"> -->
<!--              <div class="bg-white py-2 collapse-inner rounded"> -->
<!--                  <h6 class="collapse-header">기타</h6> -->
<%--                  <a class="collapse-item" href="${pageContext.request.contextPath}/ed/approval/signpathSave.do">결재선 관리</a> --%>
<%--                  <a class="collapse-item" href="${pageContext.request.contextPath}/ed/approval/delegateApprover.do">대결자 관리</a> --%>
<!--              </div> -->
<!--          </div> -->
<!--      </li> -->
    <security:authorize access="hasRole('ADMIN')">
   <li class="nav-item">
         <a class="nav-link" href="${pageContext.request.contextPath}/ed/document/createForm.do" 
             aria-expanded="true" aria-controls="collapseUtilities">
             <i class="fa fa-file-text-o" aria-hidden="true"></i>
             <span>양식 생성</span>
         </a>
     </li>
     </security:authorize>  
 </ul>
 <!-- End of edSidebar -->
  <script>

$(".sidebar").find("a").each(function(idx,value){
    if(!location.href.includes("mian.do")){
    if(value.href.includes(location.href.split("?")[0])){
        if(value.parentElement.tagName!="LI"){
        	 value.parentElement.parentElement.className +=" show"
     	        value.className+=" bg-secondary-subtle"
        }
    }
    }
})
 </script>
 