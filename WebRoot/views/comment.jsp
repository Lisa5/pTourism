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
<base href="<%=basePath%>">

<title>评论</title>

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
	 <input name="userId" style="display:none" value="${userName}">
	<div style="margin-left:auto;margin-right:auto;width:800px">
		<form action="comment-saveComment.action" method="post">
			<div>
				 
        <input name="tourismId" style="display:none" value="${request.tourismId}">
				<span class="comment-star" style="color:#EF5050;">满意度:</span>
				<input id="star" name=commentStar style="display:none"> <a
					class="stars"><span class="glyphicon glyphicon-star comment-star" ></span></a> <a
					class="stars"><span class="glyphicon glyphicon-star comment-star" ></span></a> <a
					class="stars"><span class="glyphicon glyphicon-star comment-star"></span></a> <a
					class="stars"><span class="glyphicon glyphicon-star comment-star"></span></a> <a
					class="stars"><span class="glyphicon glyphicon-star comment-star"></span></a>
			</div>
			<div>
			<textarea name="content" class="comment-content" rows="100" cols="2"></textarea>           
			</div>
			<input class="submit-btn" type="submit" value="提交" style="margin: 10px;float: right;">
		</form>
	</div>
	<script src="scripts/jquery-1.9.1.min.js"></script>

	<script type="text/javascript">
		$(".stars").click(function() {
			var index = $(this).index() - 2;
			//alert(index);
			$("#star").val(index);

			var i;
			for (i = 0; i < index; i++) {
				$(".stars").eq(i).css("color", "#EF5050");
			}
			for (i = index; i < 5; i++) {
				$(".stars").eq(i).css("color", "#757575");
			}
			$(this).css("color", "#EF5050");
		});
		$("#star").change(function(){
			var star=$(this).val();
			star=$.trim(star);
			var $this=$(this);
			
			if(star==""){
				$this.after("<span style='float: left;margin-top: -27px;margin-left: 700px; color: #C31;'>请对满意度进行评分！</span>");
			}
		});
		
		$(function() {
			/*$(".star").hover(function(){
				$(this).css("color","#EF5050");
			},function(){
				$(this).css("color","#337ab7");
			});	*/

		});
	</script>
</body>
</html>
