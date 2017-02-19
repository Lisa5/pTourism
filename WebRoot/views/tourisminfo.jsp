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
<title>景点详情</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"
	media="all" />
<!--theme-style-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/ptiscss/common.css" />
<link rel="stylesheet" href="css/ptiscss/infostyle.css" type="text/css"
	media="all" />
<link rel="stylesheet" href="css/ptiscss/myinfo.css" />
<link rel="stylesheet" href="css/etalage.css" type="text/css"
	media="all" />
<!--//theme-style-->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="application/x-javascript">	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!--fonts-->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!--//fonts-->
<script src="scripts/jquery-1.9.1.min.js"></script>
<script src="scripts/jquery.etalage.min.js"></script>
<script>
	jQuery(document)
			.ready(
					function($) {
						$('#etalage')
								.etalage(
										{
											thumb_image_width : 430,
											thumb_image_height : 450,
											source_image_width : 900,
											source_image_height : 1200,
											show_hint : true,
											click_callback : function(
													image_anchor, instance_id) {
												alert('Callback example:\nYou clicked on an image with the anchor: "'
														+ image_anchor
														+ '"\n(in Etalage instance: "'
														+ instance_id + '")');
											}
										});
					});
</script>

</head>
<body>
	<jsp:include page="header.jsp" />
	<hr style="box-shadow: 2px 0px 20px #d3d3d3;">
	<!--header-->
	<div class="header" style="background: #f6f6f6; padding-top: 20px;padding-bottom:20px">

		<div class="container" style="background:#fff">
		<div style="float:left;width: 100%;">
			<form action="#order-saveOrder.action" method="post">
				<div class=" single_top">

					<div class="single_grid">

						<div class="grid images_3_of_2">
							<ul id="etalage" style="color:#fff">${piccode}</ul>
							<div class="clearfix"></div>
						</div>
						<div class="desc1 span_3_of_2" style="padding-top:20px">
							<span style="font-size: 24px;font-weight: 600;color: #447C8D;">${TourismInfo.tourismTitle }</span>
							<span style="font-size: 22px;float: right;color: #EF5050;">
							 满意度<span style="font-weight:600"> ${TourismInfo.tourismPraise }</span><span style="font-size:14px">%</span></span>
							<div style="padding:10px">
							<span style="font-size: 15px;font-weight: 500;color: #2D1;">${TourismInfo.tourismSubtitle }</span>
							</div>
							<div style="padding:10px">
							<p>
							<script>
								document.write("省：" + myprovince + ' 市：'
										+ mycity);
							</script>
						   </p>
							    <a class="link" id="province" href="" target=_blank></a>
							</div>
							<div style="background: #f6f6f6;padding: 10px;">							
								<span style="font-weight:300;font-size:15px;color:#EF5050">￥</span>
								<span name=orderPrice style="font-weight:600px;font-size:22px;color:#EF5050">${TourismInfo.price }</span>
								<span style="font-weight:300;font-size:15px;color:#EF5050">起/人</span>
							    
							    <span style="font-size:15px;margin-left:150px">共</span>
							    <span style="font-size:22px;font-weight:600;color:#EF5050">${TourismInfo.tourDays }</span>
							    <span style="font-size:15px">天</span>
							</div>
							<div style="padding:10px">
							<span style="font-size: 20px;font-weight: 600;">推荐理由：</span>
							<span style="font-size:15px">${TourismInfo.recommendIntro }</span>
							<div class="cart-b">
								<div class="left-n"></div>
								<a class="now-get get-cart-in"
									href="order-saveOrder.action?tourism.tourismId=${tourismId}&orderPrice=${TourismInfo.price}&userId=${user.userId}">立即预定</a>
								<div class="clearfix"></div>
							</div>
							</div>
							<div class="share">
								<h5>分享</h5>
								<ul class="share_nav">
									<li><a href="#"><img src="img/facebook.png"
											title="facebook"> </a></li>
									<li><a href="#"><img src="img/twitter.png"
											title="Twiiter"></a></li>
									<li><a href="#"><img src="img/rss.png" title="Rss">
									</a></li>
									<li><a href="#"><img src="img/gpluse.png"
											title="Google+"></a></li>
								</ul>
							</div>
						</div>

						<div class="clearfix"></div>
					</div>
				</div>
			</form>
			</div>
			<div style="float: left; background-color: rgba(64, 64, 70, 0.9); width: 100%;color: #fff;margin-bottom: 20px;height: 40px;padding: 6px;">
			  <span style="font-size:20px;color:#fff">用户评论</span>
			</div>		
			<s:iterator value="#request.CommentList">
				<div class="comment-info">
					<div class="info-list">
					<div style="float: left;width: 150px;height: 110px;margin: 10px;text-align: center;">
					<img src="img/logo.png"
									style="width: 80px;height: 68px;margin-top: -30px;"></img>
					<div style="text-align: center;">${user.userName } </div>
					</div>
					<div style="margin-left: 180px;">
					<p>${content }</p>
					<div class="content-time">
								<p>${createTime }</p>
							</div>
					</div>									
					</div>					
				</div>

			</s:iterator>
		</div>
	</div>
	<jsp:include page="foot.jsp" />
	<!-- 新浪 城市定位 接口-->
	<script type="text/javascript"
		src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
	<script type="text/javascript">
	var myprovince = remote_ip_info['province'];
	var mycity = remote_ip_info['city'];
	var mydistrict = remote_ip_info['district'];
		$(window).load(function() {
			$('#province').text(myprovince); //定义A链接里面相应的省份
			$("#flexiselDemo1").flexisel({
				visibleItems : 5,
				animationSpeed : 1000,
				autoPlay : true,
				autoPlaySpeed : 3000,
				pauseOnHover : true,
				enableResponsiveBreakpoints : true,
				responsiveBreakpoints : {
					portrait : {
						changePoint : 480,
						visibleItems : 1
					},
					landscape : {
						changePoint : 640,
						visibleItems : 2
					},
					tablet : {
						changePoint : 768,
						visibleItems : 3
					}
				}
			});

		});
	</script>
	<script type="text/javascript" src="scripts/jquery.flexisel.js"></script>
</body>

<script type="text/javascript">
	calculate();
	function calculate() {
		var x = document.getElementById("istages").value;
		var y = document.getElementById("ifirpay").value;
		if (y == '') {
			document.getElementById("ifirpay").value = '0';
		}
		document.getElementById("imonpay").value = (${good.goodPrice} - y) / x;
	}

	function IsNum(e) {
		var k = window.event ? e.keyCode : e.which;
		if (((k >= 48) && (k <= 57)) || k == 8 || k == 0) {
		} else {
			if (window.event) {
				window.event.returnValue = false;
			} else {
				e.preventDefault(); //for firefox 
			}
		}
	}
</script>

</html>