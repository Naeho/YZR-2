<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="./include/header.jsp"%>
<div id="wrap_content" style="min-height: 100%; position: relative;">
   <div id="content" style="padding-bottom: 50px; float:left;">
      <div id="notice" style="border-bottom:2px solid #000; margin-top:10px; margin-bottom:10px;" class="carousel up" data-ride="carousel" data-interval="3000">
         <c:forEach begin="0" end="4" varStatus="n">
            <ol class="carousel-indicators">
                 <li data-target="#myCarousel" data-slide-to="${n.index}"></li>
            </ol>
         </c:forEach>
         <div class="carousel-inner" role="listbox">
            <c:forEach items="${notice}" var="notice" varStatus="noticeN">
               <c:choose>
                  <c:when test="${noticeN.first}">
                     <div class="item active">
                        <i class="fa fa-bullhorn" aria-hidden="true" style="font-weight:bold; font-size:15px;"> &nbsp공지사항 </i>
                        &nbsp [${notice.getNotice_category()}]
                        &nbsp <a href="/support/notice/read/${ notice.no }"> ${notice.getNotice_title()} </a>
                        <span style="float:right;"> ${notice.getNotice_date()} </span>
                     </div>
                  </c:when>
                  <c:otherwise>
                     <div class="item">
                        <i class="fa fa-bullhorn" aria-hidden="true" style="font-weight:bold; font-size:15px;"> &nbsp공지사항 </i>
                        &nbsp [${notice.getNotice_category()}]
                        &nbsp <a href="/support/notice/read/${ notice.no }"> ${notice.getNotice_title()} </a>
                        <span style="float:right;"> ${notice.getNotice_date()} </span>
                     </div>
                  </c:otherwise>
               </c:choose>
            </c:forEach>
         </div>
      </div>      
      
	<!-- 검색창 -->
	<div style="clear: both; width: 100%; height: 34px;">
		<form class="form" action="/search" method="post">
			<div class="form-group" style="clear: both; width: 100%; height: 34px;">
				<div class="col-sm-10" style="padding: 0; height: 34px;">
					<input id="serach" class="form-control" name="search" type="text" placeholder="검색어를 입력하세요.">
				</div>
				<div class="col-sm-2">
					<input type="submit" class="btn btn-danger" value="검색" style="width: 100%;">
				</div>
			</div>	
		</form>
	</div>
      
      <span style="font-weight:bold; font-size:36px; float:left; margin-top:10px;">추천영화</span>
      <div style="border:1px solid #000; margin-top:60px;"></div>
      
      <c:choose>
         <c:when test="${ member_id != null }">
            <c:set value="${ rec_movie }" var="chart"></c:set>
         </c:when>
         <c:otherwise>
            <c:set value="${ rec_basic }" var="chart"></c:set>
         </c:otherwise>
      </c:choose>
      
      <c:if test="${chart == null }">
         <span style="font-weight:bold; font-size:15px;"> ${basic_title} </span>
         <div id="rec_movie" style="width:250px; height:380px; text-align:left; margin-top:5px;">
            <a href="/movie/${ chart.movie_id }"><img src="/resources/poster/${chart.poster}" style="width:249px; height:300px;"/></a>
            <span style="font-weight:bold; font-size:15px;"> ${basic_title}  </span><br/>
            관람등급 : <span id="rating_color${i.index}" style="font-weight:bold;">${chart.rating}</span><br/>
            예매율 : ${chart.reservation_rate}%<br/>
            개봉날짜 : ${chart.open_date} <br/>
	           <input type="button" id="res_btn" name="res_btn" class="btn btn-danger btn-sm" onclick="" value="예매" style="width:250px; display:inline-block; margin-top:7px;"/>
         </div>
      </c:if>
      

      <c:forEach items="${chart}" var="chart" begin="0" end="2" varStatus="i">
         <div style="margin-top:20px; float:left; margin-left:92px; margin-right:92spx; ">
            <div id="m1" style="margin-top:20px;">
               <div id="rec_movie_title${i.index}" style="border:2px solid #000; width:250px; height:28px; padding-top:2px; background-color:#ff3636; text-align:center;">
                  <c:choose>
                     <c:when test="${member_id !=null}">
                        <span style="font-weight:bold; font-size:15px;">
                     </c:when>
                     <c:otherwise>
                        <span style="font-weight:bold; font-size:15px;">
                     </c:otherwise>
                  </c:choose>
                     <c:choose>
                        <c:when test="${ member_id != null }">
                           <c:set value="${ rec_title }" var="chart_title"></c:set>
                        </c:when>
                        <c:otherwise>
                           <c:set value="${ basic_title }" var="chart_title"></c:set>
                        </c:otherwise>
                     </c:choose>
                     ${chart_title[i.index]}
                  </span>
               </div>
               <div id="rec_movie${i.index}" style="width:250px; height:380px; text-align:left; margin-top:5px;">
                  <a href="/movie/${ chart.movie_id }"><img src="/resources/images/poster/${chart.poster}" style="width:249px; height:300px;"/></a>
                  <span style="font-weight:bold; font-size:15px;"> ${chart.title} </span><br/>

		                 관람등급 : <span id="rating_color${i.index}" style="font-weight:bold;">${chart.rating}</span><br/>
		                 예매율 : ${chart.reservation_rate}% <br/>
		                 개봉날짜 : ${chart.open_date} <br/>
                  <input type="button" id="res_btn" name="res_btn" class="btn btn-danger btn-sm" onclick="goReservation('${chart.movie_id}','${chart.title}')" value="예매" style="width:250px; display:inline-block; margin-top:7px;"/>

               </div>
            </div>
         </div>
      </c:forEach>
      
      <h2 id="event_line" style="margin-top:100px; float:left;">
         <div style="border-top:1px solid #f00; border-bottom:1px solid #f00; width:503px; height:5px; float:left; margin-top:19px;"></div>
            <span style="float:left; color:red; font-size:40px;"><a id="event_li" href="/event">EVENT</a></span>
         <div style="border-top:1px solid #f00; border-bottom:1px solid #f00; width:503px; height:5px; float:left; margin-top:19px;"></div>
      </h2>
      
      <div id="hold_img1" style="clear:both; margin-top:25px; float:left; height:380px;">
         <c:forEach items="${event_list}" var="event_list" begin="0" end="2">
            <div style="width:320px; height:300px; float:left; margin-left:43px;">
               <a href="/support/notice/read/${ event_list.no }"><img style="width:320px; height:350px;" src="/resources/images/notice/${event_list.notice_image}"></a>
               <div style="margin-top:5px; width:320px;">
                  <span style="color:#4374D9; font-weight:bold;">스페셜 이벤트</span> <br/>
                  <span style="font-size:12px;">${event_list.notice_title}</span> <br/>
                  <span style="font-size:12px; color:#5D5D5D;">${event_list.notice_date} ~</span>
               </div>
            </div>
         </c:forEach>
         <c:if test="${fn:length(event_list) > 3}">
            <button type="button" id="more_btn" onclick="more()" style="float:right; margin-top:105px; margin-right:18px; border:0; background-color:white;">
               <i class="fa fa-plus-square fa-1x" aria-hidden="true" style="color:gray;">
               </i>
               <span style="font-weight:bold; font-size:15px;">
                  더보기
               </span>
            </button>
         </c:if>
      </div>
   </div>   
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $('#notice').carousel('cycle');
    });
   
    function more(){
       location.href = "/event";
    }
    

    var sp0 = $("#rating_color0");
    var sp1 = $("#rating_color1");
    var sp2 = $("#rating_color2");
    
    if(sp0.text() == "12" || sp0.text() == "15"){
    	sp0.html(sp0.text()+"세 관람가");
    }else if(sp0.text() == "전체"){
    	sp0.html(sp0.text()+" 관람가");
    	sp0.css("color", "blue");
    }else if(sp0.text() == "청불"){
    	sp0.html("청소년 관람불가");
    	sp0.css("color", "red");
    }
    
    if(sp1.text() == "12" || sp1.text() == "15"){
    	sp1.html(sp1.text()+"세 관람가");
    }else if(sp1.text() == "전체"){
    	sp1.html(sp1.text()+" 관람가");
    	sp1.css("color", "blue");
    }else if(sp1.text() == "청불"){
    	sp1.html("청소년 관람불가");
    	sp1.css("color", "red");
    }
    
    if(sp2.text() == "12" || sp2.text() == "15"){
    	sp2.html(sp2.text()+"세 관람가");
    }else if(sp2.text() == "전체"){
    	sp2.html(sp2.text()+" 관람가");
    	sp2.css("color", "blue");
    }else if(sp2.text() == "청불"){
    	sp2.html("청소년 관람불가");
    	sp2.css("color", "red");
    }

    function goReservation(movie_id, title){
		var frm = document.createElement("form");
		frm.action = "/ticket";
		frm.method = "post";
		
		var mi = document.createElement("input");
		mi.type = "text";
		mi.name = "movie_id";
		mi.value = movie_id;
		frm.appendChild(mi);
		
		var mt = document.createElement("input");
		mt.type = "text";
		mt.name = "title";
		mt.value = title;
		frm.appendChild(mt);
		
		frm.submit();
	}
    
</script>
         
<style>
   
   #event_li{
      color:red;
      text-decoration: none;
   }
   
   .nav-tabs{ border:0px }
   
   .nav-tabs > li > a:hover,
   .nav-tabs > li > a:focus{
   background-color:#fff;
   border:0px
   }
   
   .carousel-inner > .item > a,
   .carousel-inner > .item > a:hover{
   text-decoration: none;
   color: black;
   }
</style>
   
<%@include file="./include/footer.jsp"%>