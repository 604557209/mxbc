<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		function fun(){
			var select = document.getElementById("test");
			var str = [];
			for(i=0;i<select.length;i++){
				if(select.options[i].selected){
					str.push(select[i].value);
				}
			}
			alert(str);
		}
	</script>
  </head>
  
  <body>
	<select id="test" multiple="true">
		<option value="option-A">option-A</option>  
		<option value="option-B">option-B</option>
		<option value="option-C">option-C</option> 
		<option value="option-D">option-D</option>
	</select>
	<input type="button" value="确定" onclick="fun()" />
  </body>
</html>
