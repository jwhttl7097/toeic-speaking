<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>

	<title>관리자 : 일정수정</title>
	<meta charset="UTF-8">
   	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   	<%-- moment cdnjs 불러오기 --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<%-- moment cdnjs 한국어설정하기 --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
<!--=======================================Table========================================================-->
	<link rel="icon" type="Resources/Addform/image/png" href="Resources/Addform/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="Resources/Addform/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/css/util.css">
	<link rel="stylesheet" type="text/css" href="Resources/Addform/css/main.css">
<!--========================================NavVar=======================================================-->
    <script src="Resources/Admin/js/popper.js"></script>
    <script src="Resources/Admin/js/bootstrap.min.js"></script>
    <script src="Resources/Admin/js/main.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" >
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="Resources/Admin/css/style.css">
	
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
				<form class="contact100-form validate-form" method="post" action="modifyTest" id="mofiy-form">
					<span class="contact100-form-title">
						<strong>시험일정변경</strong>
					</span>
					<div class="wrap-input100 input100-select bg1">
						<span class="label-input100"><strong>시험일정</strong></span>
						<div>
							<select class="js-select2" name="test" id="test" onchange="disPlayOldDataForm(this.value);">
								<c:forEach var="dtos" items="${scloDto }">
									<c:if test="${dtos.testDate > nowTime}">
									<option value="${dtos.testNo}">
									${dtos.testNo } : ${dtos.testName }(${dtos.centerName })/<fmt:formatDate value="${dtos.testDate }" pattern="yyyy-MM-dd E"/></option>
									</c:if>
								</c:forEach>
							</select>
							<div class="dropDownSelect2"></div>
						</div>
					</div>

				<div class="wrap-input100 input100-select bg1 col-6" id="ModifyDataForm">
					<%--기존 정보 출력될 공간 --%>
				</div>
				
				<div class="wrap-input100 input100-select bg1 col-6">		
				
						<span class="label-input100"><Strong>시험일자 - 신규</Strong></span>
						<div>
							<input type="datetime-local" class="wrap-input100 input100-select bg1" id="testDate" name="testDate" />
						</div>
					
						<span class="label-input100"><Strong>접수시작일 - 신규</Strong></span>
						<div>
							<input type="datetime-local" class="wrap-input100 input100-select bg1" id="receipt" name="receipt" />
						</div>
					
						<span class="label-input100"><Strong>접수마감일 - 신규</Strong></span>
						<div>
							<input type="datetime-local" class="wrap-input100 input100-select bg1" id="deadline" name="deadline" />
						</div>
						<span class="label-input100"><Strong>성적발표예정일 - 신규</Strong></span>
						<div>
							<input type="datetime-local" class="wrap-input100 input100-select bg1" id="expectedDate" name="expectedDate" />
						</div>
						
						<span class="label-input100"><Strong>정원수 - 신규</Strong></span>
						<div>
							<input type="number" min="10" max="500" class="wrap-input100 input100-select bg1" id="quota" name="quota" value="0"/>
						</div>
						
						<span class="label-input100"><Strong>신청자수 - 신규</Strong></span>
						<div>
							<input type="text" class="wrap-input100 input100-select bg1" id="registerCount" name="registerCount" value="선택불가능" disabled/>
						</div>
						
						
						<span class="label-input100" ><Strong>시험상태 - 신규</Strong></span>
							<div class="wrap-input100 input100-select bg1">
								<div>
									<select class="js-select2" name="statusValue" id="statusValue">
										<option value=""></option>
										<option value="N">정상</option>
										<option value="Y" >삭제</option>
									</select>
									<div class="dropDownSelect2"></div>
								</div>
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
					if($(this).val() == "") {
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

	function disPlayOldDataForm(testNo){
		
		var oldEl = document.querySelector("#ModifyDataForm");
		oldEl.innerHTML = "";
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
		
		if(xhr.readyState == 4 && xhr.status == 200){
			var JsonTextData = xhr.responseText;
			
			var data = JSON.parse(JsonTextData);
			var rows = "";
			
			var status = "";
			var Tdate = moment(new Date(data.testDate))
			var Rdate = moment(new Date(data.receiptDate));
			var Ddate = moment(new Date(data.deadLineDate));
			var Edate = moment(new Date(data.expectedDate));
			
			
			if(data.testStatus == 'N'){
				 status = '정상';
			}else{
				status = '삭제';
			}
							
rows +=		"<span class='label-input100'><Strong>시험일자 - 기존</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='testDateOld' name='testDateOld' value='"+Tdate.format('YYYY-MM-DD a HH:mm')+"' disabled/>"
rows +=			"</div>"

rows +=		"<span class='label-input100'><Strong>접수시작일 - 기존</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='receiptOld' name='receiptOld' value='"+Rdate.format('YYYY-MM-DD a HH:mm')+"' disabled/>"
rows += 		"</div>"
		
rows +=		"<span class='label-input100'><Strong>접수마감일 - 기존</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='deadlineOld' name='deadlineOld' value='"+Ddate.format('YYYY-MM-DD a HH:mm')+"' disabled/>"
rows +=			"</div>"
		
rows +=		"<span class='label-input100'><Strong>성적발표예정일 - 기존</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='expectedDateOld' name='expectedDateOld' value='"+Edate.format('YYYY-MM-DD a HH:mm')+"' disabled/>"
rows +=			"</div>"

rows +=		"<span class='label-input100'><Strong>정원수 - 기존</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='number' class='wrap-input100 input100-select bg1' id='registerCount' name='quotaOld' value='"+data.Lquota+"' disabled />"
rows +=			"</div>"
				
rows +=		"<span class='label-input100'><Strong>신청자수 - 기존</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='number' class='wrap-input100 input100-select bg1' id='registerCount' name='registerCount' value='"+data.registerCount+"' disabled />"
rows +=			"</div>"
rows +=		"<div>"		
rows +=		"<span class='label-input100'><Strong>시험상태 - 기존</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='statusOld' name='statusOld' value='"+status+"' style='height:61px;' disabled/>"
rows +=			"</div>"
rows +=	"	</div>"

			oldEl.innerHTML = rows;
		}
	}
		xhr.open("GET", "displayOld?testNo=" + testNo);
		xhr.send();
}
	
	
	
	function checkForm(){
	
	var testEl = document.querySelector("select[name='test']");
	if(!testEl.value){
		alert("시험을 선택해 주세요.");
		testEl.focus();
		return;
	}
	
	var quotaEl = document.querySelector("#quota");
	if(quota.value < 50 || quota.value > 500 || quota == ""){
		alert("정원의 최소값은 50, 최대값은 500 입니다.")
		quotaEl.focus();
		return;
	}
	
	var testdateEl = document.querySelector("#testDate");
	var now = getToday();
	if(testdateEl.value <= now || testdateEl.value == ""){
		alert("시험일은 오늘 이전일 수 없습니다.");
		testdateEl.focus();
		return;
	}
	
	var receiptEl = document.querySelector("#receipt");
	if(receiptEl.value > testdateEl.value || receiptEl.value == ""){
		alert("접수시작일은 시험일 이후일 수 없습니다.");
		receiptEl.focus();
		return;
	}
	
	var deadlineEl = document.querySelector("#deadline");
	if(deadlineEl.value < receiptEl.value || deadlineEl.value == ""){
		alert("접수마감일은 접수시작일 이전일 수 없습니다.");
		deadlineEl.focus();
		return;
	}
	
	var expectedDateEl = document.querySelector("#expectedDate");
	if(expectedDateEl.value < testdateEl.value || expectedDateEl.value == ""){
		alert("성적발표 예정일은 시험일 이전일 수 없습니다.");
		expectedDateEl.focus();
		return;
	}
	
	var statusValueEl = document.querySelector("select[name='statusValue']");
	if(statusValueEl.value == ""){
		alert("시험상태를 선택해주세요.");
		statusValueEl.focus();
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
	
	document.getElementById("mofiy-form").submit();
	}
</script>
	<script src="Resources/Admin/js/popper.js"></script>
	<script src="Resources/Admin/js/bootstrap.min.js"></script>
	<script src="Resources/Admin/js/main.js"></script>
</body>
</html>
