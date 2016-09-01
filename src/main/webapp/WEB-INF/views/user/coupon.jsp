<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>
<%@include file="./sidebar.jsp"%>
<c:if test="${ member_id == null }">
	<script>
		<%response.sendRedirect("/login");%>
	</script>
</c:if>
<style>
th, td{
	text-align: center;
}
th{
	background-color: red;
	color: white;
}
td{
	background-color: ivory;
}
</style>
<div class="content" style="margin-left: 120px; width: 890px;">
	<h2>쿠폰 목록</h2><br>
	<table class="table">
		<thead>
			<tr>
				<th>쿠폰코드</th>
				<th>발급일</th>
				<th>할인율</th>
				<th>사용여부</th>
			</tr>
		</thead>
		<tbody id="coupon_list">
		</tbody>
	</table>
	<div id="coupon_page" style="text-align: center;"></div>
</div>
<script type="text/javascript">
	var currentPage = 1;
	var startPage = 1;
	var endPage = 1;
	var totalPage;
	var used;
	function setCouponList(data){
		var result;
		$("#coupon_list").html("");
		$(data).each(function(){
			if(this.used=='Y'){
				used="<font style='font-weight: bold; color: red;'>사용함</font>"
			}else if(this.used=='N'){
				used="<font style='font-weight: bold; color: blue;'>미사용</font>"
			}
			result += "<tr>"
			+ "<td>["
			+ this.coupon_code + "-" + this.no
			+ "]</td>"
			+ "<td>"
			+ this.coupon_date
			+ "</td>"
			+ "<td>"
			+ this.coupon_amount
			+ "%</td>"
			+ "<td>"
			+ used
			+ "</td>"
			+ "</tr>";
		});		
		$("#coupon_list").html(result);
	}
	function getCouponList(page){
		if(page == null){
			page = currentPage;
		}
		currentPage = page;
		$.ajax({
			type : 'get',
			url : '/user/coupon/' + page,
			headers : {
				"Content-Type" : "application/json"
			},
			data : '',
			dataType : 'json',
			success : function(result){

				endPage = result.paging.endPage; 
	            startPage = result.paging.startPage;
	            if(totalPage<result.paging.totalPage){
	            	getCouponList(result.paging.totalPage);
	            }
	            totalPage = result.paging.totalPage;
	            
	            setCouponList(result.coupon_list);
	            setPagePrint(result.paging);
			}
		});
	}
	getCouponList(currentPage);
	
	function setPagePrint(pm){
		var str = "<ul class='pagination'>";
		if(currentPage > pm.endPage && currentPage > 1){
			getCouponList(currentPage - 1);
		}
		if(pm.prev){
			str += "<li> <a onclick='getCouponList("+(pm.startPage-1)+")'>&lt;</a> </li>"
		}
		for(var i = pm.startPage; i <= pm.endPage ; i++){
			if(i == pm.criteria.page){
				str += "<li class='active'><a href='#'>" + i + "</a></li>"
			}else{
				str += "<li><a onclick='getCouponList("+i+")' style='cursor:pointer'>" + i + "</a></li>"
			}
		}
		if(pm.next){
			str += "<li> <a onclick='getCouponList("+(pm.endPage+1)+")'>&gt;</a> </li>"
		}
		str += "</ul>"
		document.getElementById("coupon_page").innerHTML = str;
	}
</script>
<%@include file="../include/footer.jsp"%>