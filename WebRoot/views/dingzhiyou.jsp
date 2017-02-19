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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>特别定制</title>

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
	<div class="main_content clearfix" style="">
		<div class="content clearfix">
	    <c:if test="${!isLogin}">
	    <span style="color:#EF5050;">温馨提示：您还没登陆。</span><a href="userLogin-loginInput">登陆</a>
	    </c:if>
		<form action="dingzhi-saveOrUpdate" method="post">
			<input style="display:none"  value="${userInfo.userId}">
				<div class="me_needTrip">
					<div class="common_title">填写定制需求</div>
					<div class="make_person">
						<span>定制类型</span>
						<input type="text" id="OrderType" name="OrderType" style="display:none">
						<div class="common_circle clearfix" attr-sty="style">
							<a id="person"  class="order-type nomal sel" value="个人定制">个人定制</a> <a
								id="company" class="order-type nomal" value="公司定制">公司定制</a>
						</div>
					</div>
					<div class="you_name">
						<span> <i>*</i> 姓名
						</span> <input name="UserName" attr-sty="name" data-err-rq="请输入正确姓名"
							class="nomal" maxlength="10" placeholder="必填,方便客服与您联系"> <label
							class="invalid_message_right" style="display:none"> <b
							class="c_tip_info">请输入正确姓名</b>
						</label>
					</div>
					<div class="you_phone">
						<span> <i>*</i> 手机号
						</span> <input name="UserPhone" attr-sty="name"
							data-err-mobile="请输入正确格式的手机号" data-err-rq="请输入手机号" class="nomal"
							maxlength="11" placeholder="必填,方便客服与您联系"> <label
							id="Phone_error" class="invalid_message_right"
							style="display:none"> <b class="c_tip_info">请输入正确格式的手机号</b>
						</label>
					</div>
					<div class="mail_box">
						<span> <i>*</i> 电子邮箱
						</span> <input name="UserEmail" attr-sty="name"
							data-err-mail="请输入正确格式的电子邮箱" data-err-rq="请输入电子邮箱" class="nomal"
							placeholder="必填,方便客服与您联系"> <label id="Mail_error"
							class="invalid_message_right" style="display:none"> <b
							class="c_tip_info">请输入正确格式的电子邮箱</b>
						</label>
					</div>
					<div class="company_box none">
						<span> <i>*</i> 公司名称
						</span> <input name="UserCompany" attr-sty="name"
							data-err-mail="请输入正确格式的电子邮箱" data-err-rq="请输入公司名称" class="nomal"
							maxlength="30" placeholder="必填,方便客服与您联系"> <label
							id="company_error" class="invalid_message_right"
							style="display:none"> <b class="c_tip_info">请输入公司名称</b>
						</label>
					</div>
				</div>
				<div class="contect_you">
					<div class="common_title">基本信息</div>
					<div class="trip_from">
						<span><i>*</i>出发地</span> <input name="StartPlace" type="text"
							class="nomal" id="gnStartCity" readonly="true"
							attr-sty="fromcity" placeholder="请选择您的出发地" data-err-rq="请选择您的出发地">
						<label id="from_error" style="display:none"
							class="invalid_message_right"> <b class="c_tip_info">请选择您的出发地</b>
						</label>
						<div id="temstr2" class="temstr-margin">
							<div id="gnycitylist" class="gnycitylist"
								style="display: none;width: 311px !important;">
								<i class="list_arrow"></i>
								<div class="cityname">
									<h3 class="mNotice-mTab-head">
										出发城市（直接选择城市） <i></i>
									</h3>
									<div class="city_name_tab">
										<ul>
											<li class="mNotice-mTab-item-start current">热门</li>
											<li class="mNotice-mTab-item-start">ABCDEF</li>
											<li class="mNotice-mTab-item-start">GHJKLM</li>
											<li class="mNotice-mTab-item-start">NOPQRS</li>
											<li class="mNotice-mTab-item-start">STWXY</li>
											<div class="clearfix"></div>

										</ul>
										<div class="mNotice-mTab-content-start clearfix">
											<dl class="clearfix">
												<a class="mNotice-normal-start" title="上海" target="_self">上海</a>
												<a class="mNotice-normal-start" title="广州" target="_self">广州</a>
												<a class="mNotice-normal-start" title="深圳" target="_self">深圳</a>
												<a class="mNotice-normal-start" title="北京" target="_self">北京</a>
												<a class="mNotice-normal-start" title="重庆" target="_self">重庆</a>

											</dl>
										</div>
										<div class="mNotice-mTab-content-start clearfix none">
											<dl class="clearfix">
												<a class="mNotice-normal" title="上海" target="_self">上海</a>
												<a class="mNotice-normal" title="广州" target="_self">广州</a>
												<a class="mNotice-normal" title="深圳" target="_self">深圳</a>
												<a class="mNotice-normal" title="北京" target="_self">北京</a>

											</dl>
										</div>
										<div class="mNotice-mTab-content-start clearfix none">
											<dl class="clearfix">
												<a class="mNotice-normal-start" title="上海" target="_self">上海</a>
												<a class="mNotice-normal-start" title="广州" target="_self">广州</a>
												<a class="mNotice-normal-start" title="深圳" target="_self">深圳</a>

											</dl>
										</div>
										<div class="mNotice-mTab-content-start clearfix none">
											<dl class="clearfix">
												<a class="mNotice-normal-start" title="上海" target="_self">上海</a>
												<a class="mNotice-normal-start" title="广州" target="_self">广州</a>

											</dl>
										</div>
										<div class="mNotice-mTab-content-start clearfix none">
											<dl class="clearfix">
												<a class="mNotice-normal-start" title="上海" target="_self">上海</a>

											</dl>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="where_to">
						<span><i>*</i>目的地</span> <input name="EndPlace" type="text"
							class="nomal" id="gnEndCity" readonly="true" attr-sty="fromcity"
							placeholder="请选择您的目的地" data-err-rq="请选择您的目的地"> <label
							id="from_error" style="display:none"
							class="invalid_message_right"> <b class="c_tip_info">请选择您的目的地</b>
						</label>
						<div id="temstr1"
							style="margin-top: 742px !important;margin-left: 429px !important;">
							<div id="gnyendcitylist" class="gnycitylist"
								style="display: none;width: 311px !important;">
								<i class="list_arrow"></i>
								<div class="cityname">
									<h3 class="mNotice-mTab-head">
										出发城市（直接选择城市） <i></i>
									</h3>
									<div class="city_name_tab">
										<ul>
											<li class="mNotice-mTab-item-end current">热门</li>
											<li class="mNotice-mTab-item-end">ABCDEF</li>
											<li class="mNotice-mTab-item-end">GHJKLM</li>
											<li class="mNotice-mTab-item-end">NOPQRS</li>
											<li class="mNotice-mTab-item-end">STWXY</li>
											<div class="clearfix"></div>

										</ul>
										<div class="mNotice-mTab-content-end content-width clearfix">
											<dl class="clearfix">
												<a class="mNotice-normal-end" title="上海" target="_self">上海</a>
												<a class="mNotice-normal-end" title="广州" target="_self">广州</a>
												<a class="mNotice-normal-end" title="深圳" target="_self">深圳</a>
												<a class="mNotice-normal-end" title="北京" target="_self">北京</a>
												<a class="mNotice-normal-end" title="重庆" target="_self">重庆</a>

											</dl>
										</div>
										<div
											class="mNotice-mTab-content-end content-width clearfix none">
											<dl class="clearfix">
												<a class="mNotice-normal-end" title="上海" target="_self">上海</a>
												<a class="mNotice-normal-end" title="广州" target="_self">广州</a>
												<a class="mNotice-normal-end" title="深圳" target="_self">深圳</a>
												<a class="mNotice-normal-end" title="北京" target="_self">北京</a>

											</dl>
										</div>
										<div
											class="mNotice-mTab-content-end content-width clearfix none">
											<dl class="clearfix">
												<a class="mNotice-normal-end" title="上海" target="_self">上海</a>
												<a class="mNotice-normal-end" title="广州" target="_self">广州</a>
												<a class="mNotice-normal-end" title="深圳" target="_self">深圳</a>

											</dl>
										</div>
										<div
											class="mNotice-mTab-content-end content-width clearfix none">
											<dl class="clearfix">
												<a class="mNotice-normal-end" title="上海" target="_self">上海</a>
												<a class="mNotice-normal-end" title="广州" target="_self">广州</a>

											</dl>
										</div>
										<div class="mNotice-mTab-content-end clearfix none">
											<dl class="clearfix">
												<a class="mNotice-normal-end" title="上海" target="_self">上海</a>

											</dl>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="trip_day">
						<span>游玩天数</span>
						<div class="tripbox">
							<input name="Days" class="day_nub" type="text" placeholder="请输入"
								maxlength="3"> <b> 天 </b> <label><input
								id="CanRevise" type="checkbox"><b> 可适当增加天数</b></label>
						</div>
					</div>
					<div class="trip_day">
						<span>出游人数</span>
						<div class="triplist">
							<label><input name="PersonAmount" type="text"
								placeholder="请输入" maxlength="3"><b> 人</b></label>							
						</div>
					</div>
					<div class="trip_price">
						<span>预算</span>
						<div>
							<label><input name="Budget" class="avg_price" type="text"
								placeholder="请输入您的预算" maxlength="8"> </label>
						</div>
					</div>
				</div>				
				<div class="contect">
					<div class="common_title">个性需求</div>
					<div class="otherInfo_write clearfix">
						<div class="trip_every">
							<span>定制主题</span>
							<div  class="common_circle clearfix" >
							<input name="TripWay" id="TripWay" style="display:none">
								<a class="trip-way nomal" attr-foor attr-html="会议旅游"
									attr-pro="家庭出游">会议旅游</a> <a class="trip-way nomal" attr-foor
									attr-html="奖励旅游" attr-pro="好友结伴">奖励旅游</a> <a
									class="trip-way nomal" attr-foor attr-html="会议旅游"
									attr-pro="旅拍-蜜月">拓展培训</a> <a
									class="trip-way nomal last_btn sel" attr-foor attr-html="不限"
									attr-pro="不限">不限</a>
							</div>
						</div>
						<div class="trip_other">
							<span>其他说明</span>
							<textarea name="Addition" rows="10" cols="30" class="nomal"
								placeholder="请输入您对出游的其他要求，比如：购物、接送机、导游等特殊要求（≤200字）"
								maxlength="200"></textarea>
						</div>
					</div>

				</div>
				<div class="to_otherPage clearfix">
					<input style="background-color: #ff6700;border: 0;width: 100px;height: 30px;    margin-left: 254px;margin-top: 30px;" class="submit" type="submit" value="提交">
				</div>
			</form>
		</div>
	</div>
		<jsp:include page="foot.jsp" />
	<script src="scripts/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		$(function() {
			/*个人与公司切换*/
			$("#person").click(function() {
				$("#company").removeClass("sel");
				$(this).addClass("sel");				
				$(".company_box").addClass("none");
				var orderType=$(this).html();
				//alert(orderType);
				$("#OrderType").val(orderType);
			});
			$("#company").click(function() {
				$("#person").removeClass("sel");
				$(this).addClass("sel");
				$(".company_box").removeClass("none");
				var orderType=$(this).html();
				//alert(orderType);
				$("#OrderType").val(orderType);
			});
			/*日期选择控件*/
			/*出发地点获取焦点事件，弹出地点选择控件*/
			$("#gnStartCity").focus(function() {
				$("#gnyendcitylist").css("display", "none");
				$("#gnycitylist").css("display", "block");
				$(".mNotice-mTab-item-start").removeClass("current");
				$(".mNotice-mTab-item-start").eq(0).addClass("current");
			});

			/*目的地点获取焦点事件，弹出地点选择控件*/
			$("#gnEndCity").focus(function() {
				$("#gnyendcitylist").css("display", "block");
				$("#gnycitylist").css("display", "none");
				$(".mNotice-mTab-item-end").removeClass("current");
				$(".mNotice-mTab-item-end").eq(0).addClass("current");
			});
			/*通过index方法定位选中的地点区间*/
			$(".mNotice-mTab-item-start").click(function() {
				var index = $(this).index(); //this 才能定位到点击的元素index			
				$("#gnycitylist").css("display", "block");
				alert(index);
				$(".mNotice-mTab-item-start").removeClass("current");
				$(this).addClass("current");

				$(".mNotice-mTab-content-start").addClass("none");
				$(".mNotice-mTab-content-start").eq(index).removeClass("none");

			});
			/*通过index方法定位选中的地点区间*/
			$(".mNotice-mTab-item-end").click(function() {
				var index = $(this).index(); //this 才能定位到点击的元素index			
				$("#gnyendcitylist").css("display", "block");
				alert(index);
				$(".mNotice-mTab-item-end").removeClass("current");
				$(this).addClass("current");

				$(".mNotice-mTab-content-end").addClass("none");
				$(".mNotice-mTab-content-end").eq(index).removeClass("none");

			});
			/*点击弹出框以外的地方隐藏该弹出框*/
			$(document).bind(
					'click',
					function(e) {
						var e = e || window.event; //浏览器兼容性 
						var elem = e.target || e.srcElement;
						while (elem) { //循环判断至跟节点，防止点击的是div子元素 
							if ((elem.id && elem.id == 'gnycitylist')
									|| (elem.id == 'gnStartCity')
									|| (elem.id && elem.id == 'gnyendcitylist')
									|| (elem.id == 'gnEndCity')) {
								return;
							}
							elem = elem.parentNode;
						}
						$('#gnycitylist').css('display', 'none'); //点击的不是div或其子元素
						$('#gnyendcitylist').css('display', 'none');
					});

			/*start弹出框城市切换*/
			$('.mNotice-normal-start').click(function() {
				var val = $(this).html();
				$("#gnStartCity").val(val);
				$('#gnycitylist').css('display', 'none');
			});
			/*end弹出框城市切换*/
			$('.mNotice-normal-end').click(function() {
				var val = $(this).html();
				$("#gnEndCity").val(val);
				$('#gnyendcitylist').css('display', 'none');
			});
            /*旅游主题切换*/
			$(".trip-way").click(function() {
				$(".trip-way").removeClass("sel");
				var tripWay=$(this).html();
				$(this).addClass("sel");
				$("#TripWay").val(tripWay);
			});	
			/*旅游游记的hover事件*/
			$("#note").hover(function() {
				$(".submenu-nav").css("display", "block");
			});
			$(".submenu-nav").hover(function() {
				$(".submenu-nav").css("display", "block");
			}, function() {
				$(".submenu-nav").css("display", "none");
			});
			/*为搜索标签添加click事件*/
			$(".search-a").click(
					function() {
						var input = $(".search-text").val();
						$(this).attr("href",
								"tourism-tourismSearch.action?key=" + input + "");
			});
		});
	</script>
</body>
</html>
