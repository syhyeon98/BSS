<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Sidebar -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
 <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

     <!-- Sidebar - Brand -->
     <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/main.do">
         <div class="sidebar-brand-icon rotate-n-15">
             <i class="fas fa-laugh-wink"></i>
         </div>
         <div class="sidebar-brand-text mx-3">BSS</div>
     </a>

	<!--Divider -->
	<li class="nav-item">
         <a class="nav-link" href="${pageContext.request.contextPath}/mail/sendMail.do" 
             aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fa fa-file-text-o" aria-hidden="true"></i>
             <span>메일쓰기</span>
         </a>
     </li>
     <hr class="sidebar-divider my-0">
     <!-- Nav Item - Pages Collapse Menu -->
     <li class="nav-item">
         <a class="nav-link collapsed"  data-toggle="collapse" data-target="#a"
             aria-expanded="true" aria-controls="collapseTwo">
             <i class="fa fa-files-o" aria-hidden="true"></i>
             <span>전체메일</span>
         </a>
         <div id="a" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <h6 class="collapse-header">메일함</h6>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/mailBox/receiveList.do">받은메일함</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/mailBox/tomeList.do">내게 쓴 메일함</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/mailBox/sendList.do">보낸메일함</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/mailTemp/tempList.do">임시보관함</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/mailImpo/impoList.do">중요메일함</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/mailDelete/wasteList.do">휴지통</a>
             </div>
         </div>
     </li>

 </ul>
 <!-- End of Sidebar -->
  <script>
 $(".sidebar").find("a").each(function(idx,value){
	    if(value.href.includes(location.href.split("?")[0])){
	        console.log(value)
	       value.parentElement.parentElement.className +=" show"
	        value.className+=" bg-secondary-subtle"
	    }}
)
 </script>