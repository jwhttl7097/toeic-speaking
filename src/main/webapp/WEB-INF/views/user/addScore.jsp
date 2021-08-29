<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관리자 : 성적입력 및 수정</title>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	
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
	<%-- moment cdnjs 불러오기 --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<%-- moment cdnjs 한국어설정하기 --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
    
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
			<form class="contact100-form validate-form" method="post" action="modifyUser" id="modify-form">
				<span class="contact100-form-title">
					<strong>수험생 성적 추가 및 변경</strong>
				</span>
				<div class="wrap-input100 input100-select bg1">
					<span class="label-input100"><Strong>시험</Strong></span>
					<div>
						<select class="js-select2" name="testList" id="testList" onchange="displayUserInfo(this.value)">
							<option value="">시험을 선택해주세요.</option>
							<c:if test="${empty users }">
								<option value="">등록가능한 시험이 존재하지 않습니다.</option>
							</c:if>
							<c:forEach var="user" items="${users }">
								<c:if test="${user.htestStatus eq 'Y'}">
									<option value="${user.testNo }T${user.userId}"><fmt:formatDate value="${user.testDate }" pattern="yyyy-MM-dd"/> : ${user.testName } - ${user.centerName }</option>
								</c:if>
							</c:forEach>
						</select>
						<div class="dropDownSelect2"></div>
					</div>
				</div>
				
				<div class="wrap-input100 input100-select bg1" id="displayWithModify">
					<%-- 출력공간 --%>
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
	
