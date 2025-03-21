<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%
   String ctxPath = request.getContextPath();
    //     /myspring
%>


<%-- === 사내 캘린더 추가 Modal === --%>
<div class="modal fade" id="modal_addComCal" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <!-- Modal header -->
      <div class="modal-header">
        <h4 class="modal-title">사내 캘린더 추가</h4>
        <button type="button" class="close modal_close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
       	<form name="modal_frm">
       	<table style="width: 100%;" class="table table-bordered">
     			<tr>
     				<td style="text-align: left; ">소분류명</td>
     				<td><input type="text" class="add_com_smcatgoname"/></td>
     			</tr>
     			<tr>
     				<td style="text-align: left;">만든이</td>
     				<td style="text-align: left; padding-left: 5px;">${sessionScope.loginuser.name}</td>
     			</tr>
     		</table>
       	</form>	
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" id="addCom" class="btn btn-success btn-sm" onclick="goAddComCal()">추가</button>
          <button type="button" class="btn btn-danger btn-sm modal_close" data-dismiss="modal">취소</button>
      </div>
      
    </div>
  </div>
</div>

<%-- === 사내 캘린더 수정 Modal === --%>
<div class="modal fade" id="modal_editComCal" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <!-- Modal header -->
      <div class="modal-header">
        <h4 class="modal-title">사내 캘린더 수정</h4>
        <button type="button" class="close modal_close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
       	<form name="modal_frm">
       	<table style="width: 100%;" class="table table-bordered">
     			<tr>
     				<td style="text-align: left; ">소분류명</td>
     				<td><input type="text" class="edit_com_smcatgoname"/><input type="hidden" value="" class="edit_com_smcatgono"></td>
     			</tr>
     			<tr>
     				<td style="text-align: left;">만든이</td>
     				<td style="text-align: left; padding-left: 5px;">${sessionScope.loginuser.name}</td>
     			</tr>
     		</table>
       	</form>	
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" id="addCom" class="btn btn-success btn-sm" onclick="goEditComCal()">수정</button>
          <button type="button" class="btn btn-danger btn-sm modal_close" data-dismiss="modal">취소</button>
      </div>
      
    </div>
  </div>
</div>

<%-- === 내 캘린더 추가 Modal === --%>
<div class="modal fade" id="modal_addMyCal" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      
      <!-- Modal header -->
      <div class="modal-header">
        <h4 class="modal-title">내 캘린더 추가</h4>
        <button type="button" class="close modal_close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
          <form name="modal_frm">
       	<table style="width: 100%;" class="table table-bordered">
     			<tr>
     				<td style="text-align: left; ">소분류명</td>
     				<td><input type="text" class="add_my_smcatgoname" /></td>
     			</tr>
     			<tr>
     				<td style="text-align: left;">만든이</td>
     				<td style="text-align: left; padding-left: 5px;">${sessionScope.loginuser.name}</td> 
     			</tr>
     		</table>
     		</form>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" id="addMy" class="btn btn-success btn-sm" onclick="goAddMyCal()">추가</button>
          <button type="button" class="btn btn-danger btn-sm modal_close" data-dismiss="modal">취소</button>
      </div>
      
    </div>
  </div>
</div>

<%-- === 내 캘린더 수정 Modal === --%>
<div class="modal fade" id="modal_editMyCal" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <!-- Modal header -->
      <div class="modal-header">
        <h4 class="modal-title">내 캘린더 수정</h4>
        <button type="button" class="close modal_close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
      	<form name="modal_frm">
       	<table style="width: 100%;" class="table table-bordered">
     			<tr>
     				<td style="text-align: left; ">소분류명</td>
     				<td><input type="text" class="edit_my_smcatgoname"/><input type="hidden" value="" class="edit_my_smcatgono"></td>
     			</tr>
     			<tr>
     				<td style="text-align: left;">만든이</td>
     				<td style="text-align: left; padding-left: 5px;">${sessionScope.loginuser.name}</td>
     			</tr>
     		</table>
       	</form>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" id="addCom" class="btn btn-success btn-sm" onclick="goEditMyCal()">수정</button>
          <button type="button" class="btn btn-danger btn-sm modal_close" data-dismiss="modal">취소</button>
      </div>
      
    </div>
  </div>
