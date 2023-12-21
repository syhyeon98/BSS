<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Sidebar -->
 <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

     <!-- Sidebar - Brand -->
     <li>
     <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/main.do">
         <div class="sidebar-brand-icon rotate-n-15">
             <i class="fas fa-laugh-wink"></i>
         </div>
         <div class="sidebar-brand-text mx-3">BSS</div>
     </a>
	</li>
	<!--Divider -->
     <hr class="sidebar-divider my-0">
     <!-- Nav Item - Pages Collapse Menu -->
     <li class="nav-item">
         <a class="nav-link"  href="${pageContext.request.contextPath}/calendar/personalcalendar"
             aria-expanded="true" aria-controls="collapseTwo">
             <i class="fa fa-calendar"></i>
             <span>캘린더</span>
         </a>
     </li>

     <!-- Nav Item - Utilities Collapse Menu -->
     <li class="nav-item">
         <a class="nav-link collapsed"  data-toggle="collapse" data-target="#allBoard"
             aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fa fa-bars" aria-hidden="true"></i>
             <span>게시판</span>
         </a>
         <div id="allBoard" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <h6 class="collapse-header">게시판</h6>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/board/ntcAllList">공지합니다</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/board/reqAllList">문의합니다</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/board/complAllList">칭찬합니다</a>
             </div>
         </div>
     </li>
      <li class="nav-item">
         <a class="nav-link" href="${pageContext.request.contextPath}/organization/Organization"
             aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fa fa-users" aria-hidden="true"></i>
             <span>조직도</span>
         </a>
     </li>
    
 </ul>
 <!-- End of Sidebar -->
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