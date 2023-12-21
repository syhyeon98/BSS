<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- c3.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/c3.css">

<!-- c3.js -->
<script src="${pageContext.request.contextPath }/resources/js/c3/c3.js"></script>
<script src='${pageContext.request.contextPath }/resources/js/calendar.min.js'></script>
<script
	src="${pageContext.request.contextPath }/resources/js/c3/d3-5.8.2.min.js"></script>
	<!-- calendar  -->
<style>
#node0 {
	display: flex;
}

#node1 {
	/* 	float: left; */
	width: 50%;
	height: 472px;
	margin-right: 30px;
}

#node2 {
	width: 70%;
	height: 472px;;
	margin-right: 30px;
	display: block;
}

#node3 {
	width: 30%;
	display: flex;
	box-sizing: border-box;
}

#node4 {
	width: 890px;
	height: 460px;
	display: inline-flex;
}

#node5 {
	display: inline-flex;
	width: 720px;
	height: 460px;
	margin-right: 25px;
}

#node6 {
	width: 600px;
}

#node1-1 {
	display: inline-flex;
	width: 100%;
}

#node1-2 {
	display: flex;
	padding-top: 25px;
}

.card {
	width: 100%;
}

.card-body {
	text-align: center;
}

#all {
	padding: 15px 0px 0px 15px;
	margin: 0px 20px 0px 20px;
}

#img {
	margin-left: 35px;
	width: 80%;
	height: 290px;
}

#ntcList {
	max-height: 350px; /* 원하는 높이로 설정 (넘칠 경우 스크롤바가 표시됩니다) */
	overflow-y: auto; /* 세로 스크롤바 표시 */
}
#mainWaitList {
	max-height: 350px; /* 원하는 높이로 설정 (넘칠 경우 스크롤바가 표시됩니다) */
	overflow-y: auto; /* 세로 스크롤바 표시 */
} 

#empRole {
	max-height: 350px; /* 원하는 높이로 설정 (넘칠 경우 스크롤바가 표시됩니다) */
	overflow-y: auto; /* 세로 스크롤바 표시 */
}
 
#reqEdit {
	max-height: 350px; /* 원하는 높이로 설정 (넘칠 경우 스크롤바가 표시됩니다) */
	overflow-y: auto; /* 세로 스크롤바 표시 */
}
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
<security:authentication property="principal.realUser" var="authEmployee" />
<div id="all">
	<div id="node0">
		<div id="node1-1">
			<div id="node2" class="card">
				<div class="card-header">캘린더
				<span class="plusR"><a
						href="${pageContext.request.contextPath}/calendar/personalcalendar"
						>캘린더 더보기</a></span>
				</div>
				<div class="card-body">
					<div id='personalcalendar'></div>
				</div>
			</div>
				<div id="node3">
					<div class="card">
						<div class="card-header">
							<img id="img"
								src="${ pageContext.request.contextPath}/resources/empProfile/${authEmployee.outAtchNm }"
								alt="직원 프로필 사진">
						</div>
						<div class="card-body">
							<p class="card-text">
								이름 :
								<security:authentication property="principal.realUser"
									var="authEmployee" />${authEmployee.empName}</p>
							<p class="card-text">
								사번:
								<security:authentication property="principal.realUser"
									var="authEmployee" />${authEmployee.empCd}</p>
							<p class="card-text">
								부서:
								<security:authentication property="principal.realUser"
									var="authEmployee" />${authEmployee.depName}</p>
							<a href="${pageContext.request.contextPath }/employee/mypage"
								class="btn btn-primary">마이페이지</a>
						</div>
					</div>
				</div>

			</div>

		</div>
		<c:choose>
			<c:when
				test="${authEmployee != null and authEmployee.empRole =='ROLE_ADMIN' }">
				<div id="node1-2">
					<div id="node5" class="card">
						<div class="card-header">댓글
						<span class="plusR"><a
						href="${pageContext.request.contextPath }/board/reqAllList"
						>요구사항 더보기</a></span>
						</div>
						<div class="card-body">
						
							<div id="reqEdit"></div>
							
						</div>
					</div>
					<div id="node4" class="card">
						<div class="card-header">권한 대기</div>
						<div class="card-body">
						
							<div id="empRole"></div>
							
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>
		<div id="node1-2">
			<div id="node5" class="card">
				<div class="card-header">결재할 서류
					<span class="plusR"><a
						href="${pageContext.request.contextPath }/ed/document/documentWaitList.do"
						>결재문서함 더보기</a></span>
				</div>
				<div class="card-body">
					<div id="mainWaitList"></div>
				</div>
			</div>
			<div id="node4" class="card">
				<div class="card-header">공지사항
				<span class="plusR">
				<a href="${pageContext.request.contextPath }/board/ntcAllList">공지사항 더보기</a></span>
				
				</div>
				<div class="card-body">

					<div id="ntcList"></div>

				</div>
			</div>
		</div>
		<c:choose>
			<c:when
				test="${authEmployee != null and authEmployee.empRole !='ROLE_ADMIN' }">
				<div id="chart" class="d-flex mt-4 mb-4">

					<div class="card me-1">
						<div class="card-header">환율
							<span class="plusR">
							<a href="${pageContext.request.contextPath }/finMarket/exchangeRate">더보기</a></span>
						
						</div>
						<div class="card-body">
							<div id="chart1"></div>
						</div>
					</div>

					<div class="card">
						<div class="card-header">코스피/코스닥
							<span class="plusR">
							<a href="${pageContext.request.contextPath }/finMarket/stockMarket">더보기</a></span>
						
						</div>
						<div class="card-body">
							<div id="chart2"></div>
						</div>
					</div>

				</div>
			</c:when>
		</c:choose>
	</div>
