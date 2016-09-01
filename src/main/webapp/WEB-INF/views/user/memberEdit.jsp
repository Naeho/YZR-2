<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>
<%@include file="./sidebar.jsp"%>
<c:if test="${ member_id == null }">
	<script>
		<%response.sendRedirect("/login");%>
	</script>
</c:if>
<script>
	
	function index(){
		location.href="/index";
	}
	
	function userUpdate(){
		
		var form = document.getElementById("form");
		
		form.submit();
	}
	
	$(document).ready(function() { 
		document.getElementById("checkQuestion").innerHTML="${vo.getQuestion()}";
	});
	
</script>

<style>
	th{
		background-color:#bf4040; 
		color:white; 
		width:100px;
	}
	h2{text-align:center;}
	
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
		vertical-align:middle;
	}
	
	.table{
		border:1px solid lightgray;
	}
</style>

<div id="wrap_content" align="center">
	<div id="content" style="width:800px;" >
		<h2>회원정보 수정페이지</h2>
		<br>
		<form id="form" name="form" action="/user/member/edit" method="post">
			<table class="table" style="width:420px;">
				<tr>
					<th style="width:150px;" >아이디</th>
					<td>${vo.getMember_id()}</td>
				</tr>
				<tr>
					<th>이름</th><td>${vo.getMember_name()}</td>
				</tr>
				<tr>
					<th>성별</th><td>${vo.getGender()}</td>
				</tr>	
				<tr>
					<th>생년월일</th><td>${vo.getBirthday()}</td>
				</tr>	
				<tr>
					<th >집주소</th><td><input type="text" id="address" name="address" class="form-control" value="${vo.getAddress()}"  ></td>
				</tr>	
				<tr>
					<th>이메일</th><td><input type="text" id="email" name="email" class="form-control" value="${vo.getEmail()}"  ></td>
				</tr>	
				<tr>
					<th>연락처</th><td><input type="text" id="tel" name="tel" class="form-control" value="${vo.getTel()}"  ></td>
				</tr>
				<tr>
					<th>비밀번호찾기 질문</th>
					<td>
						<select id="question" name="question" class="form-control">
							<option id="checkQuestion" ></option>
							<option value="아버지 또는 어머니 성함은?">아버지 또는 어머니 성함은?</option>
							<option value="가장 감명깊게 읽은 책 제목은?">가장 감명깊게 읽은 책 제목은?</option>
							<option value="가장 친한친구의 이름은?">가장 친한친구의 이름은?</option>
							<option value="내가 다닌 고등학교는?">내가 다닌 고등학교는?</option>
							<option value="좋아하는 스포츠는?">좋아하는 스포츠는?</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>비밀번호찾기 답변</th>
					<td><input type="text" id="answer" name="answer" class="form-control" value="${vo.getAnswer()}"></td>
				</tr>
			</table>
		</form>
		
		<input type="button" onclick="userUpdate()" class="btn btn-danger" value="수정완료">
		<input type="button" onclick="index()" class="btn btn-danger" value="취소">
	</div>	
</div>

<%@include file="../include/footer.jsp"%>