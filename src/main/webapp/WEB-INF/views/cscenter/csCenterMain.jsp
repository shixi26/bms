<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<body>
<div class="card card-header-actions">
    <div class="card-header">
		고객센터
        <button class="btn btn-primary btn-sm" onclick="#">더보기</button>
    </div>
    <div class="card-body">
    <div class="datatable">
		<table class="table table-bordered table-hover">
		  <tr>
		    <td>이메일</td>
		    <td><strong>${memberInfo.email1 }@${memberInfo.email2 }</strong></td>
		   </tr>
		   <tr>
		    <td>전화번호</td>
		    <td><strong>${memberInfo.hp1 }-${memberInfo.hp2}-${memberInfo.hp3 }</strong></td>
		   </tr>
		   <tr>
		    <td>주소</td>
		    <td>
				도로명:  &nbsp;&nbsp; <strong>${memberInfo.roadAddress }</strong>  <br>
				지번:   &nbsp;&nbsp; <strong>${memberInfo.jibunAddress }</strong> 
		   </td>
		   </tr>
		</table>
		</div>
    </div>
</div>
</body>
</html>