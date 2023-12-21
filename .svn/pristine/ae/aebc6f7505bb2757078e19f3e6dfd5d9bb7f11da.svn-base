<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<!-- c3.css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/c3.css">

<!-- c3.js -->
<script src="${pageContext.request.contextPath }/resources/js/c3/c3.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/c3/d3-5.8.2.min.js"></script>
	
<!-- calendar  -->
<script src='${pageContext.request.contextPath }/resources/js/calendar.min.js'></script>


<style>

#attendCard{
	height: 100%;
}
#node0 {
	display: flex;
	margin: 25px 0px 25px;
}

#node1 {
	display: flex;
    margin-right: 25px;
    width: 30%;
    height: 460px
}

#node2 {
    width: 800px;
	height: 472px;
	margin-left: 20px;
	margin-right: 30px;
	display: block;
}

#empDiv {
	box-sizing: border-box;
}

#node4 {
	width: 890px;
	height: 460px;
	margin-right: 25px;
}

#documentCard { 
	width: 100%;
} 
#document {
	margin-right: 25px;
	width: 30%;
}

#node6 {
	display: flex;

}

#node1-1 {
	display: inline-flex;
	width: 54%;
}

#node1-2-1, #attendance {
    margin-right: 10px;
    height: 365px;
    width: 890px;
}

#emp {
	margin-right: 25px;
    height: 230px;
	width: 15%;
}

#node1-3{
	width: 30%;
}

.card-body {
	text-align: center;
}

#all {
	padding: 0px 0px 0px 0px;
    margin: -30px 0px 0px 0px;
}

img {
	width: 100%;
    height: 200px;
}

#profile, #doc {
	height: 100%;
}

#ntcList {
    max-height: 300px; /* 원하는 높이로 설정 (넘칠 경우 스크롤바가 표시됩니다) */
    overflow-y: auto; /* 세로 스크롤바 표시 */
}

#mainWaitList {
    max-height: 300px; /* 원하는 높이로 설정 (넘칠 경우 스크롤바가 표시됩니다) */
    overflow-y: auto; /* 세로 스크롤바 표시 */
}

#companycalendar {
	height : 100%;
}

#node1-2-10{
	width: 35%;
	
}

.birthCard {
	width: 30%;
	margin: 0px 25px 0px 25px;

}
#image {
	height: 250px;
	margin-right: 25px;
}
/* 하드코딩하드코딩하드코딩하드코딩  */
#image2 {
	height:150px;
}

#empHeader{
 height: 345px;
}

</style>
<security:authentication property="principal.realUser" var="authEmployee" />

