<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>郑州市圃田车站</title>
    <link rel="icon" type="image/x-icon" href="http://192.168.43.26:8080/ZZ.PuTian.TrainStation/logo/logo.png" media="screen"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/dashboard.css'/>">
    <script src="<c:url value='/js/html5shiv.min.js'/>"></script>
    <script src="<c:url value='/js/respond.js'/>"></script>
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
   	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
   	<link rel="stylesheet" type="text/css" href="<c:url value='/css/sigin.css'/>">
  </head>

  <body>
    <div class="container">
      <form class="form-signin" action="loginAction.action" method="post">
        <h3 class="form-signin-heading">
        	<p class="text-center">蜜雪冰城</p>
        </h3>
        <label for="inputEmail" class="sr-only">帐号</label>
        <input type="text" name="username" id="inputEmail" class="form-control" placeholder="管理员帐号" required autofocus>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="密码" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
      </form>
    </div>
	<nav class="navbar navbar-default navbar-fixed-bottom">
		<div></div>
		<div class="text-center" style="text-align:center;height:40px;line-height:40px;top:50%;">
			<p class="text-center">Copyright ©2016 中原工学院 All Rights Reserved. Created by 软件学院</p>
		</div>
	</nav>
  </body>
</html>
