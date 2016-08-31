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
	function pwEditConfirm(){
		
		if($("#originPw").val()==""|| $("#newPw").val()==""|| $("#newPw2").val()==""){
			if($("#originPw").val()==null || $("#originPw").val()==""){
				$("#originPw_").html("기존 비밀번호를 입력하세요.");
			}
			if($("#newPw").val()==null || $("#newPw").val()==""){
				$("#newPw_").html("새 비밀번호를 입력하세요");
			}
			if($("#newPw2").val()==null || $("#newPw2").val()==""){
				$("#newPw2_").html("새 비밀번호 확인을 입력하세요");
			}
		}else if(
			$("#originPw").val() != "${password}"		
		){
			alert("기존 비밀번호가 맞지 않습니다");
		}else if(
			$("#newPw").val() != $("#newPw2").val()		
		){
			alert("새 비밀번호가 맞지 않습니다");
		}else{
			alert("비밀번호가 정상적으로 변경되었습니다.");
			var pwChange = document.getElementById("pwChange");
			pwChange.submit();
		}
	}

	function index(){
		location.href="/index";
	}
</script>
	
<style>
	th{background-color:#bf4040; color:white;}
	
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
		vertical-align:middle;
	}
	
	.table{
		border:1px solid lightgray;
	}
</style>

<div id="wrap_content" style="min-height:100%; position:relative;" align="center" >
<div class="content" style="margin-left: 120px; width: 420px;">
		<h2>비밀번호 수정페이지</h2>
		<br>
		<form action="/user/member/pwChange" id="pwChange" name="pwChange" method="post" >
			<table class="table">
				<c:if test="${password != null || password != ''}">
					<tr>
						<th>기존 비밀번호</th>
						<td><input type="password" id="originPw" name="originPw" class="form-control" ></td>
						<td id="originPw_" name="originPw_" ></td>
					</tr>
				</c:if>
				<tr>
					<th>새 비밀번호</th>
					<td><input type="password" id="newPw" name="newPw" class="form-control" ></td>
					<td id="newPw_" name="newPw_" ></td>
				</tr>
				<tr>
					<th>새 비밀번호 확인</th>
					<td><input type="password" id="newPw2" name="newPw2" class="form-control" ></td>
					</td><td id="newPw2_" name="newPw2_" ></td>
				</tr>
			</table>
		</form>
		
		<input type="button" onclick="pwEditConfirm()" class="btn btn-danger" value="수정완료">
		<input type="button" onclick="index()" class="btn btn-danger" value="취소">
	</div>	
</div>

<%@include file="../include/footer.jsp"%>