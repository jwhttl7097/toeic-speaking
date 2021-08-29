<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
     <title>Toeic Speaking</title>
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<%@ include file="../common/header.jsp" %>
   <div class="row">
      <div  class="col-11">
         <h3 class="fw-bolder text-center mt-3">소개</h3>
      </div>
   </div>   
      <div class="row pl-5">
         <div class="col-10 mx-3 pl-5">
            <p class="text-left fs-5 border-bottom">개발배경</p>
            <p class="small mb-3">
               1979년 미국 ETS(Educational Testing Service)가 개발한 TOEIC은 듣기와 읽기 능력을 평가했고, 
               이를 통해 말하기와 쓰기 능력을 간접적으로 측정했습니다. 점차 직장 및 일상생활에서 영어 사용 범위가 확대되면서 말하기 능력과 쓰기 능력을 직접 평가할 필요성이 커졌습니다. 
               ETS에서는 국제적 의사소통 환경에 사용되는 영어에 대한 많은 조사와 검증 작업을 토대로 
               영어 말하기와 쓰기 능력을 평가하는 TOEIC Speaking and Writing Tests(TOEIC 말하기 쓰기 시험)를 개발하였으며, 
               2006년 12월 국내에 도입하였습니다.
            </p>
            <p class="small text-primary mb-5">
               TOEIC Speaking and Writing Tests의 도입으로 TOEIC 시험은 4개의 영어 능력(듣기, 읽기, 말하기,쓰기)을 모두 측정하는 것이 가능하게 되었습니다. 
               이로 인해 기업의 인사담당자에게는 보다 나은 의사결정을 하는 데 도움이 되는 정보를, 영어 학습자에게는 종합적인 영어 의사소통 능력을 높이는 기회를 제공하게 되었습니다.
            </p>
            <div class="text-center">
               <img alt="introduction1" src="images/소개1.jpg" width="850" height="400"/>
            </div>   
         </div>
      </div>
      <div class="row pl-5">
         <div class="col-10 mx-3 pl-5">
            <p class="text-left fs-5 border-bottom my-4">개발기관</p>
               <p class="small mb-3">
                  1947년 설립된 ETS(Educational Testing Service)는 교육평가 및 연구기관으로 TOEIC, TOEIC Speaking and Writing Tests, 
                  TOEIC Bridge, TOEFL, GRE, SAT 등을 개발하였으며 매년 전세계 180여 개 국가 약 5,000만 여명이 ETS의 시험에 응시하고 있습니다. 
                  ETS에는 3,000명 이상의 직원들이 근무하고 있으며 이들 중 1,100여명은 교육학, 심리학, 통계학, 심리측정학, 컴퓨터공학, 사회학, 인문학 등을 전공한 전문인력으로 구성되어 있습니다. 
                  ETS는 전 세계의 개인과 교육자, 정부기관 모두를 위해 학습을 증진할 수 있는 교육평가와 연구를 수행합니다.
               </p>
            <div class="text-center">
               <img alt="introduction1" src="images/소개2.jpg" width="850" height="400"/>
            </div>   
         </div>
      </div>   
      <div class="row">
         <div class="col-12">
            <p class="my-4">TOEIC Speaking Test 시험구성</p>
            <table class="table table-bordered text-center text-small">
               <colgroup>
                     <col width="15%">
                     <col width="35%">
                     <col width="10%">
                     <col width="15%">
                     <col width="10%">
                     <col width="20%">
               </colgroup>
               <thead>
                  <tr>
                     <th>구분</th>
                     <th>문제 유형</th>
                     <th>문항수</th>
                     <th>답변 준비 시간</th>
                     <th>답변시간</th>
                     <th>평가기준</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td class="small">Questions 1-2</td>
                     <td class="small">Read a text aloud- 문장 읽기</td>
                     <td class="small">2</td>
                     <td class="small">각 45초</td>
                     <td class="small">각 45초</td>
                     <td class="small">발음,억양과 강세</td>
                  </tr>
                  <tr>
                     <td class="small">Questions 3</td>
                     <td class="small">Describe a picture- 사진 묘사</td>
                     <td class="small">1</td>
                     <td class="small">45초</td>
                     <td class="small">45초</td>
                     <td class="small">문법,어휘,일관성</td>
                  </tr>
                  <tr>
                     <td class="small">Questions 4-6</td>
                     <td class="small">Respond to questions- 듣고,질문에 답하기</td>
                     <td class="small">3</td>
                     <td class="small">문항당 3초</td>
                     <td class="small">15~30초</td>
                     <td class="small">내용의 일관성,내용의 완성도</td>
                  </tr>
                  <tr>
                     <td class="small">Questions 7-9</td>
                     <td class="small">Respond to questions using information provided</td>
                     <td class="small">3</td>
                     <td class="small">문항당 3초</td>
                     <td class="small">15초~30초</td>
                     <td rowspan="3">위 모든 항목</td>
                  </tr>
                  <tr>
                     <td class="small">Questions 10</td>
                     <td class="small">Propose a solution- 해결책 제안하기</td>
                     <td class="small">1</td>
                     <td class="small">45초</td>
                     <td class="small">60초</td>
                  </tr>
                  <tr>
                     <td class="small">Questions 11</td>
                     <td class="small">Express an opinion- 의견 제시하기</td>
                     <td class="small">1</td>
                     <td class="small">30초</td>
                     <td class="small">60초</td>
                  </tr>
               </tbody>
            </table>
         </div>   
      </div>
      <div class="row">
         <div class="col-12">
            <p class="my-4 fw-bold">TOEIC Writing Test 시험구성</p>
            <table class="table table-bordered text-center">
               <colgroup>
                     <col width="15%">
                     <col width="45%">
                     <col width="10%">
                     <col width="10%">
                     <col width="20%">
               </colgroup>
               <thead>
                  <tr>
                     <th>구분</th>
                     <th>문제 유형</th>
                     <th>문항수</th>
                     <th>답변시간</th>
                     <th>평가기준</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td class="small">Questions 1-5</td>
                     <td class="small">Write a sentence based on a picture- 사진에 근거한 문장 만들기</td>
                     <td class="small">5</td>
                     <td class="small">총 8분</td>
                     <td class="small">문법,문장과 사진의 관련성</td>
                  </tr>
                  <tr>
                     <td class="small">Questions 6-7</td>
                     <td class="small">Respond to a written request- E-mail 답변 작성하기</td>
                     <td class="small">2</td>
                     <td class="small">10분</td>
                     <td class="small">문장 수준과 다양성,어휘,전체 구성</td>
                  </tr>
                  <tr>
                     <td class="small">Questions 8</td>
                     <td class="small">Write an opinion essay- 의견 기술하기</td>
                     <td class="small">1</td>
                     <td class="small">30분</td>
                     <td class="small">문법,어휘,전체구성</td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
