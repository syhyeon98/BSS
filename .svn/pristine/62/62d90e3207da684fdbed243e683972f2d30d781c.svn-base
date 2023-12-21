<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div></div>
<div class="min-vh-100 d-flex align-items-center" style="margin-top: -50px;">

<div class="container">
	<!-- Outer Row -->
	<div class="row justify-content-center ">
		<div class="col-xl-10 col-lg-12 col-md-9">
			<!-- <div class="card o-hidden border-0 shadow-lg my-5" > -->
			<div class="card rounded-4 o-hidden border-0 shadow-lg my-5" >
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
						<div class="col-lg-6">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">L O G I N</h1>
								</div>
								<form
									action="${pageContext.request.contextPath}/login/loginProcess"
									method="post">
									<div class="form-group">
										<input type="text" name="empCd"
											class="form-control form-control-user" placeholder="Id">
									</div>
									<div class="form-group">
										<input type="password" name="empPw"
											class="form-control form-control-user"
											id="exampleInputPassword" placeholder="Password">
									</div>
									<div class="form-group">
										<div class="custom-control custom-checkbox small">
											<input type="checkbox" class="custom-control-input"
												id="customCheck"> <label
												class="custom-control-label" for="customCheck">Remember
												Me</label>
										</div>
									</div>
									<button class="btn btn-primary" type="submit">로그인</button>
									<button class="btn btn-primary" type="button"
										id="btnAdmin">관리자</button>
									<button class="btn btn-primary" type="button"
										id="btnPm">인사직원</button>
									<button class="btn btn-primary" type="button"
										id="btnEmp">일반직원</button>
								</form>
								<hr>
								<div class="text-center">
									<a class="small"
										href="${pageContext.request.contextPath}/findPass">Forgot
										Password?</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>


<script>
	document.addEventListener("DOMContentLoaded", function() {
		const autofillButton = document.getElementById("btnAdmin");

		autofillButton.addEventListener("click", function() {
			const empCdInput = document.querySelector('input[name="empCd"]');
			const empPwInput = document.querySelector('input[name="empPw"]');

			// 아이디와 비밀번호를 원하는 값으로 변경
			empCdInput.value = "2309072";
			empPwInput.value = "java";
		});
	});
	document.addEventListener("DOMContentLoaded", function() {
		const autofillButton = document.getElementById("btnPm");

		autofillButton.addEventListener("click", function() {
			const empCdInput = document.querySelector('input[name="empCd"]');
			const empPwInput = document.querySelector('input[name="empPw"]');

			// 아이디와 비밀번호를 원하는 값으로 변경
			empCdInput.value = "2309070";
			empPwInput.value = "java";
		});
	});
	document.addEventListener("DOMContentLoaded", function() {
		const autofillButton = document.getElementById("btnEmp");

		autofillButton.addEventListener("click", function() {
			const empCdInput = document.querySelector('input[name="empCd"]');
			const empPwInput = document.querySelector('input[name="empPw"]');

			// 아이디와 비밀번호를 원하는 값으로 변경
			empCdInput.value = "2309071";
			empPwInput.value = "java";
		});
	});

</script>