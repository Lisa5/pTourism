<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href='http://fonts.useso.com/css?family=Open+Sans:300,400,600,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/ptiscss/common.css" />

<title>趣鹿旅游</title>
</head>
<body>
<jsp:include page="header.jsp" />

	<div id="section2">
		<!-- Start Feature Area -->
		<section id="feature-area" class="about-section" style="    box-shadow: 2px 0px 2px #d3d3d3;
    margin-top: 10px;">
			<div class="container" style="min-height: 275px;margin-bottom: 60px;">
				<s:iterator value="#request.pageBean">
					<s:if test="%{totalPage <= 1}"></s:if>
					<s:else>
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
								<a href="tourism-tourismSearch.action?page=1">第一页</a>
								<a
									href="tourism-tourismSearch.action?page=<s:property value="%{currentPage-1}"/>">上一页</a>
							</s:else>
							<s:if test="%{currentPage != totalPage}">
								<a
									href="tourism-tourismSearch.action?page=<s:property value="%{currentPage}"/>">下一页</a>
								<a
									href="tourism-tourismSearch.action?page=<s:property value="totalPage"/>">最后一页</a>
							</s:if>
							<s:else>
         下一页  最后一页
         </s:else>
						</div>
					</s:else>
				</s:iterator>
				<div class="row text-center inner">
					<s:if
						test="#request.TourismList==null||#request.TourismList.size()==0">
				         还没有任何数据哦~
				    </s:if>
					<s:iterator value="#request.TourismList">
						<div class="col-sm-4 box-height">
							<div class="feature-content">
								<img src="${tourismImg} " alt="Image" style="height: 200px;width: 100%;">
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
		
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>