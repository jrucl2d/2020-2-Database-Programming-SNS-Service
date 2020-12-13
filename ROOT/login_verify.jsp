<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
 <%
String userEmail = request.getParameter("userEmail");
String userPassword = request.getParameter("userPassword");
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
mySQL = "SELECT username FROM project_user WHERE useremail='" + userEmail + "' AND userpassword='" + userPassword + "'";
ResultSet myResultSet = stmt.executeQuery(mySQL);

if (myResultSet.next()) {
session.setAttribute("user", userEmail);
session.setAttribute("userName", myResultSet.getString(1));
response.sendRedirect("main.jsp");
} else {
%>
<script>
alert("이름 혹은 비밀번호가 틀렸습니다.");
location.href = "login.jsp";
</script>
<%
}
stmt.close();
myConn.close();
%>