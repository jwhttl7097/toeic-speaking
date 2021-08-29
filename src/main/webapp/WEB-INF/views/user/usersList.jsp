<%@page import="com.toeic.speaking.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="com.toeic.speaking.dao.UserDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.toeic.speaking.utils.CommonUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관리자 : 회원목록</title>
	<meta charset="UTF-8">
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <!--==========================================UserListTable -============================================-->
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="Resources/Table/css/style.css">
   	
<!--=======================================Table========================================================-->
	<link rel="icon" type="Resources/Addform/image/png" href="Resources/Addform/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="Resources/Addform/vendor/bootstrap/css/bootstrap.min.css">
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
	<link rel="stylesheet" href="Resources/Admin/css/style.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
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
		  		<h1><a href="admin" class="logo">TOEIC®</a></h1>
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
              <a href="#stuSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">학생성적관리</a>
              <ul class="collapse list-unstyled" id="stuSubmenu">
              	<li>
                    <a href="usersList">전체수험자목록</a>
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
			<form class="contact100-form validate-form">
				<span class="contact100-form-title">
					<strong>수험자목록</strong>
				</span>
				<table class="table table-striped ">
				  <thead>
				    <tr>
				      <th>아이디</th>
				      <th>이름</th>
				      <th>생일</th>
				      <th>이메일</th>
				      <th>연락처	</th>
				      <th>가입일</th>
				      <th></th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:choose>
				  		<c:when test="${empty users }">
				  			<td colspan="7">등록된 아이디가 존재하지 않습니다.</td>
				  		</c:when>
				  		<c:otherwise>
						  <c:forEach var="user" items="${users }">
							 <tr>
							     <th scope="row">${user.userId }</th>
							     <td>${user.userName }</td>
							     <td>${user.birth }</td>
							     <td>${user.email }</td>
							     <td>${user.phone }</td>
							     <td><fmt:formatDate value="${user.createdDate }" pattern="yyyy-MM-dd "/></td>
							     <td>
							     <c:choose>
							     	<c:when test="${user.status eq 'N' }">
							   		  <button type="button" class="btn btn-info" value="${user.userId }" onclick="goToDetail(this.value)">등록/수정</button>
							     	</c:when>
						     		<c:otherwise>
						     		 <a href="" class="btn btn-danger disabled">삭제</a>
						     		</c:otherwise>
							     </c:choose>
							     </td>
							  </tr>
						  </c:forEach>
						  </c:otherwise>
				  	</c:choose>
				  </tbody>
				</table>
			</form>
			
			<c:if test="${pagination.totalRows gt 0 }">
				<ul class="pagination justify-content-center">
					<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : '' }">
						<a class="page-link" href="javascript:goToPage(${pagination.pageNo - 1 })">이전</a>
					</li>
					<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
						<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
							<a class="page-link" href="javascript:goToPage(${num })">${num }</a>
						</li>
					</c:forEach>
					<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : '' }">
						<a class="page-link" href="javascript:goToPage(${pagination.pageNo + 1 })">다음</a>
					</li>
				</ul>
					<div class="wrap-input100 input100-select bg1">
						<form id="form-search" class="form-inline justify-content-center" method="get" action="usersList">
							<input type="hidden" name="no" value="" />
							<input type="hidden" name="page" value="${pagination.pageNo }" />
							<input type="hidden" name="hiddenUD" value=""/>
							<select class="form-control mr-2" name="opt">
								<option value="id" ${param.opt eq 'id' ? 'selected' : '' }>아이디</option>
								<option value="name" ${param.opt eq 'name' ? 'selected' : '' }>이름</option>
								<option value="phone" ${param.opt eq 'phone' ? 'selected' : '' }>연락처</option>
							</select>
							<input type="text" class="form-control mr-2" name="keyword" value="${param.keyword }">
							<button type="button" class="btn btn-outline-primary" onclick="submitForm()">검색</button>
						</form>
					</div>
			</c:if>
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
	
	function goToDetail(UD) {
		var userId = UD;
		console.log(userId);
		var text = document.querySelector("input[name='keyword']").value;
		if (!text) {
			document.querySelector("select[name='opt']").disabled = true;
			document.querySelector("input[name='keyword']").disabled = true;
		}
		
		document.querySelector("input[name='hiddenUD']").value = userId;
		document.querySelector("#form-search").setAttribute("action", "insertUser");
		document.querySelector("#form-search").submit();
	}

	function goToPage(pageNo){
		var text = document.querySelector("input[name='keyword']").value;
		if(!text){
			document.querySelector("select[name='opt']").disabled = true;
			document.querySelector("input[name='keyword']").disabled = true;
		}
		document.querySelector("input[name='no']").disabled = true;
		
		document.querySelector("input[name='page']").value = pageNo;
		document.querySelector("#form-search").setAttribute("action","usersList");
		document.querySelector("#form-search").submit();
	}
	
		function submitForm(){
			var text = document.querySelector("input[name='keyword']").value;
			if(!text){
				alert("검색어를 입력하세요");
				document.querySelector("input[name='keyword']").focus();
				return;
			}
			document.querySelector("input[name='page']").value = 1;
			document.querySelector("#form-search").submit();
		}
		
	</script>
	<!-- NavVar -->
	<script src="Resources/Admin/js/popper.js"></script>
	<script src="Resources/Admin/js/bootstrap.min.js"></script>
	<script src="Resources/Admin/js/main.js"></script>
</body>
</html>
