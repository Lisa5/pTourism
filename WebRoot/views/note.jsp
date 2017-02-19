<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String htmlData = request.getParameter("content1") != null
			? request.getParameter("content1")
			: "";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>游记</title>
<link rel="stylesheet" href="../scripts/themes/default/default.css" />
<link rel="stylesheet" href="../scripts/plugins/code/prettify.css" />
<script charset="utf-8" src="../scripts/kindeditor-min.js"></script>
<script charset="utf-8" src="../scripts/lang/zh-CN.js"></script>
<script charset="utf-8" src="../scripts/plugins/code/prettify.js"></script>

<link rel="stylesheet" href="css/ptiscss/common.css" />

<script>
	KindEditor.ready(function(K) {
		var editor1 = K.create('textarea[name="content"]', {
			cssPath : '../plugins/code/prettify.css',
			uploadJson : '../jsp/upload_json.jsp',
			fileManagerJson : '../jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			}
		});
		prettyPrint();
	});
</script>
</head>
<body>
	<%=htmlData%>

	<form name="example" method="post" action="note-saveNote">
		<div>
		    
			<input name="title" type="text" class="input_title"
				placeholder="快来给你的游记取一个有趣的名字吧~" style="width: 700px ;height: 40px;">
		</div>
	
		<textarea id="content" class="texarea_content" cols="100" rows="8"
			placeholder="快来给你的旅程写一个华丽丽的开端吧~"
			style="width:700px;height:200px;"></textarea>

		<br />
		<textarea name="content" cols="100" rows="8"  placeholder="快来给你的旅程写一个华丽丽的开端吧~"
			style="display:none;width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
		<br /> <input type="submit" name="button" value="提交内容"/> (提交快捷键:
		Ctrl + Enter)
	</form>
</body>
</html>
<%!private String htmlspecialchars(String str) {
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
	}%>