function displayUserInfo(vvalue){
		
		var El = document.querySelector("#displayWithModify");
		
		El.innerHTML = "";
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
		
		if(xhr.readyState == 4 && xhr.status == 200){
			var JsonTextData = xhr.responseText;
			
			var data = JSON.parse(JsonTextData);
			var rows = "";
			
			var gender = "";
			if(data.gender == 'F'){
				gender = '여성';
			}else{
				gender = '남성'
			}
			
			var Hstatus = "";
			if(data.HtestStatus == 'Y'){
				Hstatus = '정상';
			}else{
				Hstatus = '실패';
			}
			var Rqdate = moment(new Date(data.testRequestDate));
			var Rgdate = moment(new Date(data.createdDate));
			var score1 = "";
			var score2 = "";
			var score3 = "";
			
			if(!data.testScore){
				score1 = "없음";
			}else{
				score1 = data.testScore;
			}
			
			if(!data.testScore2){
				score2 = "없음";
			}else{
				score2 = data.testScore2;
			}
			
			if(!data.testScore3){
				score3 = "없음";
			}else{
				score3 = data.testScore3;
			}
			
			
			
			
rows +=		"<span class='label-input100'><Strong>아이디</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='UserId' name='UserId' value='"+data.userId+"' disabled/>"
rows +=			"</div>"			

rows +=		"<span class='label-input100'><Strong>이름</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='UserName' name='UserName' value='"+data.userName+"' disabled/>"
rows +=			"</div>"	

rows +=		"<span class='label-input100'><Strong>영문이름</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='lastName' name='lastName' value='"+data.lastName+", "+data.firstName+"' disabled/>"
rows +=			"</div>"	

rows +=		"<span class='label-input100'><Strong>생일</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='dayOfBirth' name='dayOfBirth' value='"+data.birth+"' disabled/>"
rows +=			"</div>"		
							
rows +=		"<span class='label-input100'><Strong>이메일</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='email' name='email' value='"+data.email+"' disabled/>"
rows +=			"</div>"

rows +=		"<span class='label-input100'><Strong >성적표 수령주소</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='addr' name='addr' value='"+data.userAddress+"' disabled/>"
rows +=			"</div>"

rows +=		"<span class='label-input100'><Strong >연락처</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='phone' name='phone' value='"+data.phone+"' disabled/>"
rows +=			"</div>"

rows +=		"<span class='label-input100'><Strong>성별</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='gender' name='phone' value='"+gender+"' disabled/>"
rows +=			"</div>"

rows +=		"<span class='label-input100'><Strong>성적표 수령방법</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='recevieType' name='recevieType' value='"+data.receiveType+"' disabled/>"
rows +=			"</div>"

rows +=		"<span class='label-input100'><Strong>결제수단</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='paymentType' name='paymentType' value='"+data.payment+"' disabled/>"
rows +=			"</div>"

rows +=		"<span class='label-input100'><Strong>시험접수일</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='testRequestDate' name='testRequestDate' value='"+Rqdate.format('YYYY-MM-DD a HH:mm')+"' disabled/>"
rows +=			"</div>"

rows +=		"<span class='label-input100'><Strong>시험접수상태</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='Hstatus' name='Hstatus' value='"+Hstatus+"' disabled/>"
rows +=			"</div>"

	if(data.testName == 'Speaking Test'){
rows +=		"<span class='label-input100'><Strong>Speaking 기존점수</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='sp' name='Oldsp' value='"+score1+"' disabled/>"
rows +=			"</div>"	
rows +=		"<span class='label-input100'><Strong class='text-danger'>Speaking 신규점수</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='sp' name='sp'" + " placeholder='점수를 입력해 주세요 ex)LEVEL1'" + "/>"
rows +=			"</div>"
	}else{
rows +=		"<span class='label-input100'><Strong>Speaking 기존점수</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='sp' name='Oldsp' value='"+score1+"' disabled/>"
rows +=			"</div>"	
	}
	
	if(data.testName == 'WritingTest'){
rows +=		"<span class='label-input100'><Strong>Writing 기존점수</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='Oldwr' name='Oldwr' value='"+score2+"' disabled/>"
rows +=			"</div>"	
rows +=		"<span class='label-input100'><Strong class='text-danger'>Writing 신규점수</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='wr' name='wr'" + " placeholder='점수를 입력해 주세요 ex)LEVEL1'" + "/>"
rows +=			"</div>"
	}else{
rows +=		"<span class='label-input100'><Strong>Writing 기존점수</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='wr' name='wr' value='"+score2+"' disabled/>"
rows +=			"</div>"		
	}
	
	if(data.testName == 'SpeakingWritingTest'){
rows +=		"<span class='label-input100'><Strong>Speaking And Writing 기존점수</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='oldSspwr' name='oldSpwr' value='"+score3+"' disabled/>"
rows +=			"</div>"	
rows +=		"<span class='label-input100'><Strong class='text-danger'>Speaking And Writing 신규점수</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='spwr' name='spwr'" + " placeholder='점수를 입력해 주세요 ex)LEVEL1'" + "/>"
rows +=			"</div>"
	}else{
rows +=		"<span class='label-input100'><Strong>Speaking And Writing 기존점수</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='spwr' name='spwr' value='"+score3+"' disabled/>"
rows +=			"</div>"		
	}
	
rows +=		"<span class='label-input100'><Strong>가입일</Strong></span>"
rows +=			"<div>"
rows +=				"<input type='text' class='wrap-input100 input100-select bg1' id='createdDate' name='createdDate' value='"+Rgdate.format('YYYY-MM-DD a HH:mm')+"' disabled/>"
rows +=			"</div>"

			El.innerHTML = rows;
		}
	}
		xhr.open("GET", "addModifyDisplayScore?byId=" + vvalue);
		xhr.send();
}


	function checkForm(){
		
		/* var emailEl = document.querySelector("#email");
		var addrEl = document.querySelector("#addr");
		var phoneEl = document.querySelector("#phone"); */
		var scoreEl1 = document.querySelector("#sp");
		var scoreEl2 = document.querySelector("#wr");
		var scoreEl3 = document.querySelector("#spwr");
		
	/* 	if(!emailEl.value){
			alert("이메일주소를 입력해주세요.");
			emailEl.focus();
			return;
		}
		
		if(!addrEl.value){
			alert("성적표 수령주소를 입력해주세요.");
			addrEl.focus();
			return;
		}
		
		if(!phoneEl.value){
			alert("연락처를 입력해주세요.");
			phoneEl.focus();
			return;
		}
		 */
		if(!scoreEl1.value){
			alert("Speaking 점수를 입력해주세요.");
			scoreEl1.focus();
			return;
		}
		
		if(!scoreEl2.value){
			alert("Writing 점수를 입력해주세요.")
			scoreEl2.focus();
			return;
		}
		
		if(!scoreEl3.value){
			alert("SpeakingAndWriting 점수를 입력해주세요.")
			scoreEl3.focus();
			return;
		}
		
		
		document.querySelector("#modify-form").submit();
	}
	
	</script>
	
	
	<script src="Resources/Admin/js/popper.js"></script>
	<script src="Resources/Admin/js/bootstrap.min.js"></script>
	<script src="Resources/Admin/js/main.js"></script>
</body>
</html>
