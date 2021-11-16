<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<!-- bootstrap css -->
	<link href="${contextPath }/resources/css/styles.css" rel="stylesheet" type="text/css"/>
	<link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
	<script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
	
	<!-- 로그인정보일치확인 -->
	<c:if test='${invalidMember eq true}'>
		<script>
			$().ready(function(){
				alert("아이디와 비밀번호를 확인하세요.");
			});
		</script>
	</c:if>
</head>
<body>
	<div id="layoutAuthentication">
    	<div id="layoutAuthentication_content">
        	<main>
                <div class="container">
                	<div class="row justify-content-center">
                         <div>
                         <!-- Social login form-->
                                <div class="card my-5">
                                    <div class="card-body p-5 text-center">
                                        <div class="h3 font-weight-light mb-3">로그인 하기</div>
                                        <!-- Social login links-->
                                        <!-- naver -->
                                        <a href="${contextPath }/auth/GOOGLE"><img width="50" height="50" src="${contextPath }/resources/image/btnD_icon_circle.png" /></a>
                                        <!-- google -->
                                        <a href="${contextPath }/auth/GOOGLE"><img /></a>
                                    </div>
                                    <hr class="my-0" />
                                    <div class="card-body p-5">
                                        <!-- Login form-->
                                        <form action="${contextPath}/member/login.do" method="post">
                                            <!-- Form Group (아이디)-->
                                            <div class="form-group">
                                                <label class="text-gray-600 small" for="memberId">아이디</label>
                                                <input class="form-control form-control-solid" id="memberId" name="memberId" type="text" placeholder="아이디를 입력하세요." />
                                            </div>
                                            <!-- Form Group (비밀번호)-->
                                            <div class="form-group">
                                                <label class="text-gray-600 small" for="memberPw">비밀번호</label>
                                                <input class="form-control form-control-solid" id="memberPw" name="memberPw" type="password" placeholder="비밀번호를입력하세요." />
                                            </div>
                                            <!-- Form Group (비밀번호찾기)-->
                                            <div class="form-group"><a class="small" href="auth-password-social.html">비밀번호찾기</a></div>
                                            <!-- Form Group (login box)-->
                                            <div class="form-group d-flex align-items-center justify-content-between mb-0">
                                                <div class="custom-control custom-control-solid custom-checkbox">
                                                    <input class="custom-control-input small" id="customCheck1" type="checkbox" />
                                                    <label class="custom-control-label" for="customCheck1">비밀번호 기억하기</label>
                                                </div>
                                                <input type="submit" class="btn btn-primary" value="로그인">
                                            </div>
                                        </form>
                                    </div>
                                    <hr class="my-0" />
                                    <div class="card-body px-5 py-4">
                                        <div class="small text-center">
                                            New user?
                                            <a href="${contextPath}/member/memberForm.do">새로운 계정 만들기!</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="footer mt-auto footer-dark">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 small">Copyright &copy; Your Website 2021</div>
                            <div class="col-md-6 text-md-right small">
                                <a href="#!">Privacy Policy</a>
                                &middot;
                                <a href="#!">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"/>
        <script src="js/scripts.js"/>
    </body>	

</html>