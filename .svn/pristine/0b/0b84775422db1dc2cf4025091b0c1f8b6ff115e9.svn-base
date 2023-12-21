<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
<script src='${pageContext.request.contextPath }/resources/js/calendar.min.js'></script>
<script>   
    var calendar; // FullCalendar 인스턴스를 저장하는데 사용될 이름이 지정된 변수를 선언.
    document.addEventListener('DOMContentLoaded', function() { //이 이벤트 리스너는 HTML 문서의 콘텐츠가 완전히 로드될 때 트리거됨. DOM이 준비되었을 때만 후속 코드가 실행되도록 함
    	let setting = {  // ajax 요청 설정
    		url : "${pageContext.request.contextPath }/calendar/personalcalendar",
    		method : "post",
    		data : "json",   // json형태로 받아와야함.
    		success : function(data) {
    			
    	console.log('data : ', data)
    	var calendarEl = document.getElementById('personalcalendar');
    	calendar = new FullCalendar.Calendar(calendarEl, {
    		
    	height: 800,	 	// 캘린더 높이 사이즈
    	aspectRatio: 2,  	// 종횡비
  		headerToolbar: {   	// 헤더 기능
       	left: 'prevYear,prev,next,nextYear today',   // 헤더 좌측 기능
       	center: 'title',							 // 헤더 센터 제목 
       	right: 'multiMonthYear,dayGridMonth'		 // 헤더 우측 기능
       	},
       	 	editable: true, 			// 캘린더 편집 기능
       	 	eventLimit: true,			// 하나의 날짜셀에 너무 많이 표시될때 처리할 방법.
            droppable: true,  			// Fullcalendar옵션 : 드래그 요소
            displayEventTime : false,   // 이벤트 시간 표기 없앰
            selectable: true,   		// 달력 일자 드래그 설정가능.
            selectHelper: false,		// 사용자가 이벤트를 선택할때, 보조 이벤트로 표시할지 여부를 설정.
            nowIndicator: true, 		// 현재 시간 마크.
            
            drop: function (arg) {
         if (document.getElementById('drop-remove').checked) {
             arg.draggedEl.parentNode.removeChild(arg.draggedEl);
            }
	         },
	         
    	// 클릭시 등록모달 창이 뜸
    	dateClick: function(info) {
    	const myModal = new bootstrap.Modal(document.getElementById('insertModal'), {
			backdrop: 'static',  // 모달 외부 클릭 시 닫히지 않도록 설정
			keyboard: false 	 // Esc 키를 눌러 모달이 닫히지 않도록 설정
		})
    	var eventstartdt = info.dateStr.split('T')[0];  	// 시작 시간초기값
		var eventenddt = info.dateStr.split('T')[0];		// 끝나는 시간초기값
		
		document.getElementById('instartDate').value = eventstartdt; 
		document.getElementById('inendDate').value = eventenddt;
		
    	myModal.show('modal')
    	},
    	
		        
    	// 클릭시 수정모달 창이 뜸
    	eventClick: function(info) {
		const myModal = new bootstrap.Modal(document.getElementById('updateModal'), {
			backdrop: 'static',  // 모달 외부 클릭 시 닫히지 않도록 설정
			keyboard: false 	 // Esc 키를 눌러 모달이 닫히지 않도록 설정
		});
			console.log('info.event', info.event);    	   // info.event 콘솔을 찍어본다.
			var eventid 	 = info.event.id;		 	   // 이벤트를 고유하게 식별하고 관리하는데 사용
			var eventtitle 	 = info.event.title;		   // 이벤트의 제목을 나타내는데 사용
			var eventstartdt = info.event.startStr;   	   // 이벤트의 시작 시간을 나타내는데 사용
			var eventenddt 	 = info.event.endStr;  	  	   // 이벤트의 종료 시간을 나타내는데 사용
			var eventcont = info.event.extendedProps.cont;
			
// 			console.log('종료일자 : ',  eventenddt);
			
			document.getElementById('perScNo').value = eventid;
			document.getElementById('upperTitle').value = eventtitle;
    		document.getElementById('upperCont').value = eventcont;
    		document.getElementById('upstartDate').value = eventstartdt.split('T')[0];
    		document.getElementById('upendDate').value = eventenddt.split('T')[0];
    		
		myModal.show('modal');
        },
    		            	  
        // 날짜 초기값
    	initialDate: new Date(),
        businessHours: true,
       	events: data,
    	})
    	calendar.render();
    	},
    	
    	// 에러발생시 찍히는 현상.		
    	error : function(jqXHR, status, error) {
    	console.log(jqXHR)
    	console.log(status)
    	console.log(error)
    	}}
    	$.ajax(setting);
    	
    	// 등록모달 값
		$(insertModal).on('show.bs.modal',function(event){ 
		let $checkDdcCd = $("input:checked").parent('td').siblings('.perscno');
		if($checkDdcCd.length==1){
 			let $modalBody = $(this).find(".modal-body");
 			let perSCNO = $checkDdcCd.text();
			console.log(perscno);
 			
			$.ajax(setting);
 		}
     	});
		$(insertModal).on('hidden.bs.modal', function (event) {
		    // 모달이 닫힐 때 페이지 리로드
		    location.reload();
		});
    	
    	
		// 수정모달 값
		$(updateModal).on('show.bs.modal',function(event){
		let $checkDdcCd= $("input:checked").parent('td').siblings('.perscno');
		if($checkDdcCd.length==1){
 			let $modalBody = $(this).find(".modal-body");
 			let perSCNO = $checkDdcCd.text();
			console.log(perscno);
			
			$.ajax(setting);
 		}
		});  
		$(updateModal).on('hidden.bs.modal', function (event) {
		    // 모달이 닫힐 때 페이지 리로드
		    location.reload();
		});
    	
    	
    	// 등록모달 만들기
		$('#insertBtn').on('click', function(event) {
		//event.preventDefault();		// 이벤트의 기본동작을 중단시키는 역할
			// 이벤트 클릭시의 동작
			const eventstartdt = $(instartDate).val();  	// 등록시작 이벤트
			const eventenddt   = $(inendDate).val(); 		// 등록 끝나는 이벤트
			const eventpertt   = $(inperTitle).val();		// 등록 제목 이벤트
			const eventcont    = $(inperCont).val();		// 등록 내용 이벤트
// 			const eventTarget  = $(inperTarget).is(":checked")? "Y" : "N"; 			// 공통일정 체크 확인
			const eventTarget  = $("input:radio[name='perTarget']:checked").val(); 	// 공통일정 체크 확인
			const eventTrip    = $(inperTrip).is(":checked")? "Y" : "N"; 			// 출장 체크 확인
			const eventEdu     = $(inperEdu).is(":checked")? "Y" : "N"; 			// 교육 체크 확인
			const eventVaca    = $(inperVaca).is(":checked")? "Y" : "N"; 			// 휴가 체크 확인
			console.log(eventTarget);
// 			alert("eventTarget");   // eventTarget을 확인해봄. 	
			
			var formData = {
					perStart  :  eventstartdt, 		// 시작 이벤트
					perEnd    :  eventenddt,     	// 끝나는 이벤트
					perTitle  :  eventpertt,	 	// 제목 이벤트
					perCont	  :  eventcont, 		// 내용 이벤트
					perTarget :  eventTarget,  		// 공통일정 체크 여부 (Y 또는 N)
					perTrip   :  eventTrip,  		// 출장 체크 여부 (Y 또는 N)
					perEdu    :  eventEdu,  		// 교육 체크 여부 (Y 또는 N)
					perVaca   :  eventVaca   		// 휴가 체크 여부 (Y 또는 N)
			};
			
			// 일정등록 SweetAlert 
			Swal.fire({
                title: '일정 등록이 완료되었습니다.',
                icon: 'success',
                showConfirmButton: true, 	// "닫기" 버튼 표시
                confirmButtonText: '닫기', 	// 버튼 텍스트 설정
            }).then((result) => {
                if (result.isConfirmed) {
                    // 사용자가 "닫기" 버튼을 클릭하면 실행될 코드
//                     location.reload();
                }
            });
            
			// controller에서 일정등록하는 부분.
			let setting = {
					url : `${pageContext.request.contextPath}/calendar/personalInsert.do`, 
					dataType : 'json',
					method : 'post',
					data : formData, 
					success : function(response) {  
						console.log(response) // 출력시 확인하는 부분 (newevent, success, message)
						$(insertModal).modal('hide');
		                   // 해당 일정만 다시 렌더링
	                   	if(response.success){  // response 안에 newevent, success, message 담겨있음.
		                	   if (response.newevent) {
		                		   var newevent = response.newevent
		                		   var updatedEvent = calendar.getEventById(newevent.id);
		                           if (updatedEvent) {
		                               updatedEvent.setProp('title', newevent.title);
		                               updatedEvent.setStart(newevent.start);
		                               updatedEvent.setEnd(newevent.end);
		                               updatedEvent.setExtendedProp('cont', newevent.cont);
		                                console.log(new Date(newevent.end))
		                            }else{
		                            	calendar.addEvent(newevent)
		                            }// if (updatedEvent) end
// 		                            alert("등록완료");
		                        } else {
		                            // 새로운 일정 추가 시
		                            calendar.refetchEvents();  // 캘린더에 정보가 추가되거나 변경되었을 때 해당 정보를 업데이트 하는 기능
		                            calendar.render();
		                        }// if (response.eventId) end
		                        
		                   }else{
// 		                	   alert(response.message)
		                   }// if(response.success) end
					}// success end
			}//setting end
			$.ajax(setting);
	 	});
    	
    	
      //모달 닫힐 때 입력 필드 값을 초기화
		$('#insertModal').on('hidden.bs.modal', function(){
		   $('#perScNo').val('');					 // 개인일정번호 초기화
		   $('#perStart').val('');					 // 시작시간 초기화 
		   $('#perEnd').val('');					 // 끝나는시간 초기화
	       $('#perTitle').val('');					 // 제목 초기화
		   $('#perCont').val('');					 // 내용 초기화
		   $('#perTarget').prop('checked', false);	 // 공통일정 체크 여부 초기화
		   $('#perTrip').prop('checked', false);	 // 출장일정 체크 여부 초기화 
		   $('#perEdu').prop('checked', false);		 // 교육일정 체크 여부 초기화 
		   $('#perVaca').prop('checked', false);	 // 휴가 체크 여부 초기화
		   console.log("calendar : ", calendar);
		   //calendar.refetchEvents();  // 캘린더에 정보가 추가되거나 변경되었을 때 해당 정보를 업데이트 하는 기능
		   //calendar.render();
		   location.reload(true); // 자동으로 새로고침(리로드)
		});
      
		// 수정모달 버튼 만들기
		$('#updateBtn').on('click', function(event) {
	 	    event.preventDefault();		// 이벤트의 기본동작을 중단시키는 역할
			//이벤트 클릭시의 동작
			const eventstartdt 	 = $(upstartDate).val();			// 수정 시작 이벤트
			const eventenddt 	 = $(upendDate).val();				// 수정 끝나는 이벤트
			const eventpertt 	 = $(upperTitle).val();				// 수정 제목 이벤트	
			const eventperscno   = $(perScNo).val();				// 개인일정 코드번호 이벤트
			const eventcont 	 = $(upperCont).val();				// 일정내용 이벤트 
			const eventpertarget = $(upperTarget).val();			// 공통일정 이벤트
			const eventperTrip 	 = $(upperTrip).val();				// 출장 이벤트
			const eventperEdu 	 = $(upperEdu).val();				// 교육 이벤트
			const eventperVaca 	 = $(upperVaca).val();				// 휴가 이벤트
			
			const eventTarget =  $(upperTarget).is(":checked")? "Y" : "N"; 	// 공통일정 체크 확인
			const eventTrip   =  $(upperTrip).is(":checked")? "Y" : "N"; 	// 출장 체크 확인
			const eventEdu    =  $(upperEdu).is(":checked")? "Y" : "N"; 	// 교육 체크 확인
			const eventVaca   =  $(upperVaca).is(":checked")? "Y" : "N"; 	// 휴가 체크 확인
			
			// 일정수정 SweetAlert 
			Swal.fire({
                title: '일정 수정이 완료되었습니다.',
                icon: 'success',
                showConfirmButton: true, // "닫기" 버튼 표시
                confirmButtonText: '닫기', // 버튼 텍스트 설정
            }).then((result) => {
                if (result.isConfirmed) {
                    // 사용자가 "닫기" 버튼을 클릭하면 실행될 코드
//                     location.reload();
                }
            });
			
			
			
			var formData = {
					perStart  : eventstartdt, 		// 일정 시작 이벤트
					perEnd 	  : eventenddt,     	// 일정 끝나는 이벤트
					perScNo   : eventperscno,	 	// 개인일정 코드번호 이벤트
					perTitle  : eventpertt,	 		// 일정 제목 이벤트	
					perCont   : eventcont,	  		// 일정 내용 이벤트
					perTarget : eventTarget,  		// 공통일정 체크 여부 (Y 또는 N)
					perTrip	  : eventTrip,  		// 공통일정 체크 여부 (Y 또는 N)
					perEdu	  : eventEdu,  			// 공통일정 체크 여부 (Y 또는 N)
					perVaca   : eventVaca,  		// 공통일정 체크 여부 (Y 또는 N)
			}
			// controller에서 일정수정하는 부분.
			let setting = {
					url : `${pageContext.request.contextPath}/calendar/personalUpdate.do`,
					dataType : 'json',	// json 데이터로  타입을 지정함.
					method : 'post',	// HTTP헤더의 내용으로 보내는 방식으로 데이터 크기에 제한 없고, 헤더에 포함되어 보안이 뛰어남.
					data : formData,
					success : function(response) {
						console.log(response) // 출력시 확인하는 부분 (newevent, success, message)
						$(updateModal).modal('hide');
		                   // 해당 일정만 다시 렌더링
	                   	if(response.success){  // response 안에 newevent, success, message 담겨있음.
		                		   var personal = response.personal
		                            var updatedEvent = calendar.getEventById(personal.id);
		                		   if (updatedEvent) {
		                			    updatedEvent.setProp('title', personal.title);
		                			    updatedEvent.setStart(personal.start);
		                			    updatedEvent.setEnd(personal.end);
		                			    updatedEvent.setEnd(personal.end);
		                			    updatedEvent.setExtendedProp('cont', personal.cont); // cont 값을 업데이트
		                			} // if (updatedEvent) end
// 		                            alert("수정완료");
		                   }else{
		                	   alert(response.message)
		                   } //else end
					}// success end
			}//setting end
			$.ajax(setting);
	 	});
		
		
		// 삭제 버튼
		$('#deleteBtn').on('click',function(event){
			
// 			console.log('event => ', event);
			const eventperscno = $(perScNo).val();	// 개인 코드번호 이벤트  
			
			// 일정삭제 SweetAlert 
			Swal.fire({
                title: '일정삭제가 완료되었습니다.',
                icon: 'success',
                showConfirmButton: true, // "닫기" 버튼 표시
                confirmButtonText: '닫기', // 버튼 텍스트 설정
            }).then((result) => {
                if (result.isConfirmed) {
                    // 사용자가 "닫기" 버튼을 클릭하면 실행될 코드
                    location.reload();
                }
            });
			
			
			var formData = {
					perScNo : eventperscno	 // 개인일정 코드번호 이벤트 
			}
			let $checkPerScNo= $("input:checked").parent('td').siblings('.PerScNo');
			let allowCd=[];
			for(let i = 0;i<$checkPerScNo.length;i++){
				PerScNo.push($checkPerScNo[i].innerText);
			}
			let setting = {
				url : `${pageContext.request.contextPath}/calendar/personalDelete.do`,
				method : 'post',
				dataType : 'json',
				traditional: true,
				data : formData,
				success : function(resp) {
					if(resp.success){
						$("input:checked").parents('tr').remove();
// 						alert("삭제완료");
						var deleteEvent = calendar.getEventById(eventperscno);
                        if (deleteEvent) {
                            
                        	deleteEvent.remove();
                        	$(updateModal).modal('hide');
                        	
                        } // if (updatedEvent) end
					}else{
						alert("실행중 실패");
					}
				},
			}

			$.ajax(setting);
		})
		
     	})
     	// 일정 자동완성 기능.
     	document.addEventListener("DOMContentLoaded", function() {
		const autofillButton = document.getElementById("btnauto");

		autofillButton.addEventListener("click", function() {
			const perTitleInput = document.querySelector('input[name="perTitle"]');
			const perContInput = document.querySelector('input[name="perCont"]');
			
// 			location.reload();

			// 아이디와 비밀번호를 원하는 값으로 변경
			perTitleInput.value = "일정명입니다";
			perContInput.value = "무슨일정일까요";
		});
	});
     	
     	
     	
    </script>
