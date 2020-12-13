<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
 Connection myConn = null;
 String dburl = "데이터베이스 url";
 String user = "아이디";
 String passwd = "비밀번호";
 String dbdriver = "oracle.jdbc.OracleDriver";

 String userEmail =  new String(request.getParameter("userEmail").getBytes("8859_1"),"utf-8");
 String userName =  new String(request.getParameter("userName").getBytes("8859_1"),"utf-8");
 String userPassword =  new String(request.getParameter("userPassword").getBytes("8859_1"),"utf-8");
%>
 <%
  try{
  Class.forName(dbdriver);
  myConn = DriverManager.getConnection(dburl, user, passwd);
 } catch(SQLException ex){
  System.err.println("SQLException : " + ex.getMessage());
 }
 CallableStatement cstmt = myConn.prepareCall("{call project_user_insert(?, ?, ?)}");
 cstmt.setString(1, userEmail);
 cstmt.setString(2, userName);
 cstmt.setString(3, userPassword);

 try{
  cstmt.execute();
 }catch(SQLException ex){%>
<script>
 alert("이미 존재하는 계정입니다");
 location.href = "register.jsp";
</script>
<% } finally{
  if(cstmt != null){
   try{
    myConn.commit();
    cstmt.close();
    myConn.close();%>
<script>
 location.href = "main.jsp";
</script>
   <%} catch(SQLException ex){
   }
  }
 }
%>
