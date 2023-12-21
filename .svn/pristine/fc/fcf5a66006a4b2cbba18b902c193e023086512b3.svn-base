<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#newEmployeeArea {
	width: 400px;
}
</style>
<!-- c3.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/c3.css">

<!-- c3.js -->
<script src="${pageContext.request.contextPath }/resources/js/c3/c3.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/c3/d3-5.8.2.min.js"></script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<h5>☗ 인사관리</h5>
						<hr color="black" />
					</div>
				</div>
			</div>
		</div>
		<div style="height: 15px;"></div>
	</div>

	<!-- 각부서 직원수 -->
	<div class="d-flex mb-4">
		<div
			class="d-flex me-1 flex-column justify-content-center align-items-center">
			<div class="card">
				<div class="card-body d-flex flex-column align-items-center">
					<h5 class="card-title">부서별 직원 비율</h5>
					<div id="depEmployeeChart"></div>
				</div>
			</div>
			<!-- 			<h6>부서별 직원 비율</h6> -->
			<!-- 			<div id="depEmployeeChart"> -->
			<!-- 			</div> -->
		</div>
		<div class="card">
			<div class="card-body d-flex flex-column align-items-center">
				<h5 class="card-title">입사자수</h5>
				<div id="yearEmployeeChart"></div>
			</div>
		</div>
		<!-- 		<div class="d-flex flex-column justify-content-center align-items-center"> -->
		<!-- 			<h6>입사자수</h6> -->
		<!-- 			<div id="yearEmployeeChart"> -->
		<!-- 			</div> -->
		<!-- 		</div> -->

	</div>
	<div class="mt-4 d-flex">
		<div class="card">
			<div class="card-body">
				<div id="newEmployeeArea"
					class="d-flex flex-column justify-content-center align-items-center">
					<h6 class="card-title">🎉신입사원🎉</h6>
					<div id="newEmployeeList" class="mt-2">
						<div id="carouselExampleSlidesOnly" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<div
										class="d-flex flex-column justify-content-center align-items-center">
										<div>
											<img width="150px"
												src="${pageContext.request.contextPath}/resources/empProfile/test1.png"
												alt="사진" />
										</div>
										<div>홍길동</div>
										<div>경영관리본부</div>
									</div>
								</div>
								<div class="carousel-item">
									<div
										class="d-flex flex-column justify-content-center align-items-center">
										<div>
											<img width="150px"
												src="${pageContext.request.contextPath}/resources/empProfile/test1.png"
												alt="사진" />
										</div>
										<div>김빵빵</div>
										<div>정보관리부</div>
									</div>
								</div>
								<div class="carousel-item">
									<div
										class="d-flex flex-column justify-content-center align-items-center">
										<div>
											<img width="150px"
												src="${pageContext.request.contextPath}/resources/empProfile/test1.png"
												alt="사진" />
										</div>
										<div>김옥지</div>
										<div>정보관리부</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-body d-flex flex-column align-items-center">
				<h5 class="card-title">월별 급여 지급액</h5>
				<div id="totalSalaryChart"></div>
			</div>
		</div>
<!-- 		<div -->
<!-- 			class="d-flex flex-column justify-content-center align-items-center"> -->
<!-- 			<h6>월별 급여 지급액</h6> -->
<!-- 			<div id="totalSalaryChart"></div> -->
<!-- 		</div> -->
	</div>
	<!-- 신입 -->
</div>

<script>


$(document).ready(function(){
	let depEmployeeList =[];
	let newEmployeeList = [];
	let totalSalarylist =[];
	let yearEmployeeList=[];
	let setting = {
			url : `${pageContext.request.contextPath}/pm/appointments/mainAjax.do`,
			method : "GET",
			dataType : "json",
			success : function(resp) {
				depEmployeeList = (resp.depEmployeeList)
				newEmployeeList = (resp.newEmployeeList)
				totalSalaryList=(resp.totalSalaryList)
				yearEmployeeList=(resp.yearEmployeeList)
				console.log(totalSalaryList)
				depEmployeeChart(depEmployeeList);
				yearEmployeeChart(yearEmployeeList);
				totalSalaryChart(totalSalaryList);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
	$.ajax(setting);

 });
 

function depEmployeeChart(depEmployeeList){
	let depColumns =[];
		let beforeColumns=[];
	for(let i = 0 ; i<depEmployeeList.length ; i++){
		beforeColumns.push([depEmployeeList[i].depName,0])
		let column = [depEmployeeList[i].depName,depEmployeeList[i].count];
		depColumns.push([depEmployeeList[i].depName,depEmployeeList[i].count]);
	}

	let depEmployeeChart = c3.generate({
		bindto: '#depEmployeeChart',
	    data: {
	        // iris data from R
	        columns: beforeColumns,
	        type : 'pie'
	    },
	    size: {
	    	  width: 600
	    	}
	});
	setTimeout(function() {
		depEmployeeChart.load({
			columns : depColumns
		});
	}, 200);
}

function yearEmployeeChart(yearEmployeeList){
	let yearEmpColumns = [];
	let beforeColumns=[];
	let x=["x"];
	for(let i = yearEmployeeList.length-1 ; i>=0; i--){
		 const enpStart = yearEmployeeList[i].enpStart;
		  const [year, month] = enpStart.split('/');
		  const formattedDate = `20\${year}년 \${month}월`;
		console.log(yearEmployeeList[i].enpStart)
		x.push(formattedDate)
	}
	yearEmpColumns.push("입사자수")
	beforeColumns.push("입사자수")
	for(let i = yearEmployeeList.length-1 ; i>=0; i--){
		yearEmpColumns.push(yearEmployeeList[i].count)
		beforeColumns.push(0)
	}
	
	let yearEmployeeChart = c3.generate({
		bindto: "#yearEmployeeChart",
		data: {
			x:"x",
	        columns: [
	        	x,beforeColumns
	        ]
	    },
	    axis: {
	        x: {
	          type: "category", // x축 타입을 category로 설정
	        },
	      },
	    size: {
	    	  width: 550
	    	},
	});
	setTimeout(function() {
		yearEmployeeChart.load({
			columns : [x,yearEmpColumns]
		});
	}, 200);
}
function totalSalaryChart(totalSalaryList){
	let totalSalaryColumns = [];
	let beforeColumns=[];
	let x=["x"];
	for(let i = 0 ; i<totalSalaryList.length; i++){
		const input = totalSalaryList[i].salNo;
		const year = input.slice(0, 4);
		const month = input.slice(4, 6);
		const result = year + "년" + month + "월";
		x.push(result)
	}
	totalSalaryColumns.push("급여지급총액")
	beforeColumns.push("급여지급총액")
	for(let i = 0 ; i<totalSalaryList.length; i++){
		totalSalaryColumns.push(totalSalaryList[i].sumsalary)
		beforeColumns.push(0)
	}
	
	let totalSalaryChart = c3.generate({
		bindto: "#totalSalaryChart",
		data: {
			x:"x",
	        columns: [
	        	x,beforeColumns
	        ]
	    },
	    axis: {
	        x: {
	          type: "category", // x축 타입을 category로 설정
	        },
	      },
	    size: {
	    	  width: 800,
	    	  height:300
	    	},
	});
	setTimeout(function() {
		totalSalaryChart.load({
			columns : [x,totalSalaryColumns]
		});
	}, 200);
}

</script>