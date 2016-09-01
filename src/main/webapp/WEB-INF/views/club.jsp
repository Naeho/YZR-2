<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="./include/header.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<div id="wrap_content" style="min-height: 100%; position: relative;">
	<div id="content">
		<div style="margin-left: 10px;">
			<font size="8px" ;weight="bold">클럽 서비스</font>
		</div>
		<hr style="border: solid 1px black; margin: 0 auto;">
		<div>
			<div>
			<!-- 1 -->
				<div style="width: 538px; height: 380px; background-color: #f2f2f2; margin-left: 10px; margin-top: 10px; display: inline-block;" 
				data-toggle="modal" data-target="#romanceModal">
					<img src="/resources/images/club/romance.jpg" style="width:538px; height: 300px;">
					<div>
						<div style="margin-left: 30px;margin-top: 10px;">
							<span> 
								<font size="6px">로맨스 클럽</font>
							</span> 
							<span>
								<c:choose>
									<c:when test="${membervo.club == '로맨스'}">
										<button class="btn btn-danger" style="margin-left: 220px; margin-top20px; width: 100px; height:40px;">탈퇴하기</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-info" style="margin-left: 220px; margin-top20px; width: 100px; height:40px;">가입하기</button>
									</c:otherwise>
								</c:choose>
							</span>
						</div>
						<div >
							<span style="margin-top:15px; margin-left:30px;"> 2016-01-01 ~ 2016-12-31</span>
						</div>
					</div>
				</div>
				<!-- 2 -->
				<div style="width: 536px; height: 380px; background-color: #f2f2f2; margin-left: 31px; margin-top: 10px; display: inline-block;" data-toggle="modal" data-target="#actionModal" >
					<img src="/resources/images/club/action.jpg" style="width:536px; height: 300px;">
					<div>
						<div style="margin-left: 30px;margin-top: 10px;">
							<span> 
								<font size="6px">액션 클럽</font>
							</span> 
							<span>
								<c:choose>
									<c:when test="${membervo.club == '액션'}">
										<button class="btn btn-danger" style="margin-left: 250px; margin-top20px; width: 100px; height:40px;">탈퇴하기</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-info" style="margin-left: 250px; margin-top20px; width: 100px; height:40px;">가입하기</button>
									</c:otherwise>
								</c:choose>
							</span>
						</div>
						<div >
							<span style="margin-top:15px; margin-left:30px;"> 2016-01-01 ~ 2016-12-31</span>
						</div>
					</div>
				</div>
			</div>
		<!-- 3 -->
			<div style="width: 538px; height: 380px; background-color: #f2f2f2; margin-left: 10px; margin-top: 10px; display: inline-block;" 
			data-toggle="modal" data-target="#vipModal">
				<img src="/resources/images/club/vip.jpg" style="width:538px; height: 300px;">
				<div>
					<div style="margin-left: 30px;margin-top: 10px;">
						<span> 
							<font size="6px">VIP 클럽</font> 
						</span> 
							<span>
								<c:choose>
									<c:when test="${membervo.club == 'VIP'}">
										<button class="btn btn-danger" style="margin-left: 265px; margin-top20px; width: 100px; height:40px;">탈퇴하기</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-info" style="margin-left: 265px; margin-top20px; width: 100px; height:40px;">가입하기</button>
									</c:otherwise>
								</c:choose>
							</span>
					</div>
					<div >
						<span style="margin-top:15px; margin-left:30px;"> 2016-01-01 ~ 2016-12-31</span>
					</div>
				</div>
			</div>
			<!-- 4 -->
			<div style="width: 538px; height: 380px; background-color: #f2f2f2; margin-left: 31px; margin-top: 10px; display: inline-block;" 
			data-toggle="modal" data-target="#specialModal">
				<img src="/resources/images/club/special.jpg" style="width:538px; height: 300px;">
				<div>
					<div style="margin-left: 30px;margin-top: 10px;">
						<span> 
							<font size="6px">특별관 클럽</font>
						</span> 
							<span>
								<c:choose>
									<c:when test="${membervo.club == '특별관'}">
										<button class="btn btn-danger" style="margin-left: 220px; margin-top20px; width: 100px; height:40px;">탈퇴하기</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-info" style="margin-left: 220px; margin-top20px; width: 100px; height:40px;">가입하기</button>
									</c:otherwise>
								</c:choose>
							</span>
					</div>
					<div >
						<span style="margin-top:15px; margin-left:30px;"> 2016-01-01 ~ 2016-12-31</span>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- vipmodal -->
