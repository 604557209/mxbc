<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragrma","no-cache");
	response.setDateHeader("Expires",0);
%>
<html lang="zh-CN" style="height:auto">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>顾客信息录入</title>
    <link rel="icon" href="<c:url value='/logo/logo.png'/>">
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/dashboard.css'/>">

    <script src="<c:url value='/js/html5shiv.min.js'/>"></script>
    <script src="<c:url value='/js/respond.js'/>"></script>
    <script>
		function check_f(){
			var ac = true;
			$(".check_number").each(function(){
				var input_name = $(this).attr("name");
				if(isNaN($(this).val())){
					ac = false;
					$("#warn_"+input_name).attr("style","color: red;");
				}else{
					$("#warn_"+input_name).attr("style","display: none");
				}
			});
			if(!ac){
				return 0;
			}
			$(".check_value").each(function(){
				if($(this).val() == ''){
					ac = false;	
				}
			});
			if(ac){
				$("#customer_form").submit();
			}else{
				alert("请将信息填写完整！");
			}
		}
	</script>
  </head>
  <body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto">
  <nav class="navbar navbar-default" style="margin-top:2%;height:auto">
  <div class="container-fluid" style="height:auto">
        <div class="main" style="height:auto">
          <h2 class="sub-header">顾客信息录入</h2>
          <div class="table-responsive">
			<form id="customer_form" action="addCusAction.action" method="post">
			  <table width="100%" style="line-height:32px">
			  	</th>
			  	<tr>
			  		<td width="125">编号</td>
			  		<td>
			  			<input class="check_value check_number" id="check_c_num" name="c_num" style="line-height:22px;font-size:13px">
			  			<span style="color: red; display: none;" id="warn_c_num">仅能由数字组成</span>
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">客户姓名</td>
			  		<td>
			  			<input class="check_value" name="c_name" style="line-height:22px;font-size:13px"">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">客户性别</td>
			  		<td>
			  			<select name="c_sex">
			  				<option value="0">先生</option>
			  				<option value="1">女士</option>
			  			</select>
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">客户电话</td>
			  		<td>
			  			<input class="check_value check_number" id="check_c_phone" name="c_phone" style="line-height:22px;font-size:13px">
			  			<span style="color: red; display: none;" id="warn_c_phone">仅能由数字组成</span>
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">店面地址</td>
			  		<td>
			  			<input class="check_value" name="c_address" style="line-height:22px;size:120;width:300px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">所属区域</td>
			  		<td>
			  			<!-- <input name="c_area" style="line-height:22px;font-size:13px"> -->
			  			<select name="c_area">
			  				<option value="0">华中</option>
			  				<option value="1">华东</option>
			  				<option value="2">华西</option>
			  				<option value="3">华南</option>
			  				<option value="4">华北</option>
			  			</select>
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">区域经理姓名</td>
			  		<td>
			  			<input class="check_value" name="w_name" style="line-height:22px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr line-height="32px">
			  		<td width="125">区域经理电话</td>
			  		<td>
			  			<input class="check_value check_number" id="check_w_phone" name="w_phone" style="line-height:22px;font-size:13px">
			  			<span style="color: red; display: none;" id="warn_w_phone">仅能由数字组成</span>
			  		</td>
			  	</tr>
			  	<tr line-height="32px">
			  		<td width="125">投资顾问姓名</td>
			  		<td>
			  			<input class="check_value" name="t_name" style="line-height:22px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr line-height="32px">
			  		<td width="125">投资顾问电话</td>
			  		<td>
			  			<input class="check_value check_number" id="check_t_phone" name="t_phone" style="line-height:22px;font-size:13px">
			  			<span style="color: red; display: none;" id="warn_t_phone">仅能由数字组成</span>
			  		</td>
			  	</tr>
			  </table>
			  <br>
			  <input type="button" onclick="check_f()" value="录入" class="btn btn-primary"  data-toggle="modal" data-target="#add_update_Modal"/>
			  <input type="reset" class="btn btn-primary" value="重置">
			</form>
          </div>
        </div>
      </div>
    </div>
	</nav>
    </div>
  </body>
</html>