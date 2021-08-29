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
	
		<div class="row mb-2 mt-5">
			<div class="col-6 text-left">
				<p class="fw-bold fs-5 text-left ml-2">전체내역</p>
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
							<c:when test="${empty myTestLists }">
								<tr>
									<td colspan="7">등록된 시험일정이 존재하지 않습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="dto" items="${myTestLists }">
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
			<c:if test="${pagination.totalRows gt 0 }">
	         <div class="row mb-2">
	            <div class="col-12">
	               <ul class="pagination justify-content-center">
	                  <li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
	                     <a class="page-link" href="allList?page=${pagination.pageNo - 1 }">이전</a>
	                  </li>
	                  <c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
	                     <li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
	                        <a class="page-link" href="allList?page=${num }">${num }</a>
	                     </li>
	                  </c:forEach>
	                  <li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
	                     <a class="page-link" href="allList?page=${pagination.pageNo + 1 }">다음</a>
	                  </li>
	               </ul>
	            </div>
	         </div>
	         </c:if>
		</div>
	<footer class="footer mt-auto py-3">
		<div class="row mt-5 mb-3 mx-2 border-top">
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