<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>

<style>

#btn {
	float: right;
	margin-bottom : 15px;
}

#vocationOneTable{
	text-align : center;
	margin-top: 20px;
}

#right{
	text-align : right;
}
.form-control{
    width: 85%;
}
#empName {
	display : none;
}

</style>
<!-- tr 눌렀을 때 선택한 사람의 연가상세내역  -->
<table id="vocationOneTable" class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary">
			<th>구분</th>
			<th id="empName">이름</th>
			<th>휴가일수</th>
			<th>사용일수</th>
			<th>잔여일수</th>
			<th>연가시작일</th>
			<th>연가종료일</th>
			<th>전체선택&nbsp;&nbsp;&nbsp;<input type="checkbox" onclick='selectAll(this)'></th>
		</tr>
	</thead>
	<tbody id="insert">
		<c:if test="${not empty vocationOne }">
			<c:forEach items="${vocationOne }" var="vocationOne">
				<tr>
					<td id="vocationCode">${vocationOne.vocationCode }</td>
					<td id="empName">${vocationOne.empName }</td>
					<td id="right">${vocationOne.vocationAll }</td>
					<td id="right">${vocationOne.vocationUse }</td>
					<td id="right">${vocationOne.vocationUseable }</td>
					<td class="vSday">${vocationOne.vocationSday }</td>
					<td class="vEday">${vocationOne.vocationEday }</td>
					<td><input type="checkbox" class="row-checkbox"/>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<div id="btn">
<button type="button" id="modifyBtn" class="btn btn-primary">선택수정</button>
<button type="submit" id="saveBtn" class="btn btn-success">저장</button>
<button type="button" id="removeBtn" class="btn btn-danger">선택삭제</button>
</div> 


<script>
/* 체크박스 전체선택  */
function selectAll(selectAll)  {
  const checkboxes 
     = document.querySelectorAll('input[type="checkbox"]');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}

/* 체크박스 선택 후 수정  */
$(document).ready(function() {
    // 수정 버튼 클릭 시 이벤트
    $("#modifyBtn").click(function() {
        // 체크된 체크박스 가져오기
        var checkedCheckboxes = $(".row-checkbox:checked");
        
        // 선택된 체크박스에 대한 처리
        checkedCheckboxes.each(function() {
            var row = $(this).closest("tr");
            
            var vocationSday = row.find(".vSday").text();
            var vocationEday = row.find(".vEday").text();
            
            // vocationSday, vocationEday를 input 태그로 변경
            row.find("td:eq(7)").html(`<input type="date" class="form-control vocation-sday" value="\${vocationSday}">`);
            row.find("td:eq(8)").html(`<input type="date" class="form-control vocation-eday" value="\${vocationEday}">`);
            
        });
            
    });
	
    //수정할 내용 입력 후 저장
    $("#saveBtn").click(function() {
    	var modifiedData = []; // 선택한 수정 대상의 데이터를 저장할 배열
    	
		var checkedCheckboxes = $(".row-checkbox:checked");
        
        // 선택된 체크박스에 대한 처리
        checkedCheckboxes.each(function() {
            var row = $(this).closest("tr");
            var vocationCode = row.find("td:eq(0)").text(); // 휴가 코드 가져오기
            var vocationSday = row.find(".vocation-sday").val();
            var vocationEday = row.find(".vocation-eday").val();
	
            //[]배열로 담아서 저장
            modifiedData.push({
            vocationCode: vocationCode,
            vocationSday: vocationSday,
            vocationEday: vocationEday
        });
    });
    	
        // 수정된 데이터 서버로 전송
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/pm/servicemanagement/vocationUpdate.do",
            data: JSON.stringify(modifiedData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(response) {
                // 서버로부터의 응답 처리
                if (response) {
                    alert("수정이 완료되었습니다.");
                	$("#vocationOne").modal("hide");
                	location.reload();
                } else {
                    alert("수정 중 오류가 발생했습니다.");
                }
            },
            error: function(error) {
                alert("서버와의 통신 중 오류가 발생했습니다.");
            }
        });
    });
});
/* 체크박스 선택 후 수정 끝  */

/* 삭제 처리 */
$('#removeBtn').click(function() {
    let $checkedRows = $("input.row-checkbox:checked").closest("tr");
    
    if ($checkedRows.length === 0) {
        alert("선택된 항목이 없습니다.");
        return;
    }
    
    let vocationCodes = [];
    $checkedRows.each(function() {
        var vocationCode = $(this).find("td:eq(0)").text(); // 휴가 코드 가져오기
        vocationCodes.push(vocationCode);
    });

    /* 요청을 보낼 때 */
    let setting = {
        type: "post",
        url: "${pageContext.request.contextPath}/pm/servicemanagement/vocationDelete.do",
        data: JSON.stringify(vocationCodes),
        contentType: "application/json; charset=utf-8",
        success: function(resp) {
            if (resp.status === "success") { // 서버 응답의 status 필드를 확인
                $checkedRows.remove();
                alert("삭제가 완료되었습니다.");
                location.reload();
                
                $("#vocationOne").modal("hide");
            } else {
                alert("삭제를 실패하였습니다.");
            }
        },
        error: function(jqXHR, status, error) {
            console.log(jqXHR);
            console.log(status);
            console.log(error);
        }
    };
    $.ajax(setting);
});
</script>
