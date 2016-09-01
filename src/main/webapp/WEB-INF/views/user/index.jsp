<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="../include/header.jsp"%>
<%@include file="./sidebar.jsp"%>
<style>
	.reservationInfo{
		height:20px; 
		width: 56px; 
		display: block; 
		margin-left: 10px; 
		margin-bottom: 5px; 
		font-weight: bold; 
		float: left;
	}
	
</style>
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm" var="today"/>
<div class="content" style="margin-left: 120px; width: 890px;">
	<div id="myInfo" style="border: 1px solid #aaa; height: 150px; width: 100%; margin-bottom: 20px; border-radius: 15px;">
		<div style="height: 46px; margin: 10px; line-height: 46px;">
			<h3 style="margin-top: 10px; display: inline-block;">${userInfo.member_name}님 등급은 <p style="display: inline; color: red;">${userInfo.grade}</p>입니다</h3>
		</div>
		<div id="coupon" style="border-top: 1px solid #aaa; width: 444px; height:82px; float: left; padding-left: 20px;">
			<span style="display: block; width:110px; margin: 10px; margin-left: 0; border: 2px dashed red; border-radius: 15px; text-align: center;"><h4 style="margin: 5px;">COUPON</h4></span>
			<span>사용 가능 쿠폰 : <a href="/user/coupon">${couponTotal}장</a></span>
		</div>
		<div id="point" style="border-top: 1px solid #aaa; border-left: 1px solid #aaa; width: 444px; height:82px; float: right; padding-left: 20px;">
			<span style="display: block; width:110px; margin: 10px; margin-left: 0; border: 2px dashed red; border-radius: 15px; text-align: center;"><h4 style="margin: 5px;">POINT</h4></span>
			<span>멤버십 포인트 : ${userInfo.point}점<span id="grade" class="glyphicon glyphicon-question-sign"></span></span>
		</div>
	</div>


	<div style="height: 34px; line-height: 34px;">
		<span style="font-size: 20px; font-weight: bold;">예매내역</span><a style="margin-left: 5px;" href="/user/reservation"><span id="reservationTotal"></span><span class="glyphicon glyphicon-plus-sign"></span></a>
	</div>
	
	<!-- 예매내역 -->
	<div id="reservationList" style="border: 1px solid #aaa; border-radius: 15px; margin-bottom: 10px;">
		
	</div>
	
</div>
<script>

	$(document).ready(function(){
		$('#grade').popover({title: "등급", content: "1000점 실버<br>2000점 골드<br>3000점 플래티넘<br>4000점 다이아몬드<br>5000점 마스터<br>6000점 챌린져", trigger: "hover", html: true});
	});
	
	function setReservationList(r,rm,rt){
		var a = $("#reservationList");
		var result = "";
		var date = null;
		a.html("");
		
		result += '<div style="width: 888px; height:50px; line-height: 50px;">'
			+ '<div style="width: 200px; text-align: center; font-size: 15px; border-right: 1px solid #aaa; float: left; font-weight: bold;">예매번호</div>'
			+ '<div style="width: 688px; text-align: center; font-size: 15px; margin-left: 200px; font-weight: bold;">예매정보</div>'
			+ '</div>';
			
		if(r.length>0){
			$(r).each(function(i){
				if(i<3){
					result += '<div style="height: 140px; border-top: 1px solid #aaa;">'
							+ '<div style="width: 200px; line-height: 140px; float: left; text-align: center; border-right: 1px solid #aaa;">'
							+ '<span>' + this.reservation_code + '</span>'
							+ '</div>';
							
					for(var j=0; j<rm.length; j++){
						if(this.movie_id == rm[j].movie_id){
							
							result += '<div style="height: 140px; width: 400px; float: left;">'
									+ '<span style="height: 138px; width: 105px; display: block; float: left;"><a href="/movie/'+this.movie_id+'"><img style="height: 100%; width: 100%; vertical-align: baseline;" src="/resources/images/poster/'+rm[j].poster+'"></a></span>'
									+ '<span style="height:30px; display: block; margin-left: 115px; margin-bottom: 5px; padding-top:10px; font-weight: bold;"><a href="/movie/' + this.movie_id + '">' + rm[j].title + '</a></span>'
									+ '<span class="reservationInfo">관람극장</span>'
									+ '<span style="height:20px; display: block; margin-left: 181px; margin-bottom: 5px;">';
							for(var k=0; k<rt.length; k++){
								if(rt[k].theater_id == this.theater_id){
									result += rt[k].theater_name;
								}
							}
							result += '&nbsp' + this.plex_number + '관&nbsp/&nbsp' + this.ticket_cnt + '명</span>'
									+ '<span class="reservationInfo">관람좌석</span>'
									+ '<span style="height:20px; display: block; margin-left: 181px; margin-bottom: 5px;">' + this.view_seat + '</span>'
									+ '<span class="reservationInfo">관람일시</span>'
									+ '<span style="height:20px; display: block; margin-left: 181px; margin-bottom: 5px;">' + this.start_time + '</span>'
									+ '<span class="reservationInfo">결제</span>'
									+ '<span style="height:20px; display: block; margin-left: 181px;">'+ this.pay_method + '&nbsp/&nbsp' + this.pay + '원</span>'
									+ '</div>'
									+ '<div style="height: 140px; line-height: 130px; width: 288px; text-align: center; float: left;">'
								    + '</div>';
						}
						
					}
					
						result += '</div>';
				}
			});
		}else{
			result += '<div style="height: 140px; border-top: 1px solid #aaa; line-height: 140px; text-align: center;">'
					+ '<span style="height: 138px; margin: 0; font-size: 20px;">예매내역이 없습니다</span>'
					+ '</div>';
		}
		a.html(result);
	}
	
	function getReservationList(){
	
		$.ajax({
			type : 'get',
			url : '/user/reservation/1',
			headers : {
				"Content-Type" : "application/json"
	//			"X-HTTP-Method-Override" : "GET",
			},
			dataType : 'json',
			data : '',
			success : function(result){
				setReservationList(result.l.reservationList, result.l.reservationMovie, result.l.reservationTheater);
				$("#reservationTotal").html("");
				$("#reservationTotal").html(result.total+"건");
			}
		});
		
	}
	
	getReservationList();
	
	function deleteReservation(reservation_code){
		
		$.ajax({
			type : 'delete',
			url : '/user/reservation/'+reservation_code,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			success : function(result){
				if(result == "SUCCESS"){
					getReservationList();
				}
			}
		});
		
	}
</script>
<%@include file="../include/footer.jsp"%>