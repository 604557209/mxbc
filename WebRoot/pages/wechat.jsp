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
<script type="text/javascript">
	
</script>
<body style="background: url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);">
	<form action="wechatFindByNum.action" method="post">
	<header>
		<nav>
			<h1 class="nav_title" id="nav_title">顾客信息查询</h1>
		</nav>
		<section class="search_bar">
			
				<input name="c_num" type="text" class="search_bar_input" placeholder="请输入顾客信息编号"/>
				<button type="submit" class="gray_small_btn">查询</button>
			
		</section>
	</header>
	</form>

	<article id="popselectpanel_container" class="popselectpanel_container" style="width: 480px; height: 616px; top: 98px;">
		<div id="content" class="content android_content_fixed" style="display: block;">
			<div id="scroller" class="scroller">
				<section class="section_padding">
					<ul class="cell_container">
						<li>
							<div>顾客编号：<span id="wc_c_num">${customer.c_num}</span></div>
						</li>
					</ul>
				</section>
				<section class="section_padding">
					<h2 class="section_title">顾客信息</h2>
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
					<h2 class="section_title">店面信息</h2>
					<ul class="cell_container">
						<li>
							<div>店面地址：<span id="wc_c_address">${customer.c_address}</span></div>
						</li>
						<li>
							<div>店面所属区域：<span id="wc_c_area">${customer.c_area}</span></div>
						</li>
					</ul>
				</section>
				<section class="section_padding">
					<h2 class="section_title">店面督导信息</h2>
					<ul class="cell_container">
						<li>
							<div>督导姓名：<span id="wc_w_name">${customer.w_name}</span></div>
						</li>
						<li>
							<div>督导电话：<span id="wc_w_phone">${customer.w_phone}</span></div>
						</li>
					</ul>
				</section>
				<section class="section_padding">
					<h2 class="section_title">当前状态</h2>
					<ul class="cell_container">
						<li>
							<div>审核状态：<span id="wc_c_state">${customer.c_state}</span></div>
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
