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
		function update_add(num,name,id){
			if(num == 1){
				$("#user-name").val(name);
				$("#user-id").val(id);
				$("#add_update_ModalLabel").text("修改该票据名称：");
				$("#test_id").attr("action","List_Bill_Servlet?method=update");
			}else if(num == 2){
				$("#user-name").val("");
				$("#user-id").val("");
				$("#add_update_ModalLabel").text("添加票据名称：");
				$("#test_id").attr("action","List_Bill_Servlet?method=add");
			}
		}
		function tijiao(){
			if($("#user-name").val() == ""){
				alert("请填写完整");
			}else {
				$("#test_id").submit();				
			}
		}
		function delete_bill(){
			var id = $("#delete_bill_id").val();
			location.href="List_Bill_Servlet?method=delete&id="+id;
		}
		function firm(id){
			$("#delete_bill_id").val(id);
		}
	</script>
  </head>
  <body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto" >
  <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="delete_user_ModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    	<div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="delete_ModalLabel">删除该票据名称：</h4>
	        <input type="hidden" name="id" id="delete_bill_id">
	    </div>
       <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" onclick="delete_bill();">删除</button>
	   </div>
    </div>
  </div>
</div>
  
  <div class="modal fade" id="add_update_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"  align="left">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="add_update_ModalLabel">修改该票据信息：</h4>
	      </div>
	      <div class="modal-body">
	        <form name="test_id" id="test_id" action="List_Bill_Servlet?method=add" method="post">
	        	<div class="form-group">
	        		<label for="recipient-name" class="control-label" id="label_address">票据名：</label>
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
          <h2 class="sub-header">"票据名称"信息列表</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>票据名称</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="a" items="${list_bill}">
                <tr>
                  <td>${a.name}</td>
                  <td>
                  	  <button type="button" class="btn btn-primary btn-xs" onclick="update_add(1,'${a.name}',${a.id})" data-toggle="modal" data-target="#add_update_Modal">修改</button>
                  	  <button type="button" class="btn btn-primary btn-danger btn-xs" onclick="firm(${a.id})" data-toggle="modal" data-target="#delete_user_ModalLabel">删除</button>
                  </td>
                </tr>
	           </c:forEach>
	           <tr>
	           	<td><button type="button" class="btn btn-primary btn-xs" onclick="update_add(2,'','')" data-toggle="modal" data-target="#add_update_Modal">添加</button></td>
	           	<td></td>
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