<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ page import="java.sql.*, PostBean.*"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="EUC-KR">
 <title>게시글 추가</title>
</head>
<body>
<%
 String hashtag =  new String(request.getParameter("hashtag").getBytes("8859_1"),"utf-8");
 String thePost =  new String(request.getParameter("thePost").getBytes("8859_1"),"utf-8");
 String useremail =  new String(request.getParameter("useremail").getBytes("8859_1"),"utf-8");
%>
<jsp:useBean id="PostMgr" class="PostBean.PostMgr" scope="page"/>
<%
  int theResult = PostMgr.insertNewPost(thePost, useremail);
  if(theResult == 1) {
   String [] hashtags = hashtag.split(" ");
   Connection myConn = null;
   String dburl = "데이터베이스 url";
   String user = "아이디";
   String passwd = "비밀번호";
   String dbdriver = "oracle.jdbc.OracleDriver";
   Class.forName(dbdriver);
   myConn = DriverManager.getConnection(dburl, user, passwd);
   for(int i = 0 ; i < hashtags.length; i++){

    CallableStatement cstmt = myConn.prepareCall("{call project_hashtag_insert(?)}");
    cstmt.setString(1, hashtags[i]);
    try{
     cstmt.execute();
    } catch(Exception err){

    }
   }

%>
<script>
 alert("새로운 게시글이 추가되었습니다.");
 location.href = "main.jsp";
</script>
<%} else{%>
<script>
 alert("빈 게시글을 추가할 수 없습니다.");
 location.href = "insert_post.jsp";
</script>
<%}%>

</body>
</html>