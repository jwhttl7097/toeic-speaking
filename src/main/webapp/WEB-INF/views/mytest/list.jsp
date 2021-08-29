<%@ page pageEncoding="UTF-8"%>
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
		<%@ include file="../common/header.jsp"%>

		<div class="row">
			<div class="col-12">
				<h4 class="fw-bold fs-3 text-center my-3">마이테스트</h4>
			</div>
		</div>  
		
		<div class="row mb-5">
			<div class="col-6 text-left">
				<p class="fw-bold fs-5 text-left ml-2">${user.userName }님의 프로필</p>		
			</div>
			<div class="col-6 text-end">
				<a href="../myInfo/confirmLogin" class="btn btn-outline-secondary">프로필수정</a> 		
			</div>
			
			<div class="col-12">
				<table class="table table-bordered text-center">
					<colgroup>
						<col width="10%"/>
						<col width="10%"/>
						<col width="30%"/>
						<col width="10%"/>
						<col width="10%"/>
						<col width="30%"/>
					</colgroup>
					<tr>
						<td rowspan="2">
						<c:choose>
							<c:when test="${user.fileName == null}">
								<div class="text-start">
									<img id="inputThumbnail" src="../images/noimage.png" height="70" width="110">
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<img id="inputThumbnail" src="../images/userImages/${user.fileName }" height="70" width="110">
								</div>
							</c:otherwise>
						</c:choose>
						</td>
						<th class="bg-light">이름</th>
						<td>${user.userName }</td>
						<th class="bg-light">생년월일</th>
						<td colspan="2">${user.birth }</td>
					</tr>
					<tr>
						<th class="bg-light">휴대폰번호</th>
						<td colspan="2">${user.phone }</td>
						<th class="bg-light">이메일</th>
						<td>${user.email }</td>
					</tr>
				</table>				
			</div>
		</div>
			
			
		<div class="row mb-2 mt-5">
			<div class="col-6 text-left">
				<p class="fw-bold fs-5 text-left ml-2">접수내역 <span class="fs-6 ml-2 text-secondary">(최근 3회차 접수 내역)</span></p>
			</div>
			<div class="col-6 text-end">
				<a href="allList" class="btn btn-outline-secondary">전체보기</a> 		
			</div>
			<div class="col-12">
				<div class="p-2">
					<table class="table text-center">
						<colgroup>
							<col width="15%">
							<col width="15%">
							<col width="15%">
							<col width="10%">
							<col width="35%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr class="table-light">
								<th>시험명</th>
								<th>접수일자</th>
								<th>시험일</th>
								<th>시간</th>
								<th>시험센터</th>
								<th>접수상태</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${empty testHistoryDtos }">
								<tr>
									<td colspan="7">등록된 시험일정이 존재하지 않습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="dto" items="${testHistoryDtos }">
									<tr>
										<td>${dto.testName }</td>
										<td><fmt:formatDate value="${dto.testRequestDate }" pattern="yyyy-MM-dd"/> </td>
										<td><fmt:formatDate value="${dto.testDate }" pattern="yyyy-MM-dd"/> </td>
										<td>${dto.testTime }</td>
										<td>${dto.centerName }</td>
										<td>
										<c:choose> 
											<c:when test="${dto.testStatusText eq '접수완료' }">
												<span class="text-primary">${dto.testStatusText }</span>
											</c:when>
											<c:otherwise>
												<span class="text-danger">${dto.testStatusText }</span>
											</c:otherwise>
										</c:choose>
										</td>
									</tr>
								</c:forEach>							
							</c:otherwise>
						</c:choose>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
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
</body>
</html>