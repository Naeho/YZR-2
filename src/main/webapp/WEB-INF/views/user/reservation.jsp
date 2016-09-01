<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<c:if test="${ member_id == null }">
	<script>
		<%response.sendRedirect("/login");%>
	</script>
</c:if>
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm" var="today"/>

<div class="content" style="margin-left: 120px; width: 890px;">
	
	<!-- 예매 Total -->
	<div style="height: 34px; line-height: 34px;">
		<span style="font-size: 20px;">예매내역</span><span id="reservationTotal" style="margin-left: 5px;"></span>
	</div>
	
	<!-- 예매 목록 -->
	<div id="reservationList" style="border: 1px solid #aaa; border-radius: 15px;">
	</div>
	
	<!-- 페이징 -->
	<div id="page" style="height: auto; width: 100%; display: inline-block; text-align: center;">
	</div>
	
	<div class="modal fade" id="myModal" role="dialog">
 		<div class="modal-dialog modal-sm"style="margin-top: 300px;">
 			<div class="modal-content">
 				<div class="modal-header">
					<h4 class="modal-title">예매취소</h4>
				 </div>
 				<div class="modal-body">
 					<p>예매를 취소하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="deleteReservation()">취소확정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</div>

<script>
	var currentPage = 1;
	var startPage = 1;
	var endPage = 1;
	var totalPage;
	
	function setReservationList(r,rm,rt){
		var a = $("#reservationList");
		var result = "";
		var date = null;
		a.html("");
		
		result += '<div style="width: 888px; height:50px; line-height: 50px;">'
			+ '<div style="width: 200px; text-align: center; font-size: 15px; border-right: 1px solid #aaa; float: left; font-weight: bold;">예매번호</div>'
			+ '<div style="width: 688px; text-align: center; font-size: 15px; margin-left: 200px; font-weight: bold;">예매정보</div>'
			+ '</div>';
			
		if(r.length > 0) {
			
			$(r).each(function(i){
			
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
								+ '<div style="height: 140px; line-height: 140px; width: 288px; text-align: center; float: left;">';
						
						if(this.start_time > "${today}"){
							result += '<span style="display: inline-block; margin-top: 48px;"><button class="btn btn-danger" onclick="setNumbers(\'' + this.reservation_code+ '\','+this.ticket_cnt+','+this.pay+',\''+this.movie_id+'\')" data-toggle="modal" data-target="#myModal">예매취소</button></span>';
						}
						
						result += '</div>';
					}
					
				}
				
				result += '</div>';
			
			});
		}else{
			result += '<div style="height: 140px; line-height: 130px; text-align: center; border-top: 1px solid #aaa;">'
					+ '<span style="height: 138px; margin: 0; font-size: 20px;">예매내역이 없습니다</span>'
					+ '</div>';
		}
		a.html(result);
	}
	
	function setPagePrint(pm){
		var str = "";
		if(pm.totalArticles < 11){
			$("#page").hide();
		}else{
			str += "<ul class='pagination'>";
			
			if(pm.prev){
				str += "<li><a href='javascript:getReservationList("+(pm.startPage-1)+")'>&lt;</a> </li>";
			}
			
			for(var i = pm.startPage; i<=pm.endPage; i++){
				if(i == pm.criteria.page){
					str+="<li class='active'><a href='#'>" + i + "</a></li>";
				}else{
					str+="<li><a href='javascript:getReservationList("+i+")'>" + i + "</a></li>";
				}
				
			}
			
			
			if(pm.next){
				str += "<li><a href='javascript:getReservationList("+(pm.endPage+1)+")'>&gt;</a> </li>";
			}
			str += "</ul>";
			document.getElementById("page").innerHTML = str;
		}
		
	}
	
	function getReservationList(page){
		
		if(page==null){
			page = currentPage; 
		}
		currentPage = page;
		
		$.ajax({
			type : 'get',
			url : '/user/reservation/'+page,
			headers : {
				"Content-Type" : "application/json"
	//			"X-HTTP-Method-Override" : "GET",
			},
			dataType : 'json',
			data : '',
			success : function(result){
				endPage = result.p.endPage; 
				startPage = result.p.startPage;
				if(totalPage<result.p.totalPage){
					getReservationList(result.p.totalPage);
				}
				totalPage = result.p.totalPage;
				
				setReservationList(result.l.reservationList, result.l.reservationMovie, result.l.reservationTheater);
				setPagePrint(result.p);
				$("#reservationTotal").html(result.total+"건");
				
			}
		});
		
	}
	
	getReservationList();
	
	var reservation_code;
	var seatCnt;
	var pay;
	var movieId;
	
	function setNumbers(reserCode, seat_cnt, won, movie_id){
		reservation_code = reserCode;
		seatCnt = seat_cnt;
		pay = won;
		movieId = movie_id;
	}
	
	function deleteReservation(){
		var seat_cnt = -seatCnt
		$.ajax({
			type : 'delete',
			url : '/user/reservation/'+reservation_code,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			success : function(result){
				if(result == "SUCCESS"){
					getReservationList(currentPage);
					movieViewSubstr(movieId, seat_cnt);
					pointSubstr(pay/100);
				}
			}
		});
		
	}
	
	function pointSubstr (point) {
		var minusPoint = -point;
		var memberId = '${member_id}';
		$.ajax({
			type:'get',
			url:'/member/point/' + minusPoint,
			headers: {
				"Content-Type" : "application/json",
			},
			dataType:'json',
			data : '',
			success : function(result){
				
			}
		});	
	}
	
	function movieViewSubstr(movieId, seatCnt) {
		
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

</script>
<%@include file="../include/footer.jsp"%>