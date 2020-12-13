<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*, CommentBean.*"%>

<html lang="kor">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/main.css"></link>
</head>
<%@ include file="top.jsp" %>
<body>
    <% if (session_id != null) {
        int postId = Integer.parseInt(request.getParameter("id"));
    %>
    <br>
    <div class="post-table">
        <a href="/insert_comment.jsp?pid=<%=postId%>" style="margin-bottom: 1rem; border: 1px solid black; padding : .3rem; text-decoration: none">댓글 추가</a>

        <jsp:useBean id="CommentMgr" class="CommentBean.CommentMgr" />
    <%
        Vector vlist = CommentMgr.getCommentList(postId);%>
    <%    for (int i = 0 ; i < vlist.size(); i++){
        Comment comment = (Comment)vlist.elementAt(i);
    %>
        <div class="post-container">
            <div>번호 : <%=i + 1%>
                <% if (session_id.equals(comment.getUseremail())){ %>
                <a href="/comment_update.jsp?cid=<%=comment.getCommentid()%>&pid=<%=postId%>">수정</a>
                <a href="/delete_comment.jsp?cid=<%=comment.getCommentid()%>&pid=<%=postId%>">삭제</a>
                <%}%>
            </div>
            <div>작성자 : <%=comment.getUsername()%>
            </div>
            <div><%=comment.getComment()%></div>
        </div>
    <%}%>
    </div>
    <% } else { %>
    <div>로그인한 후 사용하세요 .</div>
    <%
    }
    %>
</body>
</html>