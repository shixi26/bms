<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<script>
function getParam(sname) {
    var params = location.search.substr(location.search.indexOf("?") + 1);
    var sval = "";

    params = params.split("&");

    for (var i = 0; i < params.length; i++) {
        temp = params[i].split("=");
        if ([temp[0]] == sname) { sval = temp[1]; }
    }
    return sval;
}

$(document).ready(function() {
	var type= getParam('id');
	if(type==1) {
		$("#bestSeller").show();
		$("#newBook").hide();
		$("#steadySeller").hide();
	} else if(type==2) {
		$("#bestSeller").hide();
		$("#newBook").show();
		$("#steadySeller").hide();
	} else if(type==3) {
		$("#bestSeller").hide();
		$("#newBook").hide();
		$("#steadySeller").show();
	} else {
		$("#bestSeller").show();
		$("#newBook").show();
		$("#steadySeller").show();
	}
});
</script>
<html>
<body>
	<div id="ad_main_banner">
		<ul class="bjqs">
		    <li><img width="775" height="145" src="${contextPath}/resources/image/main_banner01.jpg"></li>
			<li><img width="775" height="145" src="${contextPath}/resources/image/main_banner02.jpg"></li>
			<li><img width="775" height="145" src="${contextPath}/resources/image/main_banner03.jpg"></li>
		</ul>
	</div>
	
	<div id="bestSeller" class="main_book">
		<h3>베스트셀러</h3>
		<c:forEach var="item" items="${bestseller }">
			<div class="book">
				<a href="${contextPath}/goods/goodsDetail.do?goodsId=${item.goodsId }"><img class="link"  src="${contextPath}/resources/image/1px.gif"></a> 
				<img width="121" height="154" src="${contextPath}/thumbnails.do?goodsId=${item.goodsId}&fileName=${item.goodsFileName}">
				<div class="title">${item.goodsTitle }</div>
				<div class="price"><fmt:formatNumber value="${item.goodsPrice}" type="number" var="goodsPrice" />${goodsPrice}원</div>
			</div>
	  </c:forEach>
	</div>
	<div class="clear"></div>
	<div id="ad_sub_banner">
		<img width="770" height="117" src="${contextPath}/resources/image/sub_banner01.jpg">
	</div>
	<div id="newBook" class="main_book" >
	 <h3>신간</h3>
	 <c:forEach var="item" items="${newbook }" >
	   <div class="book">
		   	<a href="${contextPath}/goods/goodsDetail.do?goodsId=${item.goodsId }"><img class="link" src="${contextPath}/resources/image/1px.gif"></a>
		   <img width="121" height="154" src="${contextPath}/thumbnails.do?goodsId=${item.goodsId}&fileName=${item.goodsFileName}">
		   <div class="title">${item.goodsTitle }</div>
		   <div class="price"><fmt:formatNumber value="${item.goodsPrice}" type="number" var="goodsPrice" />${goodsPrice}원</div>
	   </div>
	 </c:forEach>
	</div>
	<div class="clear"></div>
	
	<div id="ad_sub_banner">
		<img width="770" height="117" src="${contextPath}/resources/image/sub_banner02.jpg">
	</div>
	
	<div id="steadySeller" class="main_book" >
		<h3>스테디셀러</h3>
		<c:forEach var="item" items="${steadyseller }" >
			<div class="book">
				<a href="${contextPath}/goods/goodsDetail.do?goodsId=${item.goodsId }"><img class="link"  src="${contextPath}/resources/image/1px.gif"> </a>
				<img width="121" height="154" src="${contextPath}/thumbnails.do?goodsId=${item.goodsId}&fileName=${item.goodsFileName}">
				<div class="title">${item.goodsTitle }</div>
				<div class="price"><fmt:formatNumber  value="${item.goodsPrice}" type="number" var="goodsPrice" />${goodsPrice}원</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>



   
   