<script>



	$(function() {
		searchDoc();
		exchageRateChart();
		stockMarketChart();
	});
	
	let doc={};
	
	function searchDoc() {
		let setting = {
			url : `${pageContext.request.contextPath }/ed/document/mainWaitList.do`,
			method : "",
			dataType : "text",
			data : doc,
			success : function(resp) {
				$('#mainWaitList').html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	}
	
	function exchageRateChart() {
		let setting = {
			url : `${pageContext.request.contextPath }/finMarket/mainExchangeRateList`,
			method : "",
			dataType : "json",
			data : "",
			success : function(resp) {
				makeBarChart(resp,"#chart1");
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	}
	
	function stockMarketChart() {
		$.ajax({
			url : `${pageContext.request.contextPath}/finMarket/mainStockMarket`,
			type : 'GET',
			dataType : 'json',
			success : function(result) {
				makeBarChart(result,"#chart2");
			},
			error : function(result) {
				console.log("error >> " + $(result).text());
			}
		});
	}
	
	function makeBarChart(jsonData,chartArea) {
		var chartType = $(".chartType").val();
		var rows = jsonData.itemList;
		var unitName= rows[0].UNIT_NAME;
		var dataList = [];
		var dataListNm = jsonData.dataListNm;
		var baseMonthList = jsonData.timeList;
		// 		for(let i = 0;i< rows.length;i++){
		// 			dataListNm.push(rows[i].ITEM_NAME1);
		// 		}
		for (let i = 0; i < rows.length; i++) {
			dataList.push(rows[i].DATA_VALUE)
		}
		var rowData = [];
		var columns = [];
		var beforeColumns = [];
		// 		var datas = new Array();
		// 		var beforeDatas = new Array();
		var x = [ "x" ];

		for (let i = 0; i < baseMonthList.length; i++) {
			x.push(baseMonthList[i]);
		}
		columns.push(x);
		beforeColumns.push(x);
		console.log(x);
		// 		for ( var row in rows) {
		// 		datas.push(x);
		for (let i = 0; i < dataListNm.length; i++) {
			var rowData = [ dataListNm[i] ];
			for (let j = i * baseMonthList.length; j < i * baseMonthList.length
					+ baseMonthList.length; j++) {
				rowData.push(dataList[j]);
			}
			columns.push(rowData);
		}
		console.log("columns : " + columns)
		for (let i = 0; i < dataListNm.length; i++) {
			var rowData = [ dataListNm[i] ];
			for (let j = i * baseMonthList.length; j < i * baseMonthList.length
					+ baseMonthList.length; j++) {
				rowData.push(0);
			}
			beforeColumns.push(rowData);
		}

		var chart = c3.generate({
			bindto : chartArea,
			data : {
				type : "line",
				x : 'x',
				columns : beforeColumns
			},
			bar : {
				width : {
					radio : 0.5
				}
			},
			legend : {
				position : 'right'
			},
			axis : {
				x : {
					type : 'category' // x축을 카테고리 형태로 사용
				},
				y : {
					label : {
						text : unitName,
						position : 'outer-middle'
					}
				}
			},
			zoom : {
				enabled : true
			},
			size : {
				height : 350
			},
			tooltip : {
				grouped : false
			}
		});

// 		setTimeout(function() {
// 			chart.load({
// 				columns : columns
// 			});
// 		}, 200);
		const sliderImage = document.querySelector("#chart");

		function checkSlide(e) {
		          const viewportBottom = window.innerHeight + window.scrollY;
		          const imageHalfBottom =
		            sliderImage.offsetTop + sliderImage.offsetHeight / 2;
		          const isHalfShown = viewportBottom > imageHalfBottom;
		          const isNotScrollPast =
		          window.scrollY < sliderImage.offsetTop + sliderImage.height;
					console.log(isNotScrollPast)
		          if (isHalfShown ) {
		        	  chart.load({
		  				columns : columns
		  			});
		          } else {
		        	  chart.load({
			  				columns : beforeColumns
			  			});

		          }
		      }

		window.addEventListener("scroll", checkSlide);
		$("#chartType").on("change",function(){
			var chartType = $(this).val();
			chart.transform(chartType);
		})
	}

	
		function debounce(func, wait = 20, immediate = true) {
	        var timeout;
	        return function () {
	          var context = this,
	            args = arguments;
	          var later = function () {
	            timeout = null;
	            if (!immediate) func.apply(context, args);
	          };
	          var callNow = immediate && !timeout;
	          clearTimeout(timeout);
	          timeout = setTimeout(later, wait);
	          if (callNow) func.apply(context, args);
	        };
	      }
		
// 		공지사항
	$(function() {
		searchNtc();
	});

	let ntc = {};

	function searchNtc() {
		let setting = {
			url : `${pageContext.request.contextPath }/main/ntcAllList`,
			method : "",
			dataType : "text",
			data : ntc,
			success : function(resp) {
				$('#ntcList').html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	}


	function fn_paging(page) {
		searchForm.page.value = page;
		data.page = page;
		searchNtc();
	}

	
// 	댓글 리스트 
	$(function() {
		searchComment();
	});

	let reqcon = {};

	function searchComment() {
		let setting = {
			url : `${pageContext.request.contextPath }/main/reqAllList`,
			method : "",
			dataType : "text",
			data : reqcon,
			success : function(resp) {
				$('#reqEdit').html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	}


	
	
	$(function() {
		searchRole();
	});

	let role = {};

	function searchRole() {
		let setting = {
			url : `${pageContext.request.contextPath }/main/empRoleList`,
			method : "",
			dataType : "text",
			data : role,
			success : function(resp) {
				$('#empRole').html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	}


	function fn_paging(page) {
		searchComment.page.value = page;
		data.page = page;
		searchNtc();
		searchRole();
		searchComment();
	}
// 캘린더
// var var calendar; // FullCalendar 인스턴스를 저장하는데 사용될 이름이 지정된 변수를 선언.
document.addEventListener('DOMContentLoaded', function() { //이 이벤트 리스너는 HTML 문서의 콘텐츠가 완전히 로드될 때 트리거됨. DOM이 준비되었을 때만 후속 코드가 실행되도록 함
	let setting = {  // ajax 요청 설정
		url : "${pageContext.request.contextPath }/calendar/personalcalendar",
		method : "post",
		data : "json",   // json형태로 받아와야함.
		success : function(data) {
			
	console.log('data : ', data)
	var calendarEl = document.getElementById('personalcalendar');
	calendar = new FullCalendar.Calendar(calendarEl, {
		
	height: 350,	 	// 캘린더 높이 사이즈
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
		
//			console.log('종료일자 : ',  eventenddt);
		
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
//			const eventTarget  = $(inperTarget).is(":checked")? "Y" : "N"; 			// 공통일정 체크 확인
		const eventTarget  = $("input:radio[name='perTarget']:checked").val(); 	// 공통일정 체크 확인
		const eventTrip    = $(inperTrip).is(":checked")? "Y" : "N"; 			// 출장 체크 확인
		const eventEdu     = $(inperEdu).is(":checked")? "Y" : "N"; 			// 교육 체크 확인
		const eventVaca    = $(inperVaca).is(":checked")? "Y" : "N"; 			// 휴가 체크 확인
		console.log(eventTarget);
//			alert("eventTarget");   // eventTarget을 확인해봄. 	
		
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
//                 location.reload();
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
//		                            alert("등록완료");
	                        } else {
	                            // 새로운 일정 추가 시
	                            calendar.refetchEvents();  // 캘린더에 정보가 추가되거나 변경되었을 때 해당 정보를 업데이트 하는 기능
	                            calendar.render();
	                        }// if (response.eventId) end
	                        
	                   }else{
//		                	   alert(response.message)
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
//                 location.reload();
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
//		                            alert("수정완료");
	                   }else{
	                	   alert(response.message)
	                   } //else end
				}// success end
		}//setting end
		$.ajax(setting);
 	});
	
	
	// 삭제 버튼
	$('#deleteBtn').on('click',function(event){
		
//			console.log('event => ', event);
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
//						alert("삭제완료");
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
		
//			location.reload();

		// 아이디와 비밀번호를 원하는 값으로 변경
		perTitleInput.value = "일정명입니다";
		perContInput.value = "무슨일정일까요";
	});
});
</script>
