<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href='http://fonts.useso.com/css?family=Open+Sans:300,400,600,700'
	rel='stylesheet' type='text/css'>
	
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/ptiscss/common.css" />
<link rel="stylesheet" type="text/css" href="css/ptiscss/templatemo-style.css">
<title>游记</title>
</head>
<body>	
<jsp:include page="header.jsp" />
	<hr style="box-shadow: 2px 0px 20px #d3d3d3;">
	<div class="header" style="background: #f6f6f6; padding-top: 20px;padding-bottom:20px">
	<div class="container" >
	<s:iterator value="#request.pageBean">

		<div style="width: 100%; text-align-last: right;">
			共
			<s:property value="allRow" />
			条记录 共
			<s:property value="totalPage" />
			页 当前第
			<s:property value="currentPage" />
			页<br>
			<s:if test="%{currentPage == 1}">
				<span>第一页 上一页</span>
			</s:if>
			<!-- currentPage为当前页 -->
			<s:else>
				<a href="note-pageNoteList.action?page=1">第一页</a>
				<a
					href="note-pageNoteList.action?page=<s:property value="%{currentPage-1}"/>">上一页</a>
			</s:else>
			<s:if test="%{currentPage != totalPage}">
				<a
					href="note-pageNoteList.action?page=<s:property value="%{currentPage+1}"/>">下一页</a>
				<a
					href="note-pageNoteList.action?page=<s:property value="totalPage"/>">最后一页</a>
			</s:if>
			<s:else>
         下一页  最后一页
         </s:else>
		</div>
	</s:iterator>
		<s:if test="#request.noteList==null||#request.noteList.size()==0">
           <p class="section-text">  目前还没有任何游记哦~</p></s:if>
		<s:iterator value="#request.noteList" status="noteList">
			<s:if test="#noteList.odd==true">
				<section class="content" id="home">
					<div class="col-lg-6 col-md-6 content-item">
						<img src="images/<s:property value ='imgUrl'/>" alt="Image" class="tm-image"/>
					</div>
					<div
						class="col-lg-6 col-md-6 content-item content-item-1 background flexbox">
						<h2 class="main-title text-center dark-blue-text">${title }</h2>
						<span style="text-align: center;color: rgb(126, 158, 54);padding: 10px;">${subTitle }</span>
						<div class="note-content">
						   <p class="section-text">${content }</p>
						</div>						
					</div>
				</section>
			</s:if>
			<s:else>
				<section class="content padding" id="services">
					<div class="col-lg-6 col-md-6 col-md-push-6 content-item">
						<img src="images/<s:property value ='imgUrl'/>" alt="Image" class="tm-image">
					</div>
					<div
						class="col-lg-6 col-md-6 col-md-pull-6 content-item background flexbox">
						<h2 class="section-title" style="text-align: center;">${title }</h2>
						<span style="text-align: center;color: rgb(126, 158, 54);padding: 10px;">${subTitle }</span>
						<div class="note-content">
						   <p class="section-text">${content }</p>
						</div>																					
					</div>

				</section>
			</s:else>
		</s:iterator>
	</div>
    </div>

	<jsp:include page="foot.jsp" />
	<script src="scripts/jquery-1.9.1.min.js"></script>
	<script src="scripts/bootstrap.min.js"></script>
	<script src="scripts/jquery.singlePageNav.min.js"></script>

	<script>
	
		// Check scroll position and add/remove background to navbar
		function checkScrollPosition() {
			if ($(window).scrollTop() > 50) {
				$(".fixed-header").addClass("scroll");
			} else {
				$(".fixed-header").removeClass("scroll");
			}
		}

		$(document).ready(function() {
			/*Single page nav*/
			$('.fixed-header').singlePageNav({
				offset : 59,
				filter : ':not(.external)',
				updateHash : true
			});

			checkScrollPosition();

			/*nav bar*/
			$('.navbar-toggle').click(function() {
				$('.main-menu').toggleClass('show');
			});

			$('.main-menu a').click(function() {
				$('.main-menu').removeClass('show');
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

		$(window).on("scroll", function() {
			checkScrollPosition();
		});
	</script>
</body>
</html>