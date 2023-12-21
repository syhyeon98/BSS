<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
<script src='${pageContext.request.contextPath }/resources/js/calendar.min.js'></script>

<style>
.fc-event-title {
	font-size: 20px;
}
</style>
<script>   
    var calendar; // FullCalendar 인스턴스를 저장하는데 사용될 이름이 지정된 변수를 선언.
    document.addEventListener('DOMContentLoaded', function() { //이 이벤트 리스너는 HTML 문서의 콘텐츠가 완전히 로드될 때 트리거됨. DOM이 준비되었을 때만 후속 코드가 실행되도록 함
    	let setting = {  // ajax 요청 설정
    		url : "${pageContext.request.contextPath }/calendar/companycalendar",
    		method : "post",
    		data : "json",   // json형태로 받아와야함.
    		success : function(data) {
    			
    	console.log('data : ', data);		
    	var calendarEl = document.getElementById('companycalendar');
    	calendar = new FullCalendar.Calendar(calendarEl, {
    		
    	height: 800,	 // 캘린더 높이 사이즈	
    	aspectRatio: 2,  // 종횡비	
       	headerToolbar: {  // 헤더 기능
       	left: 'prevYear,prev,next,nextYear today',   // 헤더 좌측 기능
       	center: 'title',							 // 헤더 센터 제목 
       	right: 'multiMonthYear,dayGridMonth'		 // 헤더 우측 기능
       	},
       	 editable: true, 		// 캘린더 편집 기능
            droppable: true,  	// Fullcalendar옵션 : 드래그 요소.
            displayEventTime : false,   // 이벤트 시간 표기 없앰.
            selectable: true,   // 달력 일자 드래그 설정가능
            nowIndicator: true, // 현재 시간 마크
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
    	var eventstartdt = info.dateStr.split('T')[0];  // 시작 시간초기값
		var eventenddt = info.dateStr.split('T')[0];	// 끝나는 시간초기값
		
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
			console.log('info.event', info.event);
			var eventid = info.event.id;
			var eventtitle = info.event.title;
			var eventstartdt = info.event.startStr;
			var eventenddt = info.event.endStr;
			
			var eventcont = info.event.extendedProps.cont;
			console.log('종료일자 : ',  eventenddt);
			
    		document.getElementById('comScNo').value = eventid;
    		document.getElementById('upcomTitle').value = eventtitle;
    		document.getElementById('upstartDate').value = eventstartdt.split('T')[0];
    		document.getElementById('upendDate').value = eventenddt.split('T')[0];
    		document.getElementById('upcomCont').value = eventcont;
    		
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
		let $checkDdcCd = $("input:checked").parent('td').siblings('.comscno');
		if($checkDdcCd.length==1){
 			let $modalBody = $(this).find(".modal-body");
 			let comSCNO = $checkDdcCd.text();
			console.log(comscno);
		  location.reload(); // 페이지 리로드
 			
			$.ajax(setting);
 		}
     	});
		$(insertModal).on('hidden.bs.modal', function (event) {
		    // 모달이 닫힐 때 페이지 리로드
		    location.reload();
		});
    	
		// 수정모달 값
		$(updateModal).on('show.bs.modal',function(event){
		let $checkDdcCd= $("input:checked").parent('td').siblings('.comscno');
		if($checkDdcCd.length==1){
 			let $modalBody = $(this).find(".modal-body");
 			let comSCNO = $checkDdcCd.text();
			console.log(comscno);
			
			$.ajax(setting);
 		}
		});  
		$(updateModal).on('hidden.bs.modal', function (event) {
		    // 모달이 닫힐 때 페이지 리로드
		    location.reload();
		});
    	
    	
    	// 등록모달 버튼 만들기
		$('#insertBtn').on('click', function(event) {
		//event.preventDefault();		// 이벤트의 기본동작을 중단시키는 역할
			// 이벤트 클릭시의 동작
			const eventstartdt = $(instartDate).val();  // 등록 날짜 시작 이벤트
			const eventenddt = $(inendDate).val(); 		// 등록 날짜 끝나는 이벤트
			const eventcomtt = $(incomTitle).val();		// 등록 날짜 제목 이벤트
			const eventcont = $(incomCont).val();		// 등록 내용 이벤트
			var formData = {
					comStart : eventstartdt, // 시작 이벤트
					comEnd : eventenddt,     // 끝나는 이벤트
					comTitle : eventcomtt,	 // 제목 이벤트
					comCont : eventcont
			};
			// controller에서 일정등록하는 부분.
			let setting = {
					url : `${pageContext.request.contextPath}/calendar/companyInsert.do`, 
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
		                            }else{
		                            	calendar.addEvent(newevent)
		                            }// if (updatedEvent) end
		                        } else {
		                            // 새로운 일정 추가 시
		                            calendar.refetchEvents();
		                        }// if (response.eventId) end
		                   }else{
		                	   alert(response.message)
		                	   
		                   }// if(response.success) end
                        
					}// success end
			}//setting end
			$.ajax(setting);
	 	});
		
		
		// 수정모달 버튼 만들기
		$('#updateBtn').on('click', function(event) {
			event.preventDefault();		// 이벤트의 기본동작을 중단시키는 역할
			// 이벤트 클릭시의 동작
			const eventstartdt = $(upstartDate).val();  // 수정 날짜 시작 이벤트
			const eventenddt = $(upendDate).val(); 		// 수정 끝나는 이벤트
			const eventcomtt = $(updatecomTitle).val();		// 수정 제목 이벤트
			const eventcomscno = $(comScNo).val();		// 회사 코드번호 이벤트
			const eventcont = $(updatecomCont).val();
			
			var formData = {
					comStart : eventstartdt, // 시작 이벤트
					comEnd : eventenddt,     // 끝나는 이벤트
					comTitle : eventcomtt,	 // 제목 이벤트
					comScNo : eventcomscno,	 // 회사 코드번호 이벤트
					comCont : eventcont
			}
			// controller에서 일정수정하는 부분.
			let setting = {
					url : `${pageContext.request.contextPath}/calendar/companyUpdate.do`, 
					dataType : 'json',
					method : 'post',
					data : formData, 
					success : function(response) {  
						console.log(response) // 출력시 확인하는 부분 (newevent, success, message)
						$(updateModal).modal('hide');
		                   // 해당 일정만 다시 렌더링
	                   	if(response.success){  // response 안에 newevent, success, message 담겨있음.
		                		   var company = response.company
		                            var updatedEvent = calendar.getEventById(company.id);
		                            if (updatedEvent) {
		                                updatedEvent.setProp('title', company.title);
		                                updatedEvent.setStart(company.start);
		                                updatedEvent.setEnd(company.end);
		                                updatedEvent.setExtendedProp('cont', company.cont);
		                            } // if (updatedEvent) end
		                   }else{
		                	   alert(response.message)
		                   } // else end
		                  
					}// success end
			}//setting end
			$.ajax(setting);
	 	});
		
