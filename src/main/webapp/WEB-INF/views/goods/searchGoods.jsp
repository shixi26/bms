<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<head>
<title>검색 도서 목록 페이지</title>
</head>
<body>
	<hgroup>
		<h1>${goods.goodsSort }</h1>
		<h2>오늘의 책</h2>
	</hgroup>
	<section id="new_book">
		<h3>새로나온 책</h3>
		<div id="left_scroll">
			<a href='javascript:slide("left");'><img
				src="${contextPath}/resources/image/left.gif"></a>
		</div>
		<div id="carousel_inner">
			<ul id="carousel_ul">
				<c:choose>
					<c:when test="${empty newBookList}">
						<li>
							<div id="book">
								<h1>제품이없습니다.</h1>
							</div>
						</li>
					</c:when>
					<c:otherwise>
						<c:forEach var="goods" items="${newBookList}">
							<li>
								<div id="book">
									<div>
										<a
											href="${contextPath}/goods/goodsDetail.do?goodsId=${goods.goodsId}">
											<img width="75" alt="${goods.goodsFileName}"
											src="${contextPath}/thumbnails.do?goodsId=${goods.goodsId}&fileName=${goods.goodsFileName}">
										</a>
									</div>
									<div class="sort">${goods.goodsSort }</div>
									<div class="title">
										<a
											href="${contextPath}/goods/goodsDetail.do?goodsId=${goods.goodsId}">
											${goods.goodsTitle}</a>
									</div>
									<div class="writer">${goods.goodsWriter}|
										${goods.goodsPublisher}</div>
									<div class="price">
										<fmt:formatNumber var="p1" value="${goods.goodsPrice}"
											type="number" pattern="#.##" />
										<fmt:formatNumber var="p2" value="${goods.goodsSalesPrice}"
											type="number" pattern="#.##" />
										<span><fmt:formatNumber value="${p1}" type="number" /></span>
										<br>
										<fmt:formatNumber value="${p2}" type="number" />
										<br> (
										<fmt:formatNumber value="${(p1 - p2 + 0.0) / (p1 + 0.0)}"
											type="percent" />
										할인)
									</div>
								</div>
							</li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div id="right_scroll">
			<a href='javascript:slide("right");'><img
				src="${contextPath}/resources/image/right.gif"></a>
		</div>
		<input id="hidden_auto_slide_seconds" type="hidden" value="0">
		<div class="clear"></div>
	</section>
	<table id="list_view">
		<tbody>
			<c:forEach var="goods" items="${goodsList}">
				<tr align="center">
					<td class="goods_image"><a
						href="${contextPath}/goods/goodsDetail.do?goodsId=${goods.goodsId}">
							<img width="75" alt="상품이미지"
							src="${contextPath}/thumbnails.do?goodsId=${goods.goodsId}&fileName=${goods.goodsFileName}">
					</a></td>
					<td class="goods_description">
						<h2>
							<a
								href="${contextPath}/goods/goodsDetail.do?goodsId=${goods.goodsId}">${goods.goodsTitle}</a>
						</h2>
						<div class="writer_press">${goods.goodsWriter }저
							&emsp; | &emsp; ${goods.goodsPublisher } | &emsp;
							<fmt:formatDate value="${goods.goodsPublishedDate }"
								pattern="yyyy-MM-dd" />
						</div>
					</td>
					<td class="price"><fmt:formatNumber var="p1"
							value="${goods.goodsPrice}" type="number" pattern="#.##" /> <fmt:formatNumber
							var="p2" value="${goods.goodsSalesPrice}" type="number"
							pattern="#.##" /> <span><fmt:formatNumber value="${p1}"
								type="number" /></span> <br> <fmt:formatNumber value="${p2}"
							type="number" /><br> (<fmt:formatNumber
							value="${(p1 - p2 + 0.0) / (p1 + 0.0)}" type="percent" />할인)</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>