<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="./include/header.jsp"%>
<script>
	function send(){
		location.href="/membership2";
	}
</script>
<style>
<!--
	.btn-info{
		background-color: #b136ab !important;
		border-color: #b136ab;
	}
-->
</style>
<div id="wrap_content" style="min-height: 100%; position: relative;">
	<div id="content" style="padding-bottom:150px; letter-spacing:-1px; ">
		membership ${ member_id }
		<hr>
		<div>
			CJONE 회원가입 / 영화 그 이상의 감동 CGV	
		</div>
		<hr>
		<div align="center">
			<div align="left" style="width:660px; height:150;">
				<p style="color: gray;"><b>외식,쇼핑,엔터테인먼트 서비스를 한 장의 카드로 즐기세요~ 라이프스타일 멤버십 CJ ONE!</b></p>
				<p style="font-size:30px; font-weight:bold;">CJ ONE 회원가입을 환영합니다</p>
			</div>
		</div>
		
		<br>
		<div align="center">
			<div align="left" style="border:1px solid lightgray; padding:20px; color:#7c7c7c; width:660px; height:150; font-weight:bold; ">
				<p>
					<span style="color:red; font-size:35px;"><b>CGV</b></span> <span style="font-size:20px;" >&nbsp;&nbsp;은/는&nbsp;&nbsp;</span> 
					<span style="color:#b136ab; font-size:20px;">CJ ONE 통합회원으로 가입을 받고 있습니다.</span>
				</p>
				<p>회원이 되시면 하나의 <span style="color:#b136ab;" >통합된 회원 ID와 비밀번호</span>로 CJ ONE 및 각 브랜드 웹사이트의 다양한</p>
				<p>서비스 (포인트 조회, 카드등록, 정보변경 서비스 등)를 이용하실 수 있습니다.</p>
				<p>CJ ONE 통합회원으로 가입되더라도 정보 제공 및 약관 동의가 되지 않은 CJ ONE 제휴 브랜드에는 </p>
				<p>개인정보가 제공되지 않습니다.</p>
			</div>
		</div>
		
		<br/>
		<br/>
		<br/>
		<div align="center" style="background-color:#f9f9f7; padding:25px; " >
			<div align="left" style="width:660px; height:150;" >
				<p style="font-size:20px;" ><b>회원가입 여부를 먼저 확인해주세요.</b></p>
				<div style="font-size:10px; color:#b136ab; ">
					<p>입력하신 정보를 별도 저장되지 않으며, 기 회원가입 여부 확인 용도로만 사용됩니다.</p>
					<p>휴대전화 국번 3자리(01X)를 제외한 번호가 7자리인 경우, 0을 포함하여 입력(Ex. 011-123-4567 > 01234567 입력)</p>
					<p>기존 회원의 경우 기존 회원가입 정보와 일치하는 정보를 입력하셔야 회원가입 여부를 정확하게 확인하실 수 있습니다.</p>
					<p>CJmall(CJ오쇼핑),CJ제일제당,CJ월디스,CJ문화재단에서는 전자상거래에 의거하여</p>
					<p>만 14세 미만의 어린이/학생의 회원가입을 제한합니다</p>
				</div>
				
				<form action="" method="post">
				<table>
					<tr>
						<td style="padding:7px; font-size:11px;">ex)홍길동</td>
						<td style="padding:7px; font-size:11px;">ex)1980년 1월 1일생 → 800101</td>
						<td style="padding:7px; font-size:11px;">ex)010-1234-5678 → 12345678</td>
					</tr>
					<tr>
						<td style="padding:7px;"><input type="text" id="name" name="name" value="이름" size="20" ></td>
						<td style="padding:7px;"><input type="text" id="birthSix" name="birthSix" value="법정생년월일 6자리" size="20"></td>
						<td style="padding:7px;"><input type="text" id="phoneEight" name="phoneEight" value="휴대전화번호 뒤 8자리" size="20"></td>
					</tr>
				</table>
				<br/>
				<div align="center" ><input type="button" class="btn btn-info" onclick="send()" value="확인"></div>
				
				</form>
			</div>
		</div>
		
		<hr>
		<div align="center" >
			<div align="left" style="padding:8px; font-size:12px; width:660px; height:150;">
				<p>- CJ ONE에 가입하더라도 약관 동의되지 않은 CJ ONE 제휴 브랜드에는 개인정보가 제공되지 않습니다.</p>
				<p>- CJ ONE은 CJ ONE 제휴 브랜드의 통합 멤버십 서비스입니다.</p>
				<p>- 하나의 아이디(ID)로 CJ ONE 제휴 브랜드 사이트를 안전하고 편리하게 이용할 수 있습니다.</p>
				<p>- <b>기존의 각 CJ ONE 제휴 브랜드 사이트에 1개 이상 가입되어 있는 회원님은</b></p>
				<p><b>&nbsp;&nbsp;새로운 CJ ONE 통합 아이디(ID)를 생성하신 후 가입하실 수 있습니다.</b></p>
			</div>
		</div>	
		
		<div align="center">
			<div align="left" style="padding:8px; font-size:12px; width:660px; height:150;">
				<p>- <b style="color:#b136ab;">CJ ONE 제휴 브랜드</b> : CGV, 뚜레쥬르, 빕스, CJ오쇼핑, CJmall, tving, 헬로모바일, Mnet, 올리브영, CJ온마트,</p>
				<p>&nbsp;&nbsp;투썸플레이스, 비비고, 차이나팩토리, 더플레이스, 제일제면소, 빕스 버거, CJ푸드월드, 더스테이크하우스,</p>
				<p>&nbsp;&nbsp;퍼스트룩, CJ E&M, 차이나팩토리 딜라이트, CJ월디스, 계절밥상, CJ제일제당, CJ대한통운,</p>
				<p>&nbsp;&nbsp;CJ문화재단, 스타일온에어 , CJ Logoshop, 주스 솔루션 (2016년 7월 기준)</p>
			</div>
		</div>
		
	</div>	
</div>

<%@include file="./include/footer.jsp"%>