</head>

<style>
   /* 월요일 색깔 */
   .fc-day-mon a {
     color: black;
     text-decoration: none;
   }
   /* 화요일 색깔 */
   .fc-day-tue a {
     color: black;  
     text-decoration: none;
   }
   /* 수요일 색깔 */
   .fc-day-wed a {
     color: black;
     text-decoration: none;
   }
   /* 목요일 색깔 */
   .fc-day-thu a {				
     color: black;
     text-decoration: none;
   }
   /* 금요일 색깔 */
   .fc-day-fri a {
     color: black;
     text-decoration: none;
   }
   /* 토요일 색깔 */
   .fc-day-sat a {
     color: blue;
     text-decoration: none;
   }
   /* 일요일 색깔 */
   .fc-day-sun a {
     color: red;
     text-decoration: none;
   }
   /* 투데이 색상 */
   .fc-day-today {
   	background: #adc8e6 !important; 
   }
</style>

<body>

<h5>☗ 공동서비스 ▸ 캘린더 ▸ 개인일정</h5>
<hr color="black">

<!-- 등록 모달 -->
<div class="modal fade" id="insertModal" tabindex="-1" role="dialog"  aria-labelledby="insertModal" aria-hidden="true">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header"><h3 class="modal-title" id="insertModalTitle">일정등록</h3></div>
         <div class="modal-body">
            <form id="insertForm">
