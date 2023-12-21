<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
table {
	F width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
	background-color: white;
}
.title {
	width: 150px;
}

.errors {
	color: red;
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

#preview {
	width: 300px;
	height: 280px;
}
#card {
	margin-left: 8%;
	flex: 0 0 91.66667%;
	max-width: 91.66667%
}

</style>

<div id="card">
<button id="empAuto" class="btn btn-success">예시용 자동완성</button>

<form:form method="post" modelAttribute="employee" id="empForm" enctype="multipart/form-data">
  <input type="hidden" name="empCd" value="${employee.empCd }"/>
   <table style="width: 90%; , background-color: white;">
      <tr>
         <th colspan="11"><h3>직 원 등 록</h3></th>
      </tr>
      <tr>
         <th class="title">부서명</th>
         <td colspan="3">
            <form:select path="depCd" class="form-select"> 
               <form:option value="" label="부서선택" />
               <form:options items="${depList }" itemLabel="depName" itemValue="depCd" />
            </form:select>
            <form:errors path="depCd" class="errors" /></td>
            
         <th colspan="4"class="title">직급</th>
         <td colspan="3">
            <form:select path="poCd" class="form-select">
               <form:option value="" label="직급선택" />
               <form:options items="${poList }" itemLabel="poName" itemValue="poCd" />
            </form:select> 
            <form:errors path="poCd" class="errors" /></td>
      </tr>
      <tr>
         <th class="title">입사일자</th>
         <td colspan="10">
            <form:input path="enpStart" class="form-control" type="date" /> 
            <form:errors path="enpStart" class="errors" /></td>
      </tr>
      
      
     <tr>
    <th rowspan="7" class="title">
   		 	<input type="hidden" name="empProfile"/>
			<input type='file' onchange="readURL(this);" name="empFiles" multiple="multiple"/>
			<img id="preview" alt="미리보기"/>
	    </th>
	    
		   <th>성명</th>
		    <td colspan="9">
		        <form:input path="empName" class="form-control" type="text" />
	        <form:errors path="empName" class="errors" />
	    </td>
	</tr>
	
	
      <tr>
         <th>비밀번호</th>
         <td colspan="9">
            <form:password path="empPw" class="form-control"/>
            <form:errors path="empPw" class="errors" /></td>
      </tr>
      <tr>
         <th>주민번호</th>
         <td colspan="9">
            <form:input path="empId1" class="form-control" type="text" /> 
            <form:errors path="empId1" class="errors" />
             ---
             <form:input path="empId2" class="form-control" type="password" /> 
            <form:errors path="empId2" class="errors" />
      </td>
      </tr>
      <tr>
      <td colspan="9">
      <div class="form-group">                   
		<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="empAdd" id="empAdd" type="text" readonly="readonly" >
		    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
		</div>
		<div class="form-group">
		    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="empAdd1" id="empAdd1" type="text" readonly="readonly" />
		</div>
		<div class="form-group">
		    <input class="form-control" placeholder="상세주소" name="empAdd2" id="empAdd2" type="text"  />
	</div>
      </td>
      </tr>
      
      <tr>
         <th>E-mail</th>
         <td colspan="9"> 
            <form:input path="empMail" class="form-control" type="text" /> 
            <form:errors path="empMail" class="errors" /></td>
      </tr>
      <tr>
         <th>핸드폰</th>
         <td colspan="9">
            <form:input path="empHp" class="form-control" type="text" /> 
            <form:errors path="empHp" class="errors" /></td>
      </tr>
      <tr>
         <th class="title">담당직무</th>
         <td colspan="9">
            <form:select path="busCd" name="busCd" class="form-select">
               <form:option value="" label="업무선택" />
               <form:options items="${busList }" itemLabel="busName" itemValue="busCd" />
            </form:select>
            <form:errors path="busCd" class="errors" /></td>
           </tr>
      <tr>
          <th class="title">계좌번호</th>
          <td colspan="10"> 
          	<form:input path="empBank" class="form-control" tpye="text"/>
          	<form:errors path="empBank" class="errors" />
          </td>
      </tr>
     <tr>
      <th class="title">결혼여부</th>
      <th colspan="5">
      <label>미 혼<input type="radio" name="empMarry" value="N" /></label></th>
      <th colspan="4">
      <label>기 혼<input type="radio" name="empMarry" value="Y" /></label></th>
   </tr>
      <tr>
         <th colspan="11">학력사항</th>
      </tr>
      <tr>
         <th colspan="2" class="title">학교 명</th>
         <th colspan="1">전 공</th>
         <th colspan="4">기간</th>
         <th colspan="1">학위</th>
         <th colspan="2">졸업여부</th>
      </tr>
      <tr>
         <td colspan="2">
            <form:input path="uniersity.uniName" class="form-control" type="text" /> 
            <form:errors path="uniersity.uniName" class="errors" />
         </td>
         <td colspan="1">
            <form:input path="uniersity.uniMajor" class="form-control" type="text" /> 
            <form:errors path="uniersity.uniMajor" class="errors" />
         </td>
         <td colspan="4">
            <form:input path="uniersity.uniStart" class="form-control" type="date" /> 
            <form:errors path="uniersity.uniStart" class="errors" />
             ~<form:input path="uniersity.uniEnd" class="form-control" type="date" /> 
             <form:errors path="uniersity.uniEnd" class="errors" />
         </td>
         <td colspan="1">
            <form:input path="uniersity.uniDegree" class="form-control" type="text" /> 
            <form:errors path="uniersity.uniDegree" class="errors" />
         </td >
			<th colspan="1">
			<label>졸업<input type="radio" name="uniersity.code" value="U_01" /></label></th>
			<th colspan="1">
			<label>재학<input type="radio" name="uniersity.code" value="U_02" /></label></th>
		</tr>

      <tr>
         <th colspan="11">가족관계
         <span class="plusR">
         <button id="famForm" class="btn btn-outline-secondary" type="button">추가</button></span></th>
      </tr>
      <tr>
         <th>관계</th>
         <th>성명</th>
         <th colspan="3">생년월일</th>
         <th>직업</th>
         <th>학위</th>
         <th colspan="2">동거여부</th>
         <th colspan="2">비고</th>
      </tr>
      <tbody id="famInsert">
          <tr> 
             <td> 
                <form:input path="family.famClassify" class="form-control" type="text" /> 
                <form:errors path="family.famClassify" class="errors" /> 
             </td> 
             <td> 
                <form:input path="family.famName" class="form-control" type="text" /> 
                <form:errors path="family.famName" class="errors" /> 
             </td> 
             <td colspan="3"> 
                <form:input path="family.famBir" class="form-control" type="text" /> 
                <form:errors path="family.famBir" class="errors" /> 
             </td>
             <td> 
                <form:input path="family.famJob" class="form-control" type="text" /> 
                <form:errors path="family.famJob" class="errors" /> 
             </td> 
             <td> 
                <form:input path="family.famEdu" class="form-control" type="text" /> 
                <form:errors path="family.famEdu" class="errors" /> 
             </td> 
	     	<th>
	    	 <label>동거<input type="radio" name="family.code" value="F_01" /></label></th>
    		 <th>
    		 <label>비동거<input type="radio" name="family.code" value="F_02" /></label></th>
     		 
             <td colspan="2"> 
                <form:input path="family.famNote" class="form-control" type="text" /> 
                <form:errors path="family.famNote" class="errors" /> 
             </td> 
          </tr> 
