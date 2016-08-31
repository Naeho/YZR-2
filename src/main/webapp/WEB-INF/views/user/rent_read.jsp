<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>
<%@include file="./sidebar.jsp"%>
<style>
tr{
	height: 60px;
}
td{
	text-align: left;
}
th{
	width: 100px;
	text-align: left;
	font-weight: bold;
}
.table > tbody > tr > th, .table > tbody > tr > td{
	vertical-align: middle;
	background-color: ivory;
}
</style>
<div class="content" style="margin-left: 120px;">
	<div>
		<h3>나의 대관 문의</h3>
	</div>
		<div style="height: 40px;background-color: red;">
	</div>

	<table class="table">
		<tr style="border: 0px;">
			<th style="border-top: 0px;">대관장소</th>
			<td colspan="3" style="border-top: 0px;">
				${rentvo.rent_place }
			</td>
		</tr>
		<tr>
			<th>대관 날짜</th>
			<td colspan="3">
				${rentvo.rent_date }
			</td>
		</tr>
		<tr>
			<th>처리상태</th>
			<td colspan="3">
				<c:choose>
					<c:when test="${rentvo.complete == 'n' || rentvo.complete == 'N'}">
						<font style='font-weight: bold; color: red;'>처리중</font>
					</c:when>
					<c:otherwise>
						<font style='font-weight: bold; color: blue;'>완료</font>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th style="vertical-align: text-top;">내용</th>
			<td style="height: 200px;vertical-align: text-top;">
			${rentvo.rent_content }
				</textarea>
			</td>
		</tr>
	</table><br><br>
	<div style="float: right;">
		<a href="/user/rent"><input type="button" class="btn btn-danger" value="목록"></a>
	</div>
</div>
<%@include file="../include/footer.jsp"%>