</div>


<jsp:include page="../../header/header.jsp" />
<%-- 각자 페이지에 해당되는 css 연결 --%>
<link href="<%=ctxPath%>/css/email/email_main.css" rel="stylesheet">

<%-- 각자 페이지에 해당되는 js 연결 --%>

<script type="text/javascript">

$(document).ready(function(){
	
	$('.searchOn').click(e=>{
		$('#searchPart').toggle();
	})
	
	// === 사내 캘린더에 사내캘린더 소분류 보여주기 ===
	showCompanyCal();

	// === 내 캘린더에 내캘린더 소분류 보여주기 ===
	showmyCal();
	
	// === 사내캘린더 체크박스 전체 선택/전체 해제 === //
	$("input:checkbox[id=allComCal]").click(function(){
		var bool = $(this).prop("checked");
		$("input:checkbox[name=com_smcatgono]").prop("checked", bool);
	});// end of $("input:checkbox[id=allComCal]").click(function(){})-------
	
	
	// === 내캘린더 체크박스 전체 선택/전체 해제 === //
	$("input:checkbox[id=allMyCal]").click(function(){		
		var bool = $(this).prop("checked");
		$("input:checkbox[name=my_smcatgono]").prop("checked", bool);
	});// end of $("input:checkbox[id=allMyCal]").click(function(){})-------
			
	
	// === 사내캘린더 에 속한 특정 체크박스를 클릭할 경우 === 
	$(document).on("click","input:checkbox[name=com_smcatgono]",function(){	
		var bool = $(this).prop("checked");
		
		if(bool){ // 체크박스에 클릭한 것이 체크된 것이라면 
			
			var flag=false;
			
			$("input:checkbox[name=com_smcatgono]").each(function(index, item){
				var bChecked = $(item).prop("checked");
				
				if(!bChecked){     // 체크되지 않았다면 
					flag=true;     // flag 를 true 로 변경
					return false;  // 반복을 빠져 나옴.
				}
			}); // end of $("input:checkbox[name=com_smcatgono]").each(function(index, item){})---------

			if(!flag){ // 사내캘린더 에 속한 서브캘린더의 체크박스가 모두 체크가 되어진 경우라면 			
                $("input#allComCal").prop("checked",true); // 사내캘린더 체크박스에 체크를 한다.
			}
			
			var com_smcatgonoArr = document.querySelectorAll("input.com_smcatgono");
		    
			com_smcatgonoArr.forEach(function(item) {
		         item.addEventListener("change", function() {  // "change" 대신에 "click" 을 해도 무방함.
		         //	 console.log(item);
		        	 calendar.refetchEvents();  // 모든 소스의 이벤트를 다시 가져와 화면에 다시 표시합니다.
		         });
		    });// end of com_smcatgonoArr.forEach(function(item) {})---------------------

		}
		
		else {
			   $("input#allComCal").prop("checked",false);
		}
		
	});// end of $(document).on("click","input:checkbox[name=com_smcatgono]",function(){})--------
	
	
	// === 내캘린더 에 속한 특정 체크박스를 클릭할 경우 === 
	$(document).on("click","input:checkbox[name=my_smcatgono]",function(){	
		var bool = $(this).prop("checked");
		
		if(bool){ // 체크박스에 클릭한 것이 체크된 것이라면 
			
			var flag=false;
			
			$("input:checkbox[name=my_smcatgono]").each(function(index, item){
				var bChecked = $(item).prop("checked");
				
				if(!bChecked){    // 체크되지 않았다면 
					flag=true;    // flag 를 true 로 변경
					return false; // 반복을 빠져 나옴.
				}
			}); // end of $("input:checkbox[name=my_smcatgono]").each(function(index, item){})---------

			if(!flag){	// 내캘린더 에 속한 서브캘린더의 체크박스가 모두 체크가 되어진 경우라면 	
                $("input#allMyCal").prop("checked",true); // 내캘린더 체크박스에 체크를 한다.
			}
			
			var my_smcatgonoArr = document.querySelectorAll("input.my_smcatgono");
		      
			my_smcatgonoArr.forEach(function(item) {
				item.addEventListener("change", function() {   // "change" 대신에 "click" 을 해도 무방함.
				 // console.log(item); 
					calendar.refetchEvents();  // 모든 소스의 이벤트를 다시 가져와 화면에 다시 표시합니다.
		        });
		    });// end of my_smcatgonoArr.forEach(function(item) {})---------------------

		}
		
		else {
			   $("input#allMyCal").prop("checked",false);
		}
		
	});// end of $(document).on("click","input:checkbox[name=my_smcatgono]",function(){})--------
	

	// 검색할 때 필요한 datepicker
	// 모든 datepicker에 대한 공통 옵션 설정
    $.datepicker.setDefaults({
         dateFormat: 'yy-mm-dd'  // Input Display Format 변경
        ,showOtherMonths: true   // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true // 년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true        // 콤보박스에서 년 선택 가능
        ,changeMonth: true       // 콤보박스에서 월 선택 가능                
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트             
    });
	
    // input 을 datepicker로 선언
    $("input#fromDate").datepicker();                    
    $("input#toDate").datepicker();
    	    
    // From의 초기값을 한달전 날짜로 설정
    $('input#fromDate').datepicker('setDate', '-1M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
    
    // To의 초기값을 오늘 날짜로 설정
//  $('input#toDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)	
	
    // To의 초기값을 한달후 날짜로 설정
    $('input#toDate').datepicker('setDate', '+1M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)	
	
	// ==== 풀캘린더와 관련된 소스코드 시작(화면이 로드되면 캘린더 전체 화면 보이게 해줌) ==== //
	var calendarEl = document.getElementById('calendar');
        
    var calendar = new FullCalendar.Calendar(calendarEl, {
	 // === 구글캘린더를 이용하여 대한민국 공휴일 표시하기 시작 === //
     //	googleCalendarApiKey : "자신의 Google API KEY 입력",
        /*
            >> 자신의 Google API KEY 을 만드는 방법 <<
            1. 먼저 크롬 웹브라우저를 띄우고, 자신의 구글 계정으로 로그인 한다.
            2. https://console.developers.google.com 에 접속한다. 
            3. "API  API 및 서비스" 에서 "사용자 인증 정보" 를 클릭한다.
            4. ! 이 페이지를 보려면 프로젝트를 선택하세요 에서 "프로젝트 만들기" 를 클릭한다.
            5. 프로젝트 이름은 자동으로 나오는 값을 그대로 두고 그냥 "만들기" 버튼을 클릭한다. 
            6. 상단에 보여지는 사용자 인증 정보 옆의  "+ 사용자 인증 정보 만들기" 를 클릭하여 보여지는 API 키를 클릭한다.
                            그러면 API 키 생성되어진다.
            7. 생성된 API 키가  자신의 Google API KEY 이다.
            8. 애플리케이션에 대한 정보를 포함하여 OAuth 동의 화면을 구성해야 합니다. 에서 "동의 화면 구성" 버튼을 클릭한다.
            9. OAuth 동의 화면 --> User Type --> 외부를 선택하고 "만들기" 버튼을 클릭한다.
           10. 앱 정보 --> 앱 이름에는 "웹개발테스트"
                     --> 사용자 지원 이메일에는 자신의 구글계정 이메일 입력
                             하단부에 보이는 개발자 연락처 정보 --> 이메일 주소에는 자신의 구글계정 이메일 입력 
           11. "저장 후 계속" 버튼을 클릭한다. 
           12. 범위 --> "저장 후 계속" 버튼을 클릭한다.
           13. 테스트 사용자 --> "저장 후 계속" 버튼을 클릭한다.
           14. "API  API 및 서비스" 에서 "라이브러리" 를 클릭한다.
               Google Workspace --> Google Calendar API 를 클릭한다.
               "사용" 버튼을 클릭한다. 
        */
    	googleCalendarApiKey : "AIzaSyBxXWJ5o0cQIjS1JDeb5Xy1NrBmWnRl0Sw",
        eventSources :[ 
            {
            //  googleCalendarId : '대한민국의 휴일 캘린더 통합 캘린더 ID'
                googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com'
              , color: 'white'   // 옵션임! 옵션참고 사이트 https://fullcalendar.io/docs/event-source-object
              , textColor: 'red' // 옵션임! 옵션참고 사이트 https://fullcalendar.io/docs/event-source-object 
            } 
        ],
     // === 구글캘린더를 이용하여 대한민국 공휴일 표시하기 끝 === //

        initialView: 'dayGridMonth',
        locale: 'ko',
        selectable: true,
	    editable: false,
	    headerToolbar: {
	    	  left: 'dayGridMonth dayGridWeek dayGridDay',
	          center: 'prev,title,next,today',
	          right: 'listWeek'
	    },
	    dayMaxEventRows: true, // for all non-TimeGrid views
	    views: {
	      timeGrid: {
	        dayMaxEventRows: 3 // adjust to 6 only for timeGridWeek/timeGridDay
	      }
	    },
		
	    // ===================== DB 와 연동하는 법 시작 ===================== //
    	events:function(info, successCallback, failureCallback) {
	
	    	 $.ajax({
                 url: '<%= ctxPath%>/calendar/selectSchedule',
                 data:{"fk_employeeNo":$('input#fk_employeeNo').val()},
                 dataType: "json",
                 async: false ,
                 success:function(json) {
                	 /*
                	    json 의 값 예
                	    [{"enddate":"2021-11-26 18:00:00.0","fk_lgcatgono":"2","color":"#009900","scheduleno":"1","fk_smcatgono":"4","subject":"파이널 프로젝트 코딩","startdate":"2021-11-08 09:00:00.0","fk_employeeNo":"seoyh"},{"enddate":"2021-11-29 13:50:00.0","fk_lgcatgono":"1","color":"#990008","scheduleno":"2","fk_smcatgono":"7","subject":"팀원들 점심식사","joinuser":"leess,eomjh","startdate":"2021-11-29 12:50:00.0","fk_employeeNo":"seoyh"},{"enddate":"2021-12-02 20:00:00.0","fk_lgcatgono":"1","color":"#300bea","scheduleno":"3","fk_smcatgono":"11","subject":"팀원들 뒤풀이 여행","joinuser":"leess,eomjh","startdate":"2021-12-01 09:00:00.0","fk_employeeNo":"seoyh"}]
                	 */
                	 var events = [];
                     if(json.length > 0){
                         
                             $.each(json, function(index, item) {
                                    var startdate = moment(item.startdate).format('YYYY-MM-DD HH:mm');
                                    var enddate = moment(item.enddate).format('YYYY-MM-DD HH:mm');
                                    var subject = item.subject;
                              
                                   // 사내 캘린더로 등록된 일정을 풀캘린더 달력에 보여주기 
                                   // 일정등록시 사내 캘린더에서 선택한 소분류에 등록된 일정을 풀캘린더 달력 날짜에 나타내어지게 한다.
                                   if( $("input:checkbox[name=com_smcatgono]:checked").length <= $("input:checkbox[name=com_smcatgono]").length ){
	                                   
	                                   for(var i=0; i<$("input:checkbox[name=com_smcatgono]:checked").length; i++){
	                                	  
	                                		   if($("input:checkbox[name=com_smcatgono]:checked").eq(i).val() == item.fk_smcatgono){
	   			                               //  alert("캘린더 소분류 번호 : " + $("input:checkbox[name=com_smcatgono]:checked").eq(i).val());
	                                			   events.push({
	   			                                	            id: item.scheduleno,
	   			                                                title: item.subject,
	   			                                                start: startdate,
	   			                                                end: enddate,
	   			                                        	    url: "<%= ctxPath%>/calendar/detailSchedule?scheduleno="+item.scheduleno,
	   			                                                color: item.color,
	   			                                                cid: item.fk_smcatgono  // 사내캘린더 내의 서브캘린더 체크박스의 value값과 일치하도록 만들어야 한다. 그래야만 서브캘린더의 체크박스와 cid 값이 연결되어 체크시 풀캘린더에서 일정이 보여지고 체크해제시 풀캘린더에서 일정이 숨겨져 안보이게 된다. 
	   			                                   }); // end of events.push({})---------
	   		                                   }
	                                	   
	                                   }// end of for-------------------------------------
	                                 
                                   }// end of if-------------------------------------------
                                    
                                  
                                  // 내 캘린더로 등록된 일정을 풀캘린더 달력에 보여주기
                                  // 일정등록시 내 캘린더에서 선택한 소분류에 등록된 일정을 풀캘린더 달력 날짜에 나타내어지게 한다.
                                  if( $("input:checkbox[name=my_smcatgono]:checked").length <= $("input:checkbox[name=my_smcatgono]").length ){
	                                   
	                                   for(var i=0; i<$("input:checkbox[name=my_smcatgono]:checked").length; i++){
	                                	  
	                                		   if($("input:checkbox[name=my_smcatgono]:checked").eq(i).val() == item.fk_smcatgono && item.fk_employeeNo == "${sessionScope.loginuser.employeeNo}" ){
	   			                               //  alert("캘린더 소분류 번호 : " + $("input:checkbox[name=my_smcatgono]:checked").eq(i).val());
	                                			   events.push({
	   			                                	            id: item.scheduleno,
	   			                                                title: item.subject,
	   			                                                start: startdate,
	   			                                                end: enddate,
	   			                                        	    url: "<%= ctxPath%>/calendar/detailSchedule?scheduleno="+item.scheduleno,
	   			                                                color: item.color,
	   			                                                cid: item.fk_smcatgono  // 내캘린더 내의 서브캘린더 체크박스의 value값과 일치하도록 만들어야 한다. 그래야만 서브캘린더의 체크박스와 cid 값이 연결되어 체크시 풀캘린더에서 일정이 보여지고 체크해제시 풀캘린더에서 일정이 숨겨져 안보이게 된다. 
	   			                                   }); // end of events.push({})---------
	   	                                    }
	                                   }// end of for-------------------------------------
                                   
                                   }// end of if-------------------------------------------

                                 
                                  // 공유받은 캘린더(다른 사용자가 내캘린더로 만든 것을 공유받은 경우임)
                                  if (item.fk_lgcatgono==1 && item.fk_employeeNo != "${sessionScope.loginuser.employeeNo}" && (item.joinuser).indexOf("${sessionScope.loginuser.employeeNo}") != -1 ){  
                                        
  	                                   events.push({
  	                                	   			id: "0",  // "0" 인 이유는  배열 events 에 push 할때 id는 고유해야 하는데 위의 사내캘린더 및 내캘린더에서 push 할때 id값으로 item.scheduleno 을 사용하였다. item.scheduleno 값은 DB에서 1 부터 시작하는 시퀀스로 사용된 값이므로 0 값은 위의 사내캘린더나 내캘린더에서 사용되지 않으므로 여기서 고유한 값을 사용하기 위해 0 값을 준 것이다. 
  	                                                title: item.subject,
  	                                                start: startdate,
  	                                                end: enddate,
  	                                        	    url: "<%= ctxPath%>/calendar/detailSchedule?scheduleno="+item.scheduleno,
  	                                                color: item.color,
  	                                                cid: "0"  // "0" 인 이유는  공유받은캘린더 에서의 체크박스의 value 를 "0" 으로 주었기 때문이다.
  	                                   }); // end of events.push({})--------- 
  	                                   
  	                           		}// end of if------------------------- 
                                
                             }); // end of $.each(json, function(index, item) {})-----------------------
                         }                             
                         
                      // console.log(events);                       
                         successCallback(events);                               
                  },
				  error: function(request, status, error){
			            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			      }	
                                            
          }); // end of $.ajax()--------------------------------
        
        }, // end of events:function(info, successCallback, failureCallback) {}---------
        // ===================== DB 와 연동하는 법 끝 ===================== //
        
		// 풀캘린더에서 날짜 클릭할 때 발생하는 이벤트(일정 등록창으로 넘어간다)
        dateClick: function(info) {
      	 // alert('클릭한 Date: ' + info.dateStr); // 클릭한 Date: 2021-11-20
      	    $(".fc-day").css('background','none'); // 현재 날짜 배경색 없애기
      	    info.dayEl.style.backgroundColor = '#b1b8cd'; // 클릭한 날짜의 배경색 지정하기
      	    $("form > input[name=chooseDate]").val(info.dateStr);
      	    
      	    var frm = document.dateFrm;
      	    frm.method="POST";
      	    frm.action="<%= ctxPath%>/calendar/insertSchedule";
      	    frm.submit();
      	  },
      	  
      	 // === 사내캘린더, 내캘린더, 공유받은캘린더의 체크박스에 체크유무에 따라 일정을 보여주거나 일정을 숨기게 하는 것이다. === 
    	 eventDidMount: function (arg) {
	            var arr_calendar_checkbox = document.querySelectorAll("input.calendar_checkbox"); 
	            // 사내캘린더, 내캘린더, 공유받은캘린더 에서의 모든 체크박스임
	            
	            arr_calendar_checkbox.forEach(function(item) { // item 이 사내캘린더, 내캘린더, 공유받은캘린더 에서의 모든 체크박스 중 하나인 체크박스임
		              if (item.checked) { 
		            	// 사내캘린더, 내캘린더, 공유받은캘린더 에서의 체크박스중 체크박스에 체크를 한 경우 라면
		                
		            	if (arg.event.extendedProps.cid === item.value) { // item.value 가 체크박스의 value 값이다.
		                	// console.log("일정을 보여주는 cid : "  + arg.event.extendedProps.cid);
		                	// console.log("일정을 보여주는 체크박스의 value값(item.value) : " + item.value);
		                    
		                	arg.el.style.display = "block"; // 풀캘린더에서 일정을 보여준다.
		                }
		              } 
		              
		              else { 
		            	// 사내캘린더, 내캘린더, 공유받은캘린더 에서의 체크박스중 체크박스에 체크를 해제한 경우 라면
		                
		            	if (arg.event.extendedProps.cid === item.value) {
		            		// console.log("일정을 숨기는 cid : "  + arg.event.extendedProps.cid);
		                	// console.log("일정을 숨기는 체크박스의 value값(item.value) : " + item.value);
		                	
		            		arg.el.style.display = "none"; // 풀캘린더에서 일정을  숨긴다.
		                }
		              }
	            });// end of arr_calendar_checkbox.forEach(function(item) {})------------
	      }
  });
    
  calendar.render();  // 풀캘린더 보여주기
  
 
  var arr_calendar_checkbox = document.querySelectorAll("input.calendar_checkbox"); 
  // 사내캘린더, 내캘린더, 공유받은캘린더 에서의 체크박스임
  
  arr_calendar_checkbox.forEach(function(item) {
	  item.addEventListener("change", function () {
      // console.log(item);
		 calendar.refetchEvents(); // 모든 소스의 이벤트를 다시 가져와 화면에 다시 표시합니다.
    });
  });
  //==== 풀캘린더와 관련된 소스코드 끝(화면이 로드되면 캘린더 전체 화면 보이게 해줌) ==== //

  
  // 검색 할 때 엔터를 친 경우
  $("input#searchWord").keyup(function(event){
	 if(event.keyCode == 13){ 
		 goSearch();
	 }
  });
 
    
  // 모달 창에서 입력된 값 초기화 시키기 //
  $("button.modal_close").on("click", function(){
	  var modal_frmArr = document.querySelectorAll("form[name=modal_frm]");
	  for(var i=0; i<modal_frmArr.length; i++) {
		  modal_frmArr[i].reset();
	  }
  });
  
      
}); // end of $(document).ready(function(){})==============================




// === 검색 기능 === //
function goSearch(){

	if( $("#fromDate").val() > $("#toDate").val() ) {
		alert("검색 시작날짜가 검색 종료날짜 보다 크므로 검색할 수 없습니다.");
		return;
	}
    
	if( $("select#searchType").val()=="" && $("input#searchWord").val()!="" ) {
		alert("검색대상 선택을 해주세요!!");
		return;
	}
	
	if( $("select#searchType").val()!="" && $("input#searchWord").val()=="" ) {
		alert("검색어를 입력하세요!!");
		return;
	}
	
   	var frm = document.searchScheduleFrm;
    frm.method="get";
    frm.action="<%= ctxPath%>/calendar/searchSchedule";
    frm.submit();
	
}// end of function goSearch(){}--------------------------

</script>



	<%-- 이곳에 각 해당되는 뷰 페이지를 작성해주세요 --%>
	<link href="<%=ctxPath%>/css/reservation/assetDetailPage.css" rel="stylesheet">
	<link href="<%=ctxPath%>/css/reservation/reservation_main.css" rel="stylesheet"> 

	<jsp:include page="./calendar_bar.jsp" /> 

    <!-- 오른쪽 바 -->
    <div id="right_bar">
		
		<div id="right_title_box" style="display:flex; justify-content:space-between; align-items:center;">
	        <span id="right_title" style="margin-right:8px;">calendar</span>
	    
		
		<div style="display:flex; align-items:center;">
		<span style="display:flex; align-items:center; gap: 2px; justify-content: end;" class="searchOn">
			<span style="cursor:pointer;"><i class="fa-solid fa-magnifying-glass"></i></span>
		</span> 
		
		<span id="searchPart" style="display:none; margin-left: 8px;">
		<form name="searchScheduleFrm">
			<div >
				<input type="text" id="fromDate" name="startdate" style="width: 90px;" readonly="readonly">
            &nbsp;-&nbsp;<input type="text" id="toDate" name="enddate" style="width: 90px;" readonly="readonly">&nbsp;
				<select id="searchType" name="searchType" style="height: 30px;">
					<option value="">검색대상선택</option>
					<option value="subject">제목</option>
					<option value="content">내용</option>
					<option value="joinuser">공유자</option>
				</select>&nbsp;
				<input type="text" id="searchWord" value="" style="height: 30px; width:150px;" name="searchWord"/>
				&nbsp;
				<select id="sizePerPage" name="sizePerPage" style="height: 30px;">
					<option value="">보여줄개수</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
				</select>&nbsp;
				<input type="hidden" name="fk_employeeNo" value="${sessionScope.loginuser.employeeNo}"/>
				<button type="button" class="okBtn" style="display: inline-block; height:30px; margin-bottom:0px;" onclick="goSearch()">검색</button>
			</div>
		</form>
		</span>
		</div>
	</div>
		

		<%-- 풀캘린더가 보여지는 엘리먼트  --%>
		<div id="calendar" style="margin-top:12px;"></div>


    </div>
    <!-- 오른쪽 바 -->
	<%-- 이곳에 각 해당되는 뷰 페이지를 작성해주세요 --%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	<%-- === 마우스로 클릭한 날짜의 일정 등록을 위한 폼 === --%>     
	<form name="dateFrm">
		<input type="hidden" name="chooseDate" />	
	</form>	
	
	
	
	
<jsp:include page="../../footer/footer.jsp" /> 