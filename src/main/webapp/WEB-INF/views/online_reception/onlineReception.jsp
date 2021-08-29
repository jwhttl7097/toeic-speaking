<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Toeic Speaking</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<%-- moment cdnjs 불러오기 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<%-- moment cdnjs 한국어설정하기 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${param.fail eq 'deny'}">
					<div class="row mt-3">
						<div class="col-12">
							<div class="alert alert-danger">
								<strong>서비스 거부</strong> [${param.job }] 동일 날짜에는 중복접수가 불가능 합니다.
							</div>
						</div>
					</div>
			</c:when>
		</c:choose>
		<%@ include file="../common/header.jsp"%>

		<div class="row">
			<div class="col-12">
				<h4 class="text-center">시험접수</h4>
			</div>
		</div>
		<div class="row mb-3 mx-1" id="subject-box">
			<button class="col-4 text-white btn p-2 text-center rounded-0 border border-1" type="button" id="Speaking-Test" style="background-color: #0F54A6;">
				<small>Speaking Test</small>
			</button>
			<button class="col-4 text-white btn p-2 text-center rounded-0 border border-1" type="button" id="WritingTest" style="background-color: #0F54A6;">
				<small>Writing Test</small>
			</button>
			<button class="col-4 text-white btn p-2 rounded-0 border border-1" type="button" id="SpeakingWritingTest" style="background-color: #0F54A6;">
				<small>Speaking and Writing Tests</small>
			</button>
		</div>
		<div class="row mb-2">
			<div class="col-12">
				<p class="text-left ml-2">현재 접수중인 시험 (응시할 과목을 선택하세요.)</p>
			</div>
			<div class="col-12">
				<div class="p-2">
					<table class="table text-center">
						<colgroup>
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<thead>
							<tr>
								<th>시험일</th>
								<th>접수마감일</th>
								<th>성적발표예정일</th>
								<th>시험접수</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty schedulesBySubject }">
									<tr>
										<td class="text-center" colspan="8">등록된 시험정보가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="schedule" items="${schedulesBySubject }">
										<tr>
											<td><fmt:formatDate value="${schedule.testDate }" pattern="yyyy.MM.dd (E)"/></td>
											<td><fmt:formatDate value="${schedule.deadLineDate }" pattern="yyyy.MM.dd (E) a h시"/></td>
											<td><fmt:formatDate value="${schedule.expectedDate }" pattern="yyyy.MM.dd (E) a h시"/></td>
										<c:choose>
											<c:when test="${schedule.testStatus eq 'N' }">
												<td>
													<button class="btn btn-outline-danger btn-sm" disabled>마감</button>
												</td>
											</c:when>
											<c:otherwise>
												<td>
													<fmt:formatDate value="${schedule.testDate }" pattern="yyyy.MM.dd" var="testDate"/>
													<a href="testReception?testDate=${testDate }" class="btn btn-primary btn-sm">접수하기</a> 
												</td>
											</c:otherwise>
										</c:choose>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-12">
				<p class="text-left ml-2">※ 패키지 접수를 잠정 중단합니다.</p>
			</div>
		</div>
		<div class="row my-5">
			<div class="col-12 text-center">
				<a href="https://www.toeicswt.co.kr/event/release_toeicSW.php">
					<img alt="Toeic speaking ad" src="../images/온라인접수창광고.PNG">
				</a>
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
	
<script type="text/javascript">
$(function() {
	$("#subject-box button").click(function() {
		var subject = $(this).text().trim();
		console.log(subject);
		var $tbody = $("table tbody").empty();
		
		$.ajax({
			type:"GET",
			url:"onlineReceptionAjax",
			data: {subject:subject},
			dataType: "json",
			success: function(schedules) {
// 				console.log(schedules);
				$.each(schedules, function(index, item) {
					var Tdate = moment(item.testDate);
					var Ddate = moment(new Date(item.deadLineDate));
					var Edate = moment(new Date(item.expectedDate));
					
					var $tr = $("<tr></tr>");
					var $td = $("<td></td>");
					var $a = $("<a></a>");
					
					$("<td></td>").text(Tdate.format('YYYY.MM.DD (ddd)')).appendTo($tr);
					$("<td></td>").text(Ddate.format('YYYY.MM.DD (ddd) A h시')).appendTo($tr);
					$("<td></td>").text(Edate.format('YYYY.MM.DD (ddd) A h시')).appendTo($tr);
					if(item.testStatus ==='N'){
						$("<button disabled></button>").addClass('btn btn-outline-danger btn-sm').text('마감').appendTo($td).appendTo($tr);
					} else {
						$td.append($a.addClass('btn btn-primary btn-sm').attr("href", "testReception?testDate="+Tdate.format('YYYY.MM.DD')).text('접수하기')).appendTo($tr);
					}
					$tbody.append($tr);
				})
			}
		})
	})
})
</script>
</body>
</html>