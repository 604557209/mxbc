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
			  			<input name="c_num" style="line-height:22px;font-size:13px"">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">顾客姓名</td>
			  		<td>
			  			<input name="c_name" style="line-height:22px;font-size:13px"">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">顾客电话</td>
			  		<td>
			  			<input name="c_phone" style="line-height:22px;font-size:13px"">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">店面地址</td>
			  		<td>
			  			<input name="c_address" style="line-height:22px;size:120;width:300px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">所属区域</td>
			  		<td>
			  			<input name="c_area" style="line-height:22px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">区域督导姓名</td>
			  		<td>
			  			<input name="w_name" style="line-height:22px;font-size:13px"">
			  		</td>
			  	</tr>
			  	<tr line-height="32px">
			  		<td width="125">督导电话</td>
			  		<td>
			  			<input name="w_phone" style="line-height:22px;font-size:13px"">
			  		</td>
			  	</tr>
			  </table>
			  <input type="submit" class="btn btn-primary"  data-toggle="modal" data-target="#add_update_Modal"/>
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