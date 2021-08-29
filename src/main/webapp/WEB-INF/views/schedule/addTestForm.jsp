<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관리자 : 신규일정추가</title>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   	<!--========================================NavVar=======================================================-->
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" >
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link rel="stylesheet" href="Resources/Admin/css/style.css">
<!--=======================================Table========================================================-->
	<link rel="icon" type="Resources/Addform/image/png" href="Resources/Addform/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="Resources/Addform/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/css/util.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/css/main.css">

    
</head>
<body>

<!--=======================================NavVar========================================================-->

		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="custom-menu">
					<button type="button" id="sidebarCollapse" class="btn btn-primary">
	          <i class="fa fa-bars"></i>
	          <span class="sr-only">Toggle Menu</span>
	        </button>
        </div>
				<div class="p-4 pt-5">
		  		<h1 style="height: 60px;"><a href="admin" class="logo">TOEIC®</a></h1>
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="#testSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">시험일정관리</a>
	            <ul class="collapse list-unstyled" id="testSubmenu">
                <li>
                    <a href="addTest">시험일정추가</a>
                </li>
                <li>
                    <a href="modifyTest">시험일정변경</a>
                </li>
                <li>
                    <a href="deleteTest">시험일정삭제</a>
                </li>
	            </ul>
	          </li>
	          <li>
              <a href="#centerSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">시험센터관리</a>
              <ul class="collapse list-unstyled" id="centerSubmenu">
                <li>
                    <a href="addCenter">신규센터추가</a>
                </li>
                <li>
                    <a href="modifyCenter">센터정보변경</a>
                </li>
                <li>
                    <a href="deleteCenter">센터정보삭제</a>
                </li>
              </ul>
	          </li>
	          <li>
              <a href="#stuSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">수험자관리</a>
              <ul class="collapse list-unstyled" id="stuSubmenu">
              	<li>
                    <a href="usersList">수험자 점수 입력 및 수정</a>
                </li>
              </ul>
	          </li>
	          <li>
              <a href="main">메인페이지로 돌아가기</a>
	          </li>
	        </ul>

	      </div>
    	</nav>
