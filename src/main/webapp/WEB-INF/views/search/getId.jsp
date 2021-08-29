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
				<div class="border p-5 bg-light">
					<form method="post" action="getId" class="my-5">
						<table class="table table-bordered">
							<tr>
								<td class="align-middle text-center">등록된 휴대폰번호</td>
								<td><input type="text" class="form-control" id="phone" name="phone" placeholder="ex ) 010-1111-1111"/></td>
							</tr>
						</table>
						<div class="row my-3 text-center">
							<div class="col-12">
								<button type="submit" class="btn btn-primary btn-lg w-25">확인</button>
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
