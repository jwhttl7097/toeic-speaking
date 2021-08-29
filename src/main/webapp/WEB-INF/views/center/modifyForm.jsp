<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관리자 : 센터변경</title>
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
			<form class="contact100-form validate-form" method="post" action="modifyCenter" id="modify-form">
				<span class="contact100-form-title">
					<strong>센터정보변경</strong>
				</span>
				<div class="wrap-input100 input100-select bg1">
					<span class="label-input100"><Strong>지역</Strong></span>
					<div>
						<select class="js-select2" name="location" id="location" onchange="displayList(this.value)">
							<option value="">지역을 선택해주세요.</option>
							<c:forEach var="loc" items="${locsName }">
							<option value="${loc.centerLocation }"  >${loc.centerLocation }</option>
							</c:forEach>
						</select>
						<div class="dropDownSelect2"></div>
					</div>
				</div>
				<div class="wrap-input100 input100-select bg1 col-6">
				<div class="wrap-input100 input100-select bg1">
					<span class="label-input100"><Strong>시험센터 - 기존</Strong></span>
						<div>
							<select class="js-select2" name="centerOld" id="centerOld" onchange='displayOld(this.value)'>
							<option value="">센터를 선택해주세요.</option>
							<%-- 지역에 따른 선택결과 나오는 곳 --%>
							</select>
							<div class="dropDownSelect2"></div>
						</div>
					</div>
					<span class="label-input100"><Strong>정원 - 기존</Strong></span>
					<div>
						<input type="number" class="wrap-input100 input100-select bg1" id="quotaOld" name="quotaOld" disabled/>
					</div>
					<span class="label-input100"><Strong>시험센터상태 - 기존</Strong></span>
					<div>
						<input type="text" class="wrap-input100 input100-select bg1" id="centerStatusold" name="centerStatusold" disabled/>
					</div>
				</div>
				
				
				<div class="wrap-input100 input100-select bg1 col-6">
					
					<span class="label-input100"><Strong>시험센터 - 신규</Strong></span>
					<div>
						<input type="text" class="wrap-input100 input100-select bg1" id="center" name="center"/>
					</div>
					
					
					<span class="label-input100"><Strong>정원 - 신규</Strong></span>
					<div>
						<input type="number" class="wrap-input100 input100-select bg1" id="quota" name="quota"/>
					</div>
						<div class="wrap-input100 input100-select bg1">
							<span class="label-input100"><Strong>시험센터상태 - 신규</Strong></span>
								<select class="js-select2" id="centerStatus" name="centerStatus">
									<option value="">변경하실 값을 선택해주세요..</option>
									<option value="N">정상</option>
									<option value="Y" >삭제</option>
								</select>
								<div class="dropDownSelect2"></div>
						</div>
				</div>
				
				
					
					

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn " type="button" onclick="checkForm()">
						<span>
							변경
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


	function displayList(location){
		
		var locationEl = document.querySelector("#centerOld");
		locationEl.innerHTMl = "";
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			
			if(xhr.readyState == 4 && xhr.status == 200){
				var JsonTextDate = xhr.responseText;
				
				var datas = JSON.parse(JsonTextDate);
				var rows = "";
				
				if(datas.length == 0){
					rows += "<option value=''>현재 수정가능한 센터가 존재하지 않습니다.</option>"
				}
				
				for(var i=0; i<datas.length; i++){
					var data = datas[i];
					
					if(data.centerStatus == 'N'){
						rows += "<option value='"+data.centerNo+"+"+data.quota+"+"+data.centerStatus+"'>"+data.centerName+"</option>";
					}
				}
				locationEl.innerHTML = rows;
			}
			
		}
		xhr.open("GET", "centerLists?location=" + location);
		xhr.send();
	}
	
		var displayOld = function(value){
			
		var quotaOld = value.substring(6,8);
		var statusOld = value.substring(9,10);
		
		$("#quotaOld").val(quotaOld);
		if(statusOld == 'N'){
			$("#centerStatusold").val("정상");
		}else{
			$("#centerStatusold").val("삭제");
		}
	}

	

	function checkForm(){
	
	var locationEl = document.querySelector("select[name='location']");
	
	if(!locationEl.value){
		alert("지역을 선택해 주세요");
		locationEl.focus();
		return;
	}
	
	var centerOldEl = document.querySelector("select[name='centerOld']");
	if(!centerOldEl.value){
		alert("센터를 선택해주세요.");
		centerOldEl.focus();
		return;
	}
	
	var centerEl = document.querySelector("#center");
	if(!centerEl.value){
		alert("신규센터명을 입력해주세요.");
		centerEl.focus();
		return;
	}
	
	var quotaEl = document.querySelector("#quota");
	if(quota.value < 50 || quota.value > 500 || quota == ""){
		alert("정원의 최소값은 50, 최대값은 500 입니다.")
		quotaEl.focus();
		return;
	}
	
	var statusEl = document.querySelector("select[name='centerStatus']");
	if(!statusEl.value){
		alert("시험상태를 선택해 주세요.");
		statusEl.focus();
		return;
	}
	
	
	document.getElementById("modify-form").submit();
	}
</script>
	<script src="Resources/Admin/js/popper.js"></script>
	<script src="Resources/Admin/js/bootstrap.min.js"></script>
	<script src="Resources/Admin/js/main.js"></script>
</body>
</html>
