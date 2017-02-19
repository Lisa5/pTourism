<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	boolean isLogin = false;
	if (request.getSession().getAttribute("user") != null) {
		isLogin = true;
	}
	request.setAttribute("isLogin", isLogin);
	Object userName=request.getSession().getAttribute("userName");
%>
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
				<li><a
					href="tourism-getIndexTourism.action">首页</a></li>
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
				style="width: 110px;height: 110px;margin-top: -33px;"></img>
		</a>
		</div>
		<div class="header-nav">
			<ul class="nav-list J_navMainList clearfix">
				<li class="nav-category" id="nowCity">
					<p>
						<script>
							document.write("省：" + myprovince + ' 市：' + mycity);
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
				<li class="nav-category"><a id="note" class="link">旅游攻略</a></li>
			</ul>
		</div>
		<div class="submenu-nav">
			<a href="note-pageNoteList">游记</a> <a class="menuorder"
				href="views/public-note.jsp">写游记</a>
		</div>
		<div class="header-search">
			<form id="J_searchForm" class="search-form"
				action="tourism-tourismSearch.action">
				<input class="search-text" type="search" id="search" name=key>
				<input class="search-btn iconfont" type="submit" value=""> <a
					class="search-a" id="search-a" type="submit"></a>
				<div class="search-hot-words ">
					<a href="tourism-getTourismListByType?type=3&isIndex=0">自驾游</a> <a
						href="tourism-getTourismListByType?type=1&isIndex=0">定制游</a>
				</div>
			</form>
		</div>
	</div>
</div>

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
					if ($(document).height() - $(window).height() === $(window)
							.scrollTop()) {

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
