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
			<form action="agreeJoin" method="post" id="register-form">
				<div class="row mx-1">
					<div class="col-10 offset-1 border p-5 bg-light">
						<div class="my-2 mx-2">
							<div class="d-grid gap-2 align-middle">
							  <nav aria-label="breadcrumb">
								  <ol class="breadcrumb">
								    <li class="breadcrumb-item active" aria-current="page">약관동의</li>
								  </ol>
								</nav>
							</div>
							<table class="table border text-center mb-2 bg-white">
								<thead>
									<tr class="table">
										<th class="align-middle text-start">전체규정에 동의합니다.</th>
										<th class="align-middle">
										</th>
										<th class="align-middle">
												<input type="checkbox" id="checkbox-all" onchange="toggleAgreementCheckbox()" class="w-25 p-2 form-check-input">
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="align-middle text-start fw-light">YBM Family 회원 이용약관 동의 <small>(필수)</small></td>
										<td>
											<button type="button" class="btn btn-sm btn-outline-dark" onclick="winPopup1()">내용보기</button>
										</td>
										<td><input type="checkbox" id="ck1" class="w-25 p-2 form-check-input" name="agree"></td>
									</tr>
									<tr>
										<td class="align-middle text-start fw-light">개인정보 처리위탁 동의 <small>(필수)</small></td>
										<td>
											<button type="button" class="btn btn-sm btn-outline-dark" onclick="winPopup2()">내용보기</button>
										</td>
										<td><input type="checkbox" id="ck2" class="w-25 p-2 form-check-input" name="agree"></td>
									</tr>
									<tr>
										<td class="align-middle text-start fw-light">(주)와이비엠 이용약관 동의 <small>(필수)</small></td>
										<td>
											<button type="button" class="btn btn-sm btn-outline-dark" onclick="winPopup3()">내용보기</button>
										</td>
										<td><input type="checkbox" id="ck3" class="w-25 p-2 form-check-input" name="agree"></td>
									</tr>
									<tr>
										<td class="align-middle text-start fw-light">(주)와이비엠 개인정보 수집 및 이용 동의 <small>(필수)</small></td>
										<td>
											<button type="button" class="btn btn-sm btn-outline-dark" onclick="winPopup4()">내용보기</button>
										</td>
										<td><input type="checkbox" id="ck4" class="w-25 p-2 form-check-input" name="agree"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row my-3 text-center">
						<div class="col-12">
							<button type="button" onclick="checkForm()" class="btn btn-primary btn-lg w-25">동의</button>
							<a href="main" class="btn btn-secondary y btn-lg w-25">취소</a>
						</div>
<!-- 						<div class="col-6"> -->
<!-- 						</div> -->
					</div>	
				</div>
			</form>
		</div>
	</main>
</div>
<script type="text/javascript">

	function checkForm() {
		
	    var checkMe = document.querySelector("#ck1").checked;
	    if (!checkMe) {
	    	alert("YBM Family 회원 이용약관 동의여부는 반드시 체크해야 합니다.");
	    	return;
	    }
	    var checkMe = document.querySelector("#ck2").checked;
	    if (!checkMe) {
	    	alert("개인정보 처리위탁 동의여부는 반드시 체크해야 합니다.");
	    	return;
	    }
	    var checkMe = document.querySelector("#ck3").checked;
	    if (!checkMe) {
	    	alert("(주)와이비엠 이용약관 동의여부는 반드시 체크해야 합니다.");
	    	return;
	    }
	    var checkMe = document.querySelector("#ck4").checked;
	    if (!checkMe) {
	    	alert("(주)와이비엠 개인정보 수집 및 이용 동의여부는 반드시 체크해야 합니다.");
	    	return;
	    }
	    
		 // 모든 폼 입력값이 유효한 입력값임으로 서버로 제출되게 한다.
		document.getElementById("register-form").submit();
	}
	
	function toggleAgreementCheckbox() {
		// 전체 선택/해제 체크박스의 체크여부 조회하기
		var checkboxAllChecked = document.getElementById("checkbox-all").checked;
		
		document.getElementById("ck1").checked = checkboxAllChecked;
		document.getElementById("ck2").checked = checkboxAllChecked;
		document.getElementById("ck3").checked = checkboxAllChecked;
		document.getElementById("ck4").checked = checkboxAllChecked;
	}
	
	// 내용보기 팝업
	function winPopup1() {
        var popUrl = "popUpHtml/popup1.html";
        var popName = "YBM Family 회원 이용약관 동의";
        var popOption = "top=200, left=550, width=800, height=650, status=no, menubar=no, toolbar=no, resizable=no";
        window.open(popUrl, popName, popOption);
    }
	function winPopup2() {
        var popUrl = "popUpHtml/popup2.html";
        var popName = "개인정보 처리위탁 동의";
        var popOption = "top=200, left=550, width=800, height=650, status=no, menubar=no, toolbar=no, resizable=no";
        window.open(popUrl, popName, popOption);
    }
	function winPopup3() {
        var popUrl = "popUpHtml/popup3.html";
        var popName = "(주)와이비엠 이용약관 동의";
        var popOption = "top=200, left=550, width=800, height=650, status=no, menubar=no, toolbar=no, resizable=no";
        window.open(popUrl, popName, popOption);
    }
	function winPopup4() {
        var popUrl = "popUpHtml/popup4.html";
        var popName = "(주)와이비엠 개인정보 수집 및 이용 동의";
        var popOption = "top=200, left=550, width=800, height=650, status=no, menubar=no, toolbar=no, resizable=no";
        window.open(popUrl, popName, popOption);
    }

</script>
</body>
</html>
