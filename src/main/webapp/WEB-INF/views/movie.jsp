<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="./include/header.jsp" %>
<div id="wrap_content" style="min-height: 100%; position: relative;">
   <div id="content" style="padding-bottom:400px;">
      <div style="float:left;">
         <span style="font-weight:bold; font-size:36px;">무비차트</span>
      </div>
      <div style="text-align:right; float:right; width:200px; height:50px; padding-top:10px;">
         <ul class="nav nav-tabs" style="display:inline-block;">
            <li><a href="javascript:getMovieByCategory('chart')"><span class="cat" style="font-weight:bold;">무비차트</span></a></li>
            <li><a href="javascript:getMovieByCategory('schedule')"><span class="cat" style="font-weight:bold;">상영예정작</span></a></li>
         </ul>
      </div>
      
      <br/>
      
      <div style="border:2px solid #000; margin-top:40px;"></div>
      
      <div id="menu" style="display:none;">
         <div id="sel_option" style="margin-top:10px;">
            <input type="checkbox" id="checkbox" name="checkbox" style="margin-top:8px; float:left;" onclick="play()"/> 
            <label style="font-size:12px; margin-top:6px; float:left;">현재 상영작만 보기</label>
            <div style="margin-top:8px; width:205px; float:right;">
               <select id="order" class="form-control" style="width:150px; float:left;">
                  <option selected="selected" value="예매율순">예매율순</option>
                  <option value="평점순">평점순</option>
                  <option value="관람객순">관람객순</option>
               </select>
               <button type="button" id="sel_btn" class="btn btn-primary" name="sel_btn" onclick="play()" style="margin-left:5px;">
                  GO
               </button>
            </div>
         </div>
      </div>
      
      <div id="ajax_movie" style="margin-top:25px;">
         <!-- 무비차트 ajax 처리 내용뿌려줄 곳 -->
      </div>
      
   </div>   
</div>

