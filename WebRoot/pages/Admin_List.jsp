<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		function update_add(num,id,username,password){
			if(num == 1){
				$("#user-id").val(id);
				$("#user-username").val(username);
				$("#user-password").val(password);
				$("#add_update_ModalLabel").text("修改该账户密码：");
				$("#test_id").attr("action","Admin_List_Servlet?method=update");
				$("#user-username").attr("disabled",true);
			}else if(num == 2){
				$("#user-id").val("");
				$("#user-username").val("");
				$("#user-password").val("");
				$("#add_update_ModalLabel").text("添加账户：");
				$("#test_id").attr("action","Admin_List_Servlet?method=add");
				$("#user-username").attr("disabled",false);
			}
		}
		function tijiao(){
			if($("#user-username").val()=="" || $("#user-password").val()==""){
				alert("请填写完整");
			}else {
				$("#test_id").submit();				
			}
		}
		function delete_user(){
			var id = $("#delete_user_id").val();
			location.href="Admin_List_Servlet?method=delete&id="+id;
		}
		function firm(id){
			$("#delete_user_id").val(id);
		}
	</script>
  </head>
  <body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto" >
  <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="delete_user_ModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    	<div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="delete_ModalLabel">删除该账户：</h4>
	        <input type="hidden" name="delete_street" id="delete_user_id">
	    </div>
       <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" onclick="delete_user();">删除</button>
	   </div>
    </div>
  </div>
</div>
  
  <div class="modal fade" id="add_update_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"  align="left">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="add_update_ModalLabel">修改该账户密码：</h4>
	      </div>
	      <div class="modal-body">
	        <form name="test_id" id="test_id" action="Manager_AddressServlet?method=add" method="post">
	        	<div class="form-group">
	        		<label for="recipient-name" class="control-label" id="label_address">账户名：</label>
	        		<input type="text" name="form_username" id="user-username" class="form-control" disabled>
	        	</div>
	        	<div class="form-group">
	        		<label for="recipient-name" class="control-label" id="label_address">密码：</label>
	        		<input type="text" name="form_password" class="form-control" id="user-password">
	        		<input type="hidden" id="user-id" name="form_id">
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
          <h2 class="sub-header">用户信息列表</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th width="30%">用户名</th>
                  <th width="20%">密码</th>
                  <th width="20%">权限</th>
                  <th width="30%">操作</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="a" items="${list}">
                <tr>
                  <td><a>${a.username}</a></td>
                  <td>${a.password}</td>
                  <c:if test="${a.code == 1 }">
                  	<td>管理员</td>	
                  </c:if>
                  <c:if test="${a.code == 2 }">
                  	<td>普通</td>	
                  </c:if>
                  <td>
                  	  <button type="button" class="btn btn-primary btn-xs" onclick="update_add(1,${a.id},'${a.username}',${a.password})" data-toggle="modal" data-target="#add_update_Modal">修改</button>
                  	  <button type="button" class="btn btn-primary btn-danger btn-xs" onclick="firm(${a.id})" data-toggle="modal" data-target="#delete_user_ModalLabel">删除</button>
                  </td>
                </tr>
	           </c:forEach>
	           <tr>
	           	<td><button type="button" class="btn btn-primary btn-xs" onclick="update_add(2,'','','')" data-toggle="modal" data-target="#add_update_Modal">添加</button></td>
	           	<td> </td><td> </td><td> </td>
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