<%@ page language="java" contentType="text/html;charset=GBK"  import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags"%><!-- 导入struts2 的 tag标签 -->

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <html>
 <head>
<base href="<%=basePath%>">

<title>My JSP 'emp-input.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-type" content="text/html;charset=UTF-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<h1>input save</h1>
	<s:form action="emp-save" method="post">
		<s:textfield name="lastName" label="LastName"></s:textfield>
		<s:textfield name="email" label="Email"></s:textfield>
		<s:textfield name="birth" label="Birth"></s:textfield>
		
		<s:select list="#request.departments" listKey="departmentId"
			listValue="departmentName" name="department.departmentId"
			label="Department">
		</s:select>
		
		<s:submit ></s:submit>
	</s:form>
	
	<s:if test="#request.departments==null||#request.departments.size()==0">
         没任何员工数据
    </s:if>
	<s:else>
		
	</s:else>
</body>
</html>
