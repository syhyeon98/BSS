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
         <a class="nav-link collapsed"  data-toggle="collapse" data-target="#prduct"
             aria-expanded="true" aria-controls="collapseTwo">
            <i class="fa fa-university" aria-hidden="true"></i>
             <span>금융상품</span>
         </a>
         <div id="prduct" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <h6 class="collapse-header">상품</h6>
                 <a class="collapse-item" href="${pageContext.request.contextPath }/deposit/regDeposit">정기예금</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath }/saving/savingPrdt">적금</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath }/mortagageLoan/mortagageLoan">주택담보</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath }/rentHouseLoan/rentHouseLoan">전세자금</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath }/creditLoan/creditLoan">개인신용대출</a>
             </div>
         </div>
     </li>

     <!-- Nav Item - Utilities Collapse Menu -->
     <li class="nav-item">
         <a class="nav-link collapsed"  data-toggle="collapse" data-target="#managementinfo"
             aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fa fa-bar-chart" aria-hidden="true"></i>
             <span>경영정보</span>
         </a>
         <div id="managementinfo" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <h6 class="collapse-header">경영정보</h6>
                 <a class="collapse-item" href="${pageContext.request.contextPath }/general/general">일반현황</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath }/general/finance">재무현황</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath }/general/majorManagement">주요경영지표</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath }/general/apiBusiness">영업활동</a>
             </div>
         </div>
     </li>
	
<li class="nav-item">
         <a class="nav-link collapsed"  data-toggle="collapse" data-target="#finMarket"
             aria-expanded="true" aria-controls="collapseUtilities">
             <i class="fa fa-krw" aria-hidden="true"></i>
             <span>금융시장</span>
         </a>
         <div id="finMarket" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <h6 class="collapse-header">금융시장동향</h6>
                 <a class="collapse-item" href="${pageContext.request.contextPath }/finMarket/exchangeRate">일일환율</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath }/finMarket/stockMarket">주식시장</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath }/finMarket/nationalIndex">국가지수</a>
                 <a class="collapse-item" href="${pageContext.request.contextPath }/finMarket/internalIntrRates">주요국제금리</a>
             </div>
         </div>
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