<div class="modal fade" id="vipModal" role="dialog" >
	<div class="modal-dialog modal-lg" style="margin-top: 200px;" >
		<div class="modal-content" style="background-color: #222222">
				<form id="form">
					<div class="modal-header">
						<H2 style="color: white;float: left;">VIP 클럽 혜택</H2>
						<i class="fa fa-times fa-3x" aria-hidden="true" data-dismiss="modal"  style="color: white;float: right;"></i>
					</div>
					<div class="modal-body" style="height: 240px; margin-left: 30px; width: 1000px;">
						<div>
							<div style="width:400px; margin: 0 auto; float: left;">
								<div style=" display:inline-block; float: left;">
									<img src="/resources/images/club/coupon.png" style="height: 80px; width: 100px; margin-left: 10px; margin-top: 15px;">
								</div>
								<input type="hidden" id="vip_hidden" class="vip" value="vip"/> 
								<div style="margin-left: 20px;float: left; display:inline-block;">
									<span >
										<h4 style="color:white">가입쿠폰</h4>
										<div style="color:#A19DA1">평일 영화 2천원 할인쿠폰 2매</div>
										<div style="color:#A19DA1">주말 영화 2천원 할인쿠폰 1매</div>
									</span> 
								</div>
							</div>	
							<div style="width:400px; display: inline-block;  margin: 0 auto; float: left;">
								<div style=" display:inline-block; float: left;">
									<img src="/resources/images/club/point.png" style="height: 80px; width: 100px;  margin-top: 15px; ">
								</div>
								<div style="margin-left: 40px; margin-top:10px; float: left; display:inline-block;">
									<span style="color: white">
										<h4 style="color:white"> 포인트</h4>
										<div style="margin-right:20px; color:#A19DA1">클럽 회원당 500포인트 지급됩니다.</div>
										<div style="margin-right:20px; color:#A19DA1">매주 월요일 포인트 더블 적립</div>
									</span> 
								</div>
							</div>
						</div>	
						<div style="width:400px; display: inline-block;  margin: 0 auto; float: left;">
							<div style=" display:inline-block; float: left; margin-left: 0px;">
								<!-- <i class="fa fa-gift fa-5x" aria-hidden="true" style="height: 60px; width: 100px; color: red;"></i> -->
								<img src="/resources/images/club/benefit.png" style="height: 80px; width: 100px;margin-left: 10px;  margin-top: 15px;">
							</div>
							<div style=" margin-top:4px; float: left; display:inline-block; margin-left: 20px;">
								<span style="color: white">
									<h4 style="color:white"> 추가혜택</h4>
									<div style="margin-right:7px; color:#A19DA1">CINE LIBRARY 무료 입장 (월 4회限)</div>
									<div style="margin-right:7px; color:#A19DA1">VIP Club 카드 선착순 제공</div>
								</span> 
							</div>
						</div>					
						<div>
							<div style="width:400px; margin: 0 auto; float: left;">
								<div style=" display:inline-block; float: left;">
									<img src="/resources/images/club/vipclub1.png" style="height: 80px; width: 100px;  margin-top: 15px;">
								</div>
								<div style="margin-left: 40px; margin-top:5px; float: left; display:inline-block;">
									<span style="color: white" >
										<h4 style="color:white"> 이벤트</h4>
										<div style="margin-right:20px; color:#A19DA1">회원 전용 이벤트/시사회</div>
										<div style="margin-right:20px; color:#A19DA1">정기레터 발송</div>
									</span> 
								</div>
							</div>	
						</div>										
					</div>
				
					<div class="modal-footer">
						<table style="font-size: 13px;color: white">
							<tr>
								<td style="width: 100px; text-align: center;" >공통</td>
								<td style="float: left;">
									2016년 12월 31일까지 제공되는 서비스로 운영 서비스 및 혜택은 변경/종료될 수 있습니다.
								</td>	
								<td style="text-align:left;">가입방법</td>
								
							</tr>
							<tr>
								<td></td>
								<td style="width: 600px;"></td>
								<td style="width: 200px;text-align: left;">홈페이지 에서 클럽 가입하기</td>
							</tr>
							<tr>
								<td style="width: 50px; text-align: center;">포인트</td> 
								<td style="float: left;">이벤트 포인트는 2일 이내 지급 됩니다.</td>
							</tr>		
							<tr>
								<td></td>
								<td style="float: left;">이벤트 포인트는 지급일로부터 24개월간 사용 가능합니다.</td>
								<td>
									<c:choose>	
										<c:when test="${membervo.club == null || membervo.club == 'no' || membervo.club != 'VIP'}">
											<input type="button" id="clubbutton" class="btn btn-danger" data-dismiss="modal"
												onclick="club('VIP')" value="가입" style="width: 196px;" />
										</c:when>
										<c:when test="${membervo.club == 'VIP'}">
											<input type="button" id="clubbutton" class="btn btn-danger" data-dismiss="modal"
												onclick="club('no')" value="탈퇴" style="width: 196px;"  />
										</c:when>								
									</c:choose>	
								</td>
							</tr>								
							<tr>
								<td style="width: 50px; text-align: center;">쿠폰</td> 
								<td style="float: left;">가입쿠폰은 가입 후 익일 지급되며, 쿠폰은 발급일로부터 3개월간 유효합니다.</td>
								<td>
								</td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">제공된 쿠폰은 온라인 전용 쿠폰이며, 주중 주말 모두 이용가능합니다.</td>
								<td>
								</td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">탈퇴 후 재가입 시에는 가입쿠폰 및 관람 횟수별 혜택이 재 지급되지 않습니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">관람 횟수별 제공 혜택은 관람 후 2일 이내 지급 됩니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">동일한 날짜/회차/상영관의 영화를 나누어 결제한 경우에도 관람 횟수는 1회만 인정 됩니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">신규 회원은 VIP Club 가입 이후, 기존 회원은 6월 14일 이후의 관람부터 해당 됩니다.</td>
								<td></td>
								
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
	
						</table>
	
					</div>
				</form>
			</font>
		</div>
	</div>
