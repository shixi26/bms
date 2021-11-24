<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
</head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-11">
                                <!-- Social forgot password form-->
                                <div class="card my-5">
                                    <div class="card-body p-5 text-center"><div class="h3 font-weight-light mb-0">Password Recovery</div></div>
                                    <hr class="my-0" />
                                    <div class="card-body p-5">
                                        <div class="text-center small text-muted mb-4">Enter your email address below and we will send you a link to reset your password.</div>
                                        <!-- Forgot password form-->
                                        <form>
                                            <!-- Form Group (email address)-->
                                            <div class="form-group">
                                                <label class="text-gray-600 small" for="emailExample">Email address</label>
                                                <input class="form-control form-control-solid" type="text" placeholder="" aria-label="Email Address" aria-describedby="emailExample" />
                                            </div>
                                            <!-- Form Group (reset password button)    -->
                                            <div class="form-group mb-0"><a class="btn btn-primary" href="auth-login-social.html">Reset Password</a></div>
                                        </form>
                                    </div>
                                    <hr class="my-0" />
                                    <div class="card-body px-5 py-4">
                                        <div class="small text-center">
                                            New user?
                                            <a href="auth-register-social.html">Create an account!</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="js/scripts.js"></script>
    </body>
</html>