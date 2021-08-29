<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div class="col-4 mb-2">
				<a href="../main"><img class="ps-5" alt="Toeic speaking logo" src="../images/ybm_logo.png" width="170" height="100"></a>
			</div>
			<div class="col-8">
				<h1 class="fw-bold pt-4">내 비밀번호 변경</h1>
			</div>
			<div class="col-10 offset-1">
				<div class="border p-5 bg-light">
					<c:choose>
						<c:when test="${param.fail eq 'invalid'}">
								<div class="row mt-3">
									<div class="col-12">
										<div class="alert alert-danger">
											<strong>서비스 거부</strong>  이전 비밀번호를 확인해 주세요.
										</div>
									</div>
								</div>
						</c:when>
					</c:choose>
					<p class="fs-6 text-secondary">비밀번호는 <span class="text-danger">영문,숫자,특수기호로 구성된 8~15자</span>로 만드실 수 있습니다.</p>
					<p class="fs-6 text-secondary">비밀번호는 아이디나 주민등록번호 및 전화번호와 같이 개인정보와 관련된 숫자나 문자를 사용하시면 안됩니다.</p>
					<p class="fs-6 text-secondary">단, 다음의 특수기호는 보안상의 문제로 사용하실 수 없습니다.</p>
					<span class="fs-4 text-danger">(';--()/)</span>
					
					<form method="post" action="setPassword" class="my-5" id="register-form">
						<table class="table table-bordered">
							<tr>
								<td class="align-middle">이전비밀번호</td>
								<td><input type="password" class="form-control" id="user-password" name="beforePassword"/></td>
							</tr>
							<tr>
								<td class="align-middle">새로운 비밀번호</td>
								<td><input type="password" class="form-control" id="user-new-pwd" name="newPassword"/></td>
							</tr>
							<tr>
								<td class="align-middle">비밀번호 확인</td>
								<td><input type="password" class="form-control" id="user-pwd-confirm" name="confirmPassword"/></td>
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
		
		// 비밀번호 유효성 체크(필수입력값/ 글자길이 검사는 생략)
		var userPasswordEl = document.getElementById("user-password");
		var newPasswordEl = document.getElementById("user-new-pwd");
		var passwordConfirmEl = document.getElementById("user-pwd-confirm");
		
		if (!userPasswordEl.value.trim()) {
			alert("이전비밀번호는 필수 입력값입니다.");
			return;
		}
		
		if (!newPasswordEl.value.trim()) {
			alert("새로운 비밀번호는 필수 입력값입니다.");
			return;
		}
		if (!passwordConfirmEl.value.trim()) {
			alert("비밀번호 확인은 필수 입력값입니다.");
			return;
		}
		
		if (newPasswordEl.value != passwordConfirmEl.value) {
			alert("비밀번호가 서로 일치하지 않습니다.");
			passwordConfirmEl.value = "";
			passwordConfirmEl.focus();
			return;
		}
		
		 // 모든 폼 입력값이 유효한 입력값임으로 서버로 제출되게 한다.
		document.getElementById("register-form").submit();
	}
</script>
</body>
</html>