</div>
<!-- specialmodal -->
<div class="modal fade" id="specialModal" role="dialog" >
	<div class="modal-dialog modal-lg" style="margin-top: 200px;" >
		<div class="modal-content" style="background-color: #222222">
				<form id="form">
					<div class="modal-header">
						<H2 style="color: white;float: left;">특별관 클럽 혜택</H2>
						<i class="fa fa-times fa-3x" aria-hidden="true" data-dismiss="modal"  style="color: white;float: right;"></i>
					</div>
					<div class="modal-body" style="height: 240px; margin-left: 30px; width: 1000px;">
						<div>
							<div style="width:400px; margin: 0 auto; float: left;">
								<div style=" display:inline-block; float: left;">
									<img src="/resources/images/club/coupon.png" style="height: 80px; width: 100px; margin-left: 10px; margin-top: 15px;">
								</div>
								<input type="hidden" id="vip_hidden" class="vip" value="vip"/> 
								<div style="margin-left: 20px;float: left; display:inline-block;">
									<span >
										<h4 style="color:white">가입쿠폰</h4>
										<div style="margin-left: 7px; color:#A19DA1">특별관 주말 2천원 할인쿠폰 2매 </div>
										<div style="margin-left: 7px; color:#A19DA1">특별관 주중 2천원 할인쿠폰 2매</div>
									</span> 
								</div>
							</div>	
							<div style="width:400px; display: inline-block;  margin: 0 auto; float: left;">
								<div style=" display:inline-block; float: left;">
									<img src="/resources/images/club/point.png" style="height: 80px; width: 100px; margin-top: 15px;">
								</div>
								<div style="margin-left: 40px; margin-top:10px; float: left; display:inline-block;">
									<span style="color: white">
										<h4 style="color:white"> 포인트</h4>
										<div style="margin-right:20px; color:#A19DA1">클럽 회원당 500포인트 지급됩니다.</div>
										<div style="margin-right:20px; color:#A19DA1">특별관 관람시 포인트 더블 적립</div>
									</span> 
								</div>
							</div>
						</div>	
						<div style="width:400px; display: inline-block;  margin: 0 auto; float: left;">
							<div style=" display:inline-block; float: left; margin-left: 0px;">
								<!-- <i class="fa fa-gift fa-5x" aria-hidden="true" style="height: 60px; width: 100px; color: red;"></i> -->
								<img src="/resources/images/club/benefit.png" style="height: 80px; width: 100px;margin-left: 10px;margin-top: 15px;">
							</div>
							<div style=" margin-top:4px; float: left; display:inline-block; margin-left: 20px;">
								<span style="color: white">
									<h4 style="color:white"> 추가혜택</h4>
									<div style="margin-right:7px; color:#A19DA1">특별관 2회 관람 시 포토티켓 1매 증정</div>
									<div style="margin-right:7px; color:#A19DA1">특별관 3회 관람 시 포인트 1천점 증정</div>
								</span> 
							</div>
						</div>					
						<div>
							<div style="width:400px; margin: 0 auto; float: left;">
								<div style=" display:inline-block; float: left;">
									<img src="/resources/images/club/specialclub.png" style="height: 80px; width: 100px; margin-top: 15px;">
								</div>
								<div style="margin-left: 40px; margin-top:5px; float: left; display:inline-block;">
									<span style="color: white" >
										<h4 style="color:white"> 이벤트</h4>
										<div style="margin-right:20px; color:#A19DA1">특별관 Club 회원 특별 시사회 초대</div>
										<div style="margin-right:20px; color:#A19DA1">특별관 Club 정기레터 발송</div>
									</span> 
								</div>
							</div>	
						</div>										
					</div>
				
					<div class="modal-footer">
						<table style="font-size: 13px;color: white">
							<tr>
								<td style="width: 100px; text-align: center;" >공통</td>
								<td style="float: left;">
									2016년 12월 31일까지 제공되는 서비스로 운영 서비스 및 혜택은 변경/종료될 수 있습니다.
								</td>	
								<td style="text-align:left;">가입방법</td>
								
							</tr>
							<tr>
								<td></td>
								<td style="width: 600px;"></td>
								<td style="width: 200px;text-align: left;">홈페이지 에서 클럽 가입하기</td>
							</tr>
							<tr>
								<td style="width: 50px; text-align: center;">포인트</td> 
								<td style="float: left;">이벤트 포인트는 2일 이내 지급 됩니다.</td>
							</tr>		
							<tr>
								<td></td>
								<td style="float: left;">이벤트 포인트는 지급일로부터 24개월간 사용 가능합니다.</td>
								<td>
									<c:choose>	
										<c:when test="${membervo.club == null || membervo.club == 'no' || membervo.club != '특별관'}">
											<input type="button" id="clubbutton" class="btn btn-danger" data-dismiss="modal"
												onclick="club('특별관')" value="가입" style="width: 196px;"/>
										</c:when>
										<c:when test="${membervo.club == '특별관'}">
											<input type="button" id="clubbutton" class="btn btn-danger" data-dismiss="modal"
												onclick="club('no')" value="탈퇴" style="width: 196px;"/>
										</c:when>								
									</c:choose>	
								</td>
							</tr>								
							<tr>
								<td style="width: 50px; text-align: center;">쿠폰</td> 
								<td style="float: left;">가입쿠폰은 가입 후 익일 지급되며, 쿠폰은 발급일로부터 3개월간 유효합니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">제공된 쿠폰은 온라인 전용 쿠폰이며, 주중 주말 모두 이용가능합니다.</td>
								<td>
								</td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">탈퇴 후 재가입 시에는 가입쿠폰 및 관람 횟수별 혜택이 재 지급되지 않습니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">관람 횟수별 제공 혜택은 관람 후 2일 이내 지급 됩니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">동일한 날짜/회차/상영관의 영화를 나누어 결제한 경우에도 관람 횟수는 1회만 인정 됩니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">신규 회원은 특별관 Club 가입 이후, 기존 회원은 6월 14일 이후의 관람부터 해당 됩니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
						</table>
					</div>
				</form>
			</font>
		</div>
	</div>
