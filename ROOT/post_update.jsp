<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>

<%
 int postId = Integer.parseInt(request.getParameter("id"));
 Connection myConn = null;
 Statement stmt = null;
 String mySQL = null;
 String dbUrl = "데이터베이스 url";
 String user = "아이디";
 String passwd = "비밀번호";
 String dbdriver = "oracle.jdbc.driver.OracleDriver";

 Class.forName(dbdriver);
 myConn = DriverManager.getConnection(dbUrl, user, passwd);
 stmt = myConn.createStatement();
 mySQL = "SELECT postcontent FROM project_post WHERE postid=" + postId;
 ResultSet myResultSet = stmt.executeQuery(mySQL);

 String beforePost = null;

 if (myResultSet.next()) {
  beforePost = myResultSet.getString(1);
 }
 stmt.close();
 myConn.close();
%>

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
  <div>게시글을 수정하세요</div>
  <hr>
  <form method="post" action="/post_update_verify.jsp">
   <input type="hidden" name="postId" value="<%=postId%>">
   <label for="thePost" >게시글</label>
   <textarea name="thePost" id="thePost" style="resize:none"><%=beforePost%></textarea>

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