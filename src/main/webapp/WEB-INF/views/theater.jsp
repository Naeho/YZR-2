<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyATVeCpbiqd21MbrR5-OMHNWVFvuK5AtuA"></script>
<%@include file="./include/header.jsp" %>
<div id="wrap_content" style="min-height: 100%; position: relative;">
	<div id="content" style="padding-bottom: 100px; float: left; width:100%">
		<div id="theater_table" style="border:2px solid gray; border-radius:20px; height:400px; background-color:#4B4B4B;">
			<span style="font-weight:bold; color:white; font-size:30px; margin-top:35px; margin-left:110px; float:left;">자주가는 CGV</span>
			<div id="like_th_place" style="float:left; margin-top:25px; margin-left:20px;">
				<c:forEach items="${like_th}" var="like_th" begin="0" end="4" varStatus="i">
					<div class="th_group" style="text-align:center; line-height:50px;">
						<span class="th_name t${i.index}" style="color:white; font-weight:bold; font-size:20px;">
							${like_th.theater_name}
						</span>
						<input type="hidden" id="like_th_address${i.index}" name="like_th_address${i.index}" value="${like_th.theater_address}"/>
						<input type="hidden" id="like_th_xpoint${i.index}" name="like_th_xpoint${i.index}" value="${like_th.xpoint}"/>
						<input type="hidden" id="like_th_ypoint${i.index}" name="like_th_ypoint${i.index}" value="${like_th.ypoint}"/>
					</div>
				</c:forEach>
				<c:if test="${fn:length(like_th) < 5}">
					<c:forEach begin="0" end="${4-fn:length(like_th)}">
						<div class="th_group">
							<span style="color:white; font-weight:bold; font-size:20px;">
							</span>
						</div>
					</c:forEach>
				</c:if>
			</div>
			
			<ul id="location" class="nav nav-tabs list-inline" style="clear:both; width:1140px; text-align:center; margin-top:20px; float:left;">
				<li class="lo_li" onclick="getTheater_list('서울')">서울</li>
				<li class="lo_li" onclick="getTheater_list('경기')">경기</li>
				<li class="lo_li" onclick="getTheater_list('인천')">인천</li>
				<li class="lo_li" onclick="getTheater_list('강원')">강원</li>
				<li class="lo_li" onclick="getTheater_list('대전|충청')">대전/충청</li>
				<li class="lo_li" onclick="getTheater_list('광주|전라')">광주/전라</li>
				<li class="lo_li" onclick="getTheater_list('대구|울산|부산')">대구/울산/부산</li>
				<li class="lo_li" onclick="getTheater_list('경상')">경상</li>
				<li class="lo_li" onclick="getTheater_list('제주')">제주</li>
			</ul>
			
			<ul id="theater" class="nav nav-tabs list-inline" style="clear:both; width:1140px; margin-top:20px; float:left;">
				<!-- 지역에 따른 -->
			</ul>
		</div>
		
		<span id="theater_name" style="font-weight:bold; font-size:36px; float:left; margin-top:30px;"></span>
		
		<div style="border:2px solid #000; width:1140px; margin-top:20px; clear:both;"></div>
		
		<div id="map" style="width: 1000px; height: 500px; margin: 70px; margin-bottom: 0px;"></div>
		
	</div>
</div>

<script>
	function getTheater_list(location){
		if(location == null || location == ""){
			location = "서울";
		}
		$.ajax({
			type : 'get',
			url : '/theater/lo',
			headers : {
			"Content-Type" : "application/json",
			},
			dataType : 'json',
			data : {"location" : location},
			success : function(theater_list){
				setTheater_list(theater_list);
			}
		});
	}
	
	getTheater_list();
	
	function setTheater_list(theater_list){
		var result = "";
		for(var i=0; i<theater_list.length; i++){
			result += '<li id="th_tt'+i+'" class="th_li" onclick="setTheater_name('+"'"+theater_list[i].theater_name+"'"+","+"'"+theater_list[i].theater_address+"'"+","+"'"+theater_list[i].xpoint+"'"+","+"'"+theater_list[i].ypoint+"'"+')">'
				+ theater_list[i].theater_name
				+ '</li>';
		}
		
		document.getElementById("theater").innerHTML = result;
	}
	
	function setTheater_name(theater_name, address, xpoint, ypoint){
		$("#theater_name").html(theater_name);
		
		$(".date_div").css("color", "black");
		$("#0d").css("color", "red");
		initialize(theater_name, address, xpoint, ypoint);
	}
	
	setTheater_name("CGV강남","서울특별시 강남구 강남대로 438 (역삼동, 스타플렉스)","127.0262446","37.5017831");
	
	$(".th_name").click(function(){
		var temp = $(this).attr('class').substring(9,10);
		
		var tn = $(this).text();
		var ta = $("#like_th_address"+temp).val();
		var tx = $("#like_th_xpoint"+temp).val();
		var ty = $("#like_th_ypoint"+temp).val();
		
		setTheater_name(tn,ta,tx,ty);
	})
	
	function initialize(theater_name, address, xpoint, ypoint) {
		var Y_point = parseFloat(ypoint); // Y 좌표
		var X_point = parseFloat(xpoint); // X 좌표
		var zoomLevel = 16; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
		var markerTitle = theater_name; // 현재 위치 마커에 마우스를 오버했을때 나타나는 정보
		var markerMaxWidth = 300;
		// 말풍선 내용
		var contentString = address;
		var myLatlng = new google.maps.LatLng(Y_point, X_point);
		var mapOptions = {
			zoom : zoomLevel,
			center : myLatlng,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}
		var map = new google.maps.Map(document.getElementById('map'), mapOptions);
		var marker = new google.maps.Marker({
			position : myLatlng,
			map : map,
			title : markerTitle
		});
		var infowindow = new google.maps.InfoWindow({
			content : contentString,
			maxWidth : markerMaxWidth
		});
		infowindow.open(map, marker);
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});
	}
	
</script>

<style>
	#th1{
		margin-left:0px;
	}
	.th_group{
		border:5px double white; 
		width:130px; 
		height:60px; 
		float:left; 
		margin-left:5px;
		cursor:pointer;
	}
	.time_li:FIRST-CHILD{
		border-left:1px solid #BDBDBD;
	}
	.time_li{
		margin-top:10px;
		float:left;
		border-top:1px solid #BDBDBD;
		border-right:1px solid #BDBDBD;
		border-bottom:1px solid #BDBDBD;
		width:70px;
		height:42px;
		text-align:center;
	}
	.time_li > a{
		text-decoration:none;
	}
	.time_li > a:hover{
		color:red;
	}
	.lo_li{
		color:white;
		font-weight:bold;
		font-size:17px;
		margin-left:32px;
		margin-right:32px;
		cursor:pointer;
	}
	.lo_li:HOVER{
		color:red;
	}
	.th_li{
		color:white;
		font-size:14px;
		margin-left:60px;
		margin-right:25px;
		width:200px;
		margin-top:10px;
	}
	.th_li:HOVER{
		color:red;
		cursor:pointer;
	}
	.nav-tabs{
		border:0px;
	}
	.date_div{
		float:left;
		width:80px;
		margin-left:20px;
		margin-right:20px;
	}
	.date_div:HOVER{
		cursor:pointer;
		color:red;
	}
</style>
<% session.setAttribute("menu", null);%>
<%@include file="./include/footer.jsp" %>