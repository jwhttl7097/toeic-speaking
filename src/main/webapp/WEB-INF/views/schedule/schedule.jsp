<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>시험일정</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" >
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<%-- moment cdnjs 불러오기 --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<%-- moment cdnjs 한국어설정하기 --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
</head>
<body>

<div class="container">
<%@ include file="../common/header.jsp" %>
	<div class="row my-4">
		<div class="col-12">
			<h2 class="text-center"><strong>시험일정</strong></h2>
		</div>
	</div>
	<div class="row justify-content-center" role="group">
				<button class="col-4 text-white btn p-2 text-center rounded-0 border border-1" type="button" id="speaking" onclick="displaySpeaking('${names[0]}')" style="background-color: #0F54A6;">
					<small>TOEIC® Speaking Test</small>
				</button>
			<button class="col-4 text-white btn p-2 text-center rounded-0 border border-1" type="button" id="writing" onclick="displayWriting('${names[1]}')" style="background-color: #0F54A6;">
				<small>TOEIC® Writing Test</small>
			</button>
			<button class="col-4 text-white btn p-2 rounded-0 border border-1" type="button" id="speakingwriting" onclick="displaySpeakingWriting('${names[2]}')" style="background-color: #0F54A6;">
				<small>TOEIC® Speaking and Writing Tests</small>
			</button>
	<table class="table align-middle my-5" id="schedules-table">
		<colgroup>
			<col width="20%">
			<col width="20%">
			<col width="50%">
			<col width="10%">
		</colgroup>
	  <thead class="table-light">
	    <tr>
	      <th scope="col" class="text-center"><small>시험일시</small></th>
	      <th scope="col" class="text-center"><small>성적발표일</small></th>
	      <th scope="col" class="text-center"><small>온라인 접수기간</small></th>
	      <th></th>
	    </tr>
	  </thead>
	  <tbody>
	  </tbody>
	</table>
	</div>
	<small class="mb-5">ㆍ상기 일정은 주관사 사정에 따라 변경될 수 있습니다.</small>
	<div class="p-5"></div>
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





	function onLoadEvent(){
		speaking.click();
	}
	window.onload = onLoadEvent
	
	function displaySpeaking(testName){
		
		var tbodyEl = document.querySelector("#schedules-table tbody");
		tbodyEl.innerHTML = "";
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			
			if(xhr.readyState == 4 && xhr.status == 200){
				var JsonTextDate = xhr.responseText;
				
				var datas = JSON.parse(JsonTextDate);
				var rows = "";
				
				if(datas.length == 0){
					rows += "<tr>"
					rows += "<td colspan='4' class='text-center'>현재 등록된 시험이 없습니다.</td>"
					rows += "</tr>"
				}
				
				for(var i=0; i<datas.length; i++){
					var data = datas[i]
					
					var Tdate = moment(new Date(data.testDate));
					var Edate = moment(new Date(data.expectedDate));
					var Rdate = moment(new Date(data.receiptDate));
					var Ddate = moment(new Date(data.deadLineDate));
					
					rows += "<tr>";
					
					if(Tdate.format('ddd') == '토'){
						rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Tdate.format('YYYY.MM.DD') + "(" +"<label class='text-primary'>" + Tdate.format('ddd') + "</label>" + ")" +"</small></td>"
					}else if(Tdate.format('ddd') == '일'){
						rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Tdate.format('YYYY.MM.DD') + "(" +"<label class='text-danger'>" + Tdate.format('ddd') + "</label>" + ")" +"</small></td>"
					}else{
						rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Tdate.format('YYYY.MM.DD') + "(" +"<label>" + Tdate.format('ddd') + "</label>" + ")" +"</small></td>"
					}
					rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Edate.format('YYYY.MM.DD (ddd) 낮 hh시') +"</small></td>"
					rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Rdate.format('YYYY.MM.DD (ddd) A hh시~') + Ddate.format('YYYY.MM.DD (ddd) A hh시') + "</small></td>"
					
					if(new Date(data.deadLineDate) > new Date() && data.registerCount == data.quota){
					rows += "<td><button class='btn btn-danger' disabled>마감</button></td>"
					}
					if(new Date(data.deadLineDate) > new Date() && data.registerCount < data.quota){
					rows += "<td><button class='btn btn-primary'>접수하기</button></td>"
					}else{
						rows += "<td></td>"
					}
					rows += "</tr>";
				}
				tbodyEl.innerHTML = rows;
			}
		}
		xhr.open("GET", "test?name=" + testName);
		xhr.send();
		
		}
	
