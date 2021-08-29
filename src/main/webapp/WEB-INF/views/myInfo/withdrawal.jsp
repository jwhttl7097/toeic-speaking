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
				<h1 class="fw-bold pt-4">회원 탈퇴</h1>
			</div>
			<div class="col-10 offset-1">
				<div class="border p-5 bg-light">
					<p class="mb-5 fs-6 text-danger text-center">회원 탈퇴 시, 해당사이트 내의 유로정보 및 포인트 등 기타내역도 모두 삭제되며, 복원되지 않습니다.</p>
						<div class="row my-3 text-center">
							<div class="col-12">
								<a href="withdrawal" class="btn btn-danger btn-lg w-25" onclick="userDelet()">회원탈퇴</a>
								<a href="../main" class="btn btn-secondary y btn-lg w-25">취소</a>
							</div>
						</div>	
					
				</div>
			</div>
		
		</div>
	</main>
</div>
<script type="text/javascript">
	function userDelet() {
		alert("회원 탈퇴가 완료되었습니다.");
	}
</script>
</body>
</html>
