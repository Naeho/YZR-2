<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./include/header.jsp" %>
<div id="wrap_content" style="min-height: 100%; position: relative;">
	<div id="content" style="padding-bottom: 150px; float: left; width:100%">
		<span style="font-weight:bold; font-size:36px; float:left; margin-top:10px;">EVENT</span>
		<div style="border:1px solid #000; margin-top:60px;"></div>
		
		<br/>
		<div id="event_img" style="margin-top:30px; float:left;">
			<c:forEach items="${event_list}" var="event_list" varStatus="i">
				<c:choose>
					<c:when test="${i.index>2 && i.index<=6}">
						<div style="float:left; margin-left:27px; margin-top:140px;">
							<a href="/support/notice/read/${ event_list.no }">
								<img src="/resources/images/notice/${event_list.notice_image}" style="width:250px; height:280px;"/>
							</a>
							
						</div>
					</c:when>
					<c:when test="${i.index>6 && i.index<=10}">
						<div style="float:left; margin-left:27px; margin-top:50px;">
							<a href="/support/notice/read/${ event_list.no }">
								<img src="/resources/images/notice/${event_list.notice_image}" style="width:250px; height:280px;"/>
							</a>
						</div>
						<c:if test="${i.index==10}">
							<button id="more_btn" name="more_btn" onclick="more()" style="width:150px; margin-left:490px; margin-top:40px; font-weight:bold; border-top:2px dotted gray; border-bottom:2px dotted gray; font-size:20px; color:gray;">
								<i class="fa fa-chevron-circle-down fa-1x" aria-hidden="true" style="color:gray; margin-right:5px;">
								</i> 더보기
							</button>
						</c:if>
					</c:when>
					<c:when test="${i.index>10}">
						<div class="more_img" style="float:left; margin-left:27px; margin-top:50px;">
							<a href="/support/notice/read/${ event_list.no }">
								<img src="/resources/images/notice/${event_list.notice_image}" style="width:250px; height:280px;"/>
							</a>
						</div>
					</c:when>
					<c:otherwise>
						<div style="width:320px; height:300px; float:left; margin-left:43px;">
							<a href="/support/notice/read/${ event_list.no }"><img style="width:320px; height:350px;" src="/resources/images/notice/${event_list.notice_image}"></a>
							<div style="margin-top:5px;">
								<span style="color:#4374D9; font-weight:bold;">스페셜 이벤트</span> <br/>
								<span style="font-size:12px;">${event_list.notice_title}</span> <br/>
								<span style="font-size:12px; color:#5D5D5D;">${event_list.notice_date} ~</span>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		
	</div>	
</div>

<script>
	$(".more_img").hide();
	
	function more(){
		$("#more_btn").hide();
		$(".more_img").show();
	}
</script>

<style>
	#more_btn{ border:0px; background-color:white; }
	
	.nav-tabs{ border:0px }
	
	.nav-tabs > li > a:hover,
	.nav-tabs > li > a:focus{
		background-color:#fff;
		border:0px
	}
	
	.nav-tabs > li > a:focus{color:red;}
	
	.carousel-inner > .item > a,
	.carousel-inner > .item > a:hover{
		text-decoration: none;
		color: black;
	}
</style>
<% session.setAttribute("menu", null);%>
<%@include file="./include/footer.jsp" %>