function displayWriting(testName){
		
		var tbodyEl = document.querySelector("#schedules-table tbody");
		tbodyEl.innerHTML = "";
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			
			if(xhr.readyState == 4 && xhr.status == 200){
				var JsonTextDate = xhr.responseText;
				
				var datas = JSON.parse(JsonTextDate);
				var rows = "";
				
				if(datas.length == 0){
					rows += "<tr>"
					rows += "<td colspan='4' class='text-center'>현재 등록된 시험이 없습니다.</td>"
					rows += "</tr>"
				}
				
				for(var i=0; i<datas.length; i++){
					var data = datas[i]
					
					var Tdate = moment(new Date(data.testDate));
					var Edate = moment(new Date(data.expectedDate));
					var Rdate = moment(new Date(data.receiptDate));
					var Ddate = moment(new Date(data.deadLineDate));
					
					rows += "<tr>";
					
					if(Tdate.format('ddd') == '토'){
						rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Tdate.format('YYYY.MM.DD') + "(" +"<label class='text-primary'>" + Tdate.format('ddd') + "</label>" + ")" +"</small></td>"
					}else if(Tdate.format('ddd') == '일'){
						rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Tdate.format('YYYY.MM.DD') + "(" +"<label class='text-danger'>" + Tdate.format('ddd') + "</label>" + ")" +"</small></td>"
					}else{
						rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Tdate.format('YYYY.MM.DD') + "(" +"<label>" + Tdate.format('ddd') + "</label>" + ")" +"</small></td>"
					}
					rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Edate.format('YYYY.MM.DD (ddd) 낮 hh시') +"</small></td>"
					rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Rdate.format('YYYY.MM.DD (ddd) A hh시~') + Ddate.format('YYYY.MM.DD (ddd) A hh시') + "</small></td>"
					
					if(new Date(data.deadLineDate) > new Date() && data.registerCount == data.quota){
					rows += "<td><button class='btn btn-danger' disabled>마감</button></td>"
					}
					if(new Date(data.deadLineDate) > new Date() && data.registerCount < data.quota){
					rows += "<td><button class='btn btn-primary'>접수하기</button></td>"
					}else{
						rows += "<td></td>"
					}
					rows += "</tr>";
				}
				tbodyEl.innerHTML = rows;
			}
		}
		xhr.open("GET", "test?name=" + testName);
		xhr.send();
		
		}
		
function displaySpeakingWriting(testName){
	
	var tbodyEl = document.querySelector("#schedules-table tbody");
	tbodyEl.innerHTML = "";
	
	var xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		
		if(xhr.readyState == 4 && xhr.status == 200){
			var JsonTextDate = xhr.responseText;
			
			var datas = JSON.parse(JsonTextDate);
			var rows = "";
			
			if(datas.length == 0){
				rows += "<tr>"
				rows += "<td colspan='4' class='text-center'>현재 등록된 시험이 없습니다.</td>"
				rows += "</tr>"
			}
			
			for(var i=0; i<datas.length; i++){
				var data = datas[i]
				
				var Tdate = moment(new Date(data.testDate));
				var Edate = moment(new Date(data.expectedDate));
				var Rdate = moment(new Date(data.receiptDate));
				var Ddate = moment(new Date(data.deadLineDate));
				
				rows += "<tr>";
				
				if(Tdate.format('ddd') == '토'){
					rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Tdate.format('YYYY.MM.DD') + "(" +"<label class='text-primary'>" + Tdate.format('ddd') + "</label>" + ")" +"</small></td>"
				}else if(Tdate.format('ddd') == '일'){
					rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Tdate.format('YYYY.MM.DD') + "(" +"<label class='text-danger'>" + Tdate.format('ddd') + "</label>" + ")" +"</small></td>"
				}else{
					rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Tdate.format('YYYY.MM.DD') + "(" +"<label>" + Tdate.format('ddd') + "</label>" + ")" +"</small></td>"
				}
				rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Edate.format('YYYY.MM.DD (ddd) 낮 hh시') +"</small></td>"
				rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Rdate.format('YYYY.MM.DD (ddd) A hh시~') + Ddate.format('YYYY.MM.DD (ddd) A hh시') + "</small></td>"
				
				if(new Date(data.deadLineDate) > new Date() && data.registerCount == data.quota){
				rows += "<td><button class='btn btn-danger' disabled>마감</button></td>"
				}
				if(new Date(data.deadLineDate) > new Date() && data.registerCount < data.quota){
				rows += "<td><button class='btn btn-primary'>접수하기</button></td>"
				}else{
					rows += "<td></td>"
				}
				rows += "</tr>";
			}
			tbodyEl.innerHTML = rows;
		}
	}
	xhr.open("GET", "test?name=" + testName);
	xhr.send();
	
	}
 
</script>
</body>
</html>