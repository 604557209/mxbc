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
	$(function(){
		var time_list = $("#wc_c_time").val().split(" ");
		var times = time_list[0].split("-");
		var year = times[0];
		var month = times[1];
		var date = times[2];
		$("#time_y").text(year);
		$("#time_m").text(month);
		$("#time_d").text(date);
	});
</script>
<body style="background: url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);" style="min-width:150px;max-width:480px;margin:0 auto;">
	<form id="f_form" action="wechatFindByNum.action" method="post">
	<header style="width: 480px">
		<nav>
			<h1 class="nav_title" id="nav_title">蜜雪冰城店面审核自助查询系统</h1>
		</nav>
		<section class="search_bar">
			<input id="f_c_num" name="c_num" type="text" class="search_bar_input" placeholder="请输入编号"/>
			<input id="f_c_name" name="c_name" type="text" class="search_bar_input" placeholder="请输入您的姓名"/>
			<button type="button" class="gray_small_btn" onclick="checkf();">查询</button>
		</section>
	</header>
	</form>

	<article id="popselectpanel_container" class="popselectpanel_container" style="width: 480px; height: 616px; top: 98px;">
		<div id="content" class="content android_content_fixed" style="display: block;">
			<input type="hidden" id="wc_c_time" value="${message}"
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
					<h2 class="section_title">店面区域经理信息</h2>
					<ul class="cell_container">
						<li>
							<div>区域经理姓名：<span id="wc_w_name">${customer.w_name}</span></div>
						</li>
						<li>
							<div>区域经理电话：<span id="wc_w_phone">${customer.w_phone}</span></div>
						</li>
					</ul>
				</section>
				<section class="section_padding">
					<h2 class="section_title">当前状态</h2>
					<ul class="cell_container">
						<li>
							<div>审核状态：
								<span id="wc_c_state" style="color:green">审核通过</span>
							</div>
						</li>
					</ul>
				</section>
				<section class="section_padding">
					<ul class="cell_container">
						<li>
							<div>尊敬的${customer.c_name}<c:if test="${customer.c_sex == 0}">先生</c:if><c:if test="${customer.c_sex == 1}">女士</c:if>：
							<br>您好！<br>
&nbsp;&nbsp;&nbsp;&nbsp;恭喜您通过蜜雪冰城店面评审预估，愿我们在未来的合作中携手并进！<br>
&nbsp;&nbsp;&nbsp;&nbsp;请您务必于三个工作日内（即<span id="time_y"></span>年<span id="time_m"></span>月<span id="time_d"></span>日前）携带本人身份证（退伍军人请携带退伍证）、房屋租赁合同，前往公司签订《特许经营合同》，如超过该通知期限未签订《特许经营合同》，视为自动放弃。<br>
&nbsp;&nbsp;&nbsp;&nbsp;如有问题请及时联系您的投资顾问：${customer.t_name} 联系方式：${customer.t_phone}<br>
&nbsp;&nbsp;&nbsp;&nbsp;公司地址：河南省郑州市金水区文化路北三环瀚海北金商业中心A座16楼<br>
&nbsp;&nbsp;&nbsp;&nbsp;感谢您对蜜雪冰城的支持和关注，并衷心地希望未来能与您达成合作，携手并进！
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