<script>

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

   function more(){
      $(".moreline").show();
      $(".moregroup").show();
      $("#more_btn").hide();
   }
   
   function setMovieByCategory(movie, category){
      var result = "";
      var menu = $("#menu");
      if(category == "chart"){
         menu.show();
         for(var i=0; i<movie.length; i++){
            if(i>3 && i<8){
               if(i%4 == 0){
                  result += '<br/><div style="border:1px solid #000; margin-top:430px;"></div>'
               }
               result += '<div id="movie_chart'+i+'" style="margin-top:35px;">'
                  + '<div id="chart" style="width:285px; height:380px; text-align:left; float:left;">'
                  + '<div style="margin-left:18px;">'
                  + '<a href="/movie/' + movie[i].movie_id + '">'
                  + '<img src="/resources/images/poster/'+movie[i].poster+'" style="width:249px; height:300px;"/> <br/>'
                  + '</a>'
                  + '<span style="font-weight:bold; font-size:15px;">'+ movie[i].title +' </span><br/>'
                  + '관람등급 : <span id="rating_color'+i+'">'+ movie[i].rating +'</span> <br/>'
                  + '예매율 : '+ parseFloat(movie[i].reservation_rate).toFixed(1) +'% <br/>'
                  + '개봉날짜 : '+ movie[i].open_date +' <br/>'

               if(movie[i].status == "play"){
            	  result += '<input type="button" id="res_btn'+i+'" name="res_btn'+i+'" class="btn btn-danger btn-sm" onclick="goReservation(\''+ movie[i].movie_id + '\',\'' + movie[i].title + '\')" value="예매" style="width:250px; display:inline-block; margin-top:7px;"/>'; 
               }else if(movie[i].status == "schedule"){
            	  result += '<input type="button" id="res_btn'+i+'" name="res_btn'+i+'" class="btn btn-primary btn-sm" style="width:250px; display:inline-block; margin-top:7px; cursor: default; letter-spacing: 25px;" value="&nbsp상영예정" />'; 
               }   
                  result += '</div>'
	                  + '</div>'
	                  + '</div>';

               if(i == 7){
                  result += '<button type="button" id="more_btn" onclick="more()" style="float:right; margin-top:55px; margin-right:18px; border:0; background-color:white;">'
                     + '<i class="fa fa-plus-square fa-1x" aria-hidden="true" style="color:gray;">'
                     + '</i>'
                     + '<span style="font-weight:bold; font-size:15px;">'
                     + '더보기'
                     + '</span>'
                     + '</button>';
               }
            }else if(i>7){
               if(i%4 == 0){
                  result += '<br/><div class="moreline" style="border:1px solid #000; margin-top:430px; display:none;"></div>'
               }
               result += '<div class="moregroup" style="display:none;">' 
                  + '<div id="movie_chart'+i+'" style="margin-top:35px;">'
                  + '<div id="chart" style="width:285px; height:380px; text-align:left; float:left;">'
                  + '<div style="margin-left:18px;">'
                  + '<a href="/movie/' + movie[i].movie_id + '">'
                  + '<img src="/resources/images/poster/'+movie[i].poster+'" style="width:249px; height:300px;"/> <br/>'
                  + '</a>'
                  + '<span style="font-weight:bold; font-size:15px;">'+ movie[i].title +' </span><br/>'
                  + '관람등급 : <span id="rating_color'+i+'">'+ movie[i].rating +'</span> <br/>'
                  + '예매율 : '+ parseFloat(movie[i].reservation_rate).toFixed(1) +'% <br/>'
                  + '개봉날짜 : '+ movie[i].open_date +' <br/>'

               if(movie[i].status == "play"){
             	  result += '<input type="button" id="res_btn'+i+'" name="res_btn'+i+'" class="btn btn-danger btn-sm" onclick="goReservation(\''+ movie[i].movie_id + '\',\'' + movie[i].title + '\')" value="예매" style="width:250px; display:inline-block; margin-top:7px;"/>'; 
               }else if(movie[i].status == "schedule"){
             	  result += '<input type="button" id="res_btn'+i+'" name="res_btn'+i+'" class="btn btn-primary btn-sm" style="width:250px; display:inline-block; margin-top:7px; cursor: default; letter-spacing: 25px;" value="&nbsp상영예정" />'; 
               }   
                  result += '</div>'
 	                  + '</div>'
 	                  + '</div>';
            
            }else{
               result += '<div id="movie_chart'+i+'" style="margin-top:100px;">'
                  + '<div id="chart" style="width:285px; height:380px; text-align:left; float:left;">'
                  + '<div style="margin-left:18px;">'
                  + '<a href="/movie/' + movie[i].movie_id + '">'
                  + '<img src="/resources/images/poster/'+movie[i].poster+'" style="width:249px; height:300px;"/> <br/>'
                  + '</a>'
                  + '<span style="font-weight:bold; font-size:15px;">'+ movie[i].title +' </span><br/>'
                  + '관람등급 : <span id="rating_color'+i+'">'+ movie[i].rating +'</span> <br/>'
                  + '예매율 : '+ parseFloat(movie[i].reservation_rate).toFixed(1) +'% <br/>'
                  + '개봉날짜 : '+ movie[i].open_date +' <br/>'

                if(movie[i].status == "play"){
              	  result += '<input type="button" id="res_btn'+i+'" name="res_btn'+i+'" class="btn btn-danger btn-sm" onclick="goReservation(\''+ movie[i].movie_id + '\',\'' + movie[i].title + '\')" value="예매" style="width:250px; display:inline-block; margin-top:7px;"/>'; 
                }else if(movie[i].status == "schedule"){
             	  result += '<input type="button" id="res_btn'+i+'" name="res_btn'+i+'" class="btn btn-primary btn-sm" style="width:250px; display:inline-block; margin-top:7px; cursor: default; letter-spacing: 25px;" value="&nbsp상영예정" />'; 
                }   
                   result += '</div>'
 	                  + '</div>'
 	                  + '</div>';

            }
         }
      }else if(category == "schedule"){
         menu.hide();
         document.getElementById("checkbox").checked = false;
         
         today = new Date();
         current_year = today.getFullYear();
         
         result += '<h3 style="margin-left:18px; margin-bottom:10px;">'+ movie[0].open_date +'</h3>'
         for(var j=0; j<movie.length; j++){
            if(current_year == movie[j].open_date.substring(0,4)){
               if(j>0){
                  if(movie[j].open_date != movie[j-1].open_date){
                     result += '<br/> <div style="border:1px solid #000; margin-top:420px; clear:both;"></div>'
                        + '<h3 style="margin-left:18px;">'+ movie[j].open_date +'</h3>'
                        + '<div id="chart" style="width:285px; height:380px; text-align:left; float:left;">'
                        + '<div style="margin-left:18px;">'
                        + '<a href="/movie/' + movie[j].movie_id + '">'
                        + '<img src="/resources/images/poster/'+movie[j].poster+'" style="width:249px; height:300px;"/> <br/>'
                        + '</a>'
                        + '<span style="font-weight:bold; font-size:15px;">'+ movie[j].title +' </span><br/>'
                        + '관람등급 : <span id="rating_color'+j+'">'+ movie[j].rating +'</span> <br/>'
                        + '예매율 : '+ parseFloat(movie[j].reservation_rate).toFixed(1) +'% <br/>'
                        + '개봉날짜 : '+ movie[j].open_date +' <br/>'

                        + '<input type="button" id="res_btn'+j+'" name="res_btn'+j+'" class="btn btn-primary btn-sm" value="&nbsp상영예정" style="width:250px; display:inline-block; margin-top:7px; cursor: default; letter-spacing: 25px;"/>'

                        + '</div>'
                        + '</div>'
                        + '</div>';
                  }
                  if(movie[j].open_date == movie[j-1].open_date){
                     result += '<div id="chart" style="width:285px; height:380px; text-align:left; float:left; margin-bottom:70px;">'
                        + '<div style="margin-left:18px;">'
                        + '<a href="/movie/' + movie[j].movie_id + '">'
                        + '<img src="/resources/images/poster/'+movie[j].poster+'" style="width:249px; height:300px;"/> <br/>'
                        + '</a>'
                        + '<span style="font-weight:bold; font-size:15px;">'+ movie[j].title +' </span><br/>'
                        + '관람등급 : <span id="rating_color'+j+'">'+ movie[j].rating +'</span> <br/>'
                        + '예매율 : '+ parseFloat(movie[j].reservation_rate).toFixed(1) +'% <br/>'
                        + '개봉날짜 : '+ movie[j].open_date +' <br/>'

                        + '<input type="button" id="res_btn'+j+'" name="res_btn'+j+'" class="btn btn-primary btn-sm" value="&nbsp상영예정" style="width:250px; display:inline-block; margin-top:7px; cursor: default; letter-spacing: 25px;"/>'

                        + '</div>'
                        + '</div>';
                  }
               }else{
                  result += '<div id="chart" style="width:285px; height:380px; text-align:left; float:left;">'
                     + '<div style="margin-left:18px;">'
                     + '<a href="/movie/' + movie[j].movie_id + '">'
                     + '<img src="/resources/images/poster/'+movie[j].poster+'" style="width:249px; height:300px;"/> <br/>'
                     + '</a>'
                     + '<span style="font-weight:bold; font-size:15px;">'+ movie[j].title +' </span><br/>'
                     + '관람등급 : <span id="rating_color'+j+'">'+ movie[j].rating +'</span> <br/>'
                     + '예매율 : '+ parseFloat(movie[j].reservation_rate).toFixed(1) +'% <br/>'
                     + '개봉날짜 : '+ movie[j].open_date +' <br/>'

                     + '<input type="button" id="res_btn'+j+'" name="res_btn'+j+'" class="btn btn-primary btn-sm" value="&nbsp상영예정" style="width:250px; display:inline-block; margin-top:7px; cursor: default; letter-spacing: 25px;"/>'

                     + '</div>'
                     + '</div>';
               }
            }
         }   
      }
      document.getElementById("ajax_movie").innerHTML = result;
      
      for(var x=0; x<movie.length; x++){
    	  if($("#rating_color"+x).text() == "12" || $("#rating_color"+x).text() == "15"){
    		  $("#rating_color"+x).html($("#rating_color"+x).text()+"세 관람가");
    	  }else if($("#rating_color"+x).text() == "전체"){
    		  $("#rating_color"+x).html("전체 관람가");
    		  $("#rating_color"+x).css("color", "blue");
    	  }else if($("#rating_color"+x).text() == "청불"){
    		  $("#rating_color"+x).html("청소년 관람불가");
    		  $("#rating_color"+x).css("color", "red");
    	  }
    	  $("#rating_color"+x).css("font-weight", "bold");
      }
   }
   
   function getMovieByCategory(category){
      if(category == "chart"){
         $.ajax({
            type : 'get',
            url : '/movie/main',
            headers : {
            "Content-Type" : "application/json",
            //"X-HTTP-Method-Override" : "GET",  ----  POST 이거나 GET인경우는 생략가능
            },
            dataType : 'json',
            data : {'category' : category},
            success : function(movie){
               setMovieByCategory(movie, "chart");
            }
         });
      }else if(category == "schedule"){
         $.ajax({
            type : 'get',
            url : '/movie/main',
            headers : {
            "Content-Type" : "application/json",
            //"X-HTTP-Method-Override" : "GET",  ----  POST 이거나 GET인경우는 생략가능
            },
            dataType : 'json',
            data : {'category' : category},
            success : function(movie){
               setMovieByCategory(movie, "schedule");
            }
         });
      }
   }
   
   getMovieByCategory("chart");   
   
   function play(){
      var play = document.getElementById("checkbox");
      var order = document.getElementById("order");
      if(play.checked){
         play.value = "on";
      }else if(!play.checked){
         play.value = "off";
      }
      
      $.ajax({
         type : 'get',
         url : '/movie/main/select',
         headers : {
         "Content-Type" : "application/json",
         //"X-HTTP-Method-Override" : "GET",  ----  POST 이거나 GET인경우는 생략가능
         },
         dataType : 'json',
         data : {'play' : play.value,
               'order' : order.value},
         success : function(movie){
            setMovieByCategory(movie, "chart");
         }
      });
   }
</script>

<style>
   .nav-tabs{
      border:0px;
   }
   
   .nav-tabs > li > a:hover,
   .nav-tabs > li > a:focus{
      border:0px;
      background-color:#fff;
      list-style-type: none;
      color:red;
   }
   
   .nav-tabs > li > a:active{
      color:red;
   }
</style>
<% session.setAttribute("menu", null);%>
<%@include file="./include/footer.jsp" %>