<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ page import="CommentBean.*"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="EUC-KR">
 <title></title>
</head>
<body>
<%
 String comment =  new String(request.getParameter("comment").getBytes("8859_1"),"utf-8");
 int commentId = Integer.parseInt(request.getParameter("commentId"));
 int postId = Integer.parseInt(request.getParameter("postId"));

%>
<jsp:useBean id="CommentMgr" class="CommentBean.CommentMgr" scope="page"/>
<%
  int theResult = CommentMgr.updateComment(comment, commentId);
  if(theResult == 1) {%>
<script>
 alert("댓글이 수정되었습니다.");
 location.href = "/comment.jsp?id=<%=postId%>";
</script>
<%} else{%>
<script>
 alert("빈 댓글로 수정할 수 없습니다.");
 location.href = "/comment_update.jsp?cid=<%=commentId%>&pid=<%=postId%>";
</script>
<%}%>

</body>
</html>