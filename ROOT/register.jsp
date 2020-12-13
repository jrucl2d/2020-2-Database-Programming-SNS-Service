<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/register.css"></link>
</head>
<body>
<div class="outer-frame">
    <div class="register-frame">
        <div>이메일과 이름, 패스워드를 입력하세요</div>
        <hr>
        <form method="post" action="/register_verify.jsp">
            <label for="userEmail">이메일</label>
            <input type="email" id="userEmail" name="userEmail">
            <label for="userName">이름</label>
            <input type="text" id="userName" name="userName">
            <label for="userPassword">비밀번호</label>
            <input type="password" id="userPassword" name="userPassword">
            <div class="register-buttons">
                <button type="submit">회원가입</button>
                <button type="button" onClick="location.href='/main.jsp'">취소</button>
            </div>

        </form>
    </div>
</div>

</body>
</html>