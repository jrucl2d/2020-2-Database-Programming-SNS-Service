<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ page import="CommentBean.*"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="EUC-KR">
 <title>게시글 삭제 </title>
</head>
<body>
<%
 int commentId = Integer.parseInt(request.getParameter("cid"));
 int postId = Integer.parseInt(request.getParameter("pid"));
%>
<jsp:useBean id="CommentMgr" class="CommentBean.CommentMgr" scope="page"/>
<%
 CommentMgr.deleteComment(commentId);
%>
<script>
 alert("삭제되었습니다.");
 location.href = "/comment.jsp?id=<%=postId%>";
</script>
</body>
</html>