</div>
<!-- romancemodal -->
<div class="modal fade" id="romanceModal" role="dialog" >
	<div class="modal-dialog modal-lg" style="margin-top: 200px;" >
		<div class="modal-content" style="background-color: #222222">
				<form id="form">
					<div class="modal-header">
						<H2 style="color: white;float: left;">로맨스 클럽 혜택</H2>
						<i class="fa fa-times fa-3x" aria-hidden="true" data-dismiss="modal"  style="color: white;float: right;"></i>
					</div>
					<div class="modal-body" style="height: 240px; margin-left: 30px; width: 1000px;">
						<div>
							<div style="width:400px; margin: 0 auto; float: left;">
								<div style=" display:inline-block; float: left;">
									<img src="/resources/images/club/coupon.png" style="height: 80px; width: 100px; margin-left: 10px;margin-top: 15px;">
								</div>
								<input type="hidden" id="vip_hidden" class="vip" value="vip"/> 
								<div style="margin-left: 20px;float: left; display:inline-block;">
									<span >
										<h4 style="color:white">가입쿠폰</h4>
										<div style="margin-left: 7px; color:#A19DA1">로맨스 영화 주말 2천원 할인쿠폰 4매 </div>
										<div style="margin-left: 7px; color:#A19DA1">로맨스 영화 주중 2천원 할인쿠폰 2매</div>
									</span> 
								</div>
							</div>	
							<div style="width:400px; display: inline-block;  margin: 0 auto; float: left;">
								<div style=" display:inline-block; float: left;">
									<img src="/resources/images/club/point.png" style="height: 80px; width: 100px; margin-top: 15px;">
								</div>
								<div style="margin-left: 40px; margin-top:10px; float: left; display:inline-block;">
									<span style="color: white">
										<h4 style="color:white"> 포인트</h4>
										<div style="margin-right:20px; color:#A19DA1">클럽 회원당 500포인트 지급됩니다.</div>
										<div style="margin-right:20px; color:#A19DA1">로맨스 영화 관람시 포인트 더블 적립</div>
									</span> 
								</div>
							</div>
						</div>	
						<div style="width:400px; display: inline-block;  margin: 0 auto; float: left;">
							<div style=" display:inline-block; float: left; margin-left: 0px;">
								<!-- <i class="fa fa-gift fa-5x" aria-hidden="true" style="height: 60px; width: 100px; color: red;"></i> -->
								<img src="/resources/images/club/benefit.png" style="height: 80px; width: 100px;margin-left: 10px;margin-top: 15px;">
							</div>
							<div style=" margin-top:4px; float: left; display:inline-block; margin-left: 20px;">
								<span style="color: white">
									<h4 style="color:white"> 추가혜택</h4>
									<div style="margin-right:2px; color:#A19DA1">로맨스 영화 3회 관람 시 포토티켓 1매 증정</div>
									<div style="margin-right:2px; color:#A19DA1">로맨스 영화 4회 관람 시 포인트 1천점 증정</div>
								</span> 
							</div>
						</div>					
						<div>
							<div style="width:400px; margin: 0 auto; float: left;">
								<div style=" display:inline-block; float: left;">
									<img src="/resources/images/club/romanceclub.png" style="height: 80px; width: 100px; margin-top: 15px;">
								</div>
								<div style="margin-left: 40px; margin-top:5px; float: left; display:inline-block;">
									<span style="color: white" >
										<h4 style="color:white"> 이벤트</h4>
										<div style="margin-right:20px; color:#A19DA1">로맨스 Club 회원 특별 시사회 초대</div>
										<div style="margin-right:20px; color:#A19DA1">로맨스 Club 정기레터 발송</div>
									</span> 
								</div>
							</div>	
						</div>										
					</div>
				
					<div class="modal-footer">
						<table style="font-size: 13px;color: white">
							<tr>
								<td style="width: 100px; text-align: center;" >공통</td>
								<td style="float: left;">
									2016년 12월 31일까지 제공되는 서비스로 운영 서비스 및 혜택은 변경/종료될 수 있습니다.
								</td>	
								<td style="text-align:left;">가입방법</td>
								
							</tr>
							<tr>
								<td></td>
								<td style="width: 600px;"></td>
								<td style="width: 200px;text-align: left;">홈페이지 에서 클럽 가입하기</td>
							</tr>
							<tr>
								<td style="width: 50px; text-align: center;">포인트</td> 
								<td style="float: left;">이벤트 포인트는 2일 이내 지급 됩니다.</td>
							</tr>		
							<tr>
								<td></td>
								<td style="float: left;">이벤트 포인트는 지급일로부터 24개월간 사용 가능합니다.</td>
								<td>
									<c:choose>	
										<c:when test="${membervo.club == null || membervo.club == 'no' || membervo.club != '로맨스'}">
											<input type="button" id="clubbutton" class="btn btn-danger" data-dismiss="modal"
												onclick="club('로맨스')" value="가입" style="width: 196px;" />
										</c:when>
										<c:when test="${membervo.club == '로맨스'}">
											<input type="button" id="clubbutton" class="btn btn-danger" data-dismiss="modal"
												onclick="club('no')" value="탈퇴" style="width: 196px;" />
										</c:when>								
									</c:choose>	
								</td>
							</tr>								
							<tr>
								<td style="width: 50px; text-align: center;">쿠폰</td> 
								<td style="float: left;">가입쿠폰은 가입 후 익일 지급되며, 쿠폰은 발급일로부터 3개월간 유효합니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">제공된 쿠폰은 온라인 전용 쿠폰이며, 주중 주말 모두 이용가능합니다.</td>
								<td>
								</td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">탈퇴 후 재가입 시에는 가입쿠폰 및 관람 횟수별 혜택이 재 지급되지 않습니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">관람 횟수별 제공 혜택은 관람 후 2일 이내 지급 됩니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">동일한 날짜/회차/상영관의 영화를 나누어 결제한 경우에도 관람 횟수는 1회만 인정 됩니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">신규 회원은 특별관 Club 가입 이후, 기존 회원은 6월 14일 이후의 관람부터 해당 됩니다.</td>
								<td></td>
								
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
						</table>
					</div>
				</form>
			</font>
		</div>
	</div>
