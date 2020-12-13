<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*, PostBean.*"%>

<html lang="kor">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/main.css"></link>
</head>
<%@ include file="top.jsp" %>
<body>
    <% if (session_id != null) { %>
    <div><%=user_name%>님 방문을 환영합니다 </div>
    <div class="post-table">

    <jsp:useBean id="PostMgr" class="PostBean.PostMgr" />
    <%
        Vector vlist = PostMgr.getPostList();%>
    <%    for (int i = 0 ; i < vlist.size(); i++){
        Post post = (Post)vlist.elementAt(i);
    %>
        <div class="post-container">
            <div>번호 : <%=i + 1%>
                <% if (session_id.equals(post.getUseremail())){ %>
                <a href="/post_update.jsp?id=<%=post.getPostid()%>">수정</a>
                <a href="/delete_post.jsp?id=<%=post.getPostid()%>">삭제</a>
                <%}%>
                <a href="/comment.jsp?id=<%=post.getPostid()%>">댓글보기</a>
            </div>
            <div>작성자 : <%=post.getUsername()%>
            </div>
            <div><%=post.getComment()%></div>
        </div>
    <%}%>
    </div>
    <div style="display:flex; justify-content: center">
        <form action="/hashtag_search.jsp" >
            <label for="searchHashtag">해시태그 검색</label>
            <input type="text" name="searchHashtag" id="searchHashtag">
            <button type="submit">검색</button>
        </form>
    </div>

    <% } else { %>
    <div>로그인한 후 사용하세요 .</div>
    <%
    }
    %>
</body>
</html>