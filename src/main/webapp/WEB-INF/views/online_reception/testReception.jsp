<%@page import="java.util.Date"%>
<%@page import="com.toeic.speaking.utils.CommonUtils"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<title>Toeic Speaking</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" >
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${param.fail eq 'deny'}">
				<div class="row mt-3">
					<div class="col-12">
						<div class="alert alert-danger">
							<strong>서비스 거부</strong> [${param.job }] 은 필수 입력사항입니다.
						</div>
					</div>
				</div>
		</c:when>
	</c:choose>
	<%@ include file="../common/header.jsp" %>
	<form id="register-form" action="testReception" method="post" enctype="multipart/form-data">
		<div class="row">
			<div class="col-12">
				<h4 class="text-center">시험접수</h4>
			</div>
		</div>
		<div class="row mb-2">
			<div class="col-12">
				<p class="text-left ml-2">시험 선택</p>
			</div>
			<div class="col-12">
				<div class="p-2">
					<table class="table table-bordered text-center">
						<colgroup>
							<col width="20%">
							<col width="*%">
							<col width="30%">
						</colgroup>
						<tr>
							<th>과목</th>
							<td colspan="4">
								<div class="border text-white py-2" style="background-color: #0F54A6;">
									TOEIC.Sqpeaking Test
								</div>
							</td>
						</tr>
						<tr>
							<th>시험일</th>
							<td colspan="2">
									<select class="form-select" aria-label="Default select example" onchange="testDateSelected()" id="testDateSelect" >
								<c:forEach var="orsdStatus" items="${orsdStatus }">
										<option value="${orsdStatus.testDateString }" ${orsdStatus.testDateString eq param.testDate ? 'selected' : '' }><fmt:formatDate value="${orsdStatus.testDate }" pattern="yyyy.MM.dd (E)"/></option>
								</c:forEach>
									</select>
							</td>
						</tr>
						<tr>
							<th>시험센터</th>
							<td colspan="2">
								<div class="row">
									<div class="col-2" style="padding-right:0px;">
										<div class="list-group">
										  <c:forEach var="locationCnt" items="${locationCnts }">
											  <button type="button" onclick="getCenterDetail('${locationCnt.centerLocation}')" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
											  		${locationCnt.centerLocation }