<footer class="footer py-3">
      <div class="row px-5 mt-5">
         <div class="col-12">
              <table class="table">
                 <thead>
                    <tr>
                     <th class="fw-bold fs-5 text-left">시행방법</th>
                  </tr>
                 </thead>
                 <tbody>
                    <tr>
                       <td>
                         <ul>
                            <li>TOEIC Speaking Test는 ETS 인증 센터에서 지필 방식인 아닌 컴퓨터 상에서 음성 녹음(TOEIC Writing Test는 자판으로 입력)하는 Computer-based test(CBT)방식입니다.</li>
                            <li>CBT방식으로 공정하고 표준화된 방법으로 시험이 진행되며, 수험자의 답변은 모두 파일로 저장됩니다.</li>
                            <li>미국, 캐나다 등 북미 지역에 거주하는 원어민들로 구성된 ETS 전문 채점관(Rater)들이 수험자의 답변을 듣고 채점하며, 성적 결과는 시험 후 5일 이내에 제공됩니다.</li>
                         </ul>
                       </td>
                    </tr>
                 </tbody>
              </table>
           </div>
      </div>
      <div class="row mt-5 mb-3 border-top">
         <div class="col-8 px-5 border-end">
            <p class="fs-6 my-4"> 회사소개 | 이용약관 | 개인정보처리방침 | 콘텐츠창작지원 | 비즈니스제휴제안 | 고객센터</p>
            <p class="small">㈜와이비엠넷 경기도 성남시 분당구 대왕판교로 670 유스페이스2 A동 8/9층 대표이사 오재환</p>
            <p class="small">사업자등록번호 220-81-89608 / 통신판매업신고 경기성남-0034 사업자정보확인</p>
            <p class="small">시험 02.2279.0505 / 결제 02.2008.5200 / Fax 0502-320-5201 개인정보 privacy@ybm.co.kr</p>
            <p class="small">Copyright © (주)와이비엠넷. All rights reserved.</p>
         </div>
         <div class="col-4 px-5 border-start">
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