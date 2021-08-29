<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	function logout() {
		alert("로그아웃 되었습니다.");
	}
</script>
<header class="my-3">
         <div class="row">
            <div class="col-12 ">
               <div class="d-flex justify-content-between  pt-2" style="background-color: #0F54A6; border-bottom: 1px solid #356fb4;">
                  <div><a class="navbar-brand" href="/toeic-speaking/main"><img src="/toeic-speaking/images/logo2.png" alt="Toeic Speaking" width="400" height="50" /></a></div>
                  <div class="d-flex justify-content-between">
                  	<c:choose>
                  		<c:when test="${empty LOGINED_USER }">
		                    <div><a class="btn btn-link text-white text-decoration-none" href="/toeic-speaking/login">로그인</a></div>
							<div><a href="/toeic-speaking/agreeJoin" class="btn btn-link text-white text-decoration-none">회원가입</a></div>
                  		</c:when>
                  		<c:otherwise>
		                     <div class="dropdown">
		                          <button class="btn text-white dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
		                            ${LOGINED_USER.userName } 님
		                          </button>
		                          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
		                            <li><a class="dropdown-item" href="/toeic-speaking/myInfo/confirmLogin">회원정보수정</a></li>
		                            <li><a class="dropdown-item" href="/toeic-speaking/logout" onclick="logout()">로그아웃</a></li>
		                          </ul>
		                     </div>
                  		</c:otherwise>
                  	</c:choose>
                  </div>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-12">
               <div class="d-flex justify-content-between py-2 px-2" style="background-color: #0F54A6;">
                  <div><a class="btn btn-link text-white text-decoration-none" href="/toeic-speaking/online_reception/onlineReception">온라인 접수</a></div>
                  <div><a class="btn btn-link text-white text-decoration-none" href="/toeic-speaking/list">시험일정</a></div>
                  <div><a class="btn btn-link text-white text-decoration-none" href="/toeic-speaking/mytest/modifyList">시험접수확인</a></div>
                  <div><a class="btn btn-link text-white text-decoration-none" href="/toeic-speaking/intro">시험소개</a></div>
                  <c:choose>
                  	<c:when test="${LOGINED_USER.admin eq 'Y' }">
						<div><a class="btn btn-link text-white text-decoration-none" href="/toeic-speaking/admin">관리자페이지</a></div>
                  	</c:when>
                  	<c:otherwise>
						<div><a class="btn btn-link text-white text-decoration-none" href="/toeic-speaking/mytest/list">마이테스트</a></div>
                  	</c:otherwise>
                  </c:choose>
               </div>
            </div>
         </div>
      </header>