<!--                <input type="hidden" id="inperScNo" name="perScNo"> -->
<!--                <div class="form-group"> -->
                  <label for="perTarget">공통일정</label> <input type="radio" id="inperTarget" name="perTarget" value="Y">
<!--                </div> -->
<!--                <div class="form-group"> -->
                  <label for="perTrip">출장</label> <input type="radio" id="inperTrip" name="perTarget" value="T">
<!--                </div> -->
<!--                <div class="form-group"> -->
                  <label for="perEdu">교육</label> <input type="radio" id="inperEdu" name="perTarget" value="E">
<!--                </div> -->
<!--                <div class="form-group"> -->
                  <label for="perVaca">휴가</label> <input type="radio" id="inperVaca" name="perTarget" value="V">
<!--                </div> -->
               <div class="form-group">
                  <label for="startDate">시작일</label> <input type="date" class="form-control" id="instartDate" name="startDate">
               </div>
               <div class="form-group">
                  <label for="endDate">종료일</label> <input type="date" class="form-control" id="inendDate" name="endDate">
               </div>
               <div class="form-group">
                  <label for="perTitle">일정명</label> <input type="text" class="form-control" id="inperTitle" name="perTitle">
               </div>
               <div class="form-group">
                  <label for="perCont">일정내용</label> <input type="text" class="form-control" id="inperCont" name="perCont">
               </div>
               <div class="modal-footer"></div>
	               <button id="btnauto" class="btn btn-primary" type="button">자동완성</button>
               <div style="float: right;">
	               <button id="insertBtn" type="button" class="btn btn-primary">저장</button>
	               <button type="button" class="btn btn-danger" data-bs-toggle="modal" >삭제</button>
	               <button style="" class="btn btn-secondary" type="button" data-bs-dismiss="modal" tabindex="5">닫기</button>
               </div>
              
               </form>
            </div>
         </div>
      </div>
   </div>
	
