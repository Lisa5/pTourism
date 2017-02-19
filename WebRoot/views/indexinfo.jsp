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
	Object userName=request.getSession().getAttribute("userName");
%>
<!DOCTYPE html>
<html>
<head>
<!--  
<base href="http://10.253.140.31:8080/SSh-4/">
-->
<base href="<%=basePath%>">
<title>index</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href='http://fonts.useso.com/css?family=Open+Sans:300,400,600,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/ptiscss/common.css" />

</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="sticky-wrapper" id="tmNavbar"
				style="text-align:left;float:left">
				<ul class="nav navbar-nav">
					<li><a href="tourism-getIndexTourism.action">首页</a></li>
					<li><a href="#section2">关于我们</a></li>
					<li><a href="#section3">问题反馈</a></li>
					<li><a href="#section4">联系我们</a></li>
				</ul>
			</div>
			<div class="sticky-wrapper" id="tmNavbar"
				style="text-align:right;float:right">
				<ul class="nav navbar-nav">
					<c:if test="${!isLogin}">
					  <li><a href="userLogin-loginInput">登录</a></li>
					  <li><a href="userRegister-registerInput">注册</a></li>
					 </c:if>
					<c:if test="${isLogin}">
					   <li><a>${userName}，您好</a></li>
					   <li><a href="user-logOut.action"><span> </span>注销</a></li>
					</c:if>

					<li><a href="order-userOrder">我的趣鹿</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- 导航tab-->
	<div class="site-header">
		<div class="container">
			<div class="header-logo">
			<a href="tourism-getIndexTourism.action">
				<img src="img/logo.png"
					style="width: 110px;height: 110px;margin-top: -33px;"></img> </a>
			</div>
			<div class="header-nav">
				<ul class="nav-list J_navMainList clearfix">
					<li class="nav-category" id="nowCity">
						<p>
							<script>
								document.write("省：" + myprovince + ' 市：'
										+ mycity);
							</script>
						</p> <a class="link" id="province" href="" target=_blank></a><a
						class="link"> <i></i></a>
					</li>
					<li class="nav-category"><a class="link"
						href="dingzhi-savePreper">定制游</a></li>
					<li class="nav-category"><a class="link"
						href="tourism-getTourismListByType?type=2&isIndex=0">跟团游</a></li>
					<li class="nav-category"><a class="link"
						href="tourism-getTourismListByType?type=3&isIndex=0">自驾游</a></li>
					<li class="nav-category"><a class="link"
						href="tourism-getTourismListByType?type=4&isIndex=0">周边游</a></li>
					<li class="nav-category"><a id="note" class="link" >旅游攻略</a></li>
				</ul>
			</div>
			<div class="submenu-nav"> 
			<a  href="note-pageNoteList">游记</a>
			<a class="menuorder" href="views/public-note.jsp">写游记</a>
			</div>
			<div class="header-search">
				<form id="J_searchForm" class="search-form"
					action="tourism-tourismSearch.action">
					<input class="search-text" type="search" id="search" name=key>
					<input class="search-btn iconfont" type="submit" value="">
					<a class="search-a" id="search-a" type="submit"></a>
					<div class="search-hot-words ">
						<a href="tourism-getTourismListByType?type=3&isIndex=0">自驾游</a> <a
							href="tourism-getTourismListByType?type=1&isIndex=0">定制游</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	<div id="section1">
		<header id="header-area" class="intro-section">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 text-center">
						<div class="header-content">
							<h1></h1>
							<h4></h4>
						</div>
					</div>
				</div>
			</div>
		</header>
	</div>

	<div class="searchMain">
		<div class="udiyblock" type="AdModel">
			<div id="soso_17u" class="search_box clearfix" style="width: 485px;">
				<div id="soso_top_title" class="search_left">
					<a class="top_abroad hotel_at atop_guonei" id="top_abroad"> <span
						class="left_sp"></span> 国内游
					</a> <a class="top_abroad nor" id="top_abroad"> <span
						class="left_sp"></span> 周边游
					</a> <a class="top_abroad nor" id="top_abroad"> <span
						class="left_sp"></span> 景点门票
					</a> <a class="top_abroad nor" id="top_abroad"> <span
						class="left_sp"></span> 自驾游
					</a><a class="top_abroad nor" id="top_abroad"> <span
						class="left_sp"></span> 定制游
					</a>
				</div>
				<div id="soso_tab_content" class="search_right">
					<!--国内游-->
					<form action="tourism-searchByPlace.action">
						<div class="tray guoneitray ">
							<div class="guonei_con" id="tab_top_guonei">
								<div class="clearfix">
									<label>出发地</label> <input id="gnStartCity" name="startPlace"
										type="text" value="重庆" attrval="上海" class="input02"
										style="color: rgb(153, 153, 153);">
									<div id="temstr2">
										<div id="gnycitylist" class="gnycitylist"
											style="display: none;">
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
							</div>
							<div class="guonei_con" id="tab_top_guonei">
								<div class="clearfix">
									<label>目的地</label> <input id="gnEndCity" name="endPlace"
										type="text" value="请输入目的地、主题或关键词" attrval="请输入目的地、主题或关键词"
										class="input02">
									<div id="temstr1">
										<div id="gnyendcitylist" class="gnycitylist"
											style="display: none;">
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
													<div class="mNotice-mTab-content-end clearfix">
														<dl class="clearfix">
															<a class="mNotice-normal-end" title="上海" target="_self">上海</a>
															<a class="mNotice-normal-end" title="广州" target="_self">广州</a>
															<a class="mNotice-normal-end" title="深圳" target="_self">深圳</a>
															<a class="mNotice-normal-end" title="北京" target="_self">北京</a>
															<a class="mNotice-normal-end" title="重庆" target="_self">重庆</a>

														</dl>
													</div>
													<div class="mNotice-mTab-content-end clearfix none">
														<dl class="clearfix">
															<a class="mNotice-normal-end" title="上海" target="_self">上海</a>
															<a class="mNotice-normal-end" title="广州" target="_self">广州</a>
															<a class="mNotice-normal-end" title="深圳" target="_self">深圳</a>
															<a class="mNotice-normal-end" title="北京" target="_self">北京</a>

														</dl>
													</div>
													<div class="mNotice-mTab-content-end clearfix none">
														<dl class="clearfix">
															<a class="mNotice-normal-end" title="上海" target="_self">上海</a>
															<a class="mNotice-normal-end" title="广州" target="_self">广州</a>
															<a class="mNotice-normal-end" title="深圳" target="_self">深圳</a>

														</dl>
													</div>
													<div class="mNotice-mTab-content-end clearfix none">
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
							</div>
							<div class="guonei_con" id="tab_top_guonei">
								<input id="gnSearch" type="submit" value="搜 索"
									class="search_btn" style="background-color: #ff6700; border:0;">
							</div>
						</div>
					</form>
					<!--国内游--end-->
					<!--周边游-->
					
					<div class="tray guoneitray none">
					<form action="tourism-tourismSearch.action">
						<div class="guonei_con" id="tab_top_guonei"
							style="margin-top: 0px;">
							<div class="scenic_con_tab" style="width:57px">
								<a class="play_tab at" title="当地玩家" style="margin-left: 0px">当地玩家</a>
							</div>
							<div class="clearfix">
								<input id="gnStartCity" name="key" type="text"
									placeholder="主题/城市/商家名称" class="input02"
									style="width:300px;color: rgb(153, 153, 153);">
							</div>
						</div>
						<div class="guonei_con" id="tab_top_guonei">
							<input id="gnSearch" type="submit"
								value="搜索" class="search_btn"
								style="width:80px;margin-top:-14px;background-color: #ff6700; border:0;border-radius: 2px;">
						</div>
						</form>
						<div class="udiyblock" draggable="true" type="CommonSource"
							style="margin-top: 75px;">
							<dl class="recom_list">
								<dt class="recom_dt">热搜关键词</dt>
								<dd class="recom_dd hot_dd">
									<a class="recom_a"> 同里国家湿地公</a> <a class="c_search_hotCitysty">
										四月赏花</a>
								</dd>
								<dt class="recom_dt">热搜城市</dt>
								<dd class="recom_dd ">
									<a class="recom_a"> 上海</a> <a class="c_search_hotCitysty">
										杭州</a>
								</dd>
							</dl>
						</div>
					  
					</div>
					<!--周边游 end---->
					<!--景点门票---->
					<div class="tray guoneitray none">
					<form action="">
						<div class="guonei_con" id="tab_top_guonei"
							style="margin-top: 0px;">
							<div class="scenic_con_tab" style="width:57px">
								<a class="play_tab at" title="当地玩家" style="margin-left: 0px">景点</a>
							</div>
							<div class="clearfix">
								<input id="gnStartCity" name="gnStartCity" type="text"
									placeholder="景点名或城市名" class="input02"
									style="width:300px;color: rgb(153, 153, 153);">
							</div>
						</div>
						<div class="guonei_con" id="tab_top_guonei">
							<input id="gnSearch" name="abEndCityValue" type="button"
								value="搜索" class="search_btn"
								style="width:80px;margin-top:-14px;background-color: #ff6700; border:0;border-radius: 2px;">
						</div>
						<div class="udiyblock" draggable="true" type="CommonSource"
							style="margin-top: 75px;">
							<dl class="recom_list">
								<dt class="recom_dt">精选主题</dt>
								<dd class="recom_dd hot_dd">
									<a class="recom_a">名胜古迹</a> <a class="c_search_hotCitysty">
										赏花</a> <a class="c_search_hotCitysty"> 温泉</a>
								</dd>
								<dt class="recom_dt">热搜城市</dt>
								<dd class="recom_dd ">
									<a class="recom_a"> 上海</a> <a class="c_search_hotCitysty">
										杭州</a> <a class="c_search_hotCitysty"> 苏州</a> <a
										class="c_search_hotCitysty"> 南京</a>
								</dd>
								<dt class="recom_dt">热搜关键词</dt>
								<dd class="recom_dd hot_dd">
									<a class="recom_a">五一特惠游</a> <a class="c_search_hotCitysty">
										上海迪士尼乐园</a> <a class="recom_a">上海鲜花港</a>
								</dd>
							</dl>
						</div>
						</form>
					</div>
					<!--景点门票end-------->

					<!--自驾游---->
					<!--自驾游end-------->
				</div>
			</div>
		</div>

	</div>

	<div id="section2">
		<!-- Start Feature Area -->
		<section id="feature-area" class="about-section">
			<div class="container">
				<div class="row text-center inner">

					<s:if
						test="#request.TourismList1==null||#request.TourismList1.size()==0">
				       
				    </s:if>

					<s:iterator value="#request.TourismList1">
						<div class="col-sm-4">
							<div class="feature-content" style="margin-bottom:10px">
								<img src="${tourismImg }" alt="Image" style="height: 175px;width: 360px;">
								<h2 class="feature-content-title blue-text">${tourismTitle }</h2>
								<p class="feature-content-description">${recommendIntro }</p>
								<a href="tourism-getTourismInfo.action?tourismId=${tourismId}"
									class="feature-content-link blue-btn">预定</a>
							</div>
						</div>
					</s:iterator>
					
					<s:if
						test="#request.TourismList2==null||#request.TourismList2.size()==0">				       
				    </s:if>
				    <s:iterator value="#request.TourismList2">
						<div class="col-sm-4">
							<div class="feature-content" style="margin-bottom:10px">
								<img src="${tourismImg }" alt="Image" style="height: 175px;width: 360px;">
								<h2 class="feature-content-title blue-text">${tourismTitle }</h2>
								<p class="feature-content-description">${recommendIntro }</p>
								<a href="tourism-getTourismInfo.action?tourismId=${tourismId}"
									class="feature-content-link blue-btn">预定</a>
							</div>
						</div>
					</s:iterator>
				</div>
			</div>
		</section>
		<!-- End Feature Area -->

		<!-- Start Blog Area -->
		<!--  
		<section id="blog-area">
			<div class="container">
				<div class="row text-center inner">				 
					<s:if
						test="#request.TourismList2==null||#request.TourismList2.size()==0">				       
				    </s:if>
				    <s:iterator value="#request.TourismList2">
					<div class="col-sm-6">
						<div class="blog-content">
							<img src="${tourismImg} " alt="Image" style="height: 250px;width:100%">
							<h2 style="height: 40px;padding: 20px;">${tourismTitle }</h2>
							<p style="height: 122px; min-height: 122px;overflow: hidden;">
								${recommendIntro }
							</p>
							<span><a href="tourism-getTourismInfo.action?tourismId=${tourismId}">查看详情</a></span><br>
						
						</div>
					</div>
				    </s:iterator>
				</div>
			</div>
		</section>
		-->
		<!-- End Blog Area -->
	</div>
	<div id="section3">
		<!-- Start Services Area -->
		<section id="services-area" class="services-section">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 text-center inner our-service">
						<div class="service">
							<h1>趣鹿旅游</h1>
							<p>
								周边景点随便玩！
							</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Services Area -->

		<!-- Start Testimornial Area -->
		<section id="testimornial-area">
			<div class="container">
				<div class="row text-center">				
					<s:if
						test="#request.TourismList3==null||#request.TourismList3.size()==0">				       
				    </s:if>
				    <s:iterator value="#request.TourismList3">
					<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
						<div class="testimonial-content">
							<img src="${tourismImg }" alt="Image">
							<h2 style="height:60px;padding: 15px;overflow: hidden;">${tourismTitle }</h2>
							<p>${recommendIntro }</p>
							<a href="tourism-getTourismInfo.action?tourismId=${tourismId}" class="content-link">查看详情</a> <br>			
						</div>
					</div>
					</s:iterator>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="tm-box">
							<img src="img/4-5.jpg" alt="Image" class="img-responsive">
							<div class="tm-box-description">
								<h2>One Big Column</h2>
								<p class="tm-box-p">
									orci.</p>
								<p class="tm-box-p"></p>
								<a href="#" class="content-link">Read More</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Testimornial Area -->
	</div>
	<div id="section4">
		<!-- Start Contact Area -->
		<section id="contact-area" class="contact-section">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 text-center inner">
						<div class="contact-content">
							<h1>联系我们</h1>
							<div class="row">
								<div class="col-sm-12">
									<p>
										
									</p>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<form action="#" method="post" class="contact-form">
							<div class="col-sm-6 contact-form-left">
								<div class="form-group">
									<input name="name" type="text" class="form-control" id="name"
										placeholder="Name"> <input type="email" name="email"
										class="form-control" id="mail" placeholder="Email"> <input
										name="subject" type="text" class="form-control" id="subject"
										placeholder="Subject">
								</div>
							</div>
							<div class="col-sm-6 contact-form-right">
								<div class="form-group">
									<textarea name="message" rows="6" class="form-control"
										id="comment" placeholder="Your message here..."></textarea>
									<button type="submit" class="btn btn-default">发送</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<!-- End Contact Area -->
	</div>

	<!-- Start Footer Area -->
	<footer id="footer-area">
		<div class="container">
			<div class="row text-center">
				<div class="col-sm-12">
					<div class="footer-content">
						<h1>趣鹿旅游</h1>
						<p>
							
						</p>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center">
					<p class="copy">
						Copyright © 2084 ChongQing University | More Templates <a
							href="http://www.cssmoban.com/" target="_blank" ></a>
						- Collect from <a href="http://www.cssmoban.com/" 
							target="_blank"></a>
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer Area -->

	<script src="scripts/jquery-1.9.1.min.js"></script>
	<script src="scripts/jquery.scrollUp.min.js"></script>
	<!-- https://github.com/markgoodyear/scrollup -->
	<script src="scripts/jquery.singlePageNav.min.js"></script>
	<!-- https://github.com/ChrisWojcik/single-page-nav -->
	<script src="scripts/parallax.js-1.3.1/parallax.js"></script>
	<!-- http://pixelcog.github.io/parallax.js/ -->
	<script type="text/javascript"
		src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>

	<script>
		var myprovince = remote_ip_info['province'];
		var mycity = remote_ip_info['city'];
		var mydistrict = remote_ip_info['district'];

		// HTML document is loaded. DOM is ready.
		$(function() {			
			//window.location=$("#tourism").attr("href");
			/*城市定位*/
			$('#province').text(myprovince); //定义A链接里面相应的省份
			/* switch(myprovince){
			     case '广东':
			         $('#province').attr("href","/gd")
			         break;
			     case '上海':
			         $('#province').attr("href","/sh")
			         break;
			     case '北京':
			         $('#province').attr("href","/bj")
			         break;
			     case '山东':
			         $('#province').attr("href","/sd")
			         break;
			     case '江苏':
			         $('#province').attr("href","/js")
			         break;
			     case '四川':
			         $('#province').attr("href","/sc")
			         break;
			     case '浙江':
			         $('#province').attr("href","/zj")
			         break;
			     case '河南':
			         $('#province').attr("href","/hl")
			         break;
			     case '辽宁':
			         $('#province').attr("href","/ln")
			         break;
			     case '陕西':
			         $('#province').attr("href","/sx")
			         break;
			     case '湖北':
			         $('#province').attr("href","/hb")
			         break;
			     case '湖南':
			         $('#province').attr("href","/hn")
			         break;
			     case '福建':
			         $('#province').attr("href","/fj")
			         break;
			     case '重庆':
			         $('#province').attr("href","/cq")
			         break;
			     case '安徽':
			         $('#province').attr("href","/ah")
			         break;
			     case '河北':
			         $('#province').attr("href","/hb")
			         break;
			     case '山西':
			         $('#province').attr("href","/sx")
			         break;
			     case '广西':
			         $('#province').attr("href","/gx")
			         break;
			     case '江西':
			         $('#province').attr("href","/jx")
			         break;
			     case '甘肃':
			         $('#province').attr("href","/gs")
			         break;
			     case '天津':
			         $('#province').attr("href","/tj")
			         break;
			     case '吉林':
			         $('#province').attr("href","/jl")
			         break;
			     case '黑龙江':
			         $('#province').attr("href","/hnj")
			         break;
			     case '海南':
			         $('#province').attr("href","/hn")
			         break;
			     case '贵州':
			         $('#province').attr("href","/gz")
			         break;
			     case '新疆':
			         $('#province').attr("href","/xj")
			         break;
			      case '云南':
			         $('#province').attr("href","/zn")
			         break;
			     case '宁夏':
			         $('#province').attr("href","/nx")
			         break;
			     case '内蒙古':
			         $('#province').attr("href","/nmg")
			         break;
			     case '青海':
			         $('#province').attr("href","/qh")
			         break;
			     case '西藏':
			         $('#province').attr("href","/xz")
			         break;
			     default:
			       $('#province').attr("href","/")
			   }*/

			// Parallax
			$('.intro-section').parallax({
				imageSrc : 'img/bg-1.jpg',
				speed : 0.2
			});
			$('.services-section').parallax({
				imageSrc : 'img/bg-2.jpg',
				speed : 0.2
			});
			$('.contact-section').parallax({
				imageSrc : 'img/bg-3.jpg',
				speed : 0.2
			});

			// jQuery Scroll Up / Back To Top Image
			$.scrollUp({
				scrollName : 'scrollUp', // Element ID
				scrollDistance : 300, // Distance from top/bottom before showing element (px)
				scrollFrom : 'top', // 'top' or 'bottom'
				scrollSpeed : 1000, // Speed back to top (ms)
				easingType : 'linear', // Scroll to top easing (see http://easings.net/)
				animation : 'fade', // Fade, slide, none
				animationSpeed : 300, // Animation speed (ms)		        
				scrollText : '', // Text for element, can contain HTML		        
				scrollImg : true
			// Set true to use image		        
			});

			// ScrollUp Placement
			$(window).on(
					'scroll',
					function() {

						// If the height of the document less the height of the document is the same as the
						// distance the window has scrolled from the top...
						if ($(document).height() - $(window).height() === $(
								window).scrollTop()) {

							// Adjust the scrollUp image so that it's a few pixels above the footer
							$('#scrollUp').css('bottom', '80px');

						} else {
							// Otherwise, leave set it to its default value.
							$('#scrollUp').css('bottom', '30px');
						}
					});

			$('.single-page-nav').singlePageNav({
				offset : $('.single-page-nav').outerHeight(),
				speed : 1500,
				filter : ':not(.external)',
				updateHash : true
			});

			$('.navbar-toggle').click(function() {
				$('.single-page-nav').toggleClass('show');
			});

			$('.single-page-nav a').click(function() {
				$('.single-page-nav').removeClass('show');
			});

			/*城市定位click事件，弹出地点选择控件*/
			$('#nowCity').click(function() {
				
			});
			/*搜索导航tab样式切换*/
			$('.top_abroad').click(
					function() {
						var index = $(this).index();
						$(".top_abroad").removeClass(
								"atop_guonei hotel_at atop_guoneik");
						$('.top_abroad').addClass("nor");
						$(this).removeClass("nor");
						$(this).addClass("atop_guonei hotel_at atop_guoneik");

						$('.tray').addClass("none");
						$('.tray').eq(index).removeClass("none");
					});
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
				//alert(index);
				$("#gnycitylist").css("display", "block");

				$(".mNotice-mTab-item-start").removeClass("current");
				$(this).addClass("current");

				$(".mNotice-mTab-content-start").addClass("none");
				$(".mNotice-mTab-content-start").eq(index).removeClass("none");

			});
			/*通过index方法定位选中的地点区间*/
			$(".mNotice-mTab-item-end").click(function() {
				var index = $(this).index(); //this 才能定位到点击的元素index			
				$("#gnyendcitylist").css("display", "block");

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
						//$("#gnStartCity").val("重庆");
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
			/*搜索框获取焦点事件*/
			$(".search-text").focus(function() {
				$(".search-hot-words").css("display", "none");
			});
			/*搜索框失去焦点事件*/
			$(".search-text").blur(function() {
				$(".search-hot-words").css("display", "block");
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
			/*旅游游记的hover事件*/
			$("#note").hover(function(){
				$(".submenu-nav").css("display","block");
			});
			$(".submenu-nav").hover(function(){
				$(".submenu-nav").css("display","block");
			},function(){
				$(".submenu-nav").css("display","none");
			});
		});
	</script>
	<br>
	<a href="emp-list"> List all Employees</a>
	<br>
	<a href="emp-input">input Employees</a>
	<br>
	<a href="http://192.168.0.106:8000/login">login</a>
	<a href="http://localhost:3000/login">login2</a>
	<a href="views/header.jsp">	header.jsp</a>	
</body>
</html>