// 		//기존 이벤트 삭제 (일정 삭제)
// 		fcCalendar.removeAllEvents
// 		// *fcCalendar = 생성한 캘린더 명 
// 		//removeAllEvents로 등록된 일정을 모두 지우거나
// 		removeClick: function(info) { 
// 		      var id = info.event._def.defId; ////클릭한 일정 Id
// 		      fcCalendar.getEvents().forEach(function(evt) {
// 		            if (evt._def.defId == id) evt.remove();
// 		      });
// 		}
		
     	})
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

<h5>☗ 공동서비스 ▸ 캘린더 ▸ 전체일정</h5>
<hr color="black">
<!-- 등록 모달 -->
<div class="modal fade" id="insertModal" tabindex="-1" role="dialog"  aria-labelledby="insertModal" aria-hidden="true">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header"><h3 class="modal-title" id="insertModalTitle">일정등록</h3></div>
         <div class="modal-body">
            <form id="insertForm">
<!--                <input type="hidden" id="incomScNo" name="comScNo"> -->
               <div class="form-group">
                  <label for="comTarget">공통일정</label> <input type="checkbox" id="comTarget" name="comTarget" value="">
               </div>
               <div class="form-group">
                  <label for="startDate">시작일</label> <input type="date" class="form-control" id="instartDate" name="startDate">
               </div>
               <div class="form-group">
                  <label for="endDate">종료일</label> <input type="date" class="form-control" id="inendDate" name="endDate">
               </div>
               <div class="form-group">
                  <label for="comTitle">일정명</label> <input type="text" class="form-control" id="incomTitle" name="comTitle">
               </div>
               <div class="form-group">
                  <label for="comCont">일정내용</label> <input type="text" class="form-control" id="incomCont" name="comCont">
               </div>
               <div class="modal-footer"></div>
               <button id="insertBtn" type="button" class="btn btn-primary">저장</button>
<!--                <button type="button" class="btn btn-danger" data-bs-toggle="modal" >삭제</button> -->
               <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">닫기</button>	
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
               <input type="hidden" id="comScNo" name="comScNo">
               <div class="form-group">
                  <label for="comTarget">공통일정</label> <input type="checkbox" id="comTarget" name="comTarget" value="">
               </div>
               <div class="form-group">
                  <label for="startDate">시작일</label> <input type="date" class="form-control" id="upstartDate" name="startDate">
               </div>
               <div class="form-group">
                  <label for="endDate">종료일</label> <input type="date" class="form-control" id="upendDate" name="endDate">
               </div>
               <div class="form-group">
                  <label for="comTitle">일정명</label> <input type="text" class="form-control" id="upcomTitle" name="comTitle">
               </div>
                <div class="form-group">
                  <label for="comCont">일정내용</label> <input type="text" class="form-control" id="upcomCont" name="comCont">
               </div>
               
               <div class="form-group">
                  <label for="comTitle">일정수정명</label> <input type="text" class="form-control" id="updatecomTitle" name="comTitle">
               </div>
                <div class="form-group">
                  <label for="comCont">수정일정내용</label> <input type="text" class="form-control" id="updatecomCont" name="comCont">
               </div>
				<div class="modal-footer"></div>
				<button id="updateBtn" type="button" class="btn btn-primary">수정</button>
<!-- 				<button type="button" class="btn btn-danger" data-bs-toggle="modal" >삭제</button> -->
	            <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">닫기</button>
	            </form>
	        </div>
		</div>
	</div>
</div>
	<div id='companycalendar'></div>
</body>
</html>

