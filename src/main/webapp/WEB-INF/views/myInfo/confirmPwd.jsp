<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<h1 class="fw-bold pt-4">내정보</h1>
			</div>
			<div class="col-10 offset-1">
			<c:choose>
			<c:when test="${param.fail eq 'invalid' }">
				<div class="row">
					<div class="col-12">
						<div class="alert alert-danger">
							<strong>로그인 실패</strong> 아이디 혹은 비밀번호가 올바르지 않습니다.
						</div>
					</div>
				</div>
			</c:when>
			<c:when test="${param.fail eq 'deny' }">
				<div class="row">
					<div class="col-12">
						<div class="alert alert-danger">
							<strong>서비스 거부</strong> 로그인이 필요한 작업입니다.
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>
				<div class="border mb-5 p-5 bg-light">
					<h3 class="title mb-4 fs-4 fw-bold">비밀번호 재확인</h3>
					<p class="fs-6 text-secondary">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</p>
					
					<form method="post" action="confirmLogin" class="my-5">
						<table class="table table-bordered">
							<tr>
								<td class="align-middle">비밀번호</td>
								<td><input type="password" class="form-control" id="input-password" name="password"/></td>
							</tr>
						</table>
						<div class="row">
						   	<div class="col-6"><p>비밀번호가 생각나지 않으시면?</p></div>
							<div class="col-6 text-end">
					  			<a href="../search/getPassword" class="btn btn-light">비밀번호 찾기</a>
							</div>
						</div>
						<div class="row my-3 text-center">
							<div class="col-12">
								<button type="submit" class="btn btn-primary btn-lg w-25">확인</button>
								<a href="../main" class="btn btn-secondary y btn-lg w-25">취소</a>
							</div>
						</div>	
					</form>
					
				</div>
			</div>
		
		</div>
	</main>
</div>
</body>
</html>