<%--        </c:forEach> --%>
       </tbody>
   </table>
   <table style="width: 90%; , background-color: white;">
      <tr>
         <th colspan="20">자격사항
         <span class="plusR">
         <button id="liForm" class="btn btn-outline-secondary" type="button">추가</button></span></th>
      </tr>
      <tr>
         <th colspan="3">자격증명</th>
         <th colspan="3">자격증 취득일시</th>
         <th colspan="5">자격증 발급기관</th>
      </tr>
      <tbody id="liInsert">
     	 <tr>
               <td colspan="3"> 
                  <form:input path="license.licenseNm" class="form-control" type="text" />
                  <form:errors path="license.licenseNm" class="errors" />
               </td>
               <td colspan="4">
                  <form:input path="license.licenseDate" class="form-control" type="date" />
                  <form:errors path="license.licenseDate" class="errors" />
               </td>
               <td colspan="4">
                  <form:input path="license.licenseAgency" class="form-control" type="text" />
                  <form:errors path="license.licenseAgency" class="errors" />
               </td>
            </tr>
      
      </tbody>
      </table>
   
      <table style="width: 90%; , background-color: white;">
         <tr>
            <th colspan="11">경력사항
            <span class="plusR">
            <button id="carForm" class="btn btn-outline-secondary" type="button">추가</button></span></th>
          
         </tr>
         <tr>
            <th colspan="3">회사명</th>
            <th colspan="4">담당업무</th>
            <th colspan="4">근무개월</th>
         </tr>
         <tbody id="carInsert">
            <tr>
               <td colspan="3"> 
                  <form:input path="career.carNm" class="form-control" type="text" />
                  <form:errors path="career.carNm" class="errors" />
               </td>
               <td colspan="4">
                  <form:input path="career.carPo" class="form-control" type="text" />
                  <form:errors path="career.carPo" class="errors" />
               </td>
               <td colspan="4">
                  <form:input path="career.carDate" class="form-control" type="text" />
                  <form:errors path="career.carDate" class="errors" />
               </td>
            </tr>
            </tbody>
      </table>

      <table style="width: 90%; , background-color: white;">
      <!--    경력에 따라서 행 추가 -->
      
      <tr>
      <th colspan="2">병역관계</th>
      <th colspan="2">
      <label>복 무<input type="radio" name="empMilitary" value="Y" /></label></th>
      <th colspan="2">
      <label>미 필<input type="radio" name="empMilitary" value="N" /></label></th>
      <th colspan="4">
      <label>해당없음<input type="radio" name="empMilitary" value="A" /></label></th>

   </tr>
   <tr>
      <td colspan="7" style="text-align: right;">
	    <input id="saveBtn" class="btn btn-success" type="submit" value="저장" />
      	<input class="btn btn-danger" type="reset" value="초기화" />
      </td>
   </tr>
   </table>