<%-- 											  	<span class="badge bg-primary rounded-pill">총 ${locationCnt.cnt }</span> --%>
											  </button>
										  </c:forEach>
										</div>
									</div>
									<div class="col-10" id="centerDetail" style="max-height:124px; overflow-y:scroll; margin-left:-10px;">
										                                                                                   											
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>시간</th>
							<td>
								<select class="form-select" aria-label="Default select example">
									<option selected="selected">11:00</option>
								</select>
							</td>
							<td class="align-middle">
									<i class="bi bi-clock" style="color: red;"> 시험시간 11:00 (10:40분 부터 입실불가)</i>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<ul>
					<li class="text-left">
						<p class="fs-6"> 개설되는 시험센터 및 시험지역은 회차별로 변동될 수 있습니다.</p>
					</li>
					<li class="text-left">
						<p class="fs-6"> 시험 당일 시험센터 내 주차가 불가합니다.</p>
					</li>
					<li class="text-left">
						<p class="fs-6"> 패키지 접수를 장정 중단합니다.</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<p class="text-left ml-2 my-3">규정동의</p>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<table class="table text-center">
					<thead>
						<tr class="table-secondary">
							<th class="align-middle">
									<input type="checkbox" id="checkbox-all" onchange="toggleAgreementCheckbox()" class="w-25 p-3 form-check-input">
							</th>
							<th class="align-middle text-start">전체규정에 동의합니다.</th>
							<th class="align-middle">
								<button type="button" class="btn btn-secondary">전체보기</button>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox" id="ck1" class="w-25 p-3 form-check-input" name="agree"></td>
							<td class="align-middle text-start">시험관리규정동의</td>
							<td>
								<button type="button" class="btn btn-light">내용보기</button>
							</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="ck2" class="w-25 p-3 form-check-input" name="agree"></td>
							<td class="align-middle text-start">개인정보수집동의</td>
							<td>
								<button type="button" class="btn btn-light">내용보기</button>
							</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="ck3" class="w-25 p-3 form-check-input" name="agree"></td>
							<td class="align-middle text-start">개인정보처리위탁동의</td>
							<td>
								<button type="button" class="btn btn-light">내용보기</button>
							</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="ck4" class="w-25 p-3 form-check-input" name="agree"></td>
							<td class="align-middle text-start">개인정보제3자제공 및 국외이전 동의</td>
							<td>
								<button type="button" class="btn btn-light">내용보기</button>
							</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="ck5" class="w-25 p-3 form-check-input" name="agree"></td>
							<td class="align-middle text-start">민감정보수집동의</td>
							<td>
								<button type="button" class="btn btn-light">내용보기</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	
		<div class="row">
			<div class="col-12">
				<p class="text-left ml-2 my-3">개인정보 확인</p>
			</div>
			<div class="col-12">
				<div class="p-2">
					<table class="table table-bordered text-center">
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tr>
							<th class="align-middle text-start">사진</th>
							<td colspan="2">
								<div class="text-start mb-2">
									<img id="inputThumbnail" src="../images/noimage.png" width="200px;">
								</div>
								<div class="input-group">
								  <input accept="image/*" type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload" name="upfile">
								</div>
							</td>
						</tr>
						<tr>
							<th class="align-middle text-start">이름</th>
							<td class="text-start" colspan="2">${loginUser.userName }</td>
						</tr>
						<tr>
							<th class="align-middle text-start">영문이름</th>
							<td colspan="2">
								<div class="input-group">
								  <input type="text" id="eng-last-name" aria-label="First name" class="form-control" name="lastname" placeholder=" 영문 (성)을 입력하세요" value="${loginUser.lastName }">
								  <input type="text" id="eng-first-name" aria-label="Last name" class="form-control" name="firstname" placeholder=" 영문 (이름)을 입력하세요" value="${loginUser.firstName }">
								</div>
							</td>
						</tr>
						<tr>
							<th class="align-middle text-start">생년월일</th><td class="text-start">${loginUser.birth }</td>
						</tr>
						<tr>
							<th class="align-middle text-start">휴대폰 번호</th><td class="text-start">${loginUser.phone }</td>
						</tr>
						<tr>
							<th class="align-middle text-start">이메일</th><td class="text-start">${loginUser.email }</td>
						</tr>
						<tr>
							<th class="align-middle text-start">성별</th>
							<td class="text-start">
								<input type="radio" class="form-check-input" name="gendercheck" value="M" ${loginUser.gender eq "M" ? "checked" : "" }> 남
								<input type="radio" class="form-check-input" name="gendercheck" value="F" ${loginUser.gender eq "F" ? "checked" : "" }> 여
							</td>
						</tr>
						<tr>
							<th class="align-middle text-start">성적표 수령방법</th>
							<td class="text-start">
								<input type="radio" class="form-check-input" name="receptiontype" value="온라인" checked> 온라인출력
								<input type="radio" class="form-check-input" name="receptiontype" id="postReceive" value="우편"> 우편수령
							</td>
						</tr>
						<tr>
							<th class="align-middle text-start">주소</th>
							<td class="text-start">
								<div class="form-floating">
								  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" name="address"></textarea>
								  <label for="floatingTextarea">Address</label>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<p class="text-left ml-2">결제수단 선택</p>
			</div>
			<div class="col-12 text-center">
				<table class="table table-borderless bg-light">
					<tr>
						<th>
							<img alt="신용카드" src="../images/paymentImages/payment_icon_00.png">
						</th>
						<th>
							<img alt="계좌이체" src="../images/paymentImages/payment_icon_02.png">
						</th>
						<th>
							<img alt="휴대폰결제" src="../images/paymentImages/payment_icon_03.png">
						</th>
						<th>
							<img alt="카카오페이" src="../images/paymentImages/payment_icon_kakaopay.png">
						</th>
					</tr>
					<tr>
						<td>
						  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="신용카드" checked>
						  <label class="form-check-label" for="flexRadioDefault1">
						    신용카드/제휴카드
						  </label>
						</td>
						<td>
						  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="계좌이체">
						  <label class="form-check-label" for="flexRadioDefault1">
						    실시간 계좌이체
						  </label>
						</td>
						<td>
						  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" value="휴대폰결제">
						  <label class="form-check-label" for="flexRadioDefault1">
						    휴대폰 결제
						  </label>
						</td>
						<td>
						  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault4" value="카카오페이">
						  <label class="form-check-label" for="flexRadioDefault1">
						    카카오페이 
						  </label>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 결제하기 -->
		<div class="row my-5">
			<div class="col-12 border border-2 rounded-3" style="border-color: #0F54A6 !important;">
			<div class="mx-3 my-3">
				<h3 class="text-center" style="color: #0F54A6"><strong>TOEIC Speaking Test</strong></h3>
					<table class="table table-borderless">
						<tr>
							<th>
							</th>
							<th>
							</th>
							<th>
							</th>
							</th>
						</tr>
						<tr>
							<td>
								<p>시험일 : <span id="testDateOutput">${param.testDate }</span></p>
							</td>
							<td>
								<p>시험센터 : <span id="testCenterOutput"></span></p>
							</td>
						</tr>
						<tr>
							<td>
								<p>시간 : 11:00 </p> 
							</td>
							<td>
								<p>응시료 : 77,000 원(부가세 10% 포함)</p>
							</td>
					</table>
					<div class="col-12 bg-light p-2">
							<div class="mb-4">총합계금액 : <span>77,000 원</span></div>
							<div>결제예정금액 : <span>77,000 원</span></div>
					</div>
			</div>
				<button type="button" onclick="checkForm()" class="col-12 btn btn-lg mb-3 text-white" style="height:70px; background-color: #0F54A6;">결제하기</button>
			</div>
		</div>
        <!-- 결제하기 -->
    </form>
