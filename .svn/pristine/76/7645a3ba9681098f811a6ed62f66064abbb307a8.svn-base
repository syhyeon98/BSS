<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Sidebar -->
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
     <li class="nav-item">
         <a class="nav-link collapsed"  data-toggle="collapse" data-target="#pmInfo"
             aria-expanded="true" aria-controls="collapseTwo">
             <i class="fa fa-list" aria-hidden="true"></i>
             <span>인사정보</span>
         </a>
         <div id="pmInfo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <h6 class="collapse-header">인사관리</h6>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/pm/appointments/employeeAllList">인사정보</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/pm/appointments/resignation">퇴직인사정보</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/pm/appointments/Organization">조직도</a>
             </div>
         </div>
     </li>
     
     <!-- 복무정보 -->
     <li class="nav-item">
         <a class="nav-link collapsed"  data-toggle="collapse" data-target="#servicemanagement"
             aria-expanded="true" aria-controls="collapseUtilities">
             <i class="fa fa-suitcase" aria-hidden="true"></i>
             <span>복무관리</span>
         </a>
         <div id="servicemanagement" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <h6 class="collapse-header">복무</h6>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/pm/servicemanagement/attend">직원 출퇴근 현황</a>
                 <%-- <a class="collapse-item" href="${pageContext.request.contextPath}/pm/servicemanagement/overTimeList.do">직원 초과근무 현황</a> --%>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/pm/servicemanagement/businessTrip">직원 출장 현황</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/pm/servicemanagement/vocation">직원 연가 현황</a>
             </div>
         </div>
     </li>
	
     <li class="nav-item">
         <a class="nav-link collapsed"  data-toggle="collapse" data-target="#salary"
             aria-expanded="true" aria-controls="collapseUtilities">
              <i class="fa fa-money" aria-hidden="true"></i>
             <span>급여관리</span>
         </a>
         <div id="salary" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <h6 class="collapse-header">급여</h6>
                  <a class="collapse-item" href="${pageContext.request.contextPath}/allow/allowList.do">수당관리</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/ddc/ddcList.do">공제관리</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/salary/allSalary">급여계산/대장</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath}/salary/salaryList">사원별 급여 현황</a>
<%--                  <a class="collapse-item" href="${pageContext.request.contextPath}/salary/salaryMyList.do">내 급여 현황</a> --%>
             </div>
         </div>
     </li>
<!--      <li class="nav-item"> -->
<!--          <a class="nav-link collapsed"  data-toggle="collapse" data-target="#training" -->
<!--              aria-expanded="true" aria-controls="collapseUtilities"> -->
<!--             <i class="fa fa-leanpub" aria-hidden="true"></i> -->
<!--              <span>직원교육</span> -->
<!--          </a> -->
<!--          <div id="training" class="collapse" aria-labelledby="headingUtilities" -->
<!--              data-parent="#accordionSidebar"> -->
<!--              <div class="bg-white py-2 collapse-inner rounded"> -->
<!--                  <h6 class="collapse-header">교육</h6> -->
<%--                  <a class="collapse-item" href="${pageContext.request.contextPath}/pm/training/trainingList">교육관리</a> --%>
<%--                  <a class="collapse-item" href="${pageContext.request.contextPath}/pm/training/trainingApply.do">교육신청자현황</a> --%>
<!--              </div> -->
<!--          </div> -->
<!--      </li> -->
     <li class="nav-item">
         <a class="nav-link" href="${pageContext.request.contextPath}/pm/training/trainingList" 
             aria-expanded="true" aria-controls="collapseUtilities">
             <i class="fa fa-leanpub" aria-hidden="true"></i>
             <span>직원교육관리</span>
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