<!--=======================================Table========================================================-->
	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form" method="post" action="addTest" id="insert-form">
				<span class="contact100-form-title">
					<strong>신규일정추가</strong>
				</span>
				<div class="wrap-input100 input100-select bg1" id="displayAddForm">
					<span class="label-input100"><Strong>과목명</Strong></span>
					<div>
						<select class="js-select2" name="test" id="test">
							<option value="">등록할 과목을 선택해주세요.</option>
							<option value="Speaking Test">TOEIC Speaking</option>
							<option value="WritingTest">TOEIC Writing</option>
							<option value="SpeakingWritingTest">TOEIC Speaking and Writing</option>
						</select>
						<div class="dropDownSelect2"></div>
					</div>
				</div>
				<div class="wrap-input100 input100-select bg1">
					<span class="label-input100"><Strong>시험센터</Strong></span>
					<div>
						<select class="js-select2" name="center" id="center">
							<c:choose>
							<c:when test="${empty locations }">
								<option value="">현재 등록된 센터가 존재하지 않습니다.</option>
							</c:when>
							<c:otherwise>
								<c:forEach var="location" items="${locations }">
									<c:if test="${location.centerStatus eq  'N'}">
										<option value="${location.centerNo }">센터번호: ${location.centerNo } / 센터명:${location.centerName }</option>
									</c:if>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</select>
						<div class="dropDownSelect2"></div>
					</div>
				</div>
				<div class="wrap-input100 input100-select bg1">
					<span class="label-input100"><Strong>시험일자</Strong></span>
					<div>
						<input type="datetime-local" class="wrap-input100 input100-select bg1" id="testDate" name="testDate"/>
					</div>
				</div>
				<div class="wrap-input100 input100-select bg1">
					<span class="label-input100"><Strong>접수시작일</Strong></span>
					<div>
						<input type="datetime-local" class="wrap-input100 input100-select bg1" id="receipt" name="receipt"/>
					</div>
				</div>
				<div class="wrap-input100 input100-select bg1">
					<span class="label-input100"><Strong>접수마감일</Strong></span>
					<div>
						<input type="datetime-local" class="wrap-input100 input100-select bg1" id="deadline" name="deadline"/>
					</div>
				</div>
				<div class="wrap-input100 input100-select bg1">
					<span class="label-input100"><Strong>성적발표예정일</Strong></span>
					<div>
						<input type="datetime-local" class="wrap-input100 input100-select bg1" id="expectedDate" name="expectedDate"/>
					</div>
				</div>
				
				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn " type="button" onclick="checkForm()">
						<span>
							등록
							<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
						</span>
					</button>
					<button class="contact200-form-btn" type="reset">
						<span>
							취소
							<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
						</span>
					</button>
				</div>
			</form>
		</div>
	</div>
	</div>
	<!--=======================================Table========================================================-->
	<script src="Resources/Addform/js/main.js"></script>
	<script src="Resources/Addform/vendor/animsition/js/animsition.min.js"></script>
	<script src="Resources/Addform/vendor/bootstrap/js/popper.js"></script>
	<script src="Resources/Addform/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="Resources/Addform/vendor/select2/select2.min.js"></script>
	<script src="Resources/Addform/vendor/daterangepicker/moment.min.js"></script>
	<script src="Resources/Addform/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="Resources/Addform/vendor/countdowntime/countdowntime.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});

			$(".js-select2").each(function(){
				$(this).on('select2:close', function (e){
					if($(this).val() == "등록할 과목을 선택해주세요") {
						$('.js-show-service').slideUp();
					}
					else {
						$('.js-show-service').slideUp();
						$('.js-show-service').slideDown();
					}
				});
			});
		})
	</script>
<script type="text/javascript">

	function checkForm(){
	
	var testEl = document.querySelector("select[name='test']");
	
	if(!testEl.value){
		alert("과목을 선택해 주세요");
		testEl.focus();
		return;
	}
	
	var centerEl = document.querySelector("select[name='center']");
	if(!centerEl.value){
		alert("센터를 선택해주세요.");
		centerEl.focus();
		return;
	}
	
	var testdateEl = document.querySelector("#testDate");
	var now = getToday();
	if(testdateEl.value <= now){
		alert("시험일은 오늘 이전일 수 없습니다.");
		testdateEl.focus();
		return;
	}
	
	var centerEl = document.querySelector("select[name='center']");
	if(!centerEl.value){
		alert("센터를 선택해주세요.");
		centerEl.focus();
		return;
	}
	
	var receiptEl = document.querySelector("#receipt");
	if(receiptEl.value > testdateEl.value){
		alert("접수시작일은 시험일 이후일 수 없습니다.");
		receiptEl.focus();
		return;
	}
	
	var deadlineEl = document.querySelector("#deadline");
	if(deadlineEl.value < receiptEl.value){
		alert("접수마감일은 접수시작일 이전일 수 없습니다.");
		deadlineEl.focus();
		return;
	}
	
	var expectedDateEl = document.querySelector("#expectedDate");
	if(expectedDateEl.value < testdateEl.value){
		alert("성적발표 예정일은 시험일 이전일 수 없습니다.");
		expectedDateEl.focus();
		return;
	}
	
	// 현재 날짜를 yyyy-mm-dd 로 반환하는 함수
	function getToday(){
	    var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);

	    return year + "-" + month + "-" + day;
	}
	
	document.getElementById("insert-form").submit();
	}
</script>
	<script src="js/jquery.min.js"></script>
	<script src="Resources/Admin/js/popper.js"></script>
	<script src="Resources/Admin/js/bootstrap.min.js"></script>
	<script src="Resources/Admin/js/main.js"></script>
</body>
</html>
