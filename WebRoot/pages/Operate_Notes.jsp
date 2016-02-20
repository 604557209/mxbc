<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragrma","no-cache");
	response.setDateHeader("Expires",0);
%>
<html lang="zh-CN" style="height:auto">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>系统操作记录</title>
    <link rel="icon" href="<c:url value='/logo/logo.png'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/dashboard.css'/>">
    <script src="<c:url value='/js/html5shiv.min.js'/>"></script>
    <script src="<c:url value='/js/respond.js'/>"></script>
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
   	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
  </head>
  <body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto" >
  <nav class="navbar navbar-default" style="margin-top:2%;height:auto">
  <div class="container-fluid" style="height:auto">
        <div class="main" style="height:auto">
          <h2 class="sub-header">近期系统操作记录</h2>
          <div class="table-responsive">
            <table class="table table-striped" style="font-size:14px;">
              <thead>
                <tr>
                  <th width="7%">编号</th>
                  <th width="22%">操作项目</th>
                  <th width="10%">操作单位</th>
                  <th width="13%">操作金额</th>
                  <th>经办人</th>
                  <th>时间</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var="a" items="${list}">
	                <tr>
	                  <td>${a.code}</td>
	                  <c:if test="${a.opreateproject == 1}">
	                  	<td>预存款存入凭证</td>	
	                  </c:if>
	                  <c:if test="${a.opreateproject == 2}">
	                  	<td>预付款抵用（退款）凭证</td>
	                  </c:if>
	                  <td><a href="List_Bank_Servlet?method=list&name=${a.num}&pages_num=1">${a.name}</a></td>
	                  <c:if test="${a.opreateproject == 2}">
	                  	<td style="color:green">￥${a.price}</td>
	                  </c:if>
	                  <c:if test="${a.opreateproject == 1}">
	                  	<td style="color:red">￥${a.price}</td>
	                  </c:if>
	                  	
	                  <td>${a.operator}</td>
	                  <td>${a.time}</td>
	                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
	</nav>
  </body>
</html>