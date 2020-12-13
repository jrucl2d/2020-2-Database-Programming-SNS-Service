<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ page import="PostBean.*"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="EUC-KR">
 <title>게시글 추가</title>
</head>
<body>
<%
 int postId = Integer.parseInt(request.getParameter("postid"));
 String comment =  new String(request.getParameter("comment").getBytes("8859_1"),"utf-8");
 String useremail =  new String(request.getParameter("useremail").getBytes("8859_1"),"utf-8");
%>
<jsp:useBean id="CommentMgr" class="CommentBean.CommentMgr" scope="page"/>
<%
  int theResult = CommentMgr.insertNewComment(comment, useremail, postId);
 if(theResult == 1) {%>
<script>
 alert("새로운 댓글이 추가되었습니다.");
 location.href = "/comment.jsp?id=<%=postId%>";
</script>
<%} else{%>
<script>
 alert("빈 댓글을 추가할 수 없습니다.");
 location.href = "/insert_comment.jsp?pid=<%=postId%>";
</script>
<%}%>

</body>
</html>