<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
	<div class="row my-4">
		<div class="col-12">
			<h2 class="text-center"><strong>시험일정</strong></h2>
		</div>
	</div>
	<div class="row justify-content-center" role="group">
			<button class="col-4 btn btn-primary p-2 text-center rounded-0 border border-1" type="button" id="speaking" onclick="displaySpeaking('${names[0]}')">
				<small>TOEIC® Speaking Test</small>
			</button>
			<button class="col-4 btn btn-primary p-2 text-center rounded-0 border border-1" type="button" id="writing" onclick="displayWriting('${names[1]}')">
				<small>TOEIC® Writing Test</small>
			</button>
			<button class="col-4 btn btn-primary p-2 rounded-0 border border-1" type="button" id="speakingwriting" onclick="displaySpeakingWriting('${names[2]}')">
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
<div class="container2">
	<div class="row border-top my-4">
		<div class="col-8">
			<div class="row">
				<div class="col-12">
					<div class="p-3">
						<div class="d-flex flex-row bd-highlight mb-3">
						  <small class="p-2"><a href="" style="text-decoration:none">회사소개</a></small>
						  <small class="p-2">이용약관</small>
						  <small class="p-2">개인정보처리방침</small>
						  <small class="p-2">콘텐츠창작지원</small>
						  <small class="p-2">비즈니스제휴제안</small>
						  <small class="p-2">고객센터</small>
						</div>
					</div>
					<small>㈜와이비엠넷 경기도 성남시 분당구 대왕판교로 670 유스페이스2 A동 8/9층 대표이사 오재환</small><br />
					<small>사업자등록번호 220-81-89608 / 통신판매업신고 경기성남-0034 사업자정보확인</small><br />
					<small>시험 02.2279.0505 / 결제 02.2008.5200 / Fax 0502-320-5201 개인정보 privacy@ybm.co.kr</small><br />
					<small>Copyright © (주)와이비엠넷. All rights reserved.</small><br />
				</div>
			</div>
		</div>
		<div class="col-4">
		
		</div>
	</div>
</div>
</div>

<script type="text/javascript">
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
					}else{
						rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Tdate.format('YYYY.MM.DD') + "(" +"<label class='text-danger'>" + Tdate.format('ddd') + "</label>" + ")" +"</small></td>"
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
					}else{
						rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Tdate.format('YYYY.MM.DD') + "(" +"<label class='text-danger'>" + Tdate.format('ddd') + "</label>" + ")" +"</small></td>"
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
				}else{
					rows += "<td scope='col' class='text-center align-middle p-3'><small>"+ Tdate.format('YYYY.MM.DD') + "(" +"<label class='text-danger'>" + Tdate.format('ddd') + "</label>" + ")" +"</small></td>"
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