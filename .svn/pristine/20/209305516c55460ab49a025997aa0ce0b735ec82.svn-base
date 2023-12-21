<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은 메일함</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/js/bootstrap5/css/mailStyle.css">
</head>
<body>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
<div class="container">
<section class="content inbox">
			<div class="container-fluid">
			<h5>☗ 메일 ▸ 받은 메일함</h5>
				<div class="row clearfix">
					<div class="col-lg-12">
						<div class="card action_bar">
							<div class="body">
								<div id="searchUI" class="row clearfix">
									<div class="col-auto">
										<form:select path="simpleCondition.searchType"
											class="form-select">
											<form:option value="" label="전체" />
											<form:option value="title" label="제목" />
											<form:option value="sender" label="보낸사람" />
										</form:select>
									</div>
									<div class="col-auto">
										<form:input path="simpleCondition.searchWord"
											class="form-control" />
									</div>
									<div class="col-auto">
										<input type="button" value="검색" id="searchBtn"
											class="btn btn-success" /> <input type="button" value="삭제"
											id="deleteButton" class="btn btn-danger" />
									</div>
									<form:form id="searchForm" modelAttribute="simpleCondition">
										<form:hidden path="searchType" />
										<form:hidden path="searchWord" />
										<input type="hidden" name="page" />
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row clearfix">
					<div class="col-md-12 col-lg-12 col-xl-12">
						<ul id="listBody" class="mail_list list-group list-unstyled">
							<c:set var="receiveMailList" value="${paging.dataList }" />
							<c:if test="${empty receiveMailList}">

							</c:if>
							<c:if test="${not empty receiveMailList}">
								<c:forEach items="${receiveMailList}" var="mail">
									<li class="list-group-item" data-source="${mail.receiveMailNo}">
										<div class="media">
											<div class="pull-left">
												<div class="controls">
													<div class="checkbox">
														<input type="checkbox" class="mailCheckbox" value="${mail.receiveMailNo}"> <label
															for="basic_checkbox_1"></label>
													</div>
													<a href="javascript:void(0);" class="favourite text-muted hidden-sm-down" data-toggle="active">
														<i class="zmdi zmdi-${mail.mailImpoOther == '0' ? 'star-outline blue-star' : 'star blue-star'}"></i>
													</a>
												</div>
												<div class="thumb hidden-sm-down m-r-20"></div>
											</div>
											<div class="media-body">
												<div class="media-heading">
													<a href="#" class="m-r-10">보낸 사람 : ${mail.receiveMailSender}</a>
													<!--                                     <span class="badge bg-blue">Family</span> -->
													<small class="float-right text-muted"><time
															class="hidden-sm-down" datetime="2017">${mail.receiveMailDate}</time><i
														class="zmdi zmdi-attachment-alt"></i> </small>
												</div>
												<p class="msg">${mail.receiveMailTitle}</p>
											</div>
										</div>
									</li>
								</c:forEach>
							</c:if>


						</ul>
						<div class="card m-t-5">
                                <td colspan="5">
                                    ${paging.pagingHTML }
                                </td>
						</div>
					</div>
				</div>
			</div>
		</section>
 </div>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function fn_paging(page) {
            searchForm.page.value = page;
            searchForm.requestSubmit();
        
        }
        $(searchBtn).on("click", function(event) {
            $(searchUI).find(":input[name]").each(function(idx, input) {
                let name = input.name;
                let value = $(input).val();
                $(searchForm).find(`[name=\${name}]`).val(value);
            });
            $(searchForm).submit();
        });

        $(document).ready(function() {
            $("#listBody").on("click", "li.list-group-item", function(event) {
                if (!$(event.target).is('input:checkbox')) {
                    let mailNo = $(this).data("source");
                    location.href = "receiveView.do?mailNo=" + mailNo;
                }
            });

            $("#listBody").on("change", ".mailCheckbox", function(event) {
                event.stopPropagation();
                let selectedMailNo = $(this).val();
                console.log("Selected Mail No:", selectedMailNo);
            });

            $("#listBody").on("change", ".mailCheckbox", function(event) {
                event.stopPropagation();
            });

            $("#deleteButton").click(function() {
                let selectedMailNos = [];
                $(".mailCheckbox:checked").each(function() {
                    selectedMailNos.push($(this).val());
                });

                if (selectedMailNos.length > 0) {
                    location.href = "/BSS/mailDelete/wasteSelectMail.do?mailNos=" + selectedMailNos.join(",");
                } else {
                    alert("삭제할 메일을 선택해주세요.");
                }
            });

            $("#listBody").on("click", ".zmdi", function(event) {
                event.stopPropagation();
                let $icon = $(this);

                let mailNo = $(this).closest("li").data("source");
                // 별 아이콘 클래스를 토글합니다.
                $icon.toggleClass("zmdi-star");
                $icon.toggleClass("zmdi-star-outline");
                
                $.ajax({
                    url: "/BSS/mailImpo/impoSet.do",
                    method: "POST",
                    data: { mailNo: mailNo },
                    success: function(response) {
                        if (response.success) {
                            console.log("중요 메일 성공");
                        } else {
                            console.error("중요 메일 업데이트 실패");
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error("서버 요청 실패:", error);
                    }
                });
            });
        });
    </script>
</body>
</html>