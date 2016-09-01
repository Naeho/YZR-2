<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="../include/header.jsp"%>
<%@include file="./sidebar.jsp"%>

<c:if test="${ member_id == null }">
	<script>
		<%response.sendRedirect("/login");%>
	</script>
</c:if>
<style>
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
		vertical-align:middle;
	}
	
	.table{
		border:1px solid lightgray;
	}
	.red{
		color:red;
	}
</style>
<script>
	
	function memberDelete(){
		
		
		
		if($("#pw").val() == null || $("#pw").val() == ""){
			$("#pw2").html("비밀번호를 입력하세요!");
		}else if($("#pw").val() != null || $("#pw").val() != ""){
			$.ajax({
				type : 'post',
				url : '/user/member/delete',
				headers : {
					"Content-Type" : "application/json",
				},
				data : JSON.stringify({"member_pw" : $("#pw").val(), "member_id" : "${member_id}"}),
				dataType : 'json',
				success : function(result){
					if(result == true){
						$("#del").submit();
					}else{
						$("#pw2").html("비밀번호가 맞지 않습니다");
					}
				}
			});
		}
	}
	
</script>

<div style="width:480px; margin-left:340px; margin-top:50px; border-top:ridge; border-bottom:ridge; padding:15px;">
	<div style="margin:0 auto; width: 420px;">
	
		<h4>회원탈퇴 하시려면 비밀번호를 입력하세요.</h4>
		<form id="del" name="del" action="/user/member/deleteConfirm" method="post">
			<table>
				<tr>
					<td style="padding-right:10px;"><input type="password" id="pw" name="pw" class="form-control" /></td><td id="pw2" class="red" ></td>
				</tr>
			</table>
		</form>
		
		<br>
		<input type="button" onclick="memberDelete()" class="btn btn-danger" value="회원탈퇴"/>
	</div>
</div>

<%@include file="../include/footer.jsp"%>