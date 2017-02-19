<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	boolean isLogin = false;
	if (request.getSession().getAttribute("user") != null) {
		isLogin = true;
	}
	request.setAttribute("isLogin", isLogin);
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>success</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/ptiscss/common.css" />

</head>

<body>
<jsp:include page="header.jsp" />	
	<div style="margin-top: 200px;float: left;margin-left: 27%;">
		<span style="padding: 10px;font-size: 22px;">恭喜，您已注册成功！</span><br>
		<span style="padding: 10px;font-size: 20px;">登录名为：${userInfo.userName }</span><br>
		<a href="userLogin-loginInput"
			style="margin-top: 15px;margin-left: 14px;padding: 6px 24px;color: #fff;;width: 110px;height: 33px;  border: 0;background: #ffb848;float:left;cursor: pointer;">
			立即登陆 </a>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>
