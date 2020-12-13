<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ page import="PostBean.*"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="EUC-KR">
 <title>게시글 삭제 </title>
</head>
<body>
<%
 int postId = Integer.parseInt(request.getParameter("id"));
%>
<jsp:useBean id="PostMgr" class="PostBean.PostMgr" scope="page"/>
<%
 PostMgr.deletePost(postId);
%>
<script>
 alert("삭제되었습니다.");
 location.href = "main.jsp";
</script>
</body>
</html>