<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

<title>order</title>

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
	<hr style="box-shadow: 2px 0px 23px #d3d3d3;">
	<div class="content">
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
								<li><a href="user-getUserInfo.action">我的信息</a></li>
								<li><a>我的收藏</a></li>
								<li><a>安全中心</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 60%; float: right; margin-right: 20%;">
		<span style="font-size: 18px;font-weight: 600;color: #447c81;">一般订单</span>
		<table class="table able table-striped">
			<thead>
				<tr>
					<td>产品信息</td>
					<td>订单全额</td>
					<td>出发日期</td>
					<td>订单状态</td>
					<td>订单操作</td>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.OrderList">
					<tr>
						<td>${tourism.tourismTitle }</td>
						<td>${tourism.price }</td>
						<td>${startTime }</td>
						<td>${orderStatus }</td>
						<td><a href="comment-makeComment.action?tourismId=${tourism.tourismId }">去评价</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<span style="font-size: 18px;font-weight: 600;color: #447c81;">定制游订单</span>
		<table class="table able table-striped">
			<thead>
				<tr>
					<td>出发地</td>
					<td>订目的地</td>
					<td>游玩天数</td>
					<td>总人数</td>
					<td>预算</td>
					<td>定制类型</td>
					<td>定制主题</td>
					<td>说明</td>					
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.DingZhiOrderList">
					<tr>
						<td>${StartPlacee}</td>
						<td>${EndPlace }</td>
						<td>${Days }</td>								
						<td>${PersonAmount }</td>
						<td>${Budget }</td>
						<td>${OrderType }</td>
						<td>${TripWay }</td>
						<td>${Addition }</td>
						<td><a>查看订单</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
		<jsp:include page="foot.jsp" />
	<script src="scripts/jquery-1.9.1.min.js"></script>
	<script src="scripts/bootstrap.min.js"></script>
	<script type="text/javascript">
	/*旅游游记的hover事件*/
	$("#note").hover(function(){
		$(".submenu-nav").css("display","block");
	});
	$(".submenu-nav").hover(function(){
		$(".submenu-nav").css("display","block");
	},function(){
		$(".submenu-nav").css("display","none");
	});
	/*为搜索标签添加click事件*/
	$(".search-a").click(
			function() {
				var input = $(".search-text").val();
				$(this).attr(
						"href",
						"tourism-tourismSearch.action?key=" + input
								+ "");
	});
	</script>	
</body>
</html>
