<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<h5>직원교육등록</h5>
<hr color="black">
<div class="card" >
    <div class="card-body">
       	<div>
			<form:form method="post" modelAttribute="training" >
				<input type="hidden" name="trainNo" value="${training.trainNo }" />
				<table class="table table-border">
					<tr>
						<th>강사명</th>
						<td>
						<form:select path="lectorId" class="form-control">
							<form:option value="" label="강사선택" />
							<form:options items="${lectorList }" itemLabel="lectorName" itemValue="lectorId" />
						</form:select> 
						</td>
					</tr>
					<tr>
						<th>교육장소</th>
						<td><input class="form-control" type="text" name="trainPlace" />
						<form:errors path="trainPlace" class="errors"  /></td>
					</tr>
					<tr>
						<th>교육일</th>
						<td><input class="form-control" type="datetime-local" name="trainDate" />
						<form:errors path="trainDate" class="errors"  /></td>
					</tr>
					<tr>
						<th>교육소요시간</th>
						<td><input class="form-control" type="number" name="trainTime" />
						<form:errors path="trainTime" class="errors"  /></td>
					</tr>
					<tr>
						<th>교육대상</th>
						<td><input class="form-control" type="text" name="trainTarget" />
						<form:errors path="trainTarget" class="errors"  /></td>
					</tr>
					<tr>
						<th>교육정원</th>
						<td><input class="form-control" type="number" name="capacity" />
						<form:errors path="capacity" class="errors"  /></td>
					</tr>
					<tr>
						<th>교육명</th>
						<td><input class="form-control" type="text" name="trainName" />
						<form:errors path="trainName" class="errors"  /></td>
					</tr>
					<tr>
						<th>교육내용</th>
						<td><textarea class="form-control" name="trainContent" style="height: 200px;"></textarea>
						<form:errors path="trainContent" class="errors"  /></td>
					</tr>
					<tr>
						<th>신청마감일</th>
						<td><input class="form-control" type="date" name="trainPeriod" />
						<form:errors path="trainPeriod" class="errors"  /></td>
					</tr>
					<tr>
						<th>신청처</th>
						<td><input class="form-control" type="text" name="trainSign" />
						<form:errors path="trainSign" class="errors"  /></td>
					</tr>
					<tr>
						<td colspan="2">
							<button id="submitBtn" type="submit" class="btn btn-primary" value="등록">등록</button>
							<button class="btn btn-secondary" onclick="goBack(event)">뒤로가기</button>
							<button class="btn btn-primary" type="button" id="btnAutoTrain">자동완성</button>
						</td>
					</tr>
				</table>
			</form:form>
       </div>
    </div>
</div>

<script>
// 교육 입력 자동완성
document.addEventListener("DOMContentLoaded", function() {
    const autofillButton = document.getElementById("btnAutoTrain");

    autofillButton.addEventListener("click", function() {
        const lectorIdSelect = document.querySelector('select[name="lectorId"]'); // 되나?
        const trainPlaceInput = document.querySelector('input[name="trainPlace"]');
        const trainDateInput = document.querySelector('input[name="trainDate"]');
        const trainTimeInput = document.querySelector('input[name="trainTime"]');
        const trainTargetInput = document.querySelector('input[name="trainTarget"]');
        const capacityInput = document.querySelector('input[name="capacity"]');
        const trainNameInput = document.querySelector('input[name="trainName"]');
        const trainContentInput = document.querySelector('textarea[name="trainContent"]');
        const trainPeriodInput = document.querySelector('input[name="trainPeriod"]');
        const trainSignInput = document.querySelector('input[name="trainSign"]');        

        // 원하는 값을 설정
        lectorIdSelect.value = "L006";
        trainPlaceInput.value = "회의실";
        trainDateInput.value = "2023-09-21 16:00";
        trainTimeInput.value = "2";
        trainTargetInput.value = "직원";
        capacityInput.value = "20";
        trainNameInput.value = "금융 리더십과 혁신";
        trainContentInput.value =
`* 교육목표
1. 리더십 역량을 향상 및 전략적 경영 능력을 개발
2. 금융 시장의 동향을 예측하고 대응하는 능력 향상
3. 혁신적인 아이디어 생성과 변화 관리 능력 강화
* 교육 내용
1. 전략적 리더십과 혁신
 - 전략적·혁신적 리더십의 개념과 원칙
 - 혁신을 위한 조직 문화 개선 방법 및 조직 내 변화 관리 전략 및 기술
2. 금융 산업 동향과 전략
 - 금융 시장의 최신 동향 분석 및 금융 규정 및 국제 금융 제도 업데이트
 - 금융 분야에서의 전략적 의사 결정 및 프로젝트 진행
        	
* 교육 방법
 - 전문가와 고급 리더들의 경험을 공유하고 금융 시뮬레이션 및 실제 사례를 연구, 리더십 역량 향상을 위한 맞춤형 리더십 평가`;
        
        trainPeriodInput.value = "2023-09-20";
        trainSignInput.value = "인사총무부";
    });
});
// 저장 버튼을 누르면 엔터로 인한 줄띄움(\n)을 <br>태그로 변경하여 db에 저장 → 수정할 때 다시 역치환 해야함
$("#submitBtn").on("click",function(){
// 	event.preventDefault();
	let content = $('textarea[name="trainContent"]').val().replace(/\n/g, "<br>");
	$('textarea[name="trainContent"]').val(content);
// 	console.log($('textarea[name="trainContent"]').val())
})

// 뒤로가기
function goBack(event) {
    event.preventDefault(); // 기본 동작 막기
    window.history.back();
}

</script>