<footer class="footer">
  	
		<div class="row mt-5 mb-3 border-top">
			<div class="col-7 px-5 border-end">
				<p class="fs-6 my-4"> 회사소개 | 이용약관 | 개인정보처리방침 | 콘텐츠창작지원 | 비즈니스제휴제안 | 고객센터</p>
				<p class="small">㈜와이비엠넷 경기도 성남시 분당구 대왕판교로 670 유스페이스2 A동 8/9층 대표이사 오재환</p>
				<p class="small">사업자등록번호 220-81-89608 / 통신판매업신고 경기성남-0034 사업자정보확인</p>
				<p class="small">시험 02.2279.0505 / 결제 02.2008.5200 / Fax 0502-320-5201 개인정보 privacy@ybm.co.kr</p>
				<p class="small">Copyright © (주)와이비엠넷. All rights reserved.</p>
			</div>
			<div class="col-5 px-5">
				<p class="fs-6 my-4">기업은행 채무지급보증안내</p>
				<p class="small">전자상거래 등에서의 소비자보호에 관한 법률에 따라</p>
				<p class="small">기업은행과 채무지급보증 계약을 체결하여 고객님의</p>
				<p class="small">결제금액에 대한 안전거래를 보장하고 있습니다.</p>
			</div>
		</div>
	</footer>
</div>
<script type="text/javascript">

	function checkForm() {
		
	    var checkMe = document.querySelector("#ck1").checked;
	    if (!checkMe) {
	    	alert("시험관리규정 동의여부는 반드시 체크해야 합니다.");
	    	return;
	    }
	    var checkMe = document.querySelector("#ck2").checked;
	    if (!checkMe) {
	    	alert("개인정보수집 동의여부는 반드시 체크해야 합니다.");
	    	return;
	    }
	    var checkMe = document.querySelector("#ck3").checked;
	    if (!checkMe) {
	    	alert("개인정보처리위탁 동의여부는 반드시 체크해야 합니다.");
	    	return;
	    }
	    var checkMe = document.querySelector("#ck4").checked;
	    if (!checkMe) {
	    	alert("개인정보제3자제공 및 국외이전 동의여부는 반드시 체크해야 합니다.");
	    	return;
	    }
	    var checkMe = document.querySelector("#ck5").checked;
	    if (!checkMe) {
	    	alert("민감정보수집 동의여부는 반드시 체크해야 합니다.");
	    	return;
	    }
	    
	    var fileEl = document.getElementById("inputGroupFile04");
		if (!fileEl.value) {	// 거짓-false, '', 0, null, NaN, undefined
			alert("증명사진은 필수 등록해야 합니다.");
			return;
		}
	    
	 	// 아이디 입력필드의 유효성 체크하기
		var engLastNameEl = document.getElementById("eng-last-name");
		if (!engLastNameEl.value.trim()) {	// 거짓-false, '', 0, null, NaN, undefined
			alert("영문 성 은 필수 입력값입니다.");
			return;
		}
		
		var engFirstNameEl = document.getElementById("eng-first-name");// 엘리먼트객체 획득
		if (!engFirstNameEl.value.trim()) {	// 거짓-false, '', 0, null, NaN, undefined
			alert("영문 이름은 필수 입력값입니다.");
			return;
		}
		
		// 성적표 수령방법을 우편수령으로 체크할 경우 주소를 반드시 입력할것.
		var postReceiveEl = document.querySelector("#postReceive").checked;
	    if (postReceiveEl) {
	    	var floatingTextareaEl = document.getElementById("floatingTextarea");
			if (!floatingTextareaEl.value.trim()) {
				alert("성적표 우편수령시 주소는 필수 입력값입니다.");
				return;
			}
	    }
		
	    
		 // 모든 폼 입력값이 유효한 입력값임으로 서버로 제출되게 한다.
		document.getElementById("register-form").submit();
		
		 alert("시험 접수가 완료되었습니다.");
	}

