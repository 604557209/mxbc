<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    
    <link rel="icon" href="<c:url value='/Stage_Pages/img/app.icon'/>">

    <title>圃田车站预付款管理系统</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/sigin.css'/>">
	<script src="<c:url value='/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
  <script src="<c:url value='/js/ie-warning.js'/>"></script>
  <script src="<c:url value='/js/html5shiv.min.js'/>"></script>
  <script src="<c:url value='/js/respond.js'/>"></script>
  </head>

  <body>
  <table>
  	<tr></tr>
  	<tr>
  		<td width="50%">
  			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="width:20%">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox" >
    <div class="item active">
      <img src="<c:url value='/back_pic/putian_pic1.jpg'/>" style="height: 200px; width: 400px;">
    </div>
    <div class="item">
      <img src="<c:url value='/back_pic/putian_pic2.jpg'/>" style="height: 200px; width: 400px;">
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" ></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
  		</td>
  		<td width="50%">
  			<div class="container" width="20%">
    
      <form class="form-signin" action="login_servlet" method="post">
        <h3 class="form-signin-heading">
        	<p class="text-center">圃田车站预付款管理系统</p>
        </h3>
        <label for="inputEmail" class="sr-only">帐号</label>
        <input type="text" name="username" id="inputEmail" class="form-control" placeholder="管理员帐号" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="密码" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
      </form>
    </div>
  		</td>
  	</tr>
  </table>
	<nav class="navbar navbar-default navbar-fixed-bottom">
		<div></div>
		<div class="text-center" style="text-align:center;height:40px;line-height:40px;top:50%;">
			<p class="text-center">Copyright ©2015 郑州市铁路局圃田车站</p>
		</div>
	</nav>
  </body>
</html>
