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
<html>
<head>
<base href="<%=basePath%>">

<title>order</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/ptiscss/common.css" />
<link rel="stylesheet" href="css/ptiscss/dingzhiyou.css" />
</head>

<body>
	<jsp:include page="header.jsp" />
	<hr style="box-shadow: 2px 0px 23px #d3d3d3;">
	<div style="margin-left:116px">
		<div class="udiyblock">
			<div class="order-left panel-default">
				<div class="panel-heading panel-title" style="border:0px">
					<a href="order-userOrder.action">我的订单</a>
				</div>
				<p class="hr"></p>
				<div class="panel-heading panel-title" style="border:0px">
					<a>我的社区主页</a>
				</div>
				<div class="panel panel-default"
					style="border:0px;-webkit-box-shadow:0px 0px 0px;box-shadow:0px 0px 0px">
					<div class="panel-heading" style="border:0px">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseTwo">个人中心</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse">
						<div class="panel-body">
							<ul id="list" class="collapse in">
								<li><a>我的信息</a></li>
								<li><a>我的收藏</a></li>
								<li><a>安全中心</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style=" float: right;">
		<div class=" clearfix">
			<div class="me_needTrip">
				<div class="you_name">
					<span>个人资料</span>
				</div>
				<div class="you_name">

					<span> <i>*</i>用&nbsp;&nbsp;户&nbsp;&nbsp;名
					</span> <input class="nomal" maxlength="10" readonly="readonly" value="${UserInfo.userName }">
				</div>
				<div class="you_phone">
					<span> <i>*</i> 电话号码
					</span> <input class="nomal"maxlength="11"  readonly="readonly" value="${UserInfo.userEmail }">
				</div>
				<div class="mail_box">
					<span> <i>*</i> 电子邮箱
					</span> <input  class="nomal" readonly="readonly"  value="${UserInfo.userEmail }"> 
				</div>
				<div class="company_box">
					<span> <i>*</i> 职业类型
					</span> <input class="nomal"maxlength="30"  readonly="readonly" value="${UserInfo.userProfessional }"> 
				</div>
				<div class="company_box">
					<span> <i>*</i> 性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别
					</span> <s:if test="#request.UserInfo.userSex==1">
					<input class="nomal"maxlength="30"  readonly="readonly" value="女"></s:if> 
					<s:else><input class="nomal"maxlength="30"  readonly="readonly" value="男"></s:else>
				</div>
			</div>
		</div>		
	</div>
		<jsp:include page="foot.jsp" />
	<script src="scripts/jquery-1.9.1.min.js"></script>
	<script src="scripts/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".person-center").click(function() {

			});
		});
	</script>
</body>
</html>
