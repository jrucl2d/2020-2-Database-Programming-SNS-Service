<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% 
    String session_id = (String)session.getAttribute("user");
    String user_name = (String)session.getAttribute("userName");
    String log;
    if (session_id==null) log="<a href=login.jsp>로그인 </a>";
    else log="<a href=logout.jsp> 로그아웃 </a>";
%>
    <header>
        <table>
            <td><%=log%></td>
            <%if(session_id==null) {%>
            <td><a href="/register.jsp">회원가입</a></td>
            <%}%>
            <td><a href="/main.jsp">메인 화면</a></td>
            <td><a href="/insert_post.jsp">게시글 작성</a></td>
        </table>
    </header>