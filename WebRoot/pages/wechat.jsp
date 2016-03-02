<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="max-age=0">
<meta http-equiv="Cache-Control" content="no-cache">
<title>蜜雪冰城</title>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="email=no">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" name="viewport">
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/logo/icon.png" media="screen"/>
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/css/mxbc-wechat.css'/>" rel="stylesheet">
<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script type="text/javascript">
	function checkf(){
		if($("#f_c_num").val() == '' || $("#f_c_name").val() == ''){
			alert("请输入您的编号与姓名");
		}else{
			if(isNaN($("#f_c_num").val())){
				alert("请输入正确的编号！");
			}else{
				$("#f_form").submit();
			}
		}
	}
</script>
<body style="background: url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);" style="width: 100%;margin:0 auto;">
	<form id="f_form" action="wechatFindByNum.action" method="post">
	<header style="width: 100%">
		<nav>
			<h1 class="nav_title" id="nav_title">店面审核自助查询系统</h1>
		</nav>
		<section class="search_bar">
			<input id="f_c_num" name="c_num" type="text" class="search_bar_input" placeholder="请输入编号"/>
			<input id="f_c_name" name="c_name" type="text" class="search_bar_input" placeholder="请输入您的姓名"/>
			<button type="button" class="gray_small_btn" onclick="checkf();">查询</button>
		</section>
	</header>
	</form>

	<article id="popselectpanel_container" class="popselectpanel_container" style="width: 100%; height: 616px; top: 98px;">
		<div id="content" class="content android_content_fixed" style="display: block;">
			<div id="scroller" class="scroller">
				<section class="section_padding">
					<ul class="cell_container">
						<li>
							<div>客户编号：<span id="wc_c_num">${customer.c_num}</span></div>
						</li>
					</ul>
				</section>
				<section class="section_padding">
					<h2 class="section_title">客户信息</h2>
					<ul class="cell_container">
						<li>
							<div>姓名：<span id="wc_c_name">${customer.c_name}</span></div>
						</li>
						<li>
							<div>电话：<span id="wc_c_phone">${customer.c_phone}</span></div>
						</li>
					</ul>
				</section>
				<section class="section_padding">
					<h2 class="section_title">当前状态</h2>
					<ul class="cell_container">
						<li>
							<div>审核状态：
								<c:if test="${customer.c_state == 0}">
									<span id="wc_c_state" style="color:blue">派单中</span>
								</c:if>
								<c:if test="${customer.c_state == 1}">
									<span id="wc_c_state" style="color:blue">审核任务已派发，区域经理${customer.w_name}将为您审核店面</span>
								</c:if>
								<c:if test="${customer.c_state == 2}">
									<span id="wc_c_state" style="color:blue">审核中，请耐心等待</span>
								</c:if>
								<c:if test="${customer.c_state == 3}">
									<span id="wc_c_state" style="color:blue">审核完成，资料回传评定中，请耐心等待</span>
								</c:if>
							</div>
						</li>
					</ul>
				</section>
			</div>
		</div>
		<footer class="android_footer_fixed" style="top: 48px; display: block;">
		</footer>
	</article>		
</body>
</html>
