<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<title>Toeic-speaking</title>
  	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${param.fail eq 'invalid'}">
				<div class="row mt-3">
					<div class="col-12">
						<div class="alert alert-danger">
							<strong>서비스 거부</strong>  존재하지 않는 아이디 입니다.
						</div>
					</div>
				</div>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${param.fail eq 'deny'}">
				<div class="row mt-3">
					<div class="col-12">
						<div class="alert alert-danger">
							<strong>${param.job }</strong>
						</div>
					</div>
				</div>
		</c:when>
	</c:choose>
	<div class="row">
		<div class="col-12">
			<div>
				<a href="main"><img alt="Toeic speaking logo" src="images/ybm_logo.png" width="160" height="120"/></a>
			</div>
		</div>
	</div>
	<hr/>
	<div class="row mb-3">
		<div class="col-6">
			<div class="row">
				<div class="col-12">
					<form method="post" action="login">
						<div class="row">
							<div class="col-3">
								<div class="row mb-2">
									<div class="col-12">
										<label class="pt-1 text-secondary">아이디</label>
									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<label class="pt-1 text-secondary">비밀번호</label>
									</div>
								</div>
							</div>
							<div class="col-6">	
								<div class="row mb-2">
									<div class="col-12">
										<input type="text" class="form-control" name="userId">
									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<input type="password" class="form-control" name="password">
									</div>
								</div>
							</div>
							<div class="col-3">
								<button class="btn btn-primary w-100 h-100">로그인</button>
							</div>
						</div>
					</form>				
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-12">
					<div class="d-flex justify-content-between mb-2">
						<div class="text-secondary">- 아직 YBM회원이 아니신가요?</div>
						<div class="w-25"><a href="join" class="btn btn-secondary btn-sm w-100">회원가입</a></div>
					</div>
					<div class="d-flex justify-content-between mb-2">
						<div class="text-secondary">- 아이디를 잊으셨나요?</div>
						<div class="w-25"><a href="search/getId" class="btn btn-secondary btn-sm w-100">아이디 찾기</a></div>
					</div>
					<div class="d-flex justify-content-between mb-2">
						<div class="text-secondary">- 비밀번호를 잊으셨나요?</div>
						<div class="w-25"><a href="search/getPassword" class="btn btn-secondary btn-sm w-100">비밀번호 찾기</a></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-6">
			<a href="https://www.toeicswt.co.kr/event/release_toeicSW.php">
				<img alt="Toeic speaking logo" src="images/login_ad.jpg" width=520 height="400"/>
			</a>
		</div>
	</div>
</div>
</body>
</html>
