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
    </head>
<body>
	<nav class="sidenav shadow-right sidenav-light">
		 <ul>
		  <c:choose>
			<c:when test="${sideMenu == 'adminMode'}">
				<div class="sidenav-menu">
					<div class="nav accordion" id="accordionSidenav">
				       <!-- Sidenav Menu Heading (주요기능)-->
	                   <div class="sidenav-menu-heading">주요기능</div>
							<a class="nav-link collapsed" href="${contextPath}/admin/member/adminMemberMain.do">
	                            회원관리
	                        </a>
							<a class="nav-link collapsed" href="${contextPath}/admin/goods/adminGoodsMain.do">
	                            상품관리
	                        </a>
							<a class="nav-link collapsed" href="${contextPath}/admin/order/adminOrderMain.do">
	                            주문관리
	                        </a>
						</div>
					</div>
			</c:when>
			<c:when test="${sideMenu == 'myPage'}">
				<div class="sidenav-menu">
					<div class="nav accordion" id="accordionSidenav">
				       <!-- Sidenav Menu Heading (정보내역)-->
	                   <div class="sidenav-menu-heading">정보내역</div>
							<a class="nav-link collapsed" href="${contextPath}/mypage/listMyOrderHistory.do">
	                            주문내역 조회
	                        </a>
							<a class="nav-link collapsed" href="${contextPath}/mypage/myDetailInfo.do">
	                            내 정보 수정
	                        </a>
							<a class="nav-link collapsed" href="${contextPath}/main/main.do">
	                            메인화면으로 이동
	                        </a>
						</div>
					</div>
			</c:when>
			<c:when test="${sideMenu == 'csCenter'}">
				<div class="sidenav-menu">
					<div class="nav accordion" id="accordionSidenav">
				       <!-- Sidenav Menu Heading (정보내역)-->
	                   <div class="sidenav-menu-heading">고객센터</div>
							<a class="nav-link collapsed" href="${contextPath}/cscenter/notice.do">
	                            공지사항
	                        </a>
							<a class="nav-link collapsed" href="${contextPath}/cscenter/faq.do">
	                            FAQ
	                        </a>
							<a class="nav-link collapsed" href="${contextPath}/main/main.do">
	                            메인화면으로 이동
	                        </a>
						</div>
					</div>
			</c:when>
			<c:otherwise>
				<div class="sidenav-menu">
					<div class="nav accordion" id="accordionSidenav">
				       <!-- Sidenav Menu Heading (카테고리)-->
	                   <div class="sidenav-menu-heading">카테고리</div>
							<a class="nav-link collapsed" href="${contextPath}/main/main.do?id=1" >
	                            베스트셀러
	                        </a>
							<a class="nav-link collapsed" href="${contextPath}/main/main.do?id=2" >
	                            신간
	                        </a>
							<a class="nav-link collapsed" href="${contextPath}/main/main.do?id=3" >
	                            스테디셀러
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
</body>
</html>