<!-- 수정 모달 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header"><h3 class="modal-title" id="updateModalTitle">일정수정</h3></div>
			<div class="modal-body">
			<form id="updateForm">
               <input type="hidden" id="perScNo" name="perScNo">
<!--                <div class="form-group"> -->
                  <label for="perTarget">공통일정</label> <input type="radio" id="upperTarget" name="perTarget" value="Y">
<!--                </div> -->
<!--                <div class="form-group"> -->
                  <label for="perTrip">출장</label> <input type="radio" id="upperTrip" name="perTarget" value="T">
<!--                </div> -->
<!--                <div class="form-group"> -->
                  <label for="perEdu">교육</label> <input type="radio" id="upperEdu" name="perTarget" value="E">
<!--                </div> -->
<!--                <div class="form-group"> -->
                  <label for="perVaca">휴가</label> <input type="radio" id="upperVaca" name="perTarget" value="V">
<!--                </div> -->
               <div class="form-group">
                  <label for="startDate">시작일</label> <input type="date" class="form-control" id="upstartDate" name="startDate">
               </div>
               <div class="form-group">
                  <label for="endDate">종료일</label> <input type="date" class="form-control" id="upendDate" name="endDate">
               </div>
               <div class="form-group">
                  <label for="perTitle">일정명</label> <input type="text" class="form-control" id="upperTitle" name="perTitle">
               </div>
                <div class="form-group">
                  <label for="perCont">일정내용</label> <input type="text" class="form-control" id="upperCont" name="perCont">
               </div>
				<div class="modal-footer"></div>
				<div style="float: right;">
				<button id="updateBtn" type="submit" class="btn btn-primary">수정</button>
				<button id="deleteBtn" type="button" class="btn btn-danger" >삭제</button>
	            <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">닫기</button>
	            </div>
	            </form>
	        </div>
		</div>
	</div>
