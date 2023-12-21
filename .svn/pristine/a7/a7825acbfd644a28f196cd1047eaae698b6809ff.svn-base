<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/organization.css" />
<style>
table {
   F width: 100%;
   border: 1px solid #444444;
   border-collapse: collapse;
   background-color: white;
}

.title {
   width:150px;
}

.errors{
	color:red;
}

th {
   text-align: center;
}

.form-control {
   padding: 0;
}

th, td {
   color: black;
   border: 1px solid #444444;
}
.depList {
	width: 30%;
}
.top{
	width: auto;
}
.side {
	margin-left: -100px;
}
#depEmpList {
	margin-left: 50px;
}
.ri {
		text-align: right;
	}
.cen {
		text-align: center;
	}
.empDetail {
		text-align: center;
	}
.depList {
		text-align: center;
	}

</style>
<h5>☗ 공동서비스 ▸ 조직도</h5>
<hr color="black">
<div class="tree">
	<ul>
		<li class="side"><a class="top" href="#" data-code="DEP_001" style="font-size: 30px; width: 15rem;">지점장</a>
			<ul>
				<li><a class="top" href="#" data-code="DEP_002" style="font-size: 25px; width: 13rem; ">부지점장</a>
					<ul>
						<li><a class="top" href="#" data-code="DEP_MANAGE_001" style="font-size: 25px;">경영관리본부</a>
							<ul>
								<li><a href="#" data-code="DEP_MANAGE_002" style="font-size: 20px;">시스템관리부</a></li>
								<li><a href="#" data-code="DEP_MANAGE_003" style="font-size: 20px;">재무회계부</a></li>
								<li><a href="#" data-code="DEP_MANAGE_004" style="font-size: 20px;">인사총부무</a></li>
							</ul>	
						<li><a class="top" href="#" data-code="DEP_IT_001" style="font-size: 25px;">IT본부</a>
							<ul>
								<li><a href="#" data-code="DEP_IT_002" style="font-size: 20px;">정보지원부</a></li>
								<li><a href="#" data-code="DEP_IT_003" style="font-size: 20px;">정보관리부</a></li>
							</ul>	
						<li><a class="top" href="#" data-code="DEP_SALE_001" style="font-size: 25px;">기업영업본부</a>
							<ul>
								<li><a href="#" data-code="DEP_SALE_002" style="font-size: 20px;">기업금융부</a></li>
								<li><a href="#" data-code="DEP_SALE_003" style="font-size: 20px;">시너지영업부</a></li>
								<li><a href="#" data-code="DEP_SALE_004" style="font-size: 20px;">종합금융부</a></li>
							</ul>	
					</ul>
				</li>
			</ul>
		</li>
	</ul>
</div>
<div id="depEmpList"></div>

<div class="modal" data-url="${viewURL}" id="detail"
	tabindex="-1">
	<div class="modal-dialog modal-fullscreen-sm-down">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">직원 상세</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body"></div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script>
	$('a[data-code]').on('click', function(event) {
		event.preventDefault(); // 기본 클릭 동작 방지
		var deptCode = $(this).data('code'); // 부서명 추출
        
        $.ajax({
            url: `${pageContext.request.contextPath}/pm/appointments/OrganizationPage`,
            type: 'GET',
            data: { depCd: deptCode },
            dataType: 'json',
            success: function(data) {
               console.log(data);
                // 성공 시 테이블을 생성하여 표시
                var employeeTable = '<table class="table table-bordered" style="width: 90%; , background-color: white;">';
                employeeTable += '<tr class="table-secondary">';
                employeeTable += '<th class="depList">부서명</th><th>직원 사번</th><th>직원 이름</th><th>직급</th></tr>';
                data.forEach(function(employee) {
                    employeeTable += '<tr data-bs-toggle="modal" data-bs-target="#detail">';
                    employeeTable += '<td class="depList">' + employee.depName + '</td>';
                    employeeTable += '<td class="empDetail">' + employee.empCd + '</td>';
                    employeeTable += '<td class="cen">' + employee.empName + '</td>';
                    employeeTable += '<td class="cen">' + employee.poName + '</td>';
                    employeeTable += '</tr>';
                });
                employeeTable += '</table>';
                $('#depEmpList').html(employeeTable);
            },
            error: function(xhr, status, error) {
            	alert('직원 리스트를 가져오는데 실패했습니다.');
            }
        });
    });
       
	$('#detail').on('show.bs.modal', function(event) {
		let $clickEmployee = $(event.relatedTarget).closest('tr');
		if ($clickEmployee.length == 1) {
			let $modalBody = $(this).find(".modal-body");
			let emp = $clickEmployee.find(".empDetail").text();
			if (emp) {
				let setting = {
					url: `${pageContext.request.contextPath}/pm/appointments/ajax/empDetail`,
					data: { empDetail: emp 
					},
					dataType: "html",
					success: function(resp) {
						$modalBody.html(resp);
					}
				};
				$.ajax(setting);
			}
		} else {
			return;
		}
	}).on('hidden.bs.modal', function() {
		let $modalBody = $(this).find(".modal-body");
		$modalBody.empty();
	});
</script>