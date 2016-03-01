<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>管理员信息列表</title>
<link rel="icon" href="<c:url value='/logo/logo.png'/>">
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/css/dashboard.css'/>" rel="stylesheet">
<script src="<c:url value='/js/html5shiv.min.js'/>"></script>
<script src="<c:url value='/js/respond.js'/>"></script>
<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script type="text/javascript">
	function update_administrator(a_id,a_admin){
		$("#up_a_id").val(a_id);
		$("#up_a_username").val($("#l_a_username_"+a_id).text());
		$("#up_a_password").val($("#l_a_password_"+a_id).text());
		$("#up_a_tag").val($("#l_a_tag_"+a_id).text());
		$("#up_a_admin").val(a_admin);
	}
	/* function deleteCus(id) {
		if (confirm("删除确认")) {
			$("#del_c_id").val(id);
			deleteCustomerForm.submit();
		}
	} */
    </script>
</head>
<body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto">
	<div class="modal fade" id="add_update_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"  align="left">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="add_update_ModalLabel">修改该管理员信息：</h4>
	      </div>
	      <div class="modal-body">
	        <form action="updateAdminAction.action" method="post">
	        	<table width="100%" style="line-height:32px">
			  	<input type="hidden" name="a_id" id="up_a_id"/>
			  	<input type="hidden" name="a_admin" id="up_a_admin"/>
			  	<tr>
			  		<td width="125">管理区域</td>
			  		<td>
			  			<input id="up_a_tag" name="a_tag" style="line-height:22px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">管理员姓名</td>
			  		<td>
			  			<input id="up_a_username" name="a_username" style="line-height:22px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">管理员密码</td>
			  		<td>
			  			<input id="up_a_password" name="a_password" style="line-height:22px;font-size:13px">
			  		</td>
			  	</tr>
			  </table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="submit" class="btn btn-primary">保存</button>
	      </div>
	        </form>
	    </div>
	  </div>
	</div>

	<nav class="navbar navbar-default" style="margin-top:2%;height:auto">
		<div class="container-fluid" style="height:auto">
			<div class="main" style="height:auto">
				<h2 class="sub-header">管理员信息列表</h2>
				<div class="table-responsive">
					<table class="table table-striped" style="font-size:14px;">
						<thead>
							<tr>
								<th>管理区域</th>
								<th>管理员姓名</th>
								<th>管理员密码</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="a" items="${list}">
								<c:if test="${a.a_admin==0}">
									<tr style="color:red;" color="red">
										<td id="l_a_tag_${a.a_id}">${a.a_tag}</td>
										<td id="l_a_username_${a.a_id}">${a.a_username}</td>
										<td id="l_a_password_${a.a_id}">${a.a_password}</td>
										<td>
											<button type="button" class="btn btn-primary btn-xs" onclick="update_administrator(${a.a_id},${a.a_admin})" data-toggle="modal" data-target="#add_update_Modal">修改</button>
										</td>
									</tr>
								</c:if>
								<c:if test="${a.a_admin==1}">
									<tr>
										<td id="l_a_tag_${a.a_id}">${a.a_tag}</td>
										<td id="l_a_username_${a.a_id}">${a.a_username}</td>
										<td id="l_a_password_${a.a_id}">${a.a_password}</td>
										<td>
											<button type="button" class="btn btn-primary btn-xs" onclick="update_administrator(${a.a_id},${a.a_admin})" data-toggle="modal" data-target="#add_update_Modal">修改</button>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</div>
	</nav>
	<form name="deleteAdministratorForm" method="post" action="deleteAdminAction.action">
		<input id="del_a_id" type="hidden" name="a_id"/>
	</form>
</body>
</html>