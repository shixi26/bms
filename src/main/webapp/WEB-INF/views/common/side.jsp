<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
	<head>
		<!-- bootstrap css적용 -->
    	<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="${contextPath }/resources/css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
    </head>
<body>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sidenav shadow-right sidenav-light">
		 <ul>
		  <c:choose>
			<c:when test="${sideMenu == 'adminMode'}">
			   <li>
					<h3>주요기능</h3>
					<ul>
						<li><a href="${contextPath}/admin/member/adminMemberMain.do">회원 관리</a></li>
						<li><a href="${contextPath}/admin/goods/adminGoodsMain.do">상품 관리</a></li>
						<li><a href="${contextPath}/admin/order/adminOrderMain.do">주문 관리</a></li>
					</ul>
				</li>
				<br><br><br>
			</c:when>
			<c:when test="${sideMenu == 'myPage'}">
				<li>
					<h3>정보내역</h3>
					<ul>
						<li><a href="${contextPath}/mypage/listMyOrderHistory.do">주문내역 조회</a></li>
						<li><a href="${contextPath}/mypage/myDetailInfo.do">내 정보 수정</a></li>
						<li><a href="${contextPath}/main/main.do">메인화면으로 이동</a></li>
					</ul>
				</li>
				<br><br><br>
			</c:when>
			<c:otherwise>
				<div class="sidenav-menu">
					<div class="nav accordion" id="accordionSidenav">
				       <!-- Sidenav Menu Heading (카테고리)-->
	                   <div class="sidenav-menu-heading">카테고리</div>
							<a class="nav-link collapsed" href="${contextPath}/main/main.do?id=1" >
	                            <div class="nav-link-icon"><i data-feather="activity"></i></div>
	                            베스트셀러
	                        	<div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                        </a>
							<a class="nav-link collapsed" href="${contextPath}/main/main.do?id=2" >
	                            <div class="nav-link-icon"><i data-feather="activity"></i></div>
	                            신간
	                        	<div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                        </a>
							<a class="nav-link collapsed" href="${contextPath}/main/main.do?id=3" >
	                            <div class="nav-link-icon"><i data-feather="activity"></i></div>
	                            스테디셀러
	                        	<div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                        </a>
						</div>
					</div>
			 </c:otherwise>
			</c:choose>	
		  </ul>
		</nav>
		<div class="clear"></div>
		<div id="banner">
			<a href="#"><img width="190" height="163" src="${contextPath}/resources/image/n-pay.jpg"> </a>
		</div>
		<div id="notice">
			<h2>공지사항</h2>
			<ul>
				<li><a href="#">BMS 개인정보 처리방침 개정 안내</a></li>
				<li><a href="#">BMS mobile 서비스 종료 안내 </a></li>
				<li><a href="#">마케팅정보 수신동의 확인 안내</a></li>
				<li><a href="#">북클럽 혜택 '커피 무료쿠폰' 종료 안내</a></li>
				<li><a href="#">BMS 이용약관 개정 안내</a></li>
			</ul>
		</div>
		<div id="banner">
			<a href="#"><img width="190" height="362" src="${contextPath}/resources/image/side_banner1.jpg"></a>
		</div>
		<div id="banner">
			<a href="#"><img width="190" height="104" src="${contextPath}/resources/image/call_center_logo.jpg"></a>
		</div>
		<div id="banner">
			<a href="#"><img width="190" height="69" src="${contextPath}/resources/image/QnA_logo.jpg"></a>
		</div>
	</div>
	</div>
</body>
</html>