</div>
<!-- actionmodal -->
<div class="modal fade" id="actionModal" role="dialog" >
	<div class="modal-dialog modal-lg" style="margin-top: 200px;" >
		<div class="modal-content" style="background-color: #222222">
				<form id="form">
					<div class="modal-header">
						<H2 style="color: white;float: left;" >액션 클럽 혜택</H2>
						<i class="fa fa-times fa-3x" aria-hidden="true" data-dismiss="modal"  style="color: white;float: right;"></i>
					</div>
					<div class="modal-body" style="height: 240px; margin-left: 30px; width: 1000px;">
						<div>
							<div style="width:400px; margin: 0 auto; float: left;">
								<div style=" display:inline-block; float: left;">
									<img src="/resources/images/club/coupon.png" style="height: 80px; width: 100px; margin-left: 10px;margin-top: 15px;">
								</div>
								<input type="hidden" id="vip_hidden" class="vip" value="vip"/> 
								<div style="margin-left: 20px;float: left; display:inline-block;">
									<span >
										<h4 style="color:white">가입쿠폰</h4>
										<div style="margin-left: 7px; color:#A19DA1">액션 영화 주말 2천원 할인쿠폰 4매 </div>
										<div style="margin-left: 7px; color:#A19DA1">액션 영화 주중 2천원 할인쿠폰 2매</div>
									</span> 
								</div>
							</div>	
							<div style="width:400px; display: inline-block;  margin: 0 auto; float: left;">
								<div style=" display:inline-block; float: left;">
									<img src="/resources/images/club/point.png" style="height: 80px; width: 100px;margin-top: 15px; ">
								</div>
								<div style="margin-left: 40px; margin-top:10px; float: left; display:inline-block;">
									<span style="color: white">
										<h4 style="color:white"> 포인트</h4>
										<div style="margin-right:20px; color:#A19DA1">클럽 회원당 500포인트 지급됩니다.</div>
										<div style="margin-right:20px; color:#A19DA1">액션 영화 관람시 포인트 더블 적립</div>
									</span> 
								</div>
							</div>
						</div>	
						<div style="width:400px; display: inline-block;  margin: 0 auto; float: left;">
							<div style=" display:inline-block; float: left; margin-left: 0px;">
								<!-- <i class="fa fa-gift fa-5x" aria-hidden="true" style="height: 60px; width: 100px; color: red;"></i> -->
								<img src="/resources/images/club/benefit.png" style="height: 80px; width: 100px;margin-left: 10px;"margin-top: 15px;>
							</div>
							<div style=" margin-top:4px; float: left; display:inline-block; margin-left: 20px;">
								<span style="color: white">
									<h4 style="color:white"> 추가혜택</h4>
									<div style="margin-right:2px; color:#A19DA1">액션 영화 3회 관람 시 포토티켓 1매 증정</div>
									<div style="margin-right:2px; color:#A19DA1">액션 영화 4회 관람 시 포인트 1천점 증정</div>
								</span> 
							</div>
						</div>					
						<div>
							<div style="width:400px; margin: 0 auto; float: left;">
								<div style=" display:inline-block; float: left;">
									<img src="/resources/images/club/actionclub.png" style="height: 80px; width: 100px; margin-top: 15px;">
								</div>
								<div style="margin-left: 40px; margin-top:5px; float: left; display:inline-block;">
									<span style="color: white" >
										<h4 style="color:white"> 이벤트</h4>
										<div style="margin-right:20px; color:#A19DA1">액션 Club 회원 특별 시사회 초대</div>
										<div style="margin-right:20px; color:#A19DA1">액션 Club 정기레터 발송</div>
									</span> 
								</div>
							</div>	
						</div>										
					</div>
				
					<div class="modal-footer">
						<table style="font-size: 13px;color: white">
							<tr>
								<td style="width: 100px; text-align: center;" >공통</td>
								<td style="float: left;">
									2016년 12월 31일까지 제공되는 서비스로 운영 서비스 및 혜택은 변경/종료될 수 있습니다.
								</td>	
								<td style="text-align:left;">가입방법</td>
								
							</tr>
							<tr>
								<td></td>
								<td style="width: 600px;"></td>
								<td style="width: 200px;text-align: left;">홈페이지 에서 클럽 가입하기</td>
							</tr>
							<tr>
								<td style="width: 50px; text-align: center;">포인트</td> 
								<td style="float: left;">이벤트 포인트는 2일 이내 지급 됩니다.</td>
							</tr>		
							<tr>
								<td></td>
								<td style="float: left;">이벤트 포인트는 지급일로부터 24개월간 사용 가능합니다.</td>
								<td>
									<c:choose>	
										<c:when test="${membervo.club == null || membervo.club == 'no' || membervo.club != '액션'}">
											<input type="button" id="clubbutton" class="btn btn-danger" data-dismiss="modal"
												onclick="club('액션')" value="가입" style="width: 196px;"/>
										</c:when>
										<c:when test="${membervo.club == '액션'}">
											<input type="button" id="clubbutton" class="btn btn-danger" data-dismiss="modal"
												onclick="club('no')" value="탈퇴" style="width: 196px;" />
										</c:when>								
									</c:choose>	
								</td>
							</tr>								
							<tr>
								<td style="width: 50px; text-align: center;">쿠폰</td> 
								<td style="float: left;">가입쿠폰은 가입 후 익일 지급되며, 쿠폰은 발급일로부터 3개월간 유효합니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">제공된 쿠폰은 온라인 전용 쿠폰이며, 주중 주말 모두 이용가능합니다.</td>
								<td>
								</td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">탈퇴 후 재가입 시에는 가입쿠폰 및 관람 횟수별 혜택이 재 지급되지 않습니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">관람 횟수별 제공 혜택은 관람 후 2일 이내 지급 됩니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">동일한 날짜/회차/상영관의 영화를 나누어 결제한 경우에도 관람 횟수는 1회만 인정 됩니다.</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="float: left;">신규 회원은 특별관 Club 가입 이후, 기존 회원은 6월 14일 이후의 관람부터 해당 됩니다.</td>
								<td></td>
								
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
						</table>
					</div>
				</form>
		</div>
	</div>