<div id="all">

	<!-- 메인 화면 첫번째 줄 strat  -->
	<div id="node0">
		
		<!-- 결재할 서류 start  -->
		<div id="document">
			<div id="documentCard" class="card">
				<div class="card-header"><span>결재할 서류</span>
					<span class="plusR"><a href="${pageContext.request.contextPath }/ed/document/documentWaitList.do">+ 더보기</a></span>
				</div>
				<div class="card-body" id="doc">
					<div id="mainWaitList"></div>
				</div>
			</div>
		</div>
		<!-- 결재할 서류 end  -->
		
		<!-- 복무 관련 정보 start  -->
		<div id="attendance">
			<div id="attendCard" class="card">
				<div class="card-header">출근, 퇴근, 초과근무, 연가내역</div>
				  <div class="card-body">
				  	출근 몇시 퇴근 몇시 초과근무 총 몇시간 연가 몇개
				  </div>
			</div>
		</div>
		<!-- 복무 관련 정보 end  -->
		
		
		<!-- 직원 검색 start -->
		<div class="searchEmpCard">
  		  <div class="card-body">
 		     <div class="card-header" id="empHeader">직원검색
			    <div class="mx-quto input-group mt-5">
					<input name="query" type="text" class="form-control" placeholder="검색어 입력" aria-label="search" aria-describedby="button-addon2"> </mx-auto>
			 	</div>
					<button class="btn btn-primary" type="submit" id="button-addon2">검색</button>
			 </div>
		  </div>
		</div>
		<!-- 직원 검색 end  -->
		
		
		<!-- 직원 프로필 start  -->
		<div id="emp">
			<div class="card">
				<div class="card-header" id="profile">
					<img src="${ pageContext.request.contextPath}/resources/empProfile/${authEmployee.outAtchNm }" alt="직원 프로필 사진">
					<span class="plusR"><a href="${pageContext.request.contextPath }/employee/mypage">+ 더보기</a></span>
				</div>
				<div class="card-body">
					<p class="card-text">이름 : <security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empName}</p>
					<p class="card-text">사번: <security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.empCd}</p>
					<p class="card-text">부서: <security:authentication property="principal.realUser" var="authEmployee" />${authEmployee.depName}</p>
					<%-- <a href="${pageContext.request.contextPath }/employee/mypage" class="btn btn-primary">마이페이지</a> --%>
				</div>
			</div>
		</div>
		<!-- 직원 프로필 end  -->
		
	</div>
	<!-- 메인 화면 첫번째 줄 end  -->

	<!-- 메인 화면 두 번째 줄 strat  -->
	<div id="node0">
		
		<!-- 환율 start  -->
		<div id="node1" class="card">
			<div class="card-header">환율
				<span class="plusR"><a href="${pageContext.request.contextPath }/finMarket/exchangeRate">+ 더보기</a></span>
			</div>
			<div class="card-body">
				<div>
					<div class="col-md-3">
						<select id="chartType" class="form-select">
							<option value="bar">세로막대형</option>
							<option value="line">꺾은선</option>
						</select>
					</div>
				</div>
				<div id="chart1"></div>
				<!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
			</div>
		</div>
		<!-- 환율 end -->
		
		
		<!-- 캘린더 start -->
		<div id="node1-2">
			<div id="node4" class="card">
				<div class="card-header">캘린더
					<span class="plusR"><a href="${pageContext.request.contextPath}/calendar/personalcalendar">+ 더보기</a></span>
				</div>
				<div class="card-body">
					<div id='personalcalendar'></div>
					<!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
				</div>
			</div>
		</div>
		<!-- 캘린더 end -->
		
		<!-- 그래프 start  -->
		<div id="node1-3" class="card">
			<div class="card-header">그래프
				<span class="plusR"><a href="${pageContext.request.contextPath }/finMarket/exchangeRate">+ 더보기</a></span>
			</div>
			<div class="card-body">
				<div>
					<div class="col-md-3">
						<select id="chartType" class="form-select">
							<option value="bar">세로막대형</option>
							<option value="line">꺾은선</option>
						</select>
					</div>
				</div>
				<div id="chart1"></div>
				<!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
			</div>
		</div>
		<!-- 그래프 end -->
		
	</div>
	<!-- 메인 화면 두 번째 줄 end  -->
	
	<!-- 메인화면 세 번째 줄 start  -->
	<div id="node0">
		<div id="node1-2-10">
			<div id="node4-1" class="card">
				<div class="card-header">공지사항
					<span class="plusR"><a href="${pageContext.request.contextPath }/board/ntcAllList">+ 더보기</a></span>
				</div>
				<div class="card-body">
					<div id="ntcList"></div>
					<%--<a href="${pageContext.request.contextPath }/board/ntcAllList" class="btn btn-primary">공지사항 더보기</a> --%>
				</div>
			</div>
		</div>
		
		<div class="birthCard">
			<div class="card">
		  	 <div class="card-header">생일인 직원
		  	   <div class="card-body">
		  	  	 <img id="image" src="${pageContext.request.contextPath }/resources/img/birth.jpg" alt="금융감독원 전화">
			  </div>
		   	 </div>
		  	</div>
		</div>
		
		<div id="node1-2-10">
			<div id="node4-1" class="card">
				<div class="card-header">민원전화
					<span class="plusR"><a href="https://www.fss.or.kr/">+ 더보기</a></span>
				</div>
				<div class="card-body">
					<div>
					<img id="image" src="${pageContext.request.contextPath }/resources/img/call.PNG" alt="금융감독원 전화">
					</div>
				</div>
			</div>
		</div>
		
		
	</div>
	<!-- 메인화면 세 번째 줄 end  -->




</div>


<!-- all end  -->
	

