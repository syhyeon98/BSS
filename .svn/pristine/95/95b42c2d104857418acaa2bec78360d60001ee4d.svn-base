<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<style>

table {
   F width: 100%;
   border: 1px solid #444444;
   border-collapse: collapse;
   background-color: white;
}
.title {
   text-align: center;
}
th, td {
   color: black;
   border: 1px solid #444444;
}

.col-md-3 {
	width:10px;
}
img {
	width: 300px;
	height: 280px;
}
#imgUpdate {
	width: 25%;
}
</style>

<h3>[${empView.empName }] 님의 수정페이지</h3>
<form:form id="upEmp" method="post" modelAttribute="empView"> 
	<input type="hidden" name="empCd" value="${empView.empCd }" />
	<input type="hidden" name="empPw" value="${empView.empPw }" />
<%-- 	<input type="hidden" name="empMilitary" value="${empView.empMilitary }"/> --%>
	<input type="hidden" name="licenseCd" value="${license.licenseCd }" />
<%-- 	<input type="hidden" name="depCd" value="${department.depCd }" /> --%>
<%-- 	<input type="hidden" name="poCd" value="${position.poCd }" /> --%>
	<table style="width:90%;, background-color:white;">
		<tr>
		<th colspan="2" id="imgUpdate" class="title" rowspan="6">
			<img src="${ pageContext.request.contextPath}/resources/empProfile/${empView.outAtchNm }" alt="직원 프로필 사진">
