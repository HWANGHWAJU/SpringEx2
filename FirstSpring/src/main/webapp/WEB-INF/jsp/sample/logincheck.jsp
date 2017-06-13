<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    session="true"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
로그인 세션
로그인 아이디 : ${sessionScope.loginUser.id }<br>
로그인 닉네임 : ${sessionScope.loginUser.name}

</body>
</html>