<script>
	$(function() {
		searchDoc();
		exchageRateChart();
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
				makeBarChart(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	}
	
	function makeBarChart(jsonData) {
		var chartType = $("#chartType").val();
		var rows = jsonData.itemList;
		console.log(rows);
		var unitName= rows[0].UNIT_NAME;
		var dataList = [];
		var dataListNm = jsonData.dataListNm;
		var baseMonthList = jsonData.timeList;
		console.log(baseMonthList)
		console.log(rows)
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
			bindto : '#chart1',
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

		setTimeout(function() {
			chart.load({
				columns : columns
			});
		}, 200);
		
		$("#chartType").on("change",function(){
			var chartType = $(this).val();
			chart.transform(chartType);
		})
	}
	
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

	
</script>	


<!-- 캘린더 start -->
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
	
		
		
   	headerToolbar: {   // 헤더 기능
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
		
		console.log('종료일자 : ',  eventenddt);
		
		document.getElementById('perScNo').value = eventid;
		document.getElementById('upperTitle').value = eventtitle;
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
	
	
	// 등록모달 버튼 만들기
	$('#insertBtn').on('click', function(event) {
	//event.preventDefault();		// 이벤트의 기본동작을 중단시키는 역할
		// 이벤트 클릭시의 동작
		const eventstartdt = $(instartDate).val();  // 등록시작 이벤트
		const eventenddt = $(inendDate).val(); 		// 등록 끝나는 이벤트
		const eventpertt = $(inperTitle).val();		// 등록 제목 이벤트
		var formData = {
				perStart : eventstartdt, // 시작 이벤트
				perEnd : eventenddt,     // 끝나는 이벤트
				perTitle : eventpertt	 // 제목 이벤트
		};
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
	                            }else{
	                            	calendar.addEvent(newevent)
	                            }// if (updatedEvent) end
	                            alert("등록완료");
	                        } else {
	                            // 새로운 일정 추가 시
	                            calendar.refetchEvents();  // 캘린더에 정보가 추가되거나 변경되었을 때 해당 정보를 업데이트 하는 기능
	                        }// if (response.eventId) end
	                   }else{
	                	   alert(response.message)
	                   }// if(response.success) end
				}// success end
		}//setting end
		$.ajax(setting);
 	});
	
	// 빨간색 일정 = 공통일정
    if (clickedEventColor = 'red') {
         document.getElementById('perTarget').checked = true;
     }else{
         document.getElementById('perTarget').checked = false;
     }
	 
    // 체크박스 상태에 따라 value 값 설정
    if ($('#perTarget').is(':checked')) {
        formData.append('perTarget', 'all');
    } else {
        formData.append('perTarget', 'dep');
    }
    
  //모달 닫힐 때 입력 필드 값을 초기화
	$('#insertBtn').on('hidden.bs.modal', function(){
	   $('#perScNo').val('');
	   distinctionField.value = '전체';
	   $('#perStart').val('');
	   $('#perEnd').val('');
	   $('#perTarget').prop('checked', false);
	});
    
	
	
	// 수정모달 버튼 만들기
	$('#updateBtn').on('click', function(event) {
 	    event.preventDefault();		// 이벤트의 기본동작을 중단시키는 역할
		//이벤트 클릭시의 동작
		const eventstartdt = $(upstartDate).val();	// 수정 시작 이벤트
		const eventenddt = $(upendDate).val();		// 수정 끝나는 이벤트
		const eventpertt = $(upperTitles).val();	// 수정 제목 이벤트	
		const eventperscno = $(perScNo).val();		// 개인일정 코드번호 이벤트
		var formData = {
				perStart : eventstartdt, // 시작 이벤트
				perEnd : eventenddt,     // 끝나는 이벤트
				perTitle : eventpertt,	 // 제목 이벤트	
				perScNo : eventperscno	 // 개인일정 코드번호 이벤트
		}
		// controller에서 일정수정하는 부분.
		let setting = {
				url : `${pageContext.request.contextPath}/calendar/personalUpdate.do`,
				dataType : 'json',
				method : 'post',
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
	                            } // if (updatedEvent) end
	                            alert("수정완료");
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
					alert("삭제완료");
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
</script>
<!-- 캘린더 end -->