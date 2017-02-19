<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%><!-- 导入struts2 的 tag标签 -->

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
<title>Register</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
-->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/matrix-login.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.useso.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/ptiscss/common.css" />


</head>
<body>
	<div id="loginbox">
		<div class="control-group normal_text">
			<h3>
			<a href="tourism-getIndexTourism.action">
				<img src="img/logo.png" alt="Logo" style="width: 107px;float:left;" />
				</a>
				<span
					style="color: #111;float: left;margin-left: 20px;margin-top: 33px;">欢迎注册趣鹿</span>
				<span
					style="color: #111;float: right;margin-left: 20px;margin-top: 33px;font-size: 15px;">已有趣鹿账号？
					<a href="userLogin-loginInput" style="cursor: pointer;">登陆</a>
				</span>
			</h3>
		</div>
		<form id="loginform" class="form-vertical"
			action="userRegister-Register" method="post">
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						填写注册信息
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_lg"><i class="icon-user"></i></span><input
							type="text" placeholder=" 用户名" name="userName"/>
							
					</div>
					<span class="name" style='float: left;margin-top: -27px;margin-left: 705px; color: #C31;'>${errorInfo.nameNull }</span>					
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_ly"><i class="icon-lock"></i></span><input
							type="password" placeholder=" 密码" name=userPwd />
					</div>
					<span class="pwd"style='float: left;margin-top: -27px;margin-left: 705px; color: #C31;'>${errorInfo.pwdNull }</span>					
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_ly"><i class="icon-lock"></i></span><input
							type="password" placeholder=" 确认密码" name=userPwd2 />
					</div>
					<span class="pwd2" style='float: left;margin-top: -27px;margin-left: 705px; color: #C31;'>${errorInfo.pwd2Null }</span>					
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">						
						<INPUT type="radio" name="userSex" value="1"
							style="height: 20px;width: 35px;">女 <INPUT type="radio"
							name="userSex" value="2"
							style="height: 20px;width: 35px;margin-left: 30px;">男
					</div>
					
				</div>
			</div>

			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_lg"><i class="icon-user"></i></span><input
							type="text" placeholder=" 邮箱" name=userEmail />
					</div>	
					<span class="email" style='float: left;margin-top: -27px;margin-left: 705px; color: #C31;'>${errorInfo.emailNull }</span>				
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_lg"><i class="icon-user"></i></span><input
							type="text" placeholder=" 职业" name=userProfessional />
					</div>	
					<span class="pro" style='float: left;margin-top: -27px;margin-left: 705px; color: #C31;'>${errorInfo.proNull }</span>				
				</div>
			</div>
			<label style="margin-left: 40%; color: #EF5050;">${errorInfo.register }</label>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<s:submit type="submit"
							style="width: 110px;height: 33px;  border: 0;background: #ffb848;float:left;margin-left: 193px;"
							value="注册">
						</s:submit>
					</div>
				</div>
			</div>
		</form>
		<form id="recoverform" action="#" class="form-vertical">
			<p class="normal_text">Enter your e-mail address below and we
				will send you instructions how to recover a password.</p>

			<div class="controls">
				<div class="main_input_box">
					<span class="add-on bg_lo"><i class="icon-envelope"></i></span><input
						type="text" placeholder="E-mail address" />
				</div>
			</div>

			<div class="form-actions">
				<span class="pull-left"><a href="#"
					class="flip-link btn btn-success" id="to-login">&laquo; Back to
						login</a></span> <span class="pull-right"><a class="btn btn-info" />Reecover</a></span>
			</div>
		</form>
	</div>
	
	<script type="text/javascript" src="scripts/jquery-1.9.1.min.js"></script>