</form:form>
</div>
<script>

let famCounter = 0;

$('#famForm').on('click', function() {
   let modifiedHTML = `<tr>
      <td> 
         <form:input path="family.famClassify" class="form-control" type="text" /> 
         <form:errors path="family.famClassify" class="errors" /> 
      </td> 
      <td> 
         <form:input path="family.famName" class="form-control" type="text" /> 
         <form:errors path="family.famName" class="errors" /> 
      </td> 
      <td colspan="3"> 
         <form:input path="family.famBir" class="form-control" type="text" /> 
         <form:errors path="family.famBir" class="errors" /> 
      </td>
      <td> 
         <form:input path="family.famJob" class="form-control" type="text" /> 
         <form:errors path="family.famJob" class="errors" /> 
      </td> 
      <td> 
         <form:input path="family.famEdu" class="form-control" type="text" /> 
         <form:errors path="family.famEdu" class="errors" /> 
      </td>
     	 <th>
    	  <label>동거<input type="radio" name="family.state.stateNm" value="F_01" /></label></th>
    	  <th>
    	  <label>비동거<input type="radio" name="family.state.stateNm" value="F_02" /></label></th>
      <td colspan="2"> 
         <form:input path="family.famNote" class="form-control" type="text" /> 
         <form:errors path="family.famNote" class="errors" /> 
      </td>
      </tr>`;
      
      $('#famInsert').append(modifiedHTML);
      
      famCounter++;
});


let liCounter = 0;

$('#liForm').on('click', function(){
	let liHtml = `<tr>
	 </td>
	 <td colspan="3">
	 	<form:input path="license.licenseNm" class="form-control" type="text" /> 
        <form:errors path="license.licenseNm" class="errors" /> 
	 </td>
	 <td colspan="3">
	 	<form:input path="license.licenseDate" class="form-control" type="date" /> 
        <form:errors path="license.licenseDate" class="errors" /> 
	 </td>
	 <td colspan="5">
	 	<form:input path="license.licenseAgency" class="form-control" type="text" /> 
        <form:errors path="license.licenseAgency" class="errors" /> 
	 </td>
	 </tr>`;
	 
	$('#liInsert').append(liHtml);
	
	liCounter++;
});

let carCounter = 0;
$('#carForm').on('click', function(){
	let carHTML = `<tr>
		 <td colspan="3">  
           <form:input path="career.carNm" class="form-control" type="text" /> 
           <form:errors path="career.carNm" class="errors" /> 
        </td> 
        <td colspan="4"> 
           <form:input path="career.carPo" class="form-control" type="text" />
           <form:errors path="career.carPo" class="errors" />
        </td> 
        <td colspan="4"> 
           <form:input path="career.carDate" class="form-control" type="text" /> 
           <form:errors path="career.carDate" class="errors" /> 
        </td> 
        </tr>`;
	$('#carInsert').append(carHTML);
	
	carCounter++;
});


function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	    	$('#preview').attr('src', e.target.result);
	    	console.log(e.target.result);
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
	
$('#empFiles').on('change', function () {
    readURL(this); // 이미지를 미리보기로 표시
});
 