</div>

<!-- 캘린더 리스트 -->
<div class="row">
	<div class="col-md-8" id='personalcalendar'></div>
		<div class="card box-shadow col-md-4 d-flex" style="min-height: 87%;">
	   <div class="h-100">
	<div class="card calendar-container">
	  <div id="calendar" class="calendar"></div>
	   <div id="listView" class="list-view card">
	   <div class="info-icon">
	        <i class="fas fa-info-circle" style="margin-right: 8px; color: slategray"></i>
	        <span class="info-text">일정</span>
	        <div class="arrow_box">
	           <div class="circleInfo-container">
	              <div class="circleInfo" style="background-color: #59C173"></div>
	                 <span style="margin-left: 20px;">교육일정</span>
	              <div class="circleInfo" style="background-color: #f64f59"></div>
	                 <span>일정</span>
	           </div>
	           <div class="circleInfo-container">
	              <div class="circleInfo" style="background-color: #F27121"></div>
	                 <span style="margin-left: 54px;">출장일정</span>
	              <div class="circleInfo" style="background-color: #12c2e9"></div>
	                 <span>일정</span>
	           </div>
	           <div class="circleInfo-container">
	              <div class="circleInfo" style="background-color: #c471ed"></div>
	                 <span style="margin-left: 33px;">휴가일정</span>
	              <div class="circleInfo" style="background-color: #f5af19"></div>
	                 <span>일정</span>
	           </div>
	        </div>
	    </div>
	      <div class="card-header py-3 list-title box-shadow" style="border-radius: 20px 20px 0 0; font-size: 16px;">
	         <i class="mdi mdi-checkbox-marked-circle-outline" style="color: green; margin-right: 11px;"></i>
	         Schedule List
	      </div>
	   </div>
	</div>
	</div>
	</div>
</div>
</body>
</html>

