<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
</head>
<body>
    <h1>로그인</h1>
    <form action="loginProcess.jsp" method="POST">
        <label for="username">아이디:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required><br>

        <button type="submit">로그인</button>
    </form>
    <web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee" version="3.1">
    <!-- 보안 설정 -->
    <security-constraint>
        <web-resource-collection>
            <web-resource-name>Protected Pages</web-resource-name>
            <url-pattern>/protected/*</url-pattern>
        </web-resource-collection>
        <auth-constraint>
            <role-name>USER</role-name>
        </auth-constraint>
    </security-constraint>

    <!-- 로그인 설정 -->
    <login-config>
        <auth-method>FORM</auth-method>
        <form-login-config>
            <form-login-page>/login.jsp</form-login-page>
            <form-error-page>/loginError.jsp</form-error-page>
        </form-login-config>
    </login-config>

    <!-- 사용자 역할 정의 -->
    <security-role>
        <role-name>USER</role-name>
    </security-role>
</web-app>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // 간단한 사용자 인증 (실제로는 DB와 연동해야 합니다)
    if ("admin".equals(username) && "123456".equals(password)) {
        session.setAttribute("username", username);
        response.sendRedirect("protected/welcome.jsp"); // 로그인 성공 시 리다이렉트
    } else {
        response.sendRedirect("loginError.jsp"); // 로그인 실패
    }
%>
    
</body>
</html>