<!-- 			<input type="hidden" name="empProfile"/> -->
<!-- 				<input type='file' onchange="readURL(this);" name="empFiles" multiple="multiple"/> -->
<!-- 				<img id="preview" alt="미리보기"/> -->
		</th>
	</tr>
	<tr>
		<th class="title">성명</th>
		<td colspan="8">
		<form:input path="empName" class="form-control" />
			<form:errors path="empName" class="errors" /></td>
	</tr>
	<tr>
		<th class="title">생년월일</th>
		<td colspan="8">
		<form:input readonly="true" path="empId1" class="form-control" type="text" />
			<form:errors path="empId1" class="errors" /></td>
	</tr>
	<tr>
		<th class="title">부서</th>
		<td colspan="8">
		<form:input readonly="true" path="department.depName" class="form-control" type="text" />
			<form:errors path="department.depName" class="errors" /></td>
	</tr>
	<tr>
		<th class="title">직급</th>
		<td colspan="8">
		<form:input readonly="true" path="position.poName" class="form-control" type="text" />
			<form:errors path="position.poName" class="errors" /></td>
	</tr>
	<tr>
		<th class="title">담당업무</th>
		<td colspan="8">
		<form:input readonly="true" path="business.busName" class="form-control" type="text" />
			<form:errors path="business.busName" class="errors" /></td>
	</tr>
	<tr>
		<th class="title">입사일자</th>
		<td colspan="9">
		<form:input readonly="true" path="enpStart" class="form-control" type="text" />
			<form:errors path="enpStart" class="errors" /></td>
	</tr>
	<tr>
		<th class="title">핸드폰번호</th>
		<td colspan="9">
		<form:input path="empHp" class="form-control" type="text" />
			<form:errors path="empHp" class="errors" /></td>
	</tr>
	<tr>
		<th class="title">이메일</th>
		<td colspan="9">
		<form:input path="empMail" class="form-control" type="text" />
			<form:errors path="empMail" class="errors" />
			</td>
	</tr>
	<tr>
		<th class="title">우편번호</th>
		<td colspan="9">
		<form:input readonly="true" path="empAdd" class="form-control" type="text" />
			<form:errors path="empAdd" class="errors" />
			</td>
	</tr>
	<tr>
		<th class="title">주소</th>
		<td colspan="9">
			<form:input path="empAdd1" class="form-control" type="text" />
			<form:errors path="empAdd1" class="errors" />
		</td>
	</tr>
	<tr>	
	<th class="title">상세주소</th>
	<td colspan="9">
		<form:input path="empAdd2" class="form-control" type="text" />
			<form:errors path="empAdd2" class="errors" />
			</td>
	</tr>
	<tr>
		<th class="title">내선번호</th>
		<td colspan="9">
		<form:input readonly="true" path="department.depNum" class="form-control" type="text" />
			<form:errors path="department.depNum" class="errors" /></td>
	</tr>
	 <tr>
      <th class="title" rowspan="3">결혼여부</th>
      </tr>
      <tr>
      <th colspan="9"><label>미 혼
      <input type="radio" name="empMarry" value="Y" /></label></th>
      </tr>
      <tr>
      <th colspan="9"><label>기 혼
      <input type="radio" name="empMarry" value="N" /></label></th>
   </tr>
	
	<tr>
		<th class="title">계좌번호</th>
		<td colspan="9">
		<form:input path="empBank" class="form-control" type="text" />
			<form:errors path="empBank" class="errors" /></td>
	</tr>
	<tr>
		<th class="title" colspan="10">
		가족관계
		<span class="plusR">
		<button id="famForm" class="btn btn-outline-secondary" type="button">추가</button></span>
		</th>
	</tr>
	<tr>
		<th style="display: none;">번호</th>
		<th>관계</th>
		<th>성명</th>
		<th>생년월일</th>
		<th>직업</th>
		<th>학위</th>
		<th colspan="2">동거여부</th>
		<th>비고</th>
		<th>선택</th>
	</tr>
		<tbody id="famInsert">
			<c:if test="${not empty famList }">
				<c:forEach items="${famList }" var="fam">
					<tr>
						<td class="famNo" style="display: none;">${fam.famNo }</td>
						<td>${fam.famClassify }</td>
						<td>${fam.famName }</td>
						<td>${fam.famBir }</td>
						<td>${fam.famJob }</td>
						<td>${fam.famEdu }</td>
						<td colspan="2">${fam.stateNm }</td>
						<td>${fam.famNote }</td>
						<td id="famCheck" class="col-md-3"><input type="checkBox"
							name="checkBox" /></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	
	<table style="width:90%;, background-color:white;">
	<tr>
		<th class="title" colspan="7">
		자격증
		 <span class="plusR">
		<button id="liForm" class="btn btn-outline-secondary" type="button">추가</button></span>
		</th>
	</tr>
	<tr>
		<th style="display: none;"></th>
		<th class="title">자격증명</th>
		<th colspan="3" class="title">자격증 발급일자</th>
		<th colspan="4" class="title">자격증 발급기관</th>
	</tr>
		<tbody id="liInsert">
			<c:if test="${not empty liList }">
				<c:forEach items="${liList }" var="li">
					<tr>
						<td colspan="2" class="title">${li.licenseNm }</td>
						<td colspan="2" class="title">${li.licenseDate }</td>
						<td colspan="3" class="title">${li.licenseAgency }</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	
	<table style="width:90%;, background-color:white;">
	<tr>
		<th class="title" colspan="7">
		경력사항
		 <span class="plusR">
		<button id="carForm" class="btn btn-outline-secondary" type="button">추가</button></span>
		</th>
	</tr>
	<tr>
		<th style="display: none;"></th>
		<th class="title">회사명</th>
		<th colspan="3" class="title">담당업무</th>
		<th colspan="4" class="title">근무연차</th>
	</tr>
		<tbody id="carInsert">
			<c:if test="${not empty carList }">
				<c:forEach items="${carList }" var="car">
					<tr>
						<td class="title">${car.carNm }</td>
						<td colspan="3" class="title">${car.carPo }</td>
						<td colspan="4" class="title">${car.carDate }</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tr>
		<th class="title" rowspan="4">학력사항</th>
	</tr>
	<tr>
		<th>학교명</th>
		<td colspan="5">${empView.uniersity.uniName }</td>
	</tr>
	<tr>
		<th>전공</th>
		<td colspan="5">${empView.uniersity.uniMajor }</td>
	</tr>
	<tr>
		<th>졸업여부</th>
		<td colspan="5">${empView.stateNm }</td>
	</tr>
		<tr>
			<td colspan="2" style="text-align: right;">
			<input id="upBtn" class="btn btn-success" type="button" value="저장" />
			<input id="famRow" class="btn btn-success" type="button" 
			data-bs-toggle="modal" data-bs-target="#famUpdate"
			value="선택수정" />
			</td>
		</tr>
	</table>
</form:form>

<div class="modal" data-url="${viewURL }" id="famUpdate" tabindex="-1">
	<div class="modal-dialog modal-fullscreen-sm-down">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">가족 수정</h5>
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


let famCounter = 0;

$('#famForm').on('click', function() {
   let modifiedHTML = `
   <tr>
  	  <td style="display: none;">
      	<input name="familyList[\${famCounter}].empCd" type="hidden" value="${empView.empCd }"/>
   	  </td>
      <td> 
      	<input name="familyList[\${famCounter}].famClassify" class="form-control" type="text"/>
     </td>
     <td>
      	<input name="familyList[\${famCounter}].famName" class="form-control" type="text"/>
      </td>
     <td>
      	<input name="familyList[\${famCounter}].famBir" class="form-control" type="text"/>
      </td>
     <td>
      	<input name="familyList[\${famCounter}].famJob" class="form-control" type="text"/>
      </td>
     <td>
      	<input name="familyList[\${famCounter}].famEdu" class="form-control" type="text"/>
      </td>
      <th>
	  <label>동거<input type="radio" name="familyList[\${famCounter}].code" value="F_01" /></label></th>
	  <th>
	  <label>비동거<input type="radio" name="familyList[\${famCounter}].code" value="F_02" /></label></th>
     <td>
      	<input name="familyList[\${famCounter}].famNote" class="form-control" type="text"/>
      </td>
     
     </tr>`;
      
      $('#famInsert').append(modifiedHTML);
      
      famCounter++;
});


