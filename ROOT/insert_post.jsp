<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/main.css"></link>
    <link rel="stylesheet" href="/css/post.css"></link>
</head>
<%@ include file="top.jsp" %>
<body>
<% if (session_id != null) { %>
<br>

<div class="outer-frame">
    <div class="post-frame">
        <div>게시글을 작성하세요</div>
        <hr>
        <form method="post" action="/post_verify.jsp">
            <input type="hidden" name="useremail" value="<%=session_id%>">
            <label for="hashtag">해시태그</label>
            <input type="text" id="hashtag" name="hashtag" placeholder="#해시 #태그">
            <label for="thePost">게시글</label>
            <textarea name="thePost" id="thePost" style="resize:none"></textarea>

            <div class="post-buttons">
                <button type="submit">제출</button>
                <button type="button" onClick="location.href='/main.jsp'">취소</button>
            </div>

        </form>
    </div>
</div>
<% } else { %>
<div>로그인한 후 사용하세요 .</div>
<%
    }
%>


</body>
</html>