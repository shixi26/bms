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
	
	<!-- 로그인정보일치확인 -->
	<c:if test='${invalidMember eq true}'>
		<script>
			$().ready(function(){
				alert("아이디와 비밀번호를 확인하세요.");
			});
			
		
		</script>
	</c:if>
</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
    	<div id="layoutAuthentication_content">
        	<main>
                <div class="container">
                	<div>
                         <!-- Social login form-->
                                <div class="card my-5">
                                    <div class="card-body p-5 text-center">
                                        <div class="h3 font-weight-light mb-3">로그인 하기</div>
                                        <!-- Social login links-->
                                        <!-- naver -->
                                        <a href="${contextPath }/oauth/NAVER"><img width="50" height="50" src="${contextPath }/resources/image/btnG_icon_square.png" /></a>
                                        <!-- google -->
                                        <a href="${contextPath }/oauth/GOOGLE"><img width="55" height="55" src="${contextPath }/resources/image/btn_google_light_pressed_ios.svg" /></a>
                                        <!-- kakao -->
                                        <a href="${contextPath }/oauth/KAKAO"><img width="50" height="50" src="${contextPath }/resources/image/kakaolink_btn_medium_ov.png" /></a>
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
                                            <div class="form-group"><a class="small" href="${contextPath }/member/findPwForm.do">비밀번호찾기</a></div>
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
                </main>
              </div>
         </div>
    </body>	
</html>