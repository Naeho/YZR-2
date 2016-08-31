<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>
<title>pwSearch</title>

<style>
	th{background-color:#bf4040; color:white;}	
	
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
		vertical-align:middle;
	}
	
	.table{
		border:1px solid lightgray;
	}
</style>

<script>
	function check(){
		alert("check!!!");
		
		modalAjax();
		
	}
	
	function pwCheck(){
		
		var pwFind = document.getElementById("pwSearch");
		
			$.ajax({
				type : 'post',
				url : '/member/pwcheck',
				headers : {"Content-Type" : "application/json"},
				data : JSON.stringify({"member_id" : $("#member_id").val(),"question" : $("#question").val(),"answer" : $("#answer").val()}),
				dataType : 'json',
				success : function(result){
					if(result == true){
						alert("정신차려 이친구야!!!");
					}else{
						pwFind.submit();
					}
				}
			});
	}
</script>
</head>

<div align="center" >
	<div style="margin:30px;" >
		<h2>비밀번호 찾기</h2>
	</div>
	
	<form id="pwSearch" name="pwSearch" action="/user/pwFind"  method="post">
		<table class="table" style="width:420px;" >
			<tr>
				<th>아이디</th>
				<td><input type="text" id="member_id" class="form-control" name="member_id"></td>
			</tr>
			<tr>
				<th>비밀번호찾기 질문</th>
				<td>
					<select id="question" name="question" class="form-control" >
						<option value="">질문을 선택하세요</option>
							<option value="아버지 또는 어머니 성함은?">아버지 또는 어머니 성함은?</option>
							<option value="내가 다닌 고등학교는?">내가 다닌 고등학교는?</option>
							<option value="가장 감명깊게 읽은 책 제목은?">가장 감명깊게 읽은 책 제목은?</option>
							<option value="좋아하는 스포츠는?">좋아하는 스포츠는?</option>
							<option value="가장 친한친구의 이름은?">가장 친한친구의 이름은?</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>비밀번호찾기 답변</th>
				<td><input type="text" id="answer" name="answer" class="form-control" ></td>
			</tr>
		</table>
		<input type="button" onclick="pwCheck()" class="btn btn-danger btn-lg" value="확인" >
	</form>
</div>
<hr>

<%@include file="../include/footer.jsp"%>