</div>
<div id="dialog" title="가입오류">
${membervo.club } 클럽에 가입되어 있습니다.
</div>

<script>

var member_id = "${member_id}";
var member_club = "${membervo.club}";

function club(club){
	if(member_club == null || member_club == 'no' || member_club == ''){
		$.ajax({
				type : 'put',
				url : '/club/'+member_id+'/'+club ,
				headers : {
					"Content-Type" : "application/json",
				},
				dataType : 'text',
				success : function(result) {
					if (result == "SUCCESS") {
						location.href="/club";
					}
				}
			});
	}else if(member_club != null &&  club == 'no'){
		$.ajax({
				type : 'put',
				url : '/club/'+member_id+'/'+club ,
				headers : {
					"Content-Type" : "application/json",
				},
				dataType : 'text',
				success : function(result) {
					if (result == "SUCCESS") {
						location.href="/club";
					}
				}
			});
	}else if(member_id == null || member_id ==""){
		location.href="/login";
	}
	else{
		$("#dialog").dialog("open");
	}
}
$(function(){
    //$("#dialog").dialog();
    
    $("#dialog").dialog({
        autoOpen:false, //자동으로 열리지않게
        //"center", "left", "right", "top", "bottom"
        modal:true, //모달대화상자
        buttons:{
			"확인":function(){
                $(this).dialog("close");
            }
        }
    }).prev(".ui-dialog-titlebar").css("background","#222222");
    $("#dialog").dialog().prev(".ui-dialog-titlebar").css("color","white");
});
$(function(){
    //$("#dialog").dialog();
    
    $("#dialog1").dialog({
        autoOpen:false, //자동으로 열리지않게
        //"center", "left", "right", "top", "bottom"
        modal:true, //모달대화상자
        buttons:{
			"확인":function(){
                $(this).dialog("close");
            }
        }
    }).prev(".ui-dialog-titlebar").css("background","#222222");
    $("#dialog").dialog().prev(".ui-dialog-titlebar").css("color","white");
});
$(function(){
    //$("#dialog").dialog();
    
    $("#dialog2").dialog({
        autoOpen:false, //자동으로 열리지않게
        //"center", "left", "right", "top", "bottom"
        modal:true, //모달대화상자
        buttons:{
			"확인":function(){
                $(this).dialog("close");
            }
        }
    }).prev(".ui-dialog-titlebar").css("background","#222222");
    $("#dialog").dialog().prev(".ui-dialog-titlebar").css("color","white");
});




     
</script>
<%@include file="./include/footer.jsp"%>