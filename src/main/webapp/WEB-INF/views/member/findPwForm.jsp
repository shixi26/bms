<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<!-- 아이디와 이메일을 입력하여 인증받고 해당하는 id에 비밀번호 재설정 정보일치확인 -->
<script>
$().ready(function() {
	
	
	
	$("#select_email").change(function(){
		$("#email2").val($("#select_email option:selected").val());
	});
	
	$("#btnResetPw").click(function(){
		
		 var memberEmail = $("#email1").val();
		 var memberEmail2 = $("#email2").val();
		 var memberId = $("#memberId").val();

		if(memberEmail==''){
			alert("이메일을 입력하세요");
			return false;
		} else if(memberEmail2=='') {
			alert("이메일을 입력하세요");
			return false;
		} else if(memberId=='') {
		    alert("ID를 입력하세요");
		   	return false;
		} 
	});
	
	$("#btnOverlapped").click(function(){
		
	    var memberId = $("#memberId").val();
	   
	    if (memberId==''){
	   	 alert("ID를 입력하세요");
	   	 return;
	    }
	   
	    $.ajax({
	       type : "post",
	       url  : "${contextPath}/member/overlapped.do",
	       data : {id:memberId},
	       success : function (data){
	          if (data == 'false'){
	          	alert("존재하지않는 ID입니다.");
	          }
	          else {
	          	alert("존재하는 ID입니다.");
	          }
	       }
	    });
	    
	 });

	
	
	
});


</script>
</head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                            <div>
                                <!-- Social forgot password form-->
                                <div class="card my-5">
                                    <div class="card-body p-5 text-center"><div class="h3 font-weight-light mb-0">비밀번호 찾기</div></div>
                                    <hr class="my-0" />
                                    <div class="card-body p-5">
                                        <div class="text-center small text-muted mb-4">가입시 작성한 아이디와 이메일을 적어주세요.</div>
                                        <!-- Forgot password form-->
                                        <form>
                                            <!-- Form Group (아이디)-->
                                            <div class="form-group">
                                                <label class="text-gray-600 small" for="memberId">아이디</label>
                                                <input class="form-control form-control-solid" type="text" name="memberId" id="memberId" style="display:inline; width:300px;" />
                                                <input type="button" id="btnOverlapped" class="btn btn-primary btn-sm" value="계정존재여부" />
                                            </div>
                                            <!-- Form Group (이메일)-->
                                            <div class="form-group">
                                                <label class="text-gray-600 small" for="email1">이메일</label>
                                                <input class="form-control"  size="10px"  type="text" id="email1" name="email1" style="display:inline; width:100px; padding:0"  /> @ 
												<input class="form-control"  size="10px"  type="text" id="email2" name="email2" style="display:inline; width:100px; padding:0"  />
												<select class="form-control" id="select_email" name="email3" style="display:inline; width:100px; padding:0">
													 <option value="none" selected>직접입력</option>
													 <option value="gmail.com">gmail.com</option>
													 <option value="naver.com">naver.com</option>
													 <option value="daum.net">daum.net</option>
													 <option value="nate.com">nate.com</option>
												</select><br><br>
                                            </div>
                                            <!-- Form Group (reset password button)    -->
                                            <div class="form-group mb-0"><a class="btn btn-primary btn-sm" id="btnResetPw" href="${contextPath}/member/loginForm.do">비밀번호초기화</a></div>
                                        </form>
                                    </div>
                                    <hr class="my-0" />
                                    <div class="card-body px-5 py-4">
                                        <div class="small text-center">
                                            New user?
                                            <a href="${contextPath}/member/memberForm.do">회원가입하기!</a>
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