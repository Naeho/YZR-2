<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="./include/header.jsp" %>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.0.js"></script>
<c:if test="${ member_id == null }">
	<script>
		<%response.sendRedirect("/login");%>
	</script>
</c:if>
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm" var="today"/>
	<style>

	.nonInput>div{
		border:1px solid #000;
		background-color: white;
	}
	
	.content1 {
		border-left:2px solid #999;
		border-right:2px solid #999;
		background-color: #F2F0E4;
		padding-top: 15px;
		float: left;
		height: 420px;
		overflow: scroll;
	}
	
	#menu1{
		width: 1140px;
		height: 40px;
	}
	
	#content1{
		width: 1140px;
		height: 420px;
		clear: both;
	}
	
	.menu1{
		border-left:2px solid #999;
		border-right:2px solid #999;
		background-color: #404040;
		color: rgba(255,255,255,0.75);
		text-align: center;
		font-size: 13pt;
		padding: 5px;
		float:left;
		height: 40px;
	}
	
	#menu1-1, #content1-1 {
		width: 27%;
	}
	
	#content1-1>div{
		
		clear:none;
		margin-left:20px;
		margin-top:15px;
	}
	
	#menu1-2, #content1-2 {
		width: 28%;
	}
	
	#menu1-3, #content1-3 {
		width: 19%;		
	}
	
	#menu1-4, #content1-4 {
		width: 26%;
	}
	
	#title2-1 {
		 color: #fff;
		 font-weight: bolder;
		 width: 400px;
		 padding-left: 20px;
	}
	
	#title2-2 {
		 color: rgba(230,230,230,0.75);
		 padding-left: 120px;
		 font-size: 14pt;
		 width: 400px;
	}
	
	#title2-3 {
		color: rgba(230,230,230,0.75);
		font-weight: bolder;
		text-align: right;
		padding-right:20px;
		width: 800px;
	}
	
	.movie_menu{
		float:left;
		padding-right:7px;
		padding-left:7px;
		text-align: center;
		cursor:pointer;
	}
	
	.movie_second_menu{
		float:left;
		padding-right:8px;
		padding-left:8px;
		border-bottom:2px solid #999;
		text-align: center;
		width: 80px;
		cursor:pointer;
	}
	
	#movie_second_menu1{
		border-bottom: 2px solid #000;
		cursor:pointer;
	}
	
	#theater_state{
		margin-top:15px;
		float:left;
		text-align: right;
		width:130px;
	}
	
	#time{
		cursor:pointer;
	}
	
	#theater_state_num{
		margin-top:15px;
		margin-left:-20px;
		float:left;
		text-align: left;
		width:20px;	
	}
	
	ul#theater_state {
		width: 50%;
	}
	
	ul#theater_state>li {
		
		width: 100%;
		margin-bottom: 3px;
		padding: 8px;
		
		cursor:pointer;
	}
	
	.theater_state {
		background-color: #E6E4D9;
	}
	
	.select_theater_state{
		background-color: #F2F0E4;
	}
	
	ul#theater_state_num>li>div {
		background-color: rgba(166,166,166,0.2);
		margin-bottom: 3px;
		padding: 8px;
		margin-left: -20px;
		width:35px;
		
	}
	
	.theater_city{
		margin-top:15px;
		width: 50%;
		float:left;
		text-align: left;
	}
	
	#theater_detail>div{
		margin-bottom: 3px;
		padding: 8px;
		width: 100%;
		
	}
	
	.timetable_time{
		border: 1px solid #999;
		float: left;
		margin-left: 10px;
		margin-right: 3px;
		margin-bottom: 5px;
	}
	
	.timetable_seat{
		color: #6B9900;
		
		float: left;
	}
	
	.calender{
		height: 30px;
		width: 80%;
		padding-left: 30%;
		margin: 0px auto;
		text-align:center;
		cursor:pointer;
	}
	
	#movie_list{
		cursor:pointer;
	}
	
	#movie_list>div {
		width: 240px;
		margin: 0px auto;
		margin-top: 15px;
	 	float: none;
	}
	
	#theater_detail{
		width:100%;
		cursor:pointer;
	}
	
	#reset {
		float:left;
		padding-left:5px;
	}
	
	#timetableBtn {
		float:left;
		padding-left:5px;
	}
	
	.glyphicon{
		clear: both;
	}
	
	#favoriteCGV1 {
		float:left;
		border-top:2px solid #999;
		border-bottom:2px solid #999;
		width:120px;
		margin-left:45px;
		color: red; font-weight: bold;
	}
	
	#favoriteCGV2 {
		float:left;
		border-top:2px solid #999;
		border-bottom:2px solid #999;
		width:120px;
	}
	
	#info_box {
		background-color: #1D1D1C;
		width: 1140px;
		height: 200px;
		clear:both;
		border: 1px solid #1D1D1C;
	}
	
	#screen {
		width: 600px;
		height: 25px;
		background-color: #bbb;
		margin: 0px auto;
		text-align: center;
		font-size: 14pt;
		font-weight: bold;
		color: #555;
	}
	
	

	
	
	th{
		background-color: rgba(0,0,0,0.9);
		border: 1px solid gba(0,0,0,0.9);;
		padding-top: 5px;
		height: 40px;
	}
	
	td{
		background-color: #FFFFE6;
		padding: 5px;
		border: 2px solid #999;
	}
	
	.seat_num{
		margin-bottom:3px;
		
	}
	
	.seat_number{
		float: left;
		margin-left: 5px;
	}
	
	.box{
		float: left;
		width: 18px;
		height: 18px;
		border: 1px solid #000;
	}
	
	#seat_table>table ,#seat{
		margin: 0px auto;
	}
	
	.seat_header{
		width: 25px;
		height: 25px;
		font-size: 2pt;
		text-align: center;
		background-color: #FFFFE6;
		border-top: 2px solid #ddd;
		border-bottom: 2px solid #ddd;
		border-spacing: 0px;
	}
	
	.seat_prime{
		width: 25px;
		height: 25px;
		font-size: 2pt;
		text-align: center;
		border: 2px solid #f00;
		border-spacing: 0px;
		cursor:pointer;
	}
	
	.seat_standard{
		width: 25px;
		height: 25px;
		font-size: 2pt;
		text-align: center;
		border: 2px solid #477500;
		cursor:pointer;
	}
	
	.seat_economy{
		width: 25px;
		height: 25px;
		font-size: 2pt;
		text-align: center;
		border: 2px solid #FF4500;
		cursor:pointer;
	}
	
	.seat_sweetbox{
		width: 25px;
		height: 25px;
		font-size: 2pt;
		text-align: center;
		border: 2px solid #FF4500;
		
		cursor:pointer;
	}
	
	.sweet_color {
		background-color: #FF007F;
	}
	
	.seat_handicapped{
		width: 25px;
		height: 25px;
		font-size: 2pt;
		text-align: center;
		border: 0px solid #FF4500;
		background-color: #597812;
		cursor:pointer;
	}
	
	.seat_reservation{
		width: 25px;
		height: 25px;
		font-size: 2pt;
		text-align: center;border: 2px0solid #FF4500;
		
		background-color: #C2C2C2;
		cursor:pointer;
	}
	
	.seat_reservation_proceed {
		background-color: black;
		color:white;
	}
	
	.seat_clicked{
		width: 25px;
		height: 25px;
		font-size: 2pt;
		text-align: center;
		border: 2px solid #999;
		background-color: #980000;
	}
	
	.seat_over{
		width: 25px;
		height: 25px;
		font-size: 2pt;
		text-align: center;
		border: 2px solid #999;
		background-color: #980000;
	}
	
	.seat_empty{
		width: 25px;
		height: 25px;
		font-size: 2pt;
		text-align: center;
		border: 0px solid #FF4500;
		background-color: #FFFFE6;
		
	}
	
	.seat_count_nomal,.seat_count_youth,.seat_count_advantage{
		border: 1px solid #000;
		height: 20px;
		width: 20px;
		background-color: #333;
		color: white;
	}
	
	.seat_nomal,.seat_youth,.seat_advantage,.seat_title{
		margin-right: 5px;
		float:left;
		text-align: center;
	}
	.seat_nomal,.seat_youth,.seat_advantage{
		cursor: pointer;
		border: 1px solid #000;
		height: 20px;
		width: 20px;
	}
	
	.seat_title {
		width: 80px;
		height: 20px;
		margin-left:10px;
		text-align: left;
		float:none;
	}
	
	#prime {
		width: 18px;
		height: 18px;
		border: 2px solid #f00;
		float: left;
	}
	
	#standard {
		 width: 18px;
		 height: 18px;
		 border: 2px solid #477500;
		 float: left;
	}
	
	#economy {
		 width: 18px;
		 height: 18px;
		 border: 2px solid #FF4500;
		 float: left;
	}
	
	#handicapped {
		width: 18px;
		height: 18px;
		border: 0px solid #FF4500;
		background-color: #597812;
		float: left;
	}
	
	#sweetbox {
		width: 18px;
		height: 18px;
		border: 0px solid #999;
		background-color: #FF007F;
		float: left;
	}
	
	#reservationed {
		width: 18px;
		height: 18px;
		background-color: #C2C2C2;
		float: left;
	}
	
	#selected {
		width: 18px;
		height: 18px;
		border: 2px solid #999;
		background-color: #980000;
		float: left;
	}
	
	#backArea, #backArea2 {
		float: left;
	}
	
	#backBtn, #backBtn2 {
		 margin-top: 50px;
		 margin-left: 50px;
		 background-color: #999;
		 color: #fff;
	}
	
	#nextBtn1, #nextBtn2, #nextBtn3 {
	 	margin-top: 50px;
		margin-right: 50px;
		background-color: #999;
		color: #fff;
	 }
	
	#backBtn > span, #nextBtn1 > span, #nextBtn2 > span, #backBtn2 > span, #nextBtn3 > span {
		font-size: 35pt;
		color: #fff;
		font-weight: bolder;
	}
	
	#selected_movie {
		color: #fff;
		font-weight: bold;
		font-size: 25pt;
		margin-top: 80px;
		float: left;
		margin-right: 15px;
		padding-right: 20px;
		margin-left: 50px;
		border-right: 2px solid #fff;
	}
	
	#selected_theater	{
		 color: #fff;
		 font-weight: bold;
		 font-size: 25pt;
		 margin-top: 80px;
		 float: left;
		 margin-right: 15px;
		 padding-right: 20px;
		 border-right: 2px solid #fff;
	}
	
	#etc {
		 color: #fff;
		 font-weight: bold;
		 font-size: 25pt;
		 margin-top: 80px;
		 float: left;
	}
	
	#nextArea1, #nextArea2, #nextArea3 {
		float: right;
	}
	
	.discount_method, .payment {
		font-size: 30px;
		height: 50px;
		background-color: #333; 
		color: #E0E0E0; 
		font-weight: bold;
		float: left;
		padding-top: 5px;
	}
	
	#discount_method1, #payment_method1 {
		width: 30%;
		padding-left: 20px;
	}
	
	#discount_method2, #payment_method2 {
		width: 40%;
		text-align: center;
	}
	
	#discount_method3, #payment_method3 {
		width: 30%;
		text-align: right;
		padding-right: 20px;
	}
	
	#discount_method3 {
		cursor: pointer;
	}
	
	#discount_title {
		background-color: #DEDED6;
		color: #333;
		clear: both;
		width: 100%;
		height: 70px;
		font-size: 30px;
		padding-top: 15px;
		padding-left: 15px;
	}
	
	#discount_content {
		background-color: #FEF0E4;
		height: 100px;
		width: 100%;
	}
	
	#payment_content {
		clear: both;
		padding-top: 30px;
		background-color: #FEF0E4;
		height: 500px;
		width: 100%;
	}
	
	#discount_coupon{
		width: 100%;
		float: left;
		margin-top: 10px;
		padding-left: 2.5%;
		padding-right: 2.5%;
		
	}
	
	#discount_coupon>div>span{
		height: 30px;
		color: #02283D;
		font-size: 20px;
		font-weight: bold;
	}
	
	#discount_coupon>div>div>button {
		margin-left: 5px;
	}
	
	
	
	.coupon_title {
		border-bottom: 1px solid #DEDED6;
		float: left;
		margin-top: 20px;
	}
	
	#coupon_title1 {
		width: 60%;
		
	}
	
	#coupon_title2 {
		width: 40%;
	}
	
		
	#coupon_content {
		clear: both;
		padding-top: 20px;
	}
	
	#point_ul>li {
		clear: both;
	}
	
	.select {
		background-color: #333;
		color: white;
	}
	
	.movie_section {
		margin-left : -15px;
		width : 100%;
		height : 35px;
		margin-bottom : 5px;
		
	}
	
	.Saturday {
		color: blue;
	}
	
	.movie_section>span {
		height:100%;
		width: 180px;
		font-size: 12pt;
		overflow: hidden;
		padding-top:2px;
		line-height: 35px;
	}
	
	.Sunday {
		color: red;
	}
	
	label {
		float:left;
		margin-right: 5px;
	}
	
	.couponList>input {
		float:left;
	}
	
	.couponList {
		clear:both;
		padding:5px;
	}
	
	.couponList>div {
		width:300px;
	}
	
	#button_group {
		float:right;
	}
	
	.grade {
		float:left;
		border-radius:30px;
		width:25px;
		height:25px;
		text-align:center;
		padding-top:1px;
		color:white;
		font-size:10pt;
		margin-top: 5px;
	}
	
	.grade전체 {
		font-size:7pt;
		border:1px solid green;
		background-color: green;
		padding-top:5px;
	}
	
	.grade청불 {
		font-size:7pt;
		border:1px solid red;
		background-color: red;
		padding-top:5px;
	}
	
	.grade12 {
		border:1px solid blue;
		background-color: blue;
	}
	
	.grade15 {
		border:1px solid orange;
		background-color: orange;
	}
	
	.sideMenu{
		width: 30%;
		float:right;
		padding-left: 50px;
	}
	
	#demo {
		float:left;
		width: 60%;
	}
	
	.payTitle {
		background-color: black;
		color: white;
		font-size: 10pt;
		font-weight: bold;
		border-top-left-radius: 15px;
		border-top-right-radius: 15px;
		width: 200px;
		text-align: center;
	}
	
	.payContent {
		background-color: white;
		border-radius: 15px;
		text-align: center;
		height: 100%;
	}
	
	.sideGroup {
		border: 1px solid #000;
		border-radius: 15px;
		height: 50px;
		width: 200px;
		margin-bottom: 25px;
	}
	
	#pay {
		width: 180px;
		margin: 0px auto;
	}
	
	#reservation1, #reservation2, #reservation {
		width: 1140px;
		margin: 0px auto;
	}
	
	.modal.modal-center {
		text-align: center;
	}
	
	.modal.modal-center:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
	
	.modal-dialog.modal-center {
		display: inline-block;
		text-align: left;
		vertical-align: middle;
	}


	</style>

	
	<div id="reservation1">
		<div id="button_group">
			<button class="btn btn-warning btn-md" onclick="resetFirst();"><span class="glyphicon glyphicon-repeat" /><div id="reset">예매다시하기</div></button>
		</div>
		
		<br>
		<br>
		<div id="menu1">
			<div id="menu1-1" class="menu1">영화</div>
			<div id="menu1-2" class="menu1">극장</div>
			<div id="menu1-3" class="menu1">날짜</div>
			<div id="menu1-4" class="menu1">시간</div>
		</div>
		
		<div id="content1">
			<div id="content1-1" class="content1">
				<div>
					<div id="movie_second_menu1" class="movie_second_menu" onclick="order_reservation()">예매율순</div>
					<div id="movie_second_menu2" class="movie_second_menu" onclick="order_alphabet()">가나다순</div>
					<div id="movie_second_menu3" class="movie_second_menu">&nbsp;</div>
				</div>
				<br>
				<div id="movie_list"></div>
			</div>
			
			<div id="content1-2" class="content1">
				<div>
					<div id="favoriteCGV1">
						자주가는 CGV<br>
						<br>
						<br>
					</div>
					<div id="favoriteCGV2">
						CGV1<br>
						CGV2<br>
						CGV3
					</div>
				</div>
				<br>
				<div style="height: 300px">
					<ul id="theater_state">
						<c:forEach items="${ localList }" var="local_list">
							<c:choose>
								
								
								<c:when test="${local_list.localName == tempInfo.theater_area}">
									<li class="localName theater_state select_theater_state" style="float: none; display: inline-block; list-style: none;"  onclick="theater_local('${local_list.localName}')" >
										<div>${local_list.localName} (${local_list.localCount})</div>
									</li>
								</c:when>
								
								<c:when test="${local_list.localName == '서울' && tempInfo.theater_area == null}">
									<li class="localName theater_state select_theater_state" style="float: none; display: inline-block; list-style: none;"  onclick="theater_local('${local_list.localName}')" >
										<div>${local_list.localName} (${local_list.localCount})</div>
									</li>
								</c:when>
								
								<c:when test="${local_list.localName == '서울' && tempInfo.theater_area == ''}">
									<li class="localName theater_state select_theater_state" style="float: none; display: inline-block; list-style: none;"  onclick="theater_local('${local_list.localName}')" >
										<div>${local_list.localName} (${local_list.localCount})</div>
									</li>
								</c:when>
	
								<c:otherwise>
									<li class="localName theater_state" style="float: none; display: inline-block; list-style: none;"  onclick="theater_local('${local_list.localName}')" >
										<div>${local_list.localName} (${local_list.localCount})</div>
									</li>
								</c:otherwise>
								
							</c:choose>
						</c:forEach>
						
					</ul>
					<div class="theater_city">
						<div id = "theater_detail"></div>
					</div>
				</div>
			</div>
			<div id="content1-3" class="content1">
				<div style="text-align: center; font-size: 15pt;" id = "year"></div><br>
				<div style="margin-top: -20px; text-align: center; font-size: 30pt;" id = "month"></div><br>
				<div id="calender_date">
				
				</div>
				
			</div>
			<div id="content1-4" class="content1">
				<div id="timetable">
					
				</div>
			</div>
		</div>
	</div>
	
	<div id="reservation2">
		<table>
			<tr>
				<th id="title2-1">☞ 관람 할인 안내</th>
				<th id="title2-2">인원/좌석</th>
				<th id="title2-3">&nbsp;</th>
			</tr>
			<tr>
				<td style="width: 500px;">
					<div class="seat_num">
						<div class="seat_title" style="float: left;">일반</div>
						<div id="nomal_defalut" class="seat_nomal">0</div>
						<div class="seat_nomal">1</div>
						<div class="seat_nomal">2</div>
						<div class="seat_nomal">3</div>
						<div class="seat_nomal">4</div>
						<div class="seat_nomal">5</div>
						<div class="seat_nomal">6</div>
						<div class="seat_nomal">7</div>
						<div class="seat_nomal">8</div>
					</div>
					<div class="seat_num">
						<div class="seat_title">청소년</div>
						<div id="youth_defalut" class="seat_youth" style="margin-left:95px;">0</div>
						<div class="seat_youth">1</div>
						<div class="seat_youth">2</div>
						<div class="seat_youth">3</div>
						<div class="seat_youth">4</div>
						<div class="seat_youth">5</div>
						<div class="seat_youth">6</div>
						<div class="seat_youth">7</div>
						<div class="seat_youth">8</div>
					</div>
					<div class="seat_num">
						<div class="seat_title">우대</div>
						<div id="advantage_defalut" class="seat_advantage" style="margin-left:95px;">0</div>
						<div class="seat_advantage">1</div>
						<div class="seat_advantage">2</div>
						<div class="seat_advantage">3</div>
						<div class="seat_advantage">4</div>
						<div class="seat_advantage">5</div>
						<div class="seat_advantage">6</div>
						<div class="seat_advantage">7</div>
						<div class="seat_advantage">8</div>
					</div>
				</td>
				<td style="width: 200px; text-align: center;">
					<div>좌석붙임설정</div>
					<div style="margin-left: 30px; height: 25px;">
						<label onclick="seatFormClick(1);">
							<input class ="seat_number" name="seat_num" type="radio" value="1">
							<div class="box"></div>
						</label>

						<label onclick="seatFormClick(2);">
							<input class ="seat_number" name="seat_num" type="radio" value="2">
							<div class="box"></div><div class="box"></div>
						</label>
						
						
						<label onclick="seatFormClick(3);">
							<input class ="seat_number" name="seat_num" type="radio" value="3">
							<div class="box"></div><div class="box"></div><div class="box"></div>
						</label>
						
						<label onclick="seatFormClick(4);">
							<input class ="seat_number" name="seat_num" type="radio" value="4">
							<div class="box"></div><div class="box"></div><div class="box"></div><div class="box"></div>
						</label>
					</div>
				</td>
				<td>
					<div>선택하신 상영관/시간</div>
					<div style="margin-top: 10px;">
						<span id="plex" style="font-size: 12pt; font-weight: bolder;"></span>
						(총&nbsp;<span id="seat_totcnt">0</span>석)
						<span id="current_time" style="font-size: 12pt;">21:30 - 23:38</span>
						(잔여 <span id="remainSeat">132석</span>)
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="border-right: 0px solid #999;">
					<div id="screen">screen</div>
					<div style="height:50px"><span></span></div>
					<div id="seat_table"></div>
				</td>
				<td style="border-left: 0px solid #999;">
					<div id="selected"></div><div>선택</div><br>
					<div id="reservationed"></div><div>예매완료</div><br>
					
					<div id="prime"></div><div>Prime Zone</div><br>
					<div id="standard"></div><div>Standard Zone</div><br>
					<div id="economy"></div><div>Economy Zone</div><br>
					<div id="handicapped"></div><div>장애인석</div><br>
					<div id="sweetbox"></div><div>SweetBox</div><br>
				</td>
			</tr>
		</table>
	</div>
	<div id="reservation3">
		<div id="discount_method1" class="discount_method">STEP 1</div>
		<div id="discount_method2" class="discount_method">할인수단 선택</div>
		<div id="discount_method3" class="discount_method"><span id="resetBtn">다시하기</span></div>
		<div id="discount_title" class="discount_title">CGV 할인쿠폰 </div>
		<div id="discount_content">
			<div id="discount_coupon">
				<div>
					<span>●CGV 할인쿠폰</span><input type="button" class="btn btn-warning" onclick="discountList()" style="margin-left: 5px;" value="쿠폰목록"><input type="button" class="btn btn-warning" onclick="discountCancel()" style="margin-left: 5px;" value="취소하기">
				</div>
				<div class="modal modal-center fade" id="myModal" role="dialog" style="margin: 0 auto;">
					<div class="modal-dialog modal-sm modal-center">
						<div class="modal-content">
							<c:choose>
								<c:when test="${fn:length(couponList)>0 }">
									<c:forEach items="${ couponList }" var="coupon_list">
										<c:if test="${coupon_list.member_id == member_id && coupon_list.used == 'N'}">
												<label class="couponList">
													<input type="radio" class="coupon" name="coupon" value="${coupon_list.no}/${coupon_list.coupon_amount}">
													<div>${coupon_list.coupon_amount}% 할인쿠폰 </div>
												</label>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div>사용 가능한 CGV할인쿠폰이 없습니다.</div>
								</c:otherwise>
							</c:choose>
							<div class="modal-footer" style="border: 0px;">
								<button type="button" class="btn btn-warning" onclick="discountApply()" data-dismiss="modal">사용하기</button>
							</div>
						</div>
					</div>
				</div>
				<div id="coupon_content">
				
				</div>
			</div>
		</div>
		
		<div id="payment_method1" class="payment">STEP 2</div>
		<div id="payment_method2" class="payment">결제정보 입력</div>
		<div id="payment_method3" class="payment"></div>
		<div id="payment_content">
			
			
		
			<div id="demo" class="col-md-8 col-md-offset-1 col-xs-11">

				<form name="frm_payment" id="frm_payment" class="form-horizontal">
					<div class="form-group nonInput" style="display: none;">
						<label for="reservationCode" class="col-md-4 col-xs-4">예매번호</label>
						<div type="text" name="reservationCode" id="reservationCode" value="" class="col-md-8 col-xs-8"/></div>
					</div>
					<div class="form-group nonInput" style="display: none;">
						<label for="movieName" class="col-md-4 col-xs-4">영화명</label>
						<div type="text" name="movieName" id="movieName" value="" class="col-md-8 col-xs-8"></div>
					</div>
					
					
					<div class="form-group">
						<label for="payMethod" class="col-md-4 col-xs-4">결제수단</label>
						<select name="payMethod" id="payMethod" class="col-md-8 col-xs-8">
							<option value="card">신용카드</option>
							<option value="trans">실시간 계좌이체</option>
							<option value="vbank">가상계좌</option>
							<option value="phone">휴대폰 소액결제</option>
						</select>
	                </div>

					
					<div class="form-group">
						<label for="email" class="col-md-4 col-xs-4">이메일주소</label>
						<input type="text" name="email" id="email" value="${ member.email }" class="col-md-8 col-xs-8"/>
					</div>
					<div class="form-group">
						<label for="buyerName" class="col-md-4 col-xs-4">성함</label>
						<input type="text" name="buyerName" id="buyerName" value="${ member.member_name }" class="col-md-8 col-xs-8"/>
					</div>
					<div class="form-group">
						<label for="tel" class="col-md-4 col-xs-4">전화번호</label>
						<input type="text" name="tel" id="tel" value="${ member.tel }" class="col-md-8 col-xs-8"/>
					</div>
					<div class="form-group">
						<label for="address" class="col-md-4 col-xs-4">주소</label>
						<input type="text" name="address" id="address" value="${ member.address } " class="col-md-8 col-xs-8"/>
					</div>
					<div class="form-group" style="display: none;">
						<label for="post" class="col-md-4 col-xs-4">우편번호</label>
						<input type="text" name="post" id="post" value="" class="col-md-8 col-xs-8"/>
					</div>
					<div class="form-group" style="display: none;">
						<label for="vbank_due" class="col-md-4 col-xs-4">가상계좌 입금일자<br>(YYYYMMDD)</label>
						<input type="text" name="vbank_due" id="vbank_due" value="" class="col-md-8 col-xs-8"/>
					</div>
					
					
				</form>
				<div id="responser"></div>
			</div>
			<div class="sideMenu">
				<div class="sideGroup">
					<label for="originPay" class="payTitle">금액</label>
					<div id="originPay" class="payContent"></div>
				</div>
				<div class="sideGroup">
					<label for="discountPay" class="payTitle">총 할인금액</label>
					<div id="discountPay" class="payContent">0</div>
				</div>
				<div class="sideGroup">
					<label for="pay" class="payTitle">결제내역</label>
					<div class="payContent"><input type="text" name="pay" id="pay" value="1000"></div>
				</div>
			</div>
		</div>
	</div>

	<div id="info_box">
		<div id="backArea"><button id="backBtn" onclick="backStep()"><span>&lt;</span><br/>영화선택</button></div>
		<div id="backArea2"><button id="backBtn2" onclick="backStep2()"><span>&lt;</span><br/>좌석선택</button></div>
		<div id="selected_movie">
			영화선택
		</div>
		<div id="selected_theater">
			극장선택
		</div>
		<div id="etc">
			> 좌석선택 > 결제
		</div>
		<div id="nextArea1"><button id="nextBtn1" onclick="nextStep();"><span>&gt;</span><br/>좌석선택</button></div>
		<div id="nextArea2"><button id="nextBtn2" onclick="lastStep()"><span>&gt;</span><br/>결제선택</button></div>
		<div id="nextArea3"><button id="nextBtn3" onclick="payment()"><span>&gt;</span><br/>결제하기</button></div>
	</div>
	
	<form id="frm" name="frm">
		<input type="text" id="movie" name="movie" size="50" maxlength="100" style="display:none;">
		<input type="text" id="theater" name="theater" size="50" maxlength="100" style="display:none;">
		<input type="text" id="years" name="year" size="50" maxlength="100" style="display:none;">
		<input type="text" id="months" name="month" size="50" maxlength="100" style="display:none;">
		<input type="text" id="dates" name="date" size="50" maxlength="100" style="display:none;">
		<input type="text" id="start_time" name="start_time" size="50" maxlength="100" style="display:none;">
		<input type="text" id="plex" name="plex" size="50" maxlength="100" style="display:none;">
		<input type="text" id="seat_cnt" name="seat_cnt" size="50" maxlength="100" style="display:none;">
		<input type="text" id="seat1" name="seat1" size="50" maxlength="100" style="display:none;">
		<input type="text" id="seat2" name="seat2" size="50" maxlength="100" style="display:none;">
		<input type="text" id="seat3" name="seat3" size="50" maxlength="100" style="display:none;">
		<input type="text" id="seat4" name="seat4" size="50" maxlength="100" style="display:none;">
		<input type="text" id="seat5" name="seat5" size="50" maxlength="100" style="display:none;">
		<input type="text" id="seat6" name="seat6" size="50" maxlength="100" style="display:none;">
		<input type="text" id="seat7" name="seat7" size="50" maxlength="100" style="display:none;">
		<input type="text" id="seat8" name="seat8" size="50" maxlength="100" style="display:none;">
		<c:choose>
			<c:when test="${tempInfo.dataFlag != null}">
				<script>
					
					var dataFlag = ${ tempInfo.dataFlag };
					var theaterId = '${ tempInfo.theater_id }';
					var movieId = '${ tempInfo.movie_id }';
					var plexNum = '${ tempInfo.plex_num }';
					var startTime = '${ tempInfo.start_time }';
					
					var theater_area = '${ tempInfo.theater_area }';
				</script>
			</c:when>
			<c:otherwise>
				<script>
					var dataFlag = 0;
					var theaterId = "";
					var movieId = "";
					var plexNum = "";
					var startTime = "";
					var theater_area = "";
				</script>
			</c:otherwise>
		</c:choose>
		<c:if test="${tempInfo.dataFlag != 0}">
			
		</c:if>
			
	</form>
	
	<form id="finalFrm" name="finalFrm" method="post" action="/reservation">
		<input type="text" id="theaterid" name="theaterid" size="50" maxlength="100" style="display:none;">
		<input type="text" id="reservationcode" name="reservationcode" size="50" maxlength="100" style="display:none;">
	</form>
	
	<script type="text/javascript">

		var checkMovie = false;
		var checkTheater = false;
		var checkDate = false;
		var currentMoviePage = "reservation_rate";
		var currentTheaterPage = "서울";

		var reservationCode = "";

		var seat_count = 0;
		var totalPrice = 0;
		var discountPrice = 0;

		var veiwDay = "";
		var reservationDay = "";
		var reservationFlag = true;
		var couponNo = "";
		var couponApply = false;
		var timeStatus = 0;
		var disCountPrice = 0;
		var disCountAmount = 0;
		var price = 0;
		var discountMoney = 0;
		var nomalCount = 0;
		var youthCount = 0;
		var advantageCount = 0;
		var countSum = 0;
		var totalSeat = 0;
		var currentCheckedValue = 0;
		var radioCheked = 0;
		var endTime = "";
		var selectFlag = 0;
		var seat_row = "";
		var seat_col = "";
		var seat1 = "";
		var seat2 = "";
		var seat3 = "";
		var seat4 = "";
		var seat5 = "";
		var seat6 = "";
		var seat7 = "";
		var seat8 = "";
		var seat = "";
		var seatType1 = "";
		var seatType2 = "";
		var seatType3 = "";
		var seatType4 = "";
		var seatType5 = "";
		var seatType6 = "";
		var seatType7 = "";
		var seatType8 = "";
		var seatNomalCnt = "";
		var seatYouthCnt = "";
		var seatAdvantageCnt = "";
		
		//reservation1
		
		$('#resetBtn').click(function() {
			location.href="/ticket";
		});
		
		function resetFirst() {
			location.href="/ticket";
		}
		
		function nextStep(){
			
			if(frm.months.value < 10 && frm.months.value.length != 2){
				frm.months.value = "0" + frm.months.value;
			}
			
			if(frm.plex.value == "" || frm.plex.value == null) {
				alert("시간을 선택해 주세요");	
			} else {
		
				$("#reservation1").hide();
				$("#reservation2").show();
				$("#backArea").show();
				$("#nextArea1").hide();
				$("#nextArea2").show();
				$("#nextBtn1").hide;
				$("#plex").text(frm.plex.value + "관");
				reservationCode = $("#years").val() + $("#months").val() 
								+ $("#dates").val() + movieId + theaterId + frm.plex.value;
		
			}
		}

		function getTheaterList(page) {
			
			if(page == null){
				page = currentTheaterPage;
			}
			
			$.ajax({
				type:'get',
				url:'/ticket/theater/' + page,
				headers: {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "GET",
				},
				dataType:'json',
				data : '',
				success : function(result){
					setTheaterList(result.l);
				}
			});
		}
		
		function setTheaterList(data) {
			var result = "";
			
			if(dataFlag == 0 || dataFlag == 2){
				$(data).each(function() {
					result += "<div onclick='theater_select(" + '"' + this.theater_name + '", ' + '"' + this.theater_id + '"' 
							+ ")'><li style='float: none; display: inline-block;'>" + this.theater_name + "</li></div>";
				});
			} else if(dataFlag ==1) {
				$(data).each(function() {
					
					if(this.theater_id == theaterId){
						result += "<div onclick='theater_select(" + '"' + this.theater_name + '", ' + '"' + this.theater_id + '"' 
						+ ")' class='select'><li style='float: none; display: inline-block;'>" + this.theater_name + "</li></div>";
						theater_select(this.theater_name, this.theater_id);
					} else {
					result += "<div onclick='theater_select(" + '"' + this.theater_name + '", ' + '"' + this.theater_id + '"' 
							+ ")'><li style='float: none; display: inline-block;'>" + this.theater_name + "</li></div>";
					}
					
				});
			}
			
			result += "";
		
			document.getElementById("theater_detail").innerHTML = result;
		}
		
		if(dataFlag == 0 || dataFlag == 2){
			getTheaterList("서울");
			
		} else {
			
			getTheaterList(theater_area);
		}
		getMovieList("reservation_rate");
		
		function getTimetable(movie, theater, date) {
			
			$.ajax({
				type:'get',
				url:'/ticket/timetable/' + movie + '/' + theater + '/' + date,
				headers: {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "GET",
				},
				dataType:'json',
				data : '',
				success : function(result){
					setTimetableList(result.l,result.t,result.n);
					
				}
			});
		}
		
		function order_reservation() {
			$('#order').val("reservation_rate");
			getMovieList("reservation_rate");
		}
		
		function order_alphabet() {
			$('#order').val("alphabet");
			getMovieList("alphabet");
		}
		
		function theater_local(value) {			
			if(event.target.nodeName == 'DIV'){
				$(event.target).parent().parent().children().removeClass("select_theater_state");				
				$(event.target).parent().addClass("select_theater_state");				
				
			} else if(event.target.nodeName == 'LI'){
				$(event.target).parent().children().removeClass("select_theater_state");				
				$(event.target).addClass("select_theater_state");			
			}			
			getTheaterList(value);
		}
		
		function movie_select(title, movie_id) {
			checkMovie = false;
			document.getElementById("selected_movie").innerHTML = title;
			movieId = movie_id
			frm.movie.value = title;
			$('#movieName').text(title);
			
			if(event.target.nodeName == 'SPAN'){
				
				$(event.target).parent().parent().children().removeClass("select");
				
				//alert(event.target.nodeName);
				$(event.target).parent().addClass("select");
			} else if(event.target.nodeName == 'DIV') {
				$(event.target).parent().children().removeClass("select");
				
				//alert(event.target.nodeName);
				$(event.target).addClass("select");
			}
		
			checkMovie = true;
			interval();
		}
		
		function theater_select(theater_name, theater_id) {
			
			if(event.target.nodeName == 'LI'){
				
				$(event.target).parent().parent().children().removeClass("select");
				
				//alert(event.target.nodeName);
				$(event.target).parent().addClass("select");
			} else if(event.target.nodeName == 'DIV'){
				
				$(event.target).parent().children().removeClass("select");
				
				//alert(event.target.nodeName);
				$(event.target).addClass("select");
			}
			
			
			
			
			checkTheater = false;
			document.getElementById("selected_theater").innerHTML = theater_name;
			theaterId = theater_id;
			frm.theater.value = theater_name;
			checkTheater = true;
			interval();
		}
		
		function getMovieList(page) {
			
			if(page == null){
				page = currentMoviePage;
			}
						
			$.ajax({
				type:'get',
				url:'/ticket/movie/' + page,
				headers: {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "GET",
				},
				dataType:'json',
				data : '',
				success : function(result){
					setMovieList(result.l);
				}
			});
		}
		
		function setMovieList(data) {
			var result = "<div>";
			
			$(data).each(function() {
				
				if(this.movie_id == movieId){
					result += "<div class='movie_section select' class='movie_section' onclick='movie_select(" 
							+ '"' + this.title + '", ' + '"' + this.movie_id + '"' + ")'><div class='grade grade" + this.rating +"'>"
							+ this.rating + "</div><span>" + this.title + "</span></div>";
					movie_select(this.title, this.movie_id);
				} else {
					result += "<div class='movie_section' onclick='movie_select(" 
							+ '"' + this.title + '", ' + '"' + this.movie_id + '"' + ")'><div class='grade grade" + this.rating +"'>"
							+ this.rating + "</div><span>" + this.title + "</span></div>";
				}
			});
			
			result += "</div>";
		
			document.getElementById("movie_list").innerHTML = result;
		}
		
		
		
		function setTimetableList(time, plex, extraSeatNum) {
			
			var timetableTime = "";
			var result = "";
			var number = 1;
			if(time == "" || plex == ""){
				result += '<div></div>';
				document.getElementById("timetable").innerHTML = result;
			}else {
				$(plex).each(function() {
					result += '<div style="margin-left: 20px; margin-bottom: 5px; float:none; clear:both;">' 
						+ '<span style="color: #993800; font-weight: bold; float:left">'
						+ this.plex_type + '&nbsp;</span> <span style="font-weight: bold; float:left;">' + this.plex_number + '관 &nbsp;</span><span style="float:left;">'
						+'(총</span><div style="float:left;">' + this.plex_seat_cnt + '</div>석)</div>';
					
					var totalSeatNum = this.plex_seat_cnt;
						$(time).each(function() {
							
							if(this.start_time > "${today}"){
								
								if(dataFlag == 0 || dataFlag == 2){
									
									result += '<div id="time" onclick="timetable(' + "'" + this.start_time.substring(11,16) + "',  " 
											+ "'" + this.plex_number + "'," + "'" + totalSeatNum + "'" +');"><span class="timetable_time">' 
											+ this.start_time.substring(11,16) + '</span><div class="timetable_seat">';
											
									timetableTime = this.start_time;
									$(extraSeatNum).each(function() {
										if(timetableTime == this.startTime){
											result += this.extraSeatCount +'석</div></div>';
										}
									});
								} else {
									var compareStartTime = startTime.substring(11,16);

									if(compareStartTime == this.start_time.substring(11,16)){
										result += '<div id="time" onclick="timetable(' + "'" + this.start_time.substring(11,16) + "',  " 
												+ "'" + this.plex_number + "'," + "'" + totalSeatNum + "'" +');"><span class="timetable_time select">' 
												+ this.start_time.substring(11,16) + '</span><div class="timetable_seat">';
								
										timetableTime = this.start_time;
										$(extraSeatNum).each(function() {
											if(timetableTime == this.startTime){
												result += this.extraSeatCount +'석</div></div>';
											}
										});
										timetable(this.start_time.substring(11,16), this.plex_number, totalSeatNum)
									} else {
										result += '<div id="time" onclick="timetable(' + "'" + this.start_time.substring(11,16) + "',  " 
												+ "'" + this.plex_number + "'," + "'" + totalSeatNum + "'" +');"><span class="timetable_time">' 
												+ this.start_time.substring(11,16) + '</span><div class="timetable_seat">';
								
										timetableTime = this.start_time;
										$(extraSeatNum).each(function() {
											if(timetableTime == this.startTime){
												result += this.extraSeatCount +'석</div></div>';
											}
										});
									}
								}
								
								document.getElementById("timetable").innerHTML = result;
							}
							
						});
					number++;
				});
			}
		
		}
		
		// 여기여기
		function timetable(time, plex ,totalSeatNum){
			
			var remainSeatNum = $(event.target).parent().children('DIV').text();
			endTimeGenerate(time,120);
			var Alltime = time + " - " + endTime;
			$("#remainSeat").text(remainSeatNum);
			$("#seat_totcnt").text(totalSeatNum);
			$("#current_time").text(Alltime);
			
			
					
			if(event.target.nodeName == 'SPAN'){
				
				$(event.target).parent().parent().children().find('SPAN').removeClass("select");
				
				//alert(event.target.nodeName);
				$(event.target).addClass("select");
			} else if(event.target.nodeName == 'DIV') {
				$(event.target).parent().parent().children().find('SPAN').removeClass("select");
				
				//alert(event.target.nodeName);
				$(event.target).parent().find('SPAN').addClass("select");
			}
				
			frm.start_time.value = time;
			frm.plex.value = plex;
		
			getSeat(plex);
			
		}
		
		function dateSelect(i){

			checkDate = false;
			
			if(event.target.nodeName == 'SPAN'){
				
				$(event.target).parent().parent().children().removeClass("select");
				
				//alert(event.target.nodeName);
				$(event.target).parent().addClass("select");
			} else if(event.target.nodeName == 'DIV') {
				$(event.target).parent().children().removeClass("select");
				
				//alert(event.target.nodeName);
				$(event.target).addClass("select");
			}
			
			var date = document.getElementById("date"+i).value;
			frm.years.value = $('#year'+i).val();
			frm.months.value = $('#month'+i).val();
			frm.dates.value = date;
			checkDate = true;
			interval();
		}
		
		function today() {
			var now = new Date();
			var year = now.getFullYear();
			var month = now.getMonth()+1;
			var date = now.getDate();
			var day = now.getDay();
			
			var week = new Array("일", "월", "화", "수", "목", "금", "토");
			
			if(date < 10)
				date = "0" + date;
			
			document.getElementById("year").innerHTML = year;
			document.getElementById("year").value = year;
			document.getElementById("month").innerHTML = month;
			document.getElementById("month").value = month;
			
			
			var result = "";
			
			var compareDate = startTime.substring(8,10);
			
			for(i=0;i<10;i++){
				result += '<div style="text-align: center; font-size: 15pt; display:none; margin-bottom:20px;" id = "year'+i+'"></div>'
						+ '<div style="margin-top: -20px; text-align: center; font-size: 30pt; display:none; margin-bottom:20px;" id = "month'+i+'"></div>'
						+ "<div id='dateSection"+i+"' class='calender' onclick='dateSelect("+ i +")'>" 
						+ "<span style='float: left; font-size: 13pt; margin-right: 5px; font-weight: bold' id='day" + i 
						+ "'></span>" + "<span style='float: left; font-size: 13pt; font-weight: bold;' id='date" + i 
						+ "'></span>" + "</div>";
			}
			result += "";
			document.getElementById("calender_date").innerHTML = result;
			
			for(i=0;i<10;i++){
				date = now.getDate();
				day = now.getDay();
				month = now.getMonth()+1;
				year = now.getFullYear();
				
				if(compareDate == date) {
					
					$("#dateSection"+i).addClass("select");
				}
				document.getElementById("year"+i).innerHTML = year;
				document.getElementById("year"+i).value = year;
				document.getElementById("month"+i).innerHTML = month;
				document.getElementById("month"+i).value = month;
				
				document.getElementById("date"+i).innerHTML = date;
				document.getElementById("date"+i).value = date;
				document.getElementById("day"+i).innerHTML = week[now.getDay()];
				document.getElementById("day"+i).value = week[now.getDay()];
				now.setDate(now.getDate()+1);
				
				if($("#date"+i).val() == 1) {
					$("#year"+i).css("display","block");
					$("#year"+i).css("margin-top","25px");
					$("#month"+i).css("display","block");
				}
				
				if($("#day"+i).val() == '토'){
					$("#day"+i).addClass("Saturday");
					$("#date"+i).addClass("Saturday");
				} else if($("#day"+i).val() == '일'){
					$("#day"+i).addClass("Sunday");
					$("#date"+i).addClass("Sunday");
				}
			}
			for(i=0;i<10;i++){
				if($("#dateSection"+i).hasClass("select")) {
					dateSelect(i);
				}
			}
		
		}
		
		function interval(){
			var interval = setInterval(function(){
				if(checkMovie && checkTheater && checkDate){
					
					clearInterval(interval);
					var movie = $("#movie").val();
					var month = $("#month").val();
					
					if(month < 10){
						month = "0" + month;
					}
					
					var days = $("#dates").val();
					
					if(days < 10){
						days = "0" + days;
					}
					
					var theater = $("#theater").val();
					var date = $("#year").val() + '-' + month + '-';
					date += days;
					
					getTimetable(movie, theater, date);
				} else {
					
				}
			}, 50)
		}
		
		
		//reservation2
		
		function totalSeatCnt() {
			//alert("11");
			seatNomalCnt = $(".seat_count_nomal").text();
			seatYouthCnt = $(".seat_count_youth").text();
			seatAdvantageCnt = $(".seat_count_advantage").text();
			
			totalSeat = Number(seatNomalCnt) + Number(seatYouthCnt) + Number(seatAdvantageCnt);
			
		}
		
		function seatClick() {
			
			$(".seat_standard, .seat_prime, .seat_economy, .seat_handicapped, .seat_sweetbox").click(function() {
				if(selectFlag == 1 && countSum == 0){
					alert("다시 좌석을 선택합니다!");
					$(".seat_clicked").removeClass("seat_over");
					$(".seat_clicked").removeClass("seat_nonselect");
					$(".seat_clicked").removeClass("seat_clicked");
					selectFlag = 0;
					
					for(var i = 1; i <=8; i++){
						$('#seat' + i).val("");
					}
					
					countSum = totalSeat;
				} else if($(this).hasClass("seat_nonselect") && $(this).hasClass("seat_clicked") && selectFlag == 0) {
		
					if(currentCheckedValue == 1){
						
						$(this).removeClass("seat_clicked");
						$(this).removeClass("seat_nonselect");
						
		
						seat_row = $(this).parent().children("th").text();
						seat_col = $(this).text();
						seat = seat_row + seat_col;
						
						for(var i = 1; i <=8; i++){
							if($('#seat' + i).val() == seat){
								$('#seat' + i).val("");
							}
						}
						countSum += currentCheckedValue;
						seat_count -= 1;
						
					} else if(currentCheckedValue == 2) {
						
						if($(this).hasClass("seat_nonselect") && $(this).hasClass("seat_clicked") &&
						   $(this).next().hasClass("seat_nonselect") && $(this).next().hasClass("seat_clicked"))
						{
							$(this).removeClass("seat_clicked");
							$(this).removeClass("seat_nonselect");
							$(this).next().removeClass("seat_clicked");
							$(this).next().removeClass("seat_nonselect");
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).next().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
						} else if($(this).hasClass("seat_nonselect") && $(this).hasClass("seat_clicked") &&
								  $(this).prev().hasClass("seat_nonselect") && $(this).prev().hasClass("seat_clicked"))
						{
							$(this).removeClass("seat_clicked");
							$(this).removeClass("seat_nonselect");
							$(this).prev().removeClass("seat_clicked");
							$(this).prev().removeClass("seat_nonselect");
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).prev().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
						}
						
						countSum += currentCheckedValue;
						seat_count -= 2;
						
					} else if(currentCheckedValue == 3) {
						if($(this).hasClass("seat_nonselect") && $(this).hasClass("seat_clicked") &&
						   $(this).next().hasClass("seat_nonselect") && $(this).next().hasClass("seat_clicked") &&
						   $(this).next().next().hasClass("seat_nonselect") && $(this).next().next().hasClass("seat_clicked"))
						{
							$(this).removeClass("seat_clicked");
							$(this).removeClass("seat_nonselect");
							$(this).next().removeClass("seat_clicked");
							$(this).next().removeClass("seat_nonselect");
							$(this).next().next().removeClass("seat_clicked");
							$(this).next().next().removeClass("seat_nonselect");
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).next().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).next().next().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
						} else if($(this).hasClass("seat_nonselect") && $(this).hasClass("seat_clicked") &&
								  $(this).next().hasClass("seat_nonselect") && $(this).next().hasClass("seat_clicked") &&
								  $(this).prev().hasClass("seat_nonselect") && $(this).prev().hasClass("seat_clicked")) 
						{
							$(this).removeClass("seat_clicked");
							$(this).removeClass("seat_nonselect");
							$(this).next().removeClass("seat_clicked");
							$(this).next().removeClass("seat_nonselect");
							$(this).prev().removeClass("seat_clicked");
							$(this).prev().removeClass("seat_nonselect");
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).next().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).prev().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
						} else if($(this).hasClass("seat_nonselect") && $(this).hasClass("seat_clicked") &&
								  $(this).prev().hasClass("seat_nonselect") && $(this).prev().hasClass("seat_clicked") &&
								  $(this).prev().prev().hasClass("seat_nonselect") && $(this).prev().prev().hasClass("seat_clicked"))
						{
							$(this).removeClass("seat_clicked");
							$(this).removeClass("seat_nonselect");
							$(this).prev().removeClass("seat_clicked");
							$(this).prev().removeClass("seat_nonselect");
							$(this).prev().prev().removeClass("seat_clicked");
							$(this).prev().prev().removeClass("seat_nonselect");
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).prev().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).prev().prev().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
						}
						
						countSum += currentCheckedValue;
						seat_count -= 3;
						
					} else if(currentCheckedValue == 4) {
						if($(this).hasClass("seat_nonselect") && $(this).hasClass("seat_clicked") &&
						   $(this).next().hasClass("seat_nonselect") && $(this).next().hasClass("seat_clicked") &&
						   $(this).next().next().hasClass("seat_nonselect") && $(this).next().next().hasClass("seat_clicked") && 
						   $(this).next().next().next().hasClass("seat_nonselect") && $(this).next().next().next().hasClass("seat_clicked"))
						{
							$(this).removeClass("seat_clicked");
							$(this).removeClass("seat_nonselect");
							$(this).next().removeClass("seat_clicked");
							$(this).next().removeClass("seat_nonselect");
							$(this).next().next().removeClass("seat_clicked");
							$(this).next().next().removeClass("seat_nonselect");
							$(this).next().next().next().removeClass("seat_clicked");
							$(this).next().next().next().removeClass("seat_nonselect");
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).next().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).next().next().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).next().next().next().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
						} else if($(this).hasClass("seat_nonselect") && $(this).hasClass("seat_clicked") &&
								  $(this).next().hasClass("seat_nonselect") && $(this).next().hasClass("seat_clicked") &&
								  $(this).next().next().hasClass("seat_nonselect") && $(this).next().next().hasClass("seat_clicked") && 
								  $(this).prev().hasClass("seat_nonselect") && $(this).prev().hasClass("seat_clicked")) 
						{
							$(this).removeClass("seat_clicked");
							$(this).removeClass("seat_nonselect");
							$(this).next().removeClass("seat_clicked");
							$(this).next().removeClass("seat_nonselect");
							$(this).next().next().removeClass("seat_clicked");
							$(this).next().next().removeClass("seat_nonselect");
							$(this).prev().removeClass("seat_clicked");
							$(this).prev().removeClass("seat_nonselect");
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).next().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).next().next().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).prev().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
						} else if($(this).hasClass("seat_nonselect") && $(this).hasClass("seat_clicked") &&
								  $(this).next().hasClass("seat_nonselect") && $(this).next().hasClass("seat_clicked") &&
								  $(this).prev().hasClass("seat_nonselect") && $(this).prev().hasClass("seat_clicked") && 
								  $(this).prev().prev().hasClass("seat_nonselect") && $(this).prev().prev().hasClass("seat_clicked")) 
						{
							$(this).removeClass("seat_clicked");
							$(this).removeClass("seat_nonselect");
							$(this).next().removeClass("seat_clicked");
							$(this).next().removeClass("seat_nonselect");
							$(this).prev().removeClass("seat_clicked");
							$(this).prev().removeClass("seat_nonselect");
							$(this).prev().prev().removeClass("seat_clicked");
							$(this).prev().prev().removeClass("seat_nonselect");
							
						} else if($(this).hasClass("seat_nonselect") && $(this).hasClass("seat_clicked") &&
								  $(this).prev().hasClass("seat_nonselect") && $(this).prev().hasClass("seat_clicked") && 
								  $(this).prev().prev().hasClass("seat_nonselect") && $(this).prev().prev().hasClass("seat_clicked") &&
								  $(this).prev().prev().prev().hasClass("seat_nonselect") && $(this).prev().prev().prev().hasClass("seat_clicked")) 
						{
							$(this).removeClass("seat_clicked");
							$(this).removeClass("seat_nonselect");
							$(this).prev().removeClass("seat_clicked");
							$(this).prev().removeClass("seat_nonselect");
							$(this).prev().prev().removeClass("seat_clicked");
							$(this).prev().prev().removeClass("seat_nonselect");
							$(this).prev().prev().prev().removeClass("seat_clicked");
							$(this).prev().prev().prev().removeClass("seat_nonselect");
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).prev().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).prev().prev().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
							seat_row = $(this).parent().children("th").text();
							seat_col = $(this).prev().prev().prev().text();
							seat = seat_row + seat_col;
							
							for(var i = 1; i <=8; i++){
								if($('#seat' + i).val() == seat){
									$('#seat' + i).val("");
								}
							}
							
						}
						countSum += currentCheckedValue;
						seat_count -= 4;
					}
				} else if(!$(this).hasClass("seat_nonselect")) {
					
					if(currentCheckedValue == 1){
						
						$(this).addClass("seat_clicked");
						$(this).addClass("seat_nonselect");
		
						for(var i=1; i <=8; i++ ){
							if($('#seat' + i).val() == ""){
								
								seat_row = $(this).parent().children("th").text();
								seat_col = $(this).text();
								$('#seat' + i).val(seat_row + seat_col);
								//.seat_standard, .seat_prime, .seat_economy, .seat_handicapped
								if($(this).hasClass("seat_standard")) {
									$('#seatType' + i).val('standard');
								} else if($(this).hasClass("seat_prime")){
									$('#seatType' + i).val('prime');
								} else if($(this).hasClass("seat_economy")){
									$('#seatType' + i).val('economy');
								} else if($(this).hasClass("seat_handicapped")){
									$('#seatType' + i).val('handicapped');
								}
								break;
							}
						}
						
						countSum -= currentCheckedValue;
						
						seatSelect(1);
						
					} else if(currentCheckedValue == 2) {
						
						if($(this).next().hasClass("seat_nonselect") &&
						   !($(this).prev().hasClass("seat_nonselect"))) 
						{
							$(this).addClass("seat_clicked");
							$(this).prev().addClass("seat_clicked");
							$(this).addClass("seat_nonselect");
							$(this).prev().addClass("seat_nonselect");
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).prev().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							
						} else if(!($(this).next().hasClass("seat_nonselect")) && 
								  $(this).prev().hasClass("seat_nonselect"))
						{
							$(this).addClass("seat_clicked");
							$(this).next().addClass("seat_clicked");
							$(this).addClass("seat_nonselect");
							$(this).next().addClass("seat_nonselect");
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).next().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
		
						} else if(!($(this).next().hasClass("seat_nonselect"))){
							$(this).addClass("seat_clicked");
							$(this).next().addClass("seat_clicked");
							$(this).addClass("seat_nonselect");
							$(this).next().addClass("seat_nonselect");
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).next().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
						}
						
						countSum -= currentCheckedValue;
						
						seatSelect(2);
		
					} else if(currentCheckedValue == 3){
						
						if($(this).next().hasClass("seat_nonselect") && 
						   !($(this).prev().hasClass("seat_nonselect")) && 
						   !($(this).prev().prev().hasClass("seat_nonselect")))
						{
							$(this).addClass("seat_clicked");
							$(this).prev().addClass("seat_clicked");
							$(this).prev().prev().addClass("seat_clicked");
							$(this).addClass("seat_nonselect");
							$(this).prev().addClass("seat_nonselect");
							$(this).prev().prev().addClass("seat_nonselect");
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).prev().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).prev().prev().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
						} else if($(this).next().next().hasClass("seat_nonselect") && 
								  !($(this).next().hasClass("seat_nonselect")) && 
								  !($(this).prev().hasClass("seat_nonselect")))
						{
							$(this).addClass("seat_clicked");
							$(this).prev().addClass("seat_clicked");
							$(this).next().addClass("seat_clicked");
							$(this).addClass("seat_nonselect");
							$(this).prev().addClass("seat_nonselect");
							$(this).next().addClass("seat_nonselect");
							
		
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).next().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).prev().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
						} else if(!($(this).next().hasClass("seat_nonselect")) && 
								  !($(this).next().next().hasClass("seat_nonselect")))
						{
							$(this).addClass("seat_clicked");
							$(this).next().addClass("seat_clicked");
							$(this).next().next().addClass("seat_clicked");
							$(this).addClass("seat_nonselect");
							$(this).next().addClass("seat_nonselect");
							$(this).next().next().addClass("seat_nonselect");
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).next().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).next().next().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
		
						}
						
						countSum -= currentCheckedValue;
						
						seatSelect(3);
						
					} else if(currentCheckedValue == 4){
						
						if($(this).next().hasClass("seat_nonselect") && 
						   !($(this).prev().hasClass("seat_nonselect")) && 
						   !($(this).prev().prev().hasClass("seat_nonselect")) && 
						   !($(this).prev().prev().prev().hasClass("seat_nonselect")))
						{
							$(this).addClass("seat_clicked");
							$(this).prev().addClass("seat_clicked");
							$(this).prev().prev().addClass("seat_clicked");
							$(this).prev().prev().prev().addClass("seat_clicked");
							$(this).addClass("seat_nonselect");
							$(this).prev().addClass("seat_nonselect");
							$(this).prev().prev().addClass("seat_nonselect");
							$(this).prev().prev().prev().addClass("seat_nonselect");
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).prev().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).prev().prev().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).prev().prev().prev().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
						} else if($(this).next().next().hasClass("seat_nonselect") && 
								  !($(this).next().hasClass("seat_nonselect")) && 
								  !($(this).prev().hasClass("seat_nonselect")) && 
								  !($(this).prev().prev().hasClass("seat_nonselect")))
						{
							$(this).addClass("seat_clicked");
							$(this).next().addClass("seat_clicked");
							$(this).prev().addClass("seat_clicked");
							$(this).prev().prev().addClass("seat_clicked");
							$(this).addClass("seat_nonselect");
							$(this).next().addClass("seat_nonselect");
							$(this).prev().addClass("seat_nonselect");
							$(this).prev().prev().addClass("seat_nonselect");
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									sseat_row = $(this).parent().children("th").text();
									seat_col = $(this).prev().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).prev().prev().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).next().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
						} else if($(this).next().next().next().hasClass("seat_nonselect") && 
								  !($(this).next().hasClass("seat_nonselect")) && 
								  !($(this).next().next().hasClass("seat_nonselect")) && 
								  !($(this).prev().hasClass("seat_nonselect"))) 
						{
							$(this).addClass("seat_clicked");
							$(this).next().addClass("seat_clicked");
							$(this).next().next().addClass("seat_clicked");
							$(this).prev().addClass("seat_clicked");
							$(this).addClass("seat_nonselect");
							$(this).next().addClass("seat_nonselect");
							$(this).next().next().addClass("seat_nonselect");
							$(this).prev().addClass("seat_nonselect");
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).next().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).next().next().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).prev().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
						} else if(!($(this).next().hasClass("seat_nonselect")) && 
								  !($(this).next().next().hasClass("seat_nonselect")) && 
								  !($(this).next().next().next().hasClass("seat_nonselect")))
						{
							$(this).addClass("seat_clicked");
							$(this).next().addClass("seat_clicked");
							$(this).next().next().addClass("seat_clicked");
							$(this).next().next().next().addClass("seat_clicked");
							$(this).addClass("seat_nonselect");
							$(this).next().addClass("seat_nonselect");
							$(this).next().next().addClass("seat_nonselect");
							$(this).next().next().next().addClass("seat_nonselect");
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).next().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).next().next().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
							
							for(var i=1; i <=8; i++ ){
								if($('#seat' + i).val() == ""){
									
									seat_row = $(this).parent().children("th").text();
									seat_col = $(this).next().next().next().text();
									$('#seat' + i).val(seat_row + seat_col);
									break;
								}
							}
		
						}
						
						countSum -= currentCheckedValue;
						
						seatSelect(4);
					}
				}
			});
		}
		
		function mouseover() {
			$(".seat_standard, .seat_prime, .seat_economy, .seat_handicapped, .seat_sweetbox").mouseover(function() {
			
				if(!($(this).hasClass("seat_nonselect"))) {
					
					if(currentCheckedValue == 1){
						
						$(this).addClass("seat_over");
						
					} else if(currentCheckedValue == 2){
						
						if($(this).next().hasClass("seat_nonselect") &&
						   !($(this).prev().hasClass("seat_nonselect"))) 
						{
							$(this).addClass("seat_over");
							$(this).prev().addClass("seat_over");
							
						} else if(!($(this).next().hasClass("seat_nonselect")) && 
								  $(this).prev().hasClass("seat_nonselect"))
						{
							$(this).addClass("seat_over");
							$(this).next().addClass("seat_over");
							
						} else if(!($(this).next().hasClass("seat_nonselect"))){
							$(this).addClass("seat_over");
							$(this).next().addClass("seat_over");
						}
		
					} else if(currentCheckedValue == 3){
						
						if($(this).next().hasClass("seat_nonselect") && 
						   !($(this).prev().hasClass("seat_nonselect")) && 
						   !($(this).prev().prev().hasClass("seat_nonselect")))
						{
							$(this).addClass("seat_over");
							$(this).prev().addClass("seat_over");
							$(this).prev().prev().addClass("seat_over");
							
						} else if($(this).next().next().hasClass("seat_nonselect") && 
								  !($(this).next().hasClass("seat_nonselect")) && 
								  !($(this).prev().hasClass("seat_nonselect")))
						{
							$(this).addClass("seat_over");
							$(this).prev().addClass("seat_over");
							$(this).next().addClass("seat_over");
							
						} else if(!($(this).next().hasClass("seat_nonselect")) && 
								  !($(this).next().next().hasClass("seat_nonselect")))
						{
							$(this).addClass("seat_over");
							$(this).next().addClass("seat_over");
							$(this).next().next().addClass("seat_over");
							
						}
						
					} else if(currentCheckedValue == 4){
						
						if($(this).next().hasClass("seat_nonselect") && 
						   !($(this).prev().hasClass("seat_nonselect")) && 
						   !($(this).prev().prev().hasClass("seat_nonselect")) && 
						   !($(this).prev().prev().prev().hasClass("seat_nonselect")))
						{
							$(this).addClass("seat_over");
							$(this).prev().addClass("seat_over");
							$(this).prev().prev().addClass("seat_over");
							$(this).prev().prev().prev().addClass("seat_over");
							
						} else if($(this).next().next().hasClass("seat_nonselect") && 
								  !($(this).next().hasClass("seat_nonselect")) && 
								  !($(this).prev().hasClass("seat_nonselect")) && 
								  !($(this).prev().prev().hasClass("seat_nonselect")))
						{
							$(this).addClass("seat_over");
							$(this).next().addClass("seat_over");
							$(this).prev().addClass("seat_over");
							$(this).prev().prev().addClass("seat_over");
							
						} else if($(this).next().next().next().hasClass("seat_nonselect") && 
								  !($(this).next().hasClass("seat_nonselect")) && 
								  !($(this).next().next().hasClass("seat_nonselect")) && 
								  !($(this).prev().hasClass("seat_nonselect"))) 
						{
							$(this).addClass("seat_over");
							$(this).next().addClass("seat_over");
							$(this).next().next().addClass("seat_over");
							$(this).prev().addClass("seat_over");
							
						} else if(!($(this).next().hasClass("seat_nonselect")) && 
								  !($(this).next().next().hasClass("seat_nonselect")) && 
								  !($(this).next().next().next().hasClass("seat_nonselect")))
						{
							$(this).addClass("seat_over");
							$(this).next().addClass("seat_over");
							$(this).next().next().addClass("seat_over");
							$(this).next().next().next().addClass("seat_over");
							
						}	
					}
				} 
			});
		}
		
		function mouseout() {
			$(".seat_standard, .seat_prime, .seat_economy, .seat_handicapped, .seat_sweetbox").mouseout(function() {
		
				if(currentCheckedValue == 1){
					
					$(this).removeClass("seat_over");
					
				} else if(currentCheckedValue == 2){
					
					$(this).removeClass("seat_over");
					
					if($(this).next().hasClass("seat_nonselect")) {
						$(this).prev().removeClass("seat_over");
					} else {
						$(this).next().removeClass("seat_over");
					}
					
				} else if(currentCheckedValue == 3){
					
					$(this).removeClass("seat_over");
					
					if($(this).next().hasClass("seat_nonselect")) {
						$(this).prev().removeClass("seat_over");
						$(this).prev().prev().removeClass("seat_over");
						
					} else if($(this).next().next().hasClass("seat_nonselect")) {
						$(this).next().removeClass("seat_over");
						$(this).prev().removeClass("seat_over");
					} else {
						$(this).next().removeClass("seat_over");
						$(this).next().next().removeClass("seat_over");
					}
					
				} else if(currentCheckedValue == 4){
					$(this).removeClass("seat_over");
					
					if($(this).next().hasClass("seat_nonselect")) {
						$(this).prev().removeClass("seat_over");
						$(this).prev().prev().removeClass("seat_over");
						$(this).prev().prev().prev().removeClass("seat_over");	
					} else if($(this).next().next().hasClass("seat_nonselect")) {
						$(this).next().removeClass("seat_over");
						$(this).prev().removeClass("seat_over");
						$(this).prev().prev().removeClass("seat_over");
					} else if($(this).next().next().next().hasClass("seat_nonselect")) {
						$(this).next().removeClass("seat_over");
						$(this).next().next().removeClass("seat_over");
						$(this).prev().removeClass("seat_over");
					} else {
						$(this).next().removeClass("seat_over");
						$(this).next().next().removeClass("seat_over");
						$(this).next().next().next().removeClass("seat_over");
					}
				}
			});
		}
		
		
		var nomal_count = $(".seat_nomal").click(function() {
			
			radioCheked = $('input[name="seat_num"]:checked').length;
			
			if(countSum != 0) {
				countSum -=  nomalCount;
			}
			
			nomalCount = $(this).text();
			
			if(selectFlag == '0') {
				countSum = Number(nomalCount) + Number(youthCount) + Number(advantageCount);
			} else if(selectFlag == '1' && countSum != totalSeat) {
				countSum += Number(nomalCount);
				selectFlag = 0;
			}
			
			
			if(countSum <= 8){
				reset("nomal");
				$(this).toggleClass("seat_count_nomal");
				if(countSum == 0 && radioCheked == 1){
					$(this).prop('checked',false);
					$('input[name="seat_num"]:radio[value="'+ currentCheckedValue +'"]').prop('checked',false);
					currentCheckedValue = 0;
				} else if(radioCheked == 1 && countSum < currentCheckedValue){
					currentCheckedValue = countSum;
					$('input[name="seat_num"]:radio[value="'+ currentCheckedValue +'"]').prop('checked',true);
				}
			} else{
				alert("최대 예매 가능한 인원수는 8명 까지 입니다. 단체관람의 경우 단체/대관문의를 이용해주세요.");
			}
			
		});
		
		function checkSweetBox() {
			var value = $('input[name="seat_num"]:checked').val();
			
			if(value == 2 || value == 4) {
				
				$(".seat_sweetbox").removeClass("seat_nonselect");
				$(".seat_sweetbox").removeClass("seat_reservation");
				$(".seat_sweetbox").addClass("sweet_color");
				
			} else {
				$(".seat_sweetbox").removeClass("sweet_color");
				$(".seat_sweetbox").addClass("seat_nonselect");
				$(".seat_sweetbox").addClass("seat_reservation");
				
			}
		}
		
		var youth_count = $(".seat_youth").click(function() {
			
			radioCheked = $('input[name="seat_num"]:checked').length;
			
			if(countSum != 0) {
				countSum -=  youthCount;
			}
			
			youthCount = $(this).text();
			
			if(selectFlag == '0'){
				countSum = Number(nomalCount) + Number(youthCount) + Number(advantageCount);
			} else if(selectFlag == '1' && countSum != totalSeat) {
				countSum += Number(youthCount);
				selectFlag = 0;
			}
			
			if(countSum <= 8){
				reset("youth");
				$(this).toggleClass("seat_count_youth");
				
				if(countSum == 0 && radioCheked == 1){
					$(this).prop('checked',false);
					$('input[name="seat_num"]:radio[value="'+ currentCheckedValue +'"]').prop('checked',false);
					currentCheckedValue = 0;
				} else if(radioCheked == 1 && countSum < currentCheckedValue){
					currentCheckedValue = countSum;
					$('input[name="seat_num"]:radio[value="'+ currentCheckedValue +'"]').prop('checked',true);
				}
			} else{
				alert("최대 예매 가능한 인원수는 8명 까지 입니다. 단체관람의 경우 단체/대관문의를 이용해주세요.");
			}
			
		});
		
		var advantage_count = $(".seat_advantage").click(function() {
			
			radioCheked = $('input[name="seat_num"]:checked').length;
			
			if(countSum != 0) {
				countSum -=  advantageCount;
			}
			
			advantageCount = $(this).text();
			
			if(selectFlag == '0'){
				countSum = Number(nomalCount) + Number(youthCount) + Number(advantageCount);
			} else if(selectFlag == '1' && countSum != totalSeat) {
				countSum += Number(advantageCount);
				selectFlag = 0;
			}
			
			if(countSum <= 8){
				reset("advantage");
				$(this).toggleClass("seat_count_advantage");
				if(countSum == 0 && radioCheked == 1){
					$(this).prop('checked',false);
					$('input[name="seat_num"]:radio[value="'+ currentCheckedValue +'"]').prop('checked',false);
					currentCheckedValue = 0;
				} else if(radioCheked == 1 && countSum < currentCheckedValue){
					currentCheckedValue = countSum;
					$('input[name="seat_num"]:radio[value="'+ currentCheckedValue +'"]').prop('checked',true);
				}
			} else{
				alert("최대 예매 가능한 인원수는 8명 까지 입니다. 단체관람의 경우 단체/대관문의를 이용해주세요.");
			}
			
		});
		
		function reset(name) {
			$(".seat_count_" + name).removeClass("seat_count_" + name);
		}
			
		var seatNum = $("input[name=seat_num]").click(function() {
			var value = $(this).val();
			
			if(selectFlag == 0){
				
				if(countSum < value){
					
					$(this).prop('checked',false);
					$('input[name="seat_num"]:radio[value="'+ currentCheckedValue +'"]').prop('checked',true);
					
				} else {
					
					$(this).prop('checked',true);
					currentCheckedValue = $(this).val();				
				}
			} else {
				
				$('input[name="seat_num"]').removeAttr('checked');
			}
			
			
		});
		
		function seatSelect(value){
			if(countSum < value){
				currentCheckedValue = countSum;
				
				if(currentCheckedValue == 0){
					selectFlag = 1;
				}
				$('input[name="seat_num"]:radio[value="'+ value +'"]').prop('checked',false);
				$('input[name="seat_num"]:radio[value="'+ currentCheckedValue +'"]').prop('checked',true);
				$('input[name="seat_num"]:radio[value="'+ value +'"]').parent().children('div').removeClass("select");
				$('input[name="seat_num"]:radio[value="'+ currentCheckedValue +'"]').parent().children('div').addClass("select");
				seatFormClick(currentCheckedValue);
			}
		
		}
		
		function seatFormClick(value) {
			
			if(countSum >= value  && selectFlag == 0) {
				$('input[name="seat_num"]:radio[value="'+ value +'"]').parent().parent().children().children('div').removeClass("select");
				$('input[name="seat_num"]:radio[value="'+ value +'"]').parent().children('div').addClass("select");
			}
		}
		
		
		
		
		//reservation3
		
		function discountList() {
			$('#myModal').modal('show');
		}
		
		
		function discountApply() {
		
			var couponValue = $("input[name=coupon]:checked").val();
			var couopnInfo = couponValue.split('/');
			couponNo = couopnInfo[0];
			var couponAmount = couopnInfo[1];
		
			
			
			disCountAmount = price * (couponAmount/100);
			
			disCountAmount += discountMoney;
			
			disCountPrice = totalPrice - disCountAmount;
		
			
			couponApply = true;
			$('#discountPay').text(disCountAmount);
			$('#pay').val(disCountPrice);
		
		}
		
		function discountCancel() {
			couponApply = false;
			$('#discountPay').text(discountMoney);
			$('#pay').val(price);
		}
		
		function couponUsed() {
			
			$.ajax({
				type:'get',
				url:'/ticket/coupon/'+ couponNo,
				headers: {
					"Content-Type" : "application/json",
				},
				dataType:'json',
				data : '',
				success : function(result){
					
				}
			});
		}
		
		
		function backStep(){
			$("#reservation1").show();
			$("#reservation2").hide();
			$("#backArea").hide();
			$("#backArea2").hide();
			$("#nextArea3").hide();
			$("#nextArea2").hide();
			$("#nextArea1").show();
		}
		
		function backStep2() {
			$("#reservation1").hide();
			$("#reservation2").show();
			$("#reservation3").hide();
			$("#backArea").show();
			$("#backArea2").hide();
			$("#nextArea3").hide();
			$("#nextArea2").hide();
			$("#nextArea1").show();
		}
		
		function goLastpage() {
			finalFrm.submit();
		}
		
		function payment(){
			
			if(frm.months.value < 10 && frm.months.value.length < 2 ){
				frm.months.value = '0' + frm.months.value;
			}
			
			if(frm.dates.value < 10 && frm.dates.value.length < 2){
				frm.dates.value = '0' + frm.dates.value;
			}
			
			startTime = frm.years.value +'-' + frm.months.value + '-' + frm.dates.value + ' ' + frm.start_time.value;
				
			$.ajax({
				type:'get',
				url:'/ticket/seatIdentify/' + theaterId +'/' + plexNum + '/' + startTime,
				headers: {
					"Content-Type" : "application/json",
				},
				dataType:'json',
				data : {"seat1":seat1, "seat2":seat2, "seat3":seat3, "seat4":seat4, "seat5":seat5, "seat6":seat6, "seat7":seat7, "seat8":seat8},
				success : function(result){
					paymentAction(result.l);
				}
			});
		
			
		}
		
		function paymentAction(reservationExist) {
			
			$(reservationExist).each(function() {
		
				if(this == 1 || this == 2) {
					reservationFlag = false;
					alert("예약이 진행중입니다");
					resetFirst();
				}
		
			});
		
			
			if(reservationFlag == true) {
				
				//tempReservationSeat();
				
				
				var memberId = '${member_id}';
				var payMethod = $("#payMethod").val();
				var reservationCode = $("#reservationCode").text();
				var movieName = $("#movieName").text();
				var pay = parseInt($("#pay").val());
				var email = $("#email").val();
				var buyerName = $("#buyerName").val();
				var tel = $("#tel").val();
				var addr = $("#address").val();
				var post = $("#post").val();
				var seatAll = "";
				for(var i = 1; i <= 8; i++){
					if($("#seat"+i).val() != ""){
						seatAll += $("#seat"+i).val()
						if($("#seat"+(i+1)).val() != "")
						seatAll	+= ', ';
					}
				}
				
				reservationSeat();

				reservationCodeInput();
				
				if(couponApply){
					couponUsed();
				}
				pointAdder(pay/100);
				movieViewAdder(movieId, totalSeat);
				goLastpage();

				var IMP = window.IMP;
				IMP.init('iamport');
				
				IMP.request_pay({
					//이니시스만 됨
					pg : 'inicis', // version 1.1.0부터 지원.
																/*
																	'kakao':카카오페이,
																	'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제),
																	'nice':나이스,
																	'jtnet':jtnet,
																	'uplus':LG유플러스
																
																*/
					 // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
					pay_method : payMethod,
					merchant_uid : reservationCode,
					name : movieName,
					amount : pay,
					buyer_email : email,
					buyer_name : buyerName,
					buyer_tel : tel,
					buyer_addr : addr,
					buyer_postcode : post,
					app_scheme : 'iamporttest' //in app browser결제에서만 사용 
				}, function(rsp) {
					
					if ( rsp.success ) {
						
						var msg = '결제가 완료되었습니다.';
						msg += '상점 거래ID : ' + rsp.reservationCode;
						msg += '결제 금액 : ' + rsp.pay;
						
						reservationSeat();

						reservationCodeInput();
						
						if(couponApply){
							couponUsed();
						}
						pointAdder(pay/100);
						movieViewAdder(movieId, totalSeat);
						goLastpage();
						
					} else {
						
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
						
						reservationCancel();
						
					}
					$('#responser').text(msg);
					
				});
			}
			
			
		}
		
		function movieViewAdder(movieId, seatCnt) {
			
			$.ajax({
				type:'get',
				url:'/movie/viewAdder/' + movieId + '/' + seatCnt,
				headers: {
					"Content-Type" : "application/json",
				},
				dataType:'json',
				data : '',
				success : function(result){
					
				}
			});	
		}
		
		function pointAdder (point) {
			var memberId = '${member_id}';
			$.ajax({
				type:'get',
				url:'/member/point/' + point,
				headers: {
					"Content-Type" : "application/json",
				},
				dataType:'json',
				data : '',
				success : function(result){
					
				}
			});	
		}
		
		function reservationCodeInput() {
			
			var theaterName = frm.theater.value;
			
			var viewYear = frm.years.value;
			var viewMonth = frm.months.value;
			var viewDate = frm.dates.value;
		
			if(frm.months.value < 10 && frm.months.value.length < 2 ){
				viewMonth = '0' + frm.months.value;
			}
			
			if(frm.dates.value < 10 && frm.dates.value.length < 2){
				viewDate = '0' + frm.dates.value;
			}
			
			var viewHour = frm.start_time.value.substr(0,2);
			var viewMinute = frm.start_time.value.substr(3,2);
			
			veiwDay = viewYear + '-' + viewMonth + '-' + viewDate + ' ' + viewHour + ":" + viewMinute;
		
			var reservationNow = new Date();
			var reservationYear = reservationNow.getFullYear();
			var reservationMonth = reservationNow.getMonth()+1;
			var reservationDate = reservationNow.getDate();
			var reservationHour = reservationNow.getHours();
			var reservationMinute = reservationNow.getMinutes();
			
			if(reservationMonth < 10){
				reservationMonth = '0' + reservationMonth;
			}
			
			if(reservationDate < 10){
				reservationDate = '0' + reservationDate;
			}
			
			reservationDay = reservationYear + '-' + reservationMonth + '-' + reservationDate + ' ' + reservationHour + ":" + reservationMinute;
			
			var memberId = '${member_id}';
			var payMethod = $("#payMethod").val();
			var reservationCode = $("#reservationCode").text();
			var movieName = $("#movieName").text();
			var pay = parseInt($("#pay").val());
			var email = $("#email").val();
			var buyerName = $("#buyerName").val();
			var tel = $("#tel").val();
			var addr = $("#address").val();
			var post = $("#post").val();
			var seatAll = "";
			var hour = "";
			for(var i = 1; i <= 8; i++){
				if($("#seat"+i).val() != ""){
					seatAll += $("#seat"+i).val()
					if($("#seat"+(i+1)).val() != "")
					seatAll	+= ',';
				}
			}			

			$.ajax({
				type:'get',
				url:'/ticket/reservation/' + reservationCode,
				headers: {
					"Content-Type" : "application/json",
				},
				dataType:'json',
				data : {"memberId":memberId, "movieId":movieId, "theaterId":theaterId, "plexNumber":plexNum, "startTime":veiwDay,
						"ticketCnt":totalSeat, "seat":seatAll, "pay":pay, "payMethod":payMethod, "reservationDate":reservationDay},
				success : function(result){
					alert("결제가 완료되었습니다.");
				}
			});		
		}
		
		function lastStep() {
			var start_time = frm.start_time.value;
			hour = start_time.split(':')[0];
			
			
			if(7 <= hour && hour <= 9 ) {
				timeStatus = 1;
			} else if (0 <= hour && hour <= 6) {
				timeStatus = 2;
			}
			
			var intHour = parseInt(hour);
			if(selectFlag == 1){
				
				plexNum = frm.plex.value;
				seat1 = frm.seat1.value;
				seat2 = frm.seat2.value;
				seat3 = frm.seat3.value;
				seat4 = frm.seat4.value;
				seat5 = frm.seat5.value;
				seat6 = frm.seat6.value;
				seat7 = frm.seat7.value;
				seat8 = frm.seat8.value;
				
				reservationCodeGenerator();
				payGenerator();
				
				$("#reservation1").hide();
				$("#reservation2").hide();
				$("#reservation3").show();
				$("#backArea").hide();
				$("#backArea2").show();
				$("#nextArea2").hide();
				$("#nextArea3").show();
			} else if(selectFlag == 0){
				alert("선택한 좌석수가 총 좌석수와 맞지 않습니다");
			}
			
		}
		
		function reservationCodeGenerator() {
			var codeYear = frm.years.value;
			var codeMonth = frm.months.value;
			var codeDate = frm.dates.value;
			
			if(frm.months.value < 10 && frm.months.value.length < 2 ){
				codeMonth = '0' + frm.months.value;
			}
			
			if(frm.dates.value < 10 && frm.dates.value.length < 2){
				codeDate = '0' + frm.dates.value;
			}
			
			var codeHour = frm.start_time.value.substr(0,2);
			var codeMinute = frm.start_time.value.substr(3,2);
		
			var seat = frm.seat1.value;
			
			reservationCode = codeYear + codeMonth + codeDate + codeHour + codeMinute + movieId + theaterId + plexNum + seat;
			
			$('#reservationCode').text(reservationCode);
			$('#reservationcode').val(reservationCode);
			$('#theaterid').val(theaterId);
			
			
		}
		
		function payGenerator() {
			
			var economy = 0;
			var standard = 0;
			var prime = 0;
			var handicapped = 0;
			var sweetbox = 0;
		
			for(var i = 1; i <= 8; i++){
				
				//alert('#'+($('#seat'+i).val()));
				
				if($('#seat'+i).val() != ""){
					if($('#'+($('#seat'+i).val())).hasClass("seat_economy")){
						economy++;
					} else if($('#'+($('#seat'+i).val())).hasClass('seat_standard')){
						standard++;
					} else if($('#'+($('#seat'+i).val())).hasClass('seat_prime')){
						prime++;
					} else if($('#'+($('#seat'+i).val())).hasClass('seat_handicapped')){
						handicapped++;
					} else if($('#'+($('#seat'+i).val())).hasClass('seat_sweetbox')){
						sweetbox++;
					}
				}
			}
			
			economy *= 8000;
			standard *= 9000;
			prime *= 10000;
			handicapped *= 8000;
			sweetbox *= 11000;
			
			if(seatYouthCnt > 0) {
				discountMoney += 1000*seatYouthCnt
			}
			
			if(timeStatus == 1) {
				discountMoney += 2000*totalSeat;
			} else if(timeStatus == 2) {
				discountMoney += 1000*totalSeat;
			}
			
			totalPrice = economy + standard + prime + handicapped + sweetbox;
			price = economy + standard + prime + handicapped + sweetbox - discountMoney
			
			$('#pay').val(price);
			$('#originPay').text(totalPrice);
			$('#discountPay').text(discountMoney);
		}
		
		function reservationSeat() {
		
			if(frm.months.value < 10 && frm.months.value.length < 2 ){
				frm.months.value = '0' + frm.months.value;
			}
			
			if(frm.dates.value < 10 && frm.dates.value.length < 2){
				frm.dates.value = '0' + frm.dates.value;
			}
			
			startTime = frm.years.value +'-' + frm.months.value + '-' + frm.dates.value + ' ' + frm.start_time.value;
			
			$.ajax({
				type:'get',
				url:'/ticket/' + theaterId +'/' + plexNum + '/seat/' + startTime,
				headers: {
					"Content-Type" : "application/json",
				},
				dataType:'json',
				data : {"seat1":seat1, "seat2":seat2, "seat3":seat3, "seat4":seat4, "seat5":seat5, "seat6":seat6, "seat7":seat7, "seat8":seat8},
				success : function(result){
					setSeat(result.l, result.i);
				}
			});
		}
		
		function tempReservationSeat() {
			
			if(frm.months.value < 10 && frm.months.value.length < 2 ){
				frm.months.value = '0' + frm.months.value;
			}
			
			if(frm.dates.value < 10 && frm.dates.value.length < 2){
				frm.dates.value = '0' + frm.dates.value;
			}
			
			startTime = frm.years.value +'-' + frm.months.value + '-' + frm.dates.value + ' ' + frm.start_time.value;
			
			$.ajax({
				type:'get',
				url:'/ticket/' + theaterId +'/' + plexNum + '/tempseat/' + startTime,
				headers: {
					"Content-Type" : "application/json",
				},
				dataType:'json',
				data : {"seat1":seat1, "seat2":seat2, "seat3":seat3, "seat4":seat4, "seat5":seat5, "seat6":seat6, "seat7":seat7, "seat8":seat8},
				success : function(result){
					setSeat(result.l, result.i);
				}
			});
		}
		
		function reservationCancel() {
		
			if(frm.months.value < 10 && frm.months.value.length < 2 ){
				frm.months.value = '0' + frm.months.value;
			}
			
			if(frm.dates.value < 10 && frm.dates.value.length < 2){
				frm.dates.value = '0' + frm.dates.value;
			}
			
			startTime = frm.years.value +'-' + frm.months.value + '-' + frm.dates.value + ' ' + frm.start_time.value;
			
			
			$.ajax({
				type:'get',
				url:'/ticket/cancel/' + theaterId +'/' + plexNum + '/' + startTime,
				headers: {
					"Content-Type" : "application/json",
				},
				dataType:'json',
				data : {"seat1":seat1, "seat2":seat2, "seat3":seat3, "seat4":seat4, "seat5":seat5, "seat6":seat6, "seat7":seat7, "seat8":seat8},
				success : function(result){
					setSeat(result.l, result.i);
				}
			});
			
		}
		
		$(document).ready(function() {
			$("#movie_second_menu1").click(function(){
				$("#movie_second_menu1").css("border-bottom", "2px solid #000")
				$("#movie_second_menu2").css("border-bottom", "2px solid #999")
			});
		});
		
		$(document).ready(function() {
			$("#movie_second_menu2").click(function(){
				$("#movie_second_menu1").css("border-bottom", "2px solid #999")
				$("#movie_second_menu2").css("border-bottom", "2px solid #000")
			});
		});		
		
		
		
		$(document).ready(function() {
			today();
			$("#wrapper").css("margin","0px auto");
			$("#backArea").hide();
			$("#backArea2").hide();
			$("#nextArea2").hide();
			$("#nextArea3").hide();
			interval();
			
		});
		
		function getSeat(plexNum) {
			
			if(frm.months.value < 10 && frm.months.value.length < 2 ){
				frm.months.value = '0' + frm.months.value;
			}
			
			if(frm.dates.value < 10 && frm.dates.value.length < 2){
				frm.dates.value = '0' + frm.dates.value;
			}
			
			var startDay = frm.years.value +'-' + frm.months.value + '-' + frm.dates.value + ' ' + frm.start_time.value;
		
			$.ajax({
				type:'get',
				url:'/ticket/plex/' + theaterId + '/' + plexNum + '/' + startDay,
				headers: {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "GET",
				},
				dataType:'json',
				data : '',
				success : function(result){
					setSeat(result.l, result.i);
				}
			});
		}
		
		function setSeat(seat, seatIndex) {
			var result = "<table>";
			var header_index = "";
			var seat_index = "";
			
		
			$(seatIndex).each(function() {
			
				result += "<tr>" + "<th class='seat_header'>" + this + "</th>";
								
				header_index = this;
				
				$(seat).each(function() {
					seat_index = this.seat_index;
					
					if(header_index == seat_index) {
						
						if (this.seat_type == 'empty'){
							result += "<td id='" + this.seat_index + this.seat_number + "' class='seat_" + this.seat_type + " seat_nonselect'>" + this.seat_number+ "</td>";
						} else if(this.reservation_exist == '1') {
							result += "<td id='" + this.seat_index + this.seat_number + "' class='seat_reservation seat_nonselect'>" + this.seat_number+ "</td>";
						} else if(this.reservation_exist == '2') {
							result += "<td id='" + this.seat_index + this.seat_number + "' class='seat_reservation seat_nonselect seat_reservation_proceed'>" + this.seat_number+ "</td>";
						} else if(this.seat_type == 'sweetbox') {
							result += "<td id='" + this.seat_index + this.seat_number + "' class='seat_" + this.seat_type + " sweet_color'>" + this.seat_number+ "</td>";
						} else if(this.reservation_exist == '0') {
							result += "<td id='" + this.seat_index + this.seat_number + "' class='seat_" + this.seat_type + "'>" + this.seat_number+ "</td>";
						}
					}
				});
				result += "</tr>"
		
			});
			result += "</table>";
			document.getElementById("seat_table").innerHTML = result;
			
			$(".seat_empty").text("");
			
			// 좌석 선택
			seatClick();
			
			//좌석 선택영역 표시
			mouseover();		
			mouseout();
			
		}
		
		

		$(document).ready(function() {
			
			//일반 좌석 수
			nomal_count;
			
			//청소년 좌석 수
			youth_count;
			
			//우대 좌석 수
			advantage_count;
			
			//좌석형태 함수 ㅁ, ㅁㅁ, ㅁㅁㅁ, ㅁㅁㅁㅁ
			seatNum;
			
			setInterval(function(){
				totalSeatCnt();
				checkSweetBox();
			},500);
			
			
			// 기본 폼 선택
			$("#reservation2").hide();
			$("#reservation3").hide();
			
			// 기본좌석 수 선택
			
			$("#nomal_defalut").addClass("seat_count_nomal");
			$("#youth_defalut").addClass("seat_count_youth");
			$("#advantage_defalut").addClass("seat_count_advantage");
			
		});
		
		//$( "body" ).click(function( event ) {
		//	alert(event.target.nodeName);
		//});
		

		
		function endTimeGenerate(startTime, runtime){
			var divideTime = startTime.split(":");
			
			var minute = 0;
			var hour = 0;
			
			minute = Number(divideTime[1]) + runtime;
			hour = Number(divideTime[0]);
			if(minute >= 60){
				hour += minute / 60;
				hour = Math.floor(hour);
				minute = minute % 60;
				if(minute < 10){
					minute = "0" + minute;
				}
			}

			endTime = hour + ":" + minute;
			
		}

	</script>
	<% session.setAttribute("menu", null);%>
<%@include file="./include/footer.jsp" %>