<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
  <head>
  	<title>TOEIC</title>
 	  	<meta charset="utf-8">
   		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" >
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="Resources/Admin/css/style.css">
		<%-- moment cdnjs 불러오기 --%>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
		<%-- moment cdnjs 한국어설정하기 --%>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
		
	<%-- 그래프 --%>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	   <script type="text/javascript">
	   
	   var d = new Date();
	   
	   var thisMonth = parseInt(d.getMonth()+1);
	   var lastMonth = parseInt(d.getMonth());
	   var TwoMonthsAgo = parseInt(d.getMonth()-1);
	   
		var oneN1 = '<c:out value="${oneN}"/>';
		var twoN1 = '<c:out value="${twoN}"/>';
		var threeN1 = '<c:out value="${threeN}"/>';
		 	  
		var oneY1 = '<c:out value="${oneY}"/>';
		var twoY1 = '<c:out value="${twoY}"/>';
		var threeY1 = '<c:out value="${threeY}"/>';
		
		var oneN = parseInt(oneN1);
		var twoN = parseInt(twoN1);
		var threeN = parseInt(threeN1);
		
		var oneY = parseInt(oneY1);
		var twoY = parseInt(twoY1);
		var threeY = parseInt(threeY1);
		
		
	      google.charts.load("current", {packages:["corechart"]});
	      google.charts.setOnLoadCallback(drawChart);
	      
	      function drawChart() {
	    	  
	    	  var spCount = '<c:out value="${spNo}"/>';
		      var wrCount = '<c:out value="${wrNo}"/>';
		      var spwrCount = '<c:out value="${spwrNo}"/>';
		      var spNo = parseInt(spCount);
		      var wrNo = parseInt(wrCount);
		      var spwrNo = parseInt(spwrCount);
		        
	        var data = google.visualization.arrayToDataTable([
	        	
	        	
	          ['Task', 'Hours per Day'],
	          ['TOEIC® Speaking Test',    				 spNo],
	          ['TOEIC® Writing Test',     				 wrNo],
	          ['TOEIC® Speaking and Writing Test',       spwrNo],
	        ]);
	
	        var options = {
	          title: '과목별 신청 현황',
	          width: 380,
	          height: 280,
	          chartArea: {
	              width: 380,
	              height: 280
              },
	          pieHole: 0.4,
	          backgroundColor: "fafafa"
	        };
	
	        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
	        chart.draw(data, options);
	      }
	      
	      google.charts.setOnLoadCallback(columnChart1);
	      function columnChart1() {

	    	  var arr = [

	    		  ['월', '시험자', '비시험자'],

	    		  [TwoMonthsAgo+'월', oneY, oneN],

	    		  [lastMonth+'월', twoY, twoN],

	    		  [thisMonth+'월', threeY, threeN]
	    		  
	    		  ];
	    	  
	    	  var dataTable = google.visualization.arrayToDataTable(arr);
	    	  
	    	  var options = {
	    			  width: 660,
	    	          height: 280,
	    	          chartArea: {
	    	              width: 450,
	    	              height: 200
	                  },
	    	          backgroundColor: "fafafa",

	    			  title: '최근 3개월 신규가입자의 시험자/비시험자 분포 '
	    			  };
	    	  
	    	  var objDiv = document.getElementById('column_chart_div1');
	    	  
	    	  var chart = new google.visualization.ColumnChart(objDiv);
	    	  
	    	  chart.draw(dataTable, options);
	    	  
	      }
	      
	      $(document).ready(function(){

	    	  $('button').on('click', function(){

	    	  columnChart1();

	    	  });

	    	  });


	      
	      
	    </script>	
  </head>
  <body>
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
    	
        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5 pt-5 mb-4	">
        	<h1 class="mb-4"><strong>관리자 페이지</strong> <img alt="putLogo" src="images/image.png" style="float:right; width: 200; height: 30px;"></h1>
	        <p>관리자 페이지에 오신것을 환영합니다.<br />
	        해당 페이지에서는 시험일정관리, 시험센터관리, 수험자관리 기능을 사용하실수 있습니다. <br/>
	        종료를 원하시면 "메인페이지로 돌아가기"를 클릭해주세요.
	        </p>
        <div>
			<table class='responsive'>
			  <tr>
			    <td width="40%"><div id="donutchart"></div></td>
			    <td width="5%"></td>
			    <td width="55%"><div id="column_chart_div1"></div></td>
			  </tr>
			</table>
      </div>
		</div>
	</div>
	<script src="Resources/Admin/js/jquery.min.js"></script>
	<script src="Resources/Admin/js/popper.js"></script>
	<script src="Resources/Admin/js/bootstrap.min.js"></script>
	<script src="Resources/Admin/js/main.js"></script>
  </body>
</html>