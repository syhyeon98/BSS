<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }/resources/img/Title Icon.png" rel="icon">
<title> <tiles:getAsString name="title"/> </title>
    <tiles:insertAttribute name="preScript" />

<!-- 로그인 페이지 폰트 적용  -->
<style>
	#content-wrapper{
		font-family: 'MICEGothic Bold';
	}
	
	.background-div {
	    width: 100%; /* 화면 전체 너비로 설정 */
	    height: 100vh; /* 화면 전체 높이로 설정 */
	    background-image: url("${pageContext.request.contextPath}/resources/img/bankk.png");/* 배경 이미지 파일 경로 설정 */
	    background-size: cover; /* 이미지를 div에 맞게 조절 */
	    background-repeat: no-repeat; /* 이미지 반복 없음 */
	    background-position: center; /* 이미지를 가운데 정렬 */

	}

</style>
  
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
	<div class="fs-2 p-3 bg-primary text-white">금융정보제공인사시스템</div>
            <!-- Main Content -->
            <div id="content" class="background-div">
                <!-- Begin Page Content -->
                <div class="container-fluid">
				
				<tiles:insertAttribute name="contentPage" />
                  
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
		
            <!-- Footer -->
			<tiles:insertAttribute name="footer" />
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <tiles:insertAttribute name="postScript" />
</body>

</html>