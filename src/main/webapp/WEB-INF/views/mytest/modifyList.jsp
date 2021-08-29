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
		<c:choose>
		<c:when test="${param.fail eq 'deny' }">
				<div class="row">
					<div class="col-12">
						<div class="alert alert-danger">
							<strong>서비스 거부</strong> 로그인이 필요한 작업입니다.
						</div>
					</div>
				</div>
		</c:when>
	</c:choose>
		<div class="row">
			<div class="col-12">
				<h4 class="fw-bold fs-3 text-center my-3">접수확인/변경/취소</h4>
			</div>
		</div>
		
		<div class="row mb-5">
			<div class="col-12">
				<p class="fw-bold fs-5 text-left ml-2">시험접수내역</p>
			</div>
			<div class="col-12">
				<div class="p-2">
					<table class="table text-center">
						<colgroup>
							<col width="10%">
							<col width="15%">
							<col width="15%">
							<col width="10%">
							<col width="25%">
							<col width="15%">
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
								<th>접수취소</th>
							</tr>
						<tbody>
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
										</c:when>											<c:otherwise>
											<span class="text-danger">${dto.testStatusText }</span>
										</c:otherwise>
									</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${dto.testStatusText eq '접수완료' }">
												 <a href="del?testNo=${dto.testNo }&centerNo=${dto.centerNo }" class="btn btn-primary btn-sm">취소</a>  
											</c:when>
											<c:otherwise>
												 <a href="del?testNo=${dto.testNo }" class="btn btn-primary btn-sm disabled">취소</a>  
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
	<footer class="footer mt-auto py-3">
		<div class="row px-5 mt-3">
			<div class="col-12">
	  			<table class="table">
	  				<thead>
	  					<tr>
							<th class="fw-bold fs-5 text-left">유의사항</th>
						</tr>
	  				</thead>
	  				<tbody>
	  					<tr>
	  						<td>
					    		<ul>
					    			<li>접수취소 및 환불 규정 제 7조에 의해 시험일 이후 전액 환불 조건에 해당하는 경우는 우편취소를 이용하여 주시기 바랍니다.</li>
					    			<li>최근 1년 이내 정기시험에 접수한 내역만 확인 가능합니다.</li>
					    			<li>패키지 접수한 과목의 내역은 해당 과목 홈페이지에서 확인하시기 바랍니다.</li>
					    			<li>시험센터의 변경은 해당 회차의 접수기간 내에만 가능합니다.</li>
					    			<li>기업 임직원 접수 빛 군인 할인 접수자는 접수기간 내에만 취소 신청 가능합니다. 접수기간 이후에는 취소 및 환불 불가능합니다.</li>
					    		</ul>
	  						</td>
	  					</tr>
	  				</tbody>
	  			</table>
  			</div>
		</div>
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