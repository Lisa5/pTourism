<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%><!-- 导入struts2 的 tag标签 -->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<
<title>My JSP 'emp-list.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <script type="text/javascript" src="scripts/jquery-1.9.1.min.js">//引入jquery框架
  </script>

<!--  script type="text/javascript">
function testjquery()
{
// var user_name=$("#test").attr("value");
 alert("Hello");
 }
 
$(function(){  
     $(".delete").click(function(){
    	 alert("nihao");
	     var lastName=$(this).next(":input").val();
	     var flag=confirm("确定删除"+lastName+"的信息吗？");
		 if(flag)
		 {
			 alert(data)
			  var $tr=$(this).parent().parent();
		      var url=this.href;
		      var args={"time":new Date()};
		      $.post(url,args,function(data)
		      {
		          alert(data);
		         if(data==1){
		        	 alert("删除成功！");
		        	 $tr.remove();
		         }
		         else{
		        	 alert("删除失败！");
		         }
		      });
	      };
	      //取消超链接行为
	      return false;				
     });
    });

    </script-->
    <!-- script type="text/javascript">
$(function(){
	 $(":input[name=lastName]").change(function(){
	  	  var val = $(this).val();
	  	  val = $.trim(val);
	  	  var $this = $(this);	  	  	  	  
	  	  if(val != 0){
	  		$("#notice").remove();
	  		 var url = "emp-ValidataLastName";
	  		 var args = {"lastName":val,"time":new Date()};
	  		 $.get(url,args,function(data){
	  			 if(data=="1"){
	  				 $this.after("<font color='green' id='notice' >LastName可用</font>")
	  			 }else{
	  				 $this.after("<font color='red' id='notice' >LastName不可用</font>")
	  			 }
	  		 });
	  		 
	  		 
	  	  }else{
	  		  alert("用户名必须输入");
	  	  }
	    });
});
</script-->
 <script type="text/javascript">
 $(function(){
	 alert("hello");
		$(".delete").click(function(){		
			var lastName = $(this).next(":input").val();
			var flag = confirm("确定要删除"+lastName+"信息吗？");
			if(flag){
				var $tr = $(this).parent().parent();
				var url = this.href;
				var args = {"time":new Date()};
				$.post(url,args,function(data){
					if(data ==1){
						alert("删除成功");
						$tr.remove();
					}else{
						alert("删除失败");
					}
				});
			};
			return false;
		});
	});
</script>
    
</head>

<body>
	<h4>Employee list</h4>
	<s:if test="#request.employee==null||#request.employee.size()==0">
         没任何员工数据
    </s:if>
	<s:else>
		<table border="1">
			<tr>
				<td>ID</td>
				<td>LastName</td>
				<td>Email</td>
				<td>Birth</td>
				<td>CreateTime</td>
				<td>DepartmentId</td>
				<td>Delete</td>
			</tr>
			<s:iterator value="#request.employee">
				<tr>
					<td>${Id}</td>
					<td>${lastName}</td>
					<td>${email}</td>
					<td>${birth}</td>
					<td>${createTime}</td>
					<td>${department.departmentName}</td>
					<td><a href="emp-delete?id=${Id }" class="delete">Delete</a>
					<input type="hidden" value="${lastName }" /></td>
				</tr>
			</s:iterator>
		</table>
	</s:else>
	<div><input id="test" value="jquery"><button onclick="testjquery()">test</button></div>
</body>
</html>