$('#saveBtn').on('click', function() {
	　　let formData = new FormData($('#empProfile')[0]);  // 폼 객체
	　　formData.append("upload", inputFileList[i]);  // 배열에서 이미지들을 꺼내 폼 객체에 담는다.

	　　$.ajax({
        type: 'post',
        enctype: "multipart/form-data",
        url: '/employee/uploadImage',
        data: formData,
        processData: false,
        contentType: false,
        success: function(responseData) {
            // 서버로부터 이미지 URL 받기
            let imageUrl = responseData.imageUrl;
            // 이미지 URL을 empProfile 요소의 src 속성에 할당하여 이미지 표시
            $('#empProfile').attr('src', imageUrl);
            
           
          
            // 이미지 URL을 다른 데이터와 함께 서버에 저장하거나 활용 가능
        },
        error: function(e) {
            alert("error:" + e);
        }
    });
});

//폼이 제출될 때의 이벤트 핸들러
$("#saveBtn").on('click', function (e) {
    e.preventDefault(); // 기본 폼 제출 동작을 막음
    
    var successMessage = "<%= request.getAttribute("message") %>";
    if (successMessage) {
       Swal.fire({
          title: '직원 등록이 완료되었습니다.',        
          icon: 'success',
          timer:50000
//        }).then(function() {
//           $('#empForm').submit();
       });
    };
});

function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=empAdd]").val(data.zonecode);
           $("[name=empAdd1]").val(fullRoadAddr);
           
//             document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('empAdd').value = data.zonecode; 
           document.getElementById('empAdd1').value = fullRoadAddr;
       }
    }).open();
}

document.addEventListener("DOMContentLoaded", function() {
	const autofillButton = document.getElementById("empAuto");

	autofillButton.addEventListener("click", function() {
		const depCdInput = document.querySelector('select[name="depCd"]');
		const poCdInput = document.querySelector('select[name="poCd"]');
		const enpStartInput = document.querySelector('input[name="enpStart"]');
		const empNameInput = document.querySelector('input[name="empName"]');
		const empId1Input = document.querySelector('input[name="empId1"]');
		const empId2Input = document.querySelector('input[name="empId2"]');
		const empAddInput = document.querySelector('input[name="empAdd"]');
		const empAdd1Input = document.querySelector('input[name="empAdd1"]');
		const empAdd2Input = document.querySelector('input[name="empAdd2"]');
		const empMailInput = document.querySelector('input[name="empMail"]');
		const empHpInput = document.querySelector('input[name="empHp"]');
		const busCdInput = document.querySelector('select[name="busCd"]');
		const empBankInput = document.querySelector('input[name="empBank"]');
		
		const uniNameInput = document.querySelector('input[name="uniersity.uniName"]');
		const uniMajorInput = document.querySelector('input[name="uniersity.uniMajor"]');
		const uniStartInput = document.querySelector('input[name="uniersity.uniStart"]');
		const uniEndInput = document.querySelector('input[name="uniersity.uniEnd"]');
		const uniDegreeInput = document.querySelector('input[name="uniersity.uniDegree"]');

		const famClassifyInput = document.querySelector('input[name="family.famClassify"]');
		const famNameInput = document.querySelector('input[name="family.famName"]');
		const famBirInput = document.querySelector('input[name="family.famBir"]');
		const famJobInput = document.querySelector('input[name="family.famJob"]');
		const famEduInput = document.querySelector('input[name="family.famEdu"]');

		const licenseNmInput = document.querySelector('input[name="license.licenseNm"]');
		const licenseDateInput = document.querySelector('input[name="license.licenseDate"]');
		const licenseAgencyInput = document.querySelector('input[name="license.licenseAgency"]');
		
		
		depCdInput.value = "DEP_IT_002";
		poCdInput.value = "PO_008";
		enpStartInput.value = "2023-09-01";
		empNameInput.value = "박건태";
		empId1Input.value = "970306";
		empId2Input.value = "1000000";
		empAddInput.value = "35315";
		empAdd1Input.value = "대전 서구 동서대로1063번길 14-8 (내동)";
		empAdd2Input.value = "허니빌 202호";
		empMailInput.value = "ssdey12@naver.com";
		empHpInput.value = "010-8791-9703";
		busCdInput.value = "BUS_003";
		empBankInput.value = "71040200248307";

		uniNameInput.value = "한남대학교";
		uniMajorInput.value = "컴퓨터통신무인기술학과";
		uniStartInput.value = "2016-03-01";
		uniEndInput.value = "2022-02-10";
		uniDegreeInput.value = "학사";

		famClassifyInput.value = "모";
		famNameInput.value = "이여사";
		famBirInput.value = "1976-02-21";
		famJobInput.value = "농업";
		famEduInput.value = "학사";

		licenseNmInput.value = "운전면허증(1종 보통)";
		licenseDateInput.value = "2016-01-14";
		licenseAgencyInput.value = "경상북도 경찰청";

	});
});










</script>