// 	이미지 아이디 inputThumbnail 인풋아이디 inputGroupFile04
	var inputThumbnail = document.getElementById("inputThumbnail");
	var inputGroupFile04 = document.getElementById("inputGroupFile04");
	
	inputGroupFile04.onchange = evt => {
	  const [file] = inputGroupFile04.files
	  if (file) {
		  inputThumbnail.src = URL.createObjectURL(file)
	  }
	}
	
	function testDateSelected() {
		var testDateSelected = document.getElementById("testDateSelect");
		var testDateOutput = document.getElementById("testDateOutput");
		var dateTime = testDateSelected.options[testDateSelected.selectedIndex].textContent;
		var day = dateTime.substring(0, 14)
		
		var centerDetailEl = document.getElementById("centerDetail");
		centerDetailEl.innerHTML = "";
		
		testDateOutput.textContent = day;
	}

	function getCenterDetail(centerLocation) {
		var centerDetailEl = document.getElementById("centerDetail");
		var testDate = document.getElementById("testDateSelect").value;
		
		centerDetailEl.innerHTML = "";
		centerDetailEl.style.display = "";
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var jsonTextData = xhr.responseText;
				console.log(jsonTextData);
				var centerList = JSON.parse(jsonTextData);
				
				var rows = "";
				for (var i=0; i<centerList.length; i++) {
					var center = centerList[i];
					
					if ( center.testStatus == "Y") {
						rows += "<button type='button' onclick='testCenterSelected("+center.centerNo+")' id='testCenterSelect"+center.centerNo+"' class='list-group-item list-group-item-action d-flex justify-content-between align-items-center'>";
						rows += center.centerName +" 신청인원/정원 : " + center.registerCount + " / " + center.quota + " <h5><span class='badge bg-primary'>접수중</span></h5>";
						rows += "<input type='hidden' name='centerNumber' value=" + center.centerNo + ">";
						rows += "<input type='hidden' name='testNumber' value=" + center.testNo + ">";
						rows += "</button>";
					} else {
						rows += "<button type='button' onclick='testCenterSelected("+center.centerNo+")' id='testCenterSelect"+center.centerNo+"' class='list-group-item list-group-item-action d-flex justify-content-between align-items-center' disabled>";
						rows += center.centerName +" 신청인원/정원 : " + center.registerCount + " / " + center.quota + " <h5><span class='badge bg-danger'>마감</span></h5>";
						rows += "</button>";
					}
				}
				
				centerDetailEl.innerHTML = rows;
			}
		};
		
		xhr.open("GET", "testReceptionAjax?centerLocation=" + centerLocation + "&testDate=" + testDate);
		xhr.send();
	}
	
	function testCenterSelected(no) {
		var centerSelect = document.getElementById("testCenterSelect" + no);
		var centerOutput = document.getElementById("testCenterOutput");
		
		centerOutput.textContent = centerSelect.textContent
	}
	
	function toggleAgreementCheckbox() {
		// 전체 선택/해제 체크박스의 체크여부 조회하기
		var checkboxAllChecked = document.getElementById("checkbox-all").checked;
		
		document.getElementById("ck1").checked = checkboxAllChecked;
		document.getElementById("ck2").checked = checkboxAllChecked;
		document.getElementById("ck3").checked = checkboxAllChecked;
		document.getElementById("ck4").checked = checkboxAllChecked;
		document.getElementById("ck5").checked = checkboxAllChecked;
	}
	
</script>
</body>
</html>