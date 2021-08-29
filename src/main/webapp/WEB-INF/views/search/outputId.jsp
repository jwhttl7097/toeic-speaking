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
				<h1 class="fw-bold pt-4">아이디 찾기</h1>
			</div>
			<div class="col-10 offset-1">
				<div class="border p-3 bg-light text-center">
					<strong>아이디 </strong> : <span class="display-5 text-danger">${user.userId }</span>
				</div>
			</div>
			<div class="col-10 offset-1 my-3">
				<a href="../main" class="btn btn-secondary y btn-lg w-100">홈으로</a>
			</div>
		</div>
	</main>
</div>
</body>
</html>
