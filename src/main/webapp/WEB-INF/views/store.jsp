<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./include/header.jsp" %>
<div id="wrap_content" style="min-height: 100%; position: relative;">
	<div id="content" style="padding-bottom: 150px; float: left;">
		
		<h2 id="menu_line" style="margin-top:10px;">
			<div style="border-top:1px solid #000; border-bottom:1px solid #000; width:475px; height:5px; float:left; margin-top:22px;"></div>
				<span style="float:left; font-size:48.5px;">M E N U</span>
			<div style="border-top:1px solid #000; border-bottom:1px solid #000; width:475px; height:5px; float:left; margin-top:22px;"></div>
		</h2>
		
		<form id="frm" name="frm" action="/store/buy" method="post">
			<input type="hidden" id="menu_name" name="menu_name" value="" />
			<input type="hidden" id="menu_price" name="menu_price" value="" />
			<input type="hidden" id="menu_img" name="menu_img" value="" />
			<input type="hidden" id="menu_content" name="menu_content" value="" />
		</form>

		<div id="porduct_group" style="margin-top:20px; clear:both;">
			<div class="product" style="width:530px; height:614px; float:left; margin-left:27px; margin-top:30px; border-radius: 20px; border:2px solid #FF7E7E;">
				<div style="width:350px; float:left; margin-left:7px;">
					<span id="menu1" name="menu1" style="font-weight:bold; font-size:30px;">칠리치즈나쵸콤보</span> <br/>
					<span id="menu_content1" name="menu_content1" style="font-weight:bold; font-size:15px; color:gray;">팝콘(L)1+콜라(M)2+칠리치즈나쵸</span> <br/>
					<button class="btn btn-danger" style="margin-top:5px;" onclick="buyCombo('칠리치즈나쵸콤보','팝콘(L)1+콜라(M)2+칠리치즈나쵸','11000','combo_set.png')">구매</button>
				</div>
				<span style="float:right; font-size:30px; margin-right:7px;">11,000 원</span>
				<img src="/resources/images/product/combo_set.png" style="width:525px; height:490px; margin-top:5px;">
			</div>
			<div class="product" style="width:530px; height:614px; float:left; margin-left:27px; margin-top:30px; border-radius: 20px; border:2px solid #FF7E7E;">
				<div style="width:350px; float:left; margin-left:7px;">
					<span id="menu2" name="menu2" style="font-weight:bold; font-size:35px;">더블치즈팝콘</span> <br/>
					<button class="btn btn-danger" style="margin-top:15px;" onclick="buy('더블치즈팝콘','6000','popcorn.png')">구매</button>
				</div>
				<span style="float:right; font-size:30px; margin-right:7px;">6,000 원</span>
				<img src="/resources/images/product/popcorn.png" style="width:525px; height:490px; margin-top:5px;">
			</div>
			<div class="product" style="width:530px; height:614px; float:left; margin-left:27px; margin-top:50px; border-radius: 20px; border:2px solid #FF7E7E;">
				<div style="width:350px; float:left; margin-left:7px;">
					<span id="menu3" name="menu3" style="font-weight:bold; font-size:35px;">크리미갈릭핫도그</span> <br/>
					<button class="btn btn-danger" style="margin-top:15px;" onclick="buy('크리미갈릭핫도그','6500','hotdog.png')">구매</button>
				</div>
				<span style="float:right; font-size:30px; margin-right:7px;">6,500 원</span>
				<img src="/resources/images/product/hotdog.png" style="width:525px; height:490px; margin-top:5px;">
			</div>
			<div class="product" style="width:530px; height:614px; float:left; margin-left:27px; margin-top:50px; border-radius: 20px; border:2px solid #FF7E7E;">
				<div style="width:350px; float:left; margin-left:7px;">
					<span id="menu4" name="menu4" style="font-weight:bold; font-size:35px;">콜라(L)</span> <br/>
					<button class="btn btn-danger" style="margin-top:15px;" onclick="buy('콜라(L)','2500','coke.png')">구매</button>
				</div>
				<span style="float:right; font-size:30px; margin-right:7px;">2,500 원</span>
				<img src="/resources/images/product/coke.png" style="width:525px; height:490px; margin-top:5px;">
			</div>
		</div>
	</div>	
</div>

<script>
	function buy(menu, price, img){
		var frm = document.getElementById("frm");
		
		var member_id = "${member_id}";
		
		if(member_id == null || member_id == ""){
			goLogin();
		}else{
			frm.menu_name.value = menu;
			frm.menu_price.value = price;
			frm.menu_img.value = img;
			frm.menu_content.value = "";
			frm.submit();
		}
	}
	
	function buyCombo(menu, content, price, img){
		var frm = document.getElementById("frm");
		
		var member_id = "${member_id}";
		
		if(member_id == null || member_id == ""){
			goLogin();
		}else{
			frm.menu_name.value = menu;
			frm.menu_price.value = price;
			frm.menu_img.value = img;
			frm.menu_content.value = content;
			
			frm.submit();
		}
	}
	
	function goLogin(){
		alert("로그인이 필요합니다");
		location.href = "/login";
	}
</script>
<% session.setAttribute("menu", null);%>
<%@include file="./include/footer.jsp" %>