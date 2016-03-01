<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN" style="height:100%">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>蜜雪冰城</title>
    <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/logo/icon.png" media="screen"/>
	<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/dashboard.css'/>" rel="stylesheet">
    <script src="<c:url value='/js/html5shiv.min.js'/>"></script>
    <script src="<c:url value='/js/respond.js'/>"></script>
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <script type="text/javascript">
    //区分选中与未选中的标题栏
    function alter_href(href,li){
    	//获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
	    var curWwwPath=window.document.location.href;
	    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
	    var pathName=window.document.location.pathname;
	    var pos=curWwwPath.indexOf(pathName);
	    //获取主机地址，如： http://localhost:8083
	    var localhostPaht=curWwwPath.substring(0,pos);
	    //获取带"/"的项目名，如：/uimcardprj
	    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    
    	$("#iframe").attr("src",localhostPaht+projectName+"/"+href);
    	//突出选中的颜色，并恢复未选中的颜色
    	$("#li_"+li).attr("style","background-color:#eee");
    	$(".lihref").each(function(){
    		   	if((($(this).attr("style") == "background-color: rgb(238, 238, 238);")||
    			($(this).attr("style") == "BACKGROUND-COLOR: #eee")
    		) && ($(this).attr("id") != ("li_"+li))){
    			$(this).attr("style","");		
    	}
    	});
    }
    //servlet
    function alter_href_title(href){
    	$("#iframe").attr("src",href);
    }
    //退出登录
    function firm(){
    	location.href="loginAction.action";
    }
    //判断当前时间段
    $(function(){
    	var today = new Date();
		var hour = today.getHours();
		if((hour>=0) && hour<=8){
			$("#hello_name").text("早上好 "+$("#admin_name").val());
		}else if((hour>=9) && (hour<=10)){
			$("#hello_name").text("上午好 "+$("#admin_name").val());
		}else if((hour>=11) && (hour <= 12)){
			$("#hello_name").text("中午好 "+$("#admin_name").val());
		}else if((hour>=13) && (hour<=18)){
			$("#hello_name").text("下午好 "+$("#admin_name").val());
		}else if((hour>=19) && (hour<=24)){
			$("#hello_name").text("晚上好 "+$("#admin_name").val());
		}
		var usercode = $("#admin_code").val();
		if(usercode == 1){
			$("#qitaxinxi").attr("style","");
		}else{
			$("#qitaxinxi").attr("style","display:none");
		}
    });
    </script>
  </head>
  <body style="background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:100%;" scroll="no">
  <!-- 删除 -->
   <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="delete_small_ModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    	<div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="delete_ModalLabel">退出登录</h4>
	        <input type="hidden" name="delete_meal_id" id="delete_meal_id">
	    </div>
       <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" onclick="firm();">退出</button>
	   </div>
    </div>
  </div>
</div>

  <!-- 帮助 -->
   <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="help_small_ModalLabel">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    	<div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="help_ModalLabel">使用帮助</h4>
	    </div>
		<div class="modal-body">
	        <label>
	        	招商部管理员为超级管理员，负责信息的录入，拥有系统所有权限。<br><br>
	        	市场部五名管理员为普通管理员，负责更新客户审核信息状态，不能录入客户信息。<br><br>
	        	市场部五名管理员的系统登录名与登录密码，由超级管理员即招商部管理员管理。
	        </label>
	    </div>
        <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	   	</div>
    </div>
  </div>
</div>

  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-header" style="width:10%;height:10%">
      <a class="navbar-brand" style="width:100%;" href="#">
        <img alt="Brand" style="height:100%;width:100%;" src="<c:url value='/logo/logo.png'/>">
      </a>
    </div>
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" style="color:white;" href="#" onclick="javascript:alter_href('findAllCusAction.action');">蜜雪冰城店面审核自助查询系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#" id="hello_name"></a></li>
            <input type="hidden" value="超级管理员" id="admin_name">
            <input type="hidden" value="${sessionScope.username_code}" id="admin_code">
            <li><a href="#" data-toggle="modal" data-target="#help_small_ModalLabel">帮助</a></li>
            <li><a href="#" data-toggle="modal" data-target="#delete_small_ModalLabel">退出</a></li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container-fluid"  style="height:100%">
      <div class="row" style="height:100%">
        <div class="col-sm-3 col-md-2 sidebar">
       	 <ul class="nav nav-sidebar">
          <li class="active"><a href="#">快速操作 <span class="sr-only">(current)</span></a></li>
            <li id="li_1" class="lihref"><a href="#" onclick="javascript:alter_href('pages/addcustomer.jsp',1);">客户信息录入</a></li>
         </ul>
		 <ul class="nav nav-sidebar">
            <li class="active"><a href="#">信息查看 <span class="sr-only">(current)</span></a></li>
            <li id="li_4" class="lihref"><a href="#" onclick="javascript:alter_href('findAllCusAction.action',4);">客户信息列表</a></li>
         </ul>
         <ul class="nav nav-sidebar">
            <li class="active"><a href="#">管理员 <span class="sr-only">(current)</span></a></li>
            <li id="li_5" class="lihref"><a href="#" onclick="javascript:alter_href('findAllAdminAction.action',5);">系统操作人员管理</a></li>
         </ul> 
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2" style="height:100%;">
        	<iframe id="iframe" frameborder="no" border="0"  style="height:100%;width:100%;" src="<c:url value='findAllCusAction.action'/>"></iframe>
        </div>
      </div>
    </div>
  </body>
</html>