<!--  <script src="scripts/matrix.login.js"></script> -->
<script type="text/javascript">
	$(function(){
		/*验证用户名是否可用*/
		 $(":input[name=userName]").change(function(){	
			 $(".name").css("display","none");
				var username = $(this).val();
			    username = $.trim(username);
			    var $this=$(this);			    
				if (username != "") {
					var url="userRegister-valiadteUserName";
					var args={"userName":username,"time":new Date()};
					$.post(url,args,function(data){
						$this.parent().nextAll("font").remove();
						//表示可用
						if(data == "1"){
							$("name3").css("display","none");
							$("name2").css("display","none");
							$this.parent().after("<span id='name1' style='float: left;margin-top: -27px;margin-left: 705px; color: #11AF59;font-weight:700'>√</span>");
						}
						//表示不可用
						else if(data == "0"){
							$("name3").css("display","none");
							$("name1").css("display","none");
							$this.parent().after("<span id='name2' style='float: left;margin-top: -27px;margin-left: 705px; color: #C31;'>用户名已经存在！</span>");
						}
						//服务器错误
						else{
							alert("服务器错误");
						}
						return "";					
					});					
				} else {
					$("name2").css("display","none");
					$("name1").css("display","none");					
					$this.parent().nextAll("font").remove();
					$this.parent().after("<span id='name3' style='float: left;margin-top: -27px;margin-left: 705px; color: #C31;'>用户名为空！</span>");
					this.val("");					
				}
			});
	    /*验证密码*/
		$(":input[name=userPwd]").change(function(){
			 $(".pwd").css("display","none");
			var userPwd=$(this).val();
			userPwd=$.trim(userPwd);
			var $this=$(this);
			
			if(userPwd==""){
				$(".pwd2").css("display","none");
				$this.parent().after("<span id='pwd1' style='float: left;margin-top: -27px;margin-left: 705px; color: #C31;'>请输入密码！</span>");
			}
			else{
				$(".pwd1").css("display","none");
				$this.parent().after("<span id='pwd2' style='float: left;margin-top: -27px;margin-left: 705px; color: #11AF59;font-weight:700'>√</span>");
			}
		});
	    /*验证第二次输入的密码是否正确*/
	    $(":input[name=userPwd2]").change(function(){
	    	 $(".pwd2").css("display","none");
	    	var userPwd=$(":input[name=userPwd]").val();
	    	var userPwd2=$(this).val();
			userPwd2=$.trim(userPwd2);
			var $this=$(this);
			
			if(userPwd2 != userPwd||userPwd2==null||userPwd2==""){
				 $(".p2").css("display","none");
				$this.parent().after("<span id='p1' style='float: left;margin-top: -27px;margin-left: 705px; color: #C31;'>与首次输入的密码不符！</span>");	
			}
			else{
				 $(".p1").css("display","none");
				$this.parent().after("<span id='p2' style='float: left;margin-top: -27px;margin-left: 705px;color: #11AF59;font-weight:700'>√</span>");	
			}
	    });
	    /*验证邮箱*/
	    $(":input[name=userEmail]").change(function(){
	    	 $(".email").css("display","none");
	    	var userEmail=$(this).val();
	    	userEmail=$.trim(userEmail);
			var $this=$(this);
			/*邮箱为空*/
			if(userEmail==""){
				$this.parent().after("<span style='float: left;margin-top: -27px;margin-left: 705px; color: #C31;'>邮箱不能为空！</span>");	
			}
			/*邮箱不为空*/
			if (userEmail != "") {
				var url="userRegister-checkEmail";
				var args={"userEmail":userEmail,"time":new Date()};
				$.post(url,args,function(data){
					$this.parent().nextAll("font").remove();
					//表示可用
					if(data == "1"){
						$("#email2").css("display","none");
						$this.parent().after("<span id='email1' style='float: left;margin-top: -27px;margin-left: 705px; color: #11AF59;font-weight:700'>√</span>");
					}
					//表示不可用
					else if(data == "0"){
                        $("#email1").css("display","none");
						$this.parent().after("<span id='email2' style='float: left;margin-top: -27px;margin-left: 705px; color: #C31;'>邮箱格式错误！</span>");
					}
					//服务器错误
					else{
						alert("服务器错误");
					}
					return "";					
				});					
			} else {
				//alert("null");
				$this.parent().nextAll("font").remove();
				$this.parent().after("<span style='float: left;margin-top: -27px;margin-left: 705px; color: #C31;'>用户名为空！</span>");
				this.val("");					
			}
			
			
	    });
	    /*验证职业*/
	    $(":input[name=userProfessional]").change(function(){
	    	 $(".pro").css("display","none");
	    	var userProfessional=$(this).val();
	    	userProfessional=$.trim(userProfessional);
			var $this=$(this);
			
			if(userProfessional==""){
				 $(".pro2").css("display","none");
				$this.parent().after("<span id='pro1' style='float: left;margin-top: -27px;margin-left: 705px; color: #C31;'>请输入您的职业！</span>");	
			}
			else{
				 $(".pro1").css("display","none");
				$this.parent().after("<span id='pro2' style='float: left;margin-top: -27px;margin-left: 705px; color: #11AF59;font-weight:700'>√</span>");	
			}
	    });
	    
	});
</script>
</body>
</html>
