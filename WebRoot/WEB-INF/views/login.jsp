<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

<title>login</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/matrix-login.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.useso.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="/css/ptiscss/common.css" />


</head>
<!-- action="http://themedesigner.in/demo/matrix-admin/index.html" -->
<body>
	
	<div id="loginbox">
		<form id="loginform" class="form-vertical" action="userLogin-Login"
			style="margin-right: 511px;margin-left: 510px;">
			<div class="control-group normal_text">
				<h3>
					<img src="img/logo.png" alt="Logo" style="width: 107px" />
				</h3>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_lg"><i class="icon-user"></i></span><input
							type="text" placeholder=" 用户名" name=userName id="userName" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_ly"><i class="icon-lock"></i></span><input
							type="password" name="userPwd" placeholder=" 密码" />
					</div>
				</div>
			</div>
			<label style="color:#C31;margin-left: 46px">${errorInfo.loginfailed }</label>
			<div class="form-actions">
				<span class="pull-left"> <a href="#" id="to-recover">忘记密码？</a>
				</span> <span class="pull-right"> <s:submit
						class="btn btn-success btn-gel"
						style="width: 110px;height: 33px;  border: 0;background: #ffb848;"
						value="登录">
					</s:submit>
				</span> <span class="pull-left" style="width:100%"> <a
					href="userRegister-registerInput" style="color: #B97D0B;">立即注册</a>，享受会员优惠
				</span>
			</div>
		</form>
		<form id="recoverform" action="#" class="form-vertical">
			<p class="normal_text">Enter your e-mail address below and we
				will send you instructions how to recover a password.</p>

			<div class="controls">
				<div class="main_input_box">
					<span class="add-on bg_lo"><i class="icon-envelope"></i></span> <input
						type="text" placeholder="E-mail address" />
				</div>
			</div>

			<div class="form-actions">
				<span class="pull-left"><a href="#"
					class="flip-link btn btn-success" id="to-login">&laquo; Back to
						login</a></span> <span class="pull-right"> <a class="btn btn-info" />Reecover
				</span>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="scripts/jquery-1.9.1.min.js"></script>
	<!-- <script type="text/javascript" src="scripts/matrix.login.js"></script>
-->
	<script type="text/javascript">
		$(function() {
			$(":input[name=userName]").change(function() {
				// alert("hello");
				var username = $(this).val();
				username = $.trim(username);
				var $this = $(this);

			});
		});
	</script>
</body>
</html>
