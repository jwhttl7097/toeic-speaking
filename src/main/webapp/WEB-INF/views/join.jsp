<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<title>Toeic Speaking</title>
  	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" >
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
  	
  	
</head>
<body>
<div class="container">
	<main >
		<div class="row my-5 mb-3 p-5" style="background-color: #E4E6E7;">
			<div class="col-5 mb-2">
				<a href="main"><img class="ps-5" alt="Toeic speaking logo" src="images/ybm_logo.png" width="180" height="100"></a>
			</div>
			<div class="col-7">
				<h1 class="fw-bold pt-4">회원가입</h1>
			</div>
			<form action="join" method="post" id="register-form">
				<div class="row mx-2">
					<div class="col-10 offset-1 border p-5 bg-light">
						<div class="my-2 mx-5">
							<div class="d-grid gap-2 align-middle">
							  <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
								  <ol class="breadcrumb">
								    <li class="breadcrumb-item"><a href="agreeJoin">약관동의</a></li>
								    <li class="breadcrumb-item active" aria-current="page">회원가입</li>
								  </ol>
								</nav>
							</div>
							<table class="table table-borderless text-center mb-2 bg-white">
								<tr>
									<td class="align-middle text-start fw-light">
										<div class="form-floating input-group">
										  <input type="text" class="form-control" id="user-id" placeholder="user_id" name="userId" aria-describedby="button-addon2">
										  <button class="btn btn-outline-secondary" onclick="idCheck()" type="button" id="button-addon2">중복검사</button>
										  <label for="floatingPassword">아이디</label>
										</div>
										<div id="idCheckText">
											
										</div>
									</td>
								</tr>
								<tr>
									<td class="align-middle text-start fw-light">
										<div class="form-floating">
										  <input type="password" class="form-control" id="user-pwd" placeholder="Password"  name="userPassword">
										  <label for="floatingPassword">비밀번호</label>
										</div>
									</td>
								</tr>
								<tr>
									<td class="align-middle text-start fw-light">
										<div class="form-floating">
										  <input type="password" class="form-control" id="user-pwd-confirm" placeholder="PasswordConfirm"  name="userPasswordConfirm">
										  <label for="floatingPassword">비밀번호 확인</label>
										</div>
									</td>
								</tr>
								<tr>
									<td class="align-middle text-start fw-light">
										<div class="form-floating">
										  <input type="text" class="form-control" id="user-name" placeholder="user_name"  name="userName">
										  <label for="floatingPassword">이름</label>
										</div>
									</td>
								</tr>
								<tr>
									<td class="align-middle text-start fw-light">
										<div class="form-control" style="width:100%;">
											<div class="row ml-2">
												<div class="col-2">
													<label class="fw-light align-middle mt-2">생년월일</label>
												</div>
												<div class="col-10">
													<input type="date" class="form-control fw-light" id="user-birth" name="userBirth">
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="align-middle text-start fw-light">
										<div class="form-floating">
										  <input type="email" class="form-control" id="user-email" placeholder="user_email" name="userEmail">
										  <label for="floatingInput">이메일</label>
										</div>
									</td>
								</tr>
								<tr>
									<td class="align-middle text-start fw-light">
										<div class="form-control" style="width:100%;">
											<div class="row ml-2">
												<div class="col-2 text-left">
													<label class="fw-light">휴대폰</label>
												</div>
												<div class="col-10 text-left">
													<input type="text" class="rounded" id="phone-1" style="width:31%; border:1px solid #ced4da;" name="phone1"> -
													<input type="text" class="rounded" id="phone-2" style="width:31%; border:1px solid #ced4da;" name="phone2"> -
													<input type="text" class="rounded" id="phone-3" style="width:31%; border:1px solid #ced4da;" name="phone3">
												</div>
											</div>
										</div>
									</td>
								</tr>
							</table>
							<div class="d-grid gap-2 align-middle">
							  <button type="button" onclick="checkForm()" class="btn text-white mt-1" style="background-color: #0F54A6; height: 50px">회원가입</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</main>
