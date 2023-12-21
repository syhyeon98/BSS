<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>전체메일함</title>
    <style>
	    .button-center {
            text-align: center;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .table {
            width: 100%;
            margin-bottom: 1rem;
            color: #212529;
        }

        .table-bordered {
            border: 1px solid #dee2e6;
        }

        .table-bordered th,
        .table-bordered td {
            border: 1px solid #dee2e6;
            padding: 0.75rem;
            vertical-align: top;
        }

        @media (max-width: 575.98px) {
            .table-responsive {
                display: block;
                width: 100%;
                overflow-x: auto;
            }

            .table {
                width: auto;
                max-width: 100%;
                margin-bottom: 0.75rem;
            }

            .table-bordered {
                border: 0;
            }

            .table-bordered th,
            .table-bordered td {
                border-bottom: 1px solid #dee2e6;
            }
        }
    </style>
</head>
<body>
    <div class="container-fluid mt-4">
        <h4>전체메일함</h4>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th></th>
                        <th>제목</th>
                        <th>보낸사람</th>
                        <th>수신일시</th>
                    </tr>
                </thead>
                <tbody id="listBody">
                	<c:set var="allMailList" value="${paging.dataList }"/>
                    <c:if test="${empty allMailList}">
                        <tr>
                            <td colspan="5">받은 메일이 없습니다.</td>
                        </tr>
                    </c:if>
                    <c:if test="${not empty allMailList}">
                        <c:forEach items="${allMailList}" var="mail">
                            <tr class="datatr" data-source="${mail.receiveMailNo}">
                            	<td style="text-align: center;">
        							<input type="checkbox" class="mailCheckbox" value="${mail.receiveMailNo}">
    							</td>
    							<td>${mail.receiveMailTitle}</td>
                                <td>${mail.receiveMailSender}</td>
                                <td>${mail.receiveMailDate}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
                <tfoot>
                   <tr>
                       <td colspan="5">
                           ${paging.pagingHTML }
                       </td>
                   </tr>
               </tfoot>
            </table>
        </div>
        <div id="searchUI" class="row justify-content-center">
            <div class="col-auto">
                <form:select path="simpleCondition.searchType" class="form-select">
                    <form:option value="" label="전체" />
                    <form:option value="title" label="제목" />
                    <form:option value="sender" label="보낸사람" />
                </form:select>
            </div>
            <div class="col-auto">
                <form:input path="simpleCondition.searchWord" class="form-control"/>
            </div>
            <div class="col-auto">
                <input type="button" value="검색" id="searchBtn" class="btn btn-success"/>
                <input type="button" value="삭제" id="deleteButton" class="btn btn-danger"/>
            </div>
        </div>
        <!-- 검색 폼 -->
        <form:form id="searchForm" modelAttribute="simpleCondition">
            <form:hidden path="searchType" />
            <form:hidden path="searchWord" />
            <input type="hidden" name="page" />
        </form:form>
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
	    $("#listBody").on("click", "tr.datatr", function(event) {
	        if (!$(event.target).is('input:checkbox')) {
	            let mailNo = $(this).data("source");
	            location.href = "allMailView.do?mailNo=" + mailNo;
	        }
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
	});
    </script>
</body>
</html>