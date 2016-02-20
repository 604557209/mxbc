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

    <title>用户列表</title>
    <link rel="icon" href="<c:url value='/logo/logo.png'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/dashboard.css'/>">
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	
    <script src="<c:url value='/js/html5shiv.min.js'/>"></script>
    <script src="<c:url value='/js/respond.js'/>"></script>
	<script type="text/javascript">
		function update_add(num,name){
			if(num == 1){
				$("#user-name").val(name);
				$("#user-id").val(1);
				$("#add_update_ModalLabel").text("修改预付款凭证编号：");
			}else if(num == 2){
				$("#user-name").val(name);
				$("#user-id").val(2);
				$("#add_update_ModalLabel").text("修改退款凭证编号：");
			}
		}
		function tijiao(){
			if($("#user-name").val() == ""){
				alert("请填写完整");
			}else {
				$("#test_id").submit();
			}
		}
	</script>
  </head>
  <body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto" >
  <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="delete_user_ModalLabel">
</div>
  
  <div class="modal fade" id="add_update_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"  align="left">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="add_update_ModalLabel">修改起始编码：</h4>
	      </div>
	      <div class="modal-body">
	        <form name="test_id" id="test_id" action="ProveNum_List_Servlet?method=update" method="post">
	        	<div class="form-group">
	        		<label for="recipient-name" class="control-label" id="label_address">编码：</label>
	        		<input type="text" name="name" class="form-control" id="user-name">
	        		<input type="hidden" id="user-id" name="id">
	        	</div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" onclick="tijiao();">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
  
  <nav class="navbar navbar-default" style="margin-top:2%;height:auto">
  <div class="container-fluid" style="height:auto">
        <div class="main" style="height:auto">
          <h2 class="sub-header">"编码"信息列表</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <tbody>
                <tr>
                  <td>预付款编码</td>
                  <td>${pay_num}</td>
                  <td>
                  	  <button type="button" class="btn btn-primary btn-xs" onclick="update_add(1,'${pay_num}')" data-toggle="modal" data-target="#add_update_Modal">修改</button>
                  </td>
                </tr>
                <tr>
                  <td>退款编码</td>
                  <td>${refund_num}</td>
                  <td>
                  	  <button type="button" class="btn btn-primary btn-xs" onclick="update_add(2,'${refund_num}')" data-toggle="modal" data-target="#add_update_Modal">修改</button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
	</nav>
  </body>
</html>