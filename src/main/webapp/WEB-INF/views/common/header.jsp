<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
    <head>
    <!-- bootstrap css적용 -->
    	<meta charset="utf-8" />
    	<link href="${contextPath }/resources/css/stylesCustom.css" rel="stylesheet">
    </head>
    
	<body>
		<nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
			<c:choose>
			<c:when test="${isLogOn == true and memberInfo.memberId == 'admin' }">
				<a class="navbar-brand" href="${contextPath}/main/main.do">Book Management System</a>							
			</c:when>
			<c:otherwise>
				<a class="navbar-brand" href="${contextPath}/main/main.do"><img src="${contextPath}/resources/image/hao_logo1.png"></a>							
			</c:otherwise>
			</c:choose>
			<!-- 검색기능 -->
			<form class="form-inline mr-auto d-none d-md-block mr-3" name="frmSearch" action="${contextPath}/goods/searchGoods.do" >
                <div class="input-group input-group-joined input-group-solid" style='width:400px;'>
                    <input name="searchWord" class="form-control mr-sm-2" type="text" placeholder="Search"  />
					<input type="submit" name="search" class="btn btn-sm btn-primary" value="검 색" >
                </div>
            </form>

			<!-- 상단바 아이템 -->
            <ul class="navbar-nav align-items-center ml-auto">
				<c:choose>
			    <c:when test="${isLogOn == true and memberInfo.memberId =='admin' }">  
				   <li><a href="${contextPath}/admin/goods/adminGoodsMain.do">관리자 화면</a></li>
				   <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
				</c:when>
			    <c:when test="${isLogOn == true and not empty memberInfo }">
				   <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
				   <li><a href="${contextPath}/mypage/myPageMain.do">마이페이지</a></li>
				</c:when>
				<c:otherwise>
				   <li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
				   <li><a href="${contextPath}/member/memberForm.do">회원가입</a></li> 
				</c:otherwise>
				</c:choose>
				</ul>
		</nav>
	</body>
</html>