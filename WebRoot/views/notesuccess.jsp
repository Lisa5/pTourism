<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>success</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/ptiscss/common.css" />
</head>
<body>
<jsp:include page="header.jsp" />
	
	<div style="margin-top: 200px;float: left;margin-left: 27%;margin-bottom:200px">
		<span style="padding: 10px;font-size: 22px; color: #EF5050;">您的游记已经提交成功，待管理员审核通过后发表！</span><br>		
	</div>
	
	<jsp:include page="foot.jsp" />
</body>
</html>