</div>
<script type="text/javascript">

	function idCheck() {
		var userId = document.getElementById("user-id").value;
		var userIdEl = document.getElementById("idCheckText");
		
		userIdEl.innerHTML = "";
		userIdEl.style.display = "";
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var jsonTextData = xhr.responseText;
				console.log(jsonTextData);
				var user = JSON.parse(jsonTextData);
				
				var rows = "";
				if (user != null) {
					rows += "<span class='text-danger'>해당 아이디는 이미 사용중인 아이디 입니다.</span>";
				} else {
					rows += "<span class='text-danger'>사용 가능한 아이디 입니다.</span>";
				}
				
				userIdEl.innerHTML = rows;
			}
		};
		
		xhr.open("GET", "joinAjax?userId=" + userId);
		xhr.send();
	}

	function checkForm() {
		
		// 아이디 입력필드의 유효성 체크하기
		var userIdEl = document.getElementById("user-id");	// 엘리먼트객체 획득
		if (!userIdEl.value.trim()) {	// 거짓-false, '', 0, null, NaN, undefined
			alert("아이디는 필수 입력값입니다.");
			return;
		}
		if (userIdEl.value.trim().length < 4) {
			alert("아이디는 4글자 이상으로 입력해야 합니다.");
			userIdEl.focus();
			return;
		}
		if (!/^[a-zA-Z0-9]+$/.test(userIdEl.value.trim())) {
	         alert("아이디는 영어대소문자, 숫자만 허용됩니다.");
	         userIdEl.focus();
	         return;
	    }
		var passwordEl = document.getElementById("user-pwd");
		var passwordConfirmEl = document.getElementById("user-pwd-confirm");
		
		if (!passwordEl.value.trim()) {
			alert("비밀번호는 필수 입력값입니다.");
			return;
		}
		if (passwordEl.value.trim().length < 8) {
			alert("비밀번호는 8~15자로 입력해야 합니다.");
			passwordEl.focus();
			return;
		}
		if (passwordEl.value.trim().length > 15) {
			alert("비밀번호는 8~15자로 입력해야 합니다.");
			passwordEl.focus();
			return;
		}
		if (!/^[a-zA-Z0-9]+$/.test(passwordEl.value.trim())) {
	         alert("비밀번호는 영어대소문자, 숫자만 허용됩니다. 특수기호는 보안상 사용불가합니다. ';--<()\/");
	         passwordEl.focus();
	         return;
	    }
		if (!passwordConfirmEl.value.trim()) {
			alert("비밀번호 확인은 필수 입력값입니다.");
			return;
		}
		if (passwordEl.value != passwordConfirmEl.value) {
			alert("비밀번호가 서로 일치하지 않습니다.");
			passwordConfirmEl.value = "";
			passwordConfirmEl.focus();
			return;
		}
		
		var userNameEl = document.getElementById("user-name");
		if (!userNameEl.value.trim()) {
			alert("이름은 필수 입력값입니다.");
			return;
		}
		
		var userBirthEl = document.getElementById("user-birth");
		if (!userBirthEl.value.trim()) {
			alert("생년월일은 필수 입력값입니다.");
			return;
		}
		
		var userEmailEl = document.getElementById("user-email");
		if (!userEmailEl.value.trim()) {
			alert("이메일은 필수 입력값입니다.");
			return;
		}
		
		var phone1El = document.getElementById("phone-1");
		if (!phone1El.value.trim()) {
			alert("휴대폰 번호는 필수 입력값입니다.");
			return;
		}
		var phone2El = document.getElementById("phone-2");
		if (!phone2El.value.trim()) {
			alert("휴대폰 번호는 필수 입력값입니다.");
			return;
		}
		var phone3El = document.getElementById("phone-3");
		if (!phone3El.value.trim()) {
			alert("휴대폰 번호는 필수 입력값입니다.");
			return;
		}
		
	    
		 // 모든 폼 입력값이 유효한 입력값임으로 서버로 제출되게 한다.
		document.getElementById("register-form").submit();
		
		alert("회원가입이 완료되었습니다.");
	}
	
</script>
</body>
</html>
