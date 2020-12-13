<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ page import="PostBean.*"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="EUC-KR">
 <title></title>
</head>
<body>
<%
 String thePost =  new String(request.getParameter("thePost").getBytes("8859_1"),"utf-8");
 int postId = Integer.parseInt(request.getParameter("postId"));
%>
<jsp:useBean id="PostMgr" class="PostBean.PostMgr" scope="page"/>
<%
  int theResult = PostMgr.updatePost(thePost, postId);
  if(theResult == 1) {%>
<script>
 alert("게시글이 수정되었습니다.");
 location.href = "main.jsp";
</script>
<%} else{%>
<script>
 alert("빈 게시글로 수정할 수 없습니다.");
 location.href = "post_update.jsp?id=<%=postId%>";
</script>
<%}%>

</body>
</html>