let liCounter = 0;

$('#liForm').on('click', function(){
	let liHtml = `
	<tr>
	<td style="display: none;">
		<input name="licenseList[\${liCounter}].empCd" type="hidden" value="${empView.empCd }" />
	</td>
	 <td>
		<input name="licenseList[\${liCounter}].licenseNm" class="form-control" type="text"/>
	 </td>
	 <td colspan="3">
	 	<input name="licenseList[\${liCounter}].licenseDate" class="form-control" type="date"/>
	 </td>
	 <td colspan="4">
		<input name="licenseList[\${liCounter}].licenseAgency" class="form-control" type="text"/>	
	 </td>
	 </tr>`;
	 
	$('#liInsert').append(liHtml);
	
	liCounter++;
});

let carCounter = 0;
$('#carForm').on('click', function(){
	let carHTML = `<tr>
		<td style="display: none;">
			<input type="hidden" name="careerList[\${carCounter}].empCd" value="${empView.empCd }"/>
		</td>
		 <td>  
			<input name="careerList[\${carCounter}].carNm" class="form-control" type="text"/>
        </td> 
        <td colspan="3"> 
       	 	<input name="careerList[\${carCounter}].carPo" class="form-control" type="text"/>
        </td> 
        <td colspan="4"> 
        	<input name="careerList[\${carCounter}].carDate" class="form-control" type="date"/>	
        </td> 
        </tr>`;
	$('#carInsert').append(carHTML);
	
	carCounter++;
});

$(famUpdate).on('show.bs.modal', function(event){
	let $checkFamNo= $("input:checked").parent('td').siblings('.famNo');
	if($checkFamNo.length==1){
		let $modalBody = $(this).find(".modal-body");
		let famNo = $checkFamNo.text();
		if(famNo){
			let setting = {
				url : `${pageContext.request.contextPath}/family/famUpdate?who=${empView.empCd}`,
				dataType : "html",
				data : {
					famNo:famNo
				},
				success : function(resp){
					console.log(resp)
					$modalBody.html(resp);
				}
			}
			$.ajax(setting);
		}
	}else{
		alert("수정은 한 개씩 가능합니다.");
		event.preventDefault(); 
		return;
	}
		
}).on('hidden.bs.modal', function(){
	let $modalBody = $(this).find(".modal-body");
	$modalBody.empty();
});

$("#upBtn").on('click', function (e) {
    e.preventDefault(); // 기본 폼 제출 동작을 막음
    
    var successMessage = "<%= request.getAttribute("message") %>";
    if (successMessage) {
       Swal.fire({
          title: '직원 수정이 완료되었습니다.',        
          icon: 'success',
          timer:50000
       }).then(function() {
          $('#upEmp').submit();
       });
    };
});

// function readURL(input) {
// 	  if (input.files && input.files[0]) {
// 	    var reader = new FileReader();
// 	    reader.onload = function(e) {
// 	    	$('#preview').attr('src', e.target.result);
// 	    	console.log(e.target.result);
// 	    };
// 	    reader.readAsDataURL(input.files[0]);
// 	  } else {
// 	    document.getElementById('preview').src = "";
// 	  }
// 	}
	
// $('#empFiles').on('change', function () {
//     readURL(this); // 이미지를 미리보기로 표시
// });

// $('#saveBtn').on('click', function() {
// 	　　let formData = new FormData($('#empProfile')[0]);  // 폼 객체
// 	　　formData.append("upload", inputFileList[i]);  // 배열에서 이미지들을 꺼내 폼 객체에 담는다.

// 	　　$.ajax({
//       type: 'post',
//       enctype: "multipart/form-data",
//       url: '/employee/uploadImage',
//       data: formData,
//       processData: false,
//       contentType: false,
//       success: function(responseData) {
//           // 서버로부터 이미지 URL 받기
//           let imageUrl = responseData.imageUrl;
//           // 이미지 URL을 empProfile 요소의 src 속성에 할당하여 이미지 표시
//           $('#empProfile').attr('src', imageUrl);

//           // 이미지 URL을 다른 데이터와 함께 서버에 저장하거나 활용 가능
//       },
//       error: function(e) {
//           alert("error:" + e);
//       }
//   });
// });
	


</script>