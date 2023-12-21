<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- module page -->

<!-- preScript -->

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/js/bootstrap5/css/bootstrap.min.css">
 <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/resources/template/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">	
 <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath }/resources/template/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                                                           
<!-- Core plugin JavaScript-->                            
<script src="${pageContext.request.contextPath }/resources/template/vendor/jquery-easing/jquery.easing.min.js"></script>
                                                           
<!-- Custom scripts for all pages-->                      
<script src="${pageContext.request.contextPath }/resources/template/js/sb-admin-2.min.js"></script>
                                                          
<!-- Page level plugins -->                                
<script src="${pageContext.request.contextPath }/resources/template/vendor/chart.js/Chart.min.js"></script>
                                                          
<!-- Page level custom scripts -->                         
<%-- <script src="${pageContext.request.contextPath }/resources/template/js/demo/chart-area-demo.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/template/js/demo/chart-pie-demo.js"></script> --%>

<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath }/resources/template/css/sb-admin-2.min.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/resources/js/customLibs.js"></script>

<!-- jqueryUi css를 위함  -->
<link href="${pageContext.request.contextPath }/resources/jqueryui/jquery-ui.css" rel="stylesheet">

<!-- animateCSS -->
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />


<script>
	<c:if test="${not empty message}">
		alert("${message}");
		<c:remove var="message" scope="session" />
	</c:if>
	$(document).on("ajaxError", function(jqXHR, settings, errorText) {
		console.log("XMLHttpRequest : ", jqXHR);
		console.log("settings : ", settings);
		console.log("error : ", errorText);
	})
	
</script>


