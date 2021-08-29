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
				<a href="../main"><img class="ps-5" alt="Toeic speaking logo" src="../images/ybm_logo.png" width="170" height="100"></a>
			</div>
			<div class="col-7">
				<h1 class="fw-bold pt-4">내 정보 변경</h1>
			</div>
			<div class="col-10 offset-1">
				<div class="border mb-5 p-5 bg-light">
					<form method="post" action="setMyInfo" class="my-5" id="register-form">
						<table class="table table-bordered">
							<tr>
								<td class="align-middle">이름</td>
								<td>${user.userName }</td>
							</tr>
							<tr>
								<td class="align-middle">이메일</td>
								<td><input type="email" class="form-control" id="user-email" name="email" value="${user.email }"/></td>
							</tr>
							<tr>
								<td class="align-middle">휴대폰</td>
								<td><input type="text" class="form-control" id="user-phone" name="phone" value="${user.phone }"/></td>
							</tr>
						</table>
						<div class="row my-3 text-center">
							<div class="col-12">
								<button type="button" class="btn btn-primary btn-lg w-25" onclick="checkForm()">확인</button>
								<a href="../main" class="btn btn-secondary y btn-lg w-25">취소</a>
							</div>
						</div>	
					</form>
					
				</div>
			</div>
		
		</div>
	</main>
</div>
<script type="text/javascript">
	function checkForm() {
		
		// 아이디 입력필드의 유효성 체크하기
		var userEmailEl = document.getElementById("user-email");	// 엘리먼트객체 획득
		if (!userEmailEl.value.trim()) {	// 거짓-false, '', 0, null, NaN, undefined
			alert("이메일은 필수 입력값입니다.");
			return;
		}
		var userPhoneEl = document.getElementById("user-phone");
		if (!userPhoneEl.value.trim()) {
			alert("휴대폰 번호는 필수 입력값입니다.");
			return;
		}
		
		// 모든 폼 입력값이 유효한 입력값임으로 서버로 제출되게 한다.
		document.getElementById("register-form").submit();
		
		alert("회원 정보가 수정되었습니다.");
	}
</script>
</body>
</html>
