<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" >
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<title>Toeic Speaking</title>

	<style type="text/css">
		.carousel {
			width: 100%;
			height: 225px;
		}
		
		.card-hover:hover{
			box-shadow : 0 .5rem 1rem rgba(0,0,0,.15)!important; 
		}
		
	</style>
</head>
<body>
<div class="container">
	<%@ include file="common/header.jsp" %>
	<main>
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
		<!-- 광고캐러셀 -->
		<div class="row my-3">
			<div class="col-12 mb-3">
				<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active" data-bs-interval="2500">
							<a href="https://www.toeicswt.co.kr/news/noticeView.php?noticeCode=9401"><img src="images/adMainImages/mainAd1.jpg" class="d-block w-100" alt="..."></a>
						</div>
						<div class="carousel-item" data-bs-interval="2500">
							<a href="https://www.toeicswt.co.kr/common/template/viewContents.php?contentsCode=84"><img src="images/adMainImages/mainAd2.jpg" class="d-block w-100" alt="..."></a>
						</div>
						<div class="carousel-item" data-bs-interval="2500">
							<a href="https://www.toeicswt.co.kr/event/release_toeicSW.php"><img src="images/adMainImages/mainAd3.jpg" class="d-block w-100" alt="..."></a>
						</div>
						<div class="carousel-item" data-bs-interval="2500">
							<a href="https://www.toeicswt.co.kr/event/app/01.php"><img src="images/adMainImages/mainAd4.jpg" class="d-block w-100" alt="..."></a>
						</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
		<!-- 광고캐러셀 -->
		<!-- 시험일정 페이징 -->
		<div class="row">	
			<div class="col-12 mt-5">
				<table class="table table-borderless text-center" style="background-color: #F2F2F2">
					<tr>
						<td>
							<div class="card-group justify-content-center">
								<!-- 카드 -->
									<c:forEach var="cardSchedule" items="${cardSchedule }">
									<a href="online_reception/onlineReception">
										<button class="btn">
											<div class="card card-hover">
												<div class="card-body">
													<c:choose>
														<c:when test="${cardSchedule.testStatus eq 'Y' }">
															<h5><span class="badge bg-primary">접수중</span></h5>
														</c:when>
														<c:otherwise>
															<h5><span class="badge bg-danger">마감</span></h5>
														</c:otherwise>
													</c:choose>
													<h5 class="card-title"><fmt:formatDate value="${cardSchedule.testDate }" pattern="yyyy.MM.dd (E)"/></h5>
													<p class="card-text">접수마감 : <fmt:formatDate value="${cardSchedule.deadLineDate }" pattern="yyyy.MM.dd (E)"/></p>
													<p class="card-text">성적발표 : <fmt:formatDate value="${cardSchedule.announcementDate }" pattern="yyyy.MM.dd (E)"/></p>
												</div>
											</div>
										</button>
									</a>
								</c:forEach>
								<!-- 카드 -->
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<c:if test="${pagination.totalRows gt 0 }">
					         <div class="row">
					            <div class="col-12">
					               <ul class="pagination justify-content-center">
					                  <li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
					                     <a class="page-link" href="main?pageNo=${pagination.pageNo - 1 }">
					                      이전
					                     </a>
					                  </li>
					                  <li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
					                     <a class="page-link" href="main?pageNo=${pagination.pageNo + 1 }">
											다음
					                     </a>
					                  </li>
					               </ul>
					            </div>
					         </div>
					         </c:if>
						</th>
					</tr>
				</table>
			</div>
		</div>
		<div class="row text-center justify-content-center">
			<div class="col-4">
				<a href="https://www.toeicswt.co.kr/content/common/copyright_law.php">
					<img alt="..." src="images/cop.png" class="shadow rounded" width="400" height="125">
				</a>
			</div>
			<div class="col-4">
				<a href="https://www.toeicstory.co.kr/">
					<img alt="..." src="images/toeicstory.png" class="shadow rounded" width="400" height="125">
				</a>
			</div>
		</div>
	<!-- 시험일정 페이징 -->
	<div class="row mt-5" style="background-color: #F2F2F2">
		<div class="col-6 mt-5">
			<table class="table table-borderless">
				<tr>
					<td>
					<h5>
					<a href="https://www.toeicswt.co.kr/customer/csFaq.php" class="text-body" style="text-decoration:none; font-weight:700;">
						고객센터 &gt;
					</a>
					</h5>
					</td>
				</tr>
				<tr>
					<td>시험문의 02-2279-0505 시험문의 02-2008-5200</td>
				</tr>
				<tr>
					<td>기업 및 기관 단체시험 : 02-2280-7254 / 전국 대학 단체시험 : 02-2280-7225</td>
				</tr>
				<tr>
					<td>
						공인시험인증센터 신청 문의 : 02-2280-7256
					</td>
				</tr>
			</table>
		</div>
		<div class="col-6 mt-5">
			<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active" data-bs-interval="2500">
							<a href="https://www.toeicswt.co.kr/news/noticeView.php?noticeCode=9401"><img src="images/adMainImages/mainAd1.jpg" class="d-block w-100" alt="..."></a>
						</div>
						<div class="carousel-item" data-bs-interval="2500">
							<a href="https://www.toeicswt.co.kr/common/template/viewContents.php?contentsCode=84"><img src="images/adMainImages/mainAd2.jpg" class="d-block w-100" alt="..."></a>
						</div>
						<div class="carousel-item" data-bs-interval="2500">
							<a href="https://www.toeicswt.co.kr/event/release_toeicSW.php"><img src="images/adMainImages/mainAd3.jpg" class="d-block w-100" alt="..."></a>
						</div>
						<div class="carousel-item" data-bs-interval="2500">
							<a href="https://www.toeicswt.co.kr/event/app/01.php"><img src="images/adMainImages/mainAd4.jpg" class="d-block w-100" alt="..."></a>
						</div>
					</div>
				</div>
		</div>
	</div>
	</main>
	<footer class="footer">
      <div class="row mt-5 mb-3 border-top">
		<div class="col-7 px-5 border-end">
			<p class="fs-6 my-4"> 회사소개 | 이용약관 | 개인정보처리방침 | 콘텐츠창작지원 | 비즈니스제휴제안 | 고객센터</p>
			<p class="small">㈜와이비엠넷 경기도 성남시 분당구 대왕판교로 670 유스페이스2 A동 8/9층 대표이사 오재환</p>
			<p class="small">사업자등록번호 220-81-89608 / 통신판매업신고 경기성남-0034 사업자정보확인</p>
			<p class="small">시험 02.2279.0505 / 결제 02.2008.5200 / Fax 0502-320-5201 개인정보 privacy@ybm.co.kr</p>
			<p class="small">Copyright © (주)와이비엠넷. All rights reserved.</p>
		</div>
		<div class="col-5 px-5 border-start">
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