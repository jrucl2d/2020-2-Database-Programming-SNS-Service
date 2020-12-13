<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/login.css"></link>
</head>
<body>
    <div class="outer-frame">
        <div class="login-frame">
            <div>이메일과 패스워드를 입력하세요</div>
            <hr>
             <form method="post" action="/login_verify.jsp">
                 <label for="userEmail">이메일</label>
                 <input type="email" id="userEmail" name="userEmail">
                 <label for="userPassword">비밀번호</label>
                 <input type="password" id="userPassword" name="userPassword">
                 <div class="login-buttons">
                    <button type="submit">로그인</button>
                    <button type="button" onClick="location.href='/main.jsp'">취소</button>
                 </div>

             </form>
        </div>
    </div>

</body>
</html>