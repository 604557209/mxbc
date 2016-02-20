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

    <title>银行日记账</title>
    <link rel="icon" href="<c:url value='/logo/logo.png'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/dashboard.css'/>">
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/html5shiv.min.js'/>"></script>
    <script src="<c:url value='/js/respond.js'/>"></script>
	<script type="text/javascript">
	//修改账面
	function viewToEdit(id){
		if($("#select_end_year").val() == "" || id==null){
			alert("无数据");
		}else {
			var begin_month = $("#select_begin_month").val();
			var end_month = $("#select_end_month").val();
			var begin_day = $("#select_begin_day").val();
			var end_day = $("#select_end_day").val();
			var name = $("#user_code").val();
			if(Number(begin_month) < 10){
				begin_month = "0"+begin_month;
			}
			if(Number(end_month) < 10){
				end_month = "0"+end_month;
			}
			if(Number(begin_day) < 10){
				begin_day = "0"+begin_day;
			}
			if(Number(end_day) < 10){
				end_day = "0"+end_day;
			}
			var begin_time = $("#select_begin_year").val()+"-"+begin_month+"-"+begin_day;
			var end_time = $("#select_end_year").val()+"-"+end_month+"-"+end_day;
			location.href="List_Bank_Servlet?method=toedit&id="+id+"&b_time="+begin_time+"&e_time="+end_time;
		}
	}
	//打印
	function viewToExcel(id){
		if($("#select_end_year").val() == "" || id==null){
			alert("无数据");
			
		}else{
			alert("打印阅览");
			var begin_month = $("#select_begin_month").val();
			var end_month = $("#select_end_month").val();
			var begin_day = $("#select_begin_day").val();
			var end_day = $("#select_end_day").val();
			var name = $("#user_code").val();
			if(Number(begin_month) < 10){
				begin_month = "0"+begin_month;
			}
			if(Number(end_month) < 10){
				end_month = "0"+end_month;
			}
			if(Number(begin_day) < 10){
				begin_day = "0"+begin_day;
			}
			if(Number(end_day) < 10){
				end_day = "0"+end_day;
			}
			var begin_time = $("#select_begin_year").val()+"-"+begin_month+"-"+begin_day;
			var end_time = $("#select_end_year").val()+"-"+end_month+"-"+end_day;
			location.href="List_Bank_Servlet?method=print&id="+id+"&b_time="+begin_time+"&e_time="+end_time;	
		}
    }
	function fanye(pages){
		$("#bank_form").attr("action","List_Bank_Servlet?method=list&pages_num="+pages);
		tijiao();
	}
	//增加分页按钮
	$(function() {
			var bys = $("#begin_year_select").val();
			var eys = $("#end_year_select").val();
			var today = new Date();
	        year1 = today.getFullYear();
	        year2 = year1 + 1;
	        year3 = year2 + 1;
	        year0 = year1 - 1;
	        $("#sb_y_0").text(year0);
			$("#sb_y_1").text(year1);
			$("#sb_y_2").text(year2);
			$("#sb_y_3").text(year3);
			$("#se_y_0").text(year0);
			$("#se_y_1").text(year1);
			$("#se_y_2").text(year2);
			$("#se_y_3").text(year3);
			for(var i = 0;i < 4;i++){
				if($("#sb_y_"+i).text() == bys){
					$("#sb_y_"+i).attr("selected",true);
				} 
				if($("#se_y_"+i).text() == eys){
					$("#se_y_"+i).attr("selected",true);
				}
			}
			
			var page = $("#page_servlet").val();//选中跳转至的页数
			$("li").each(function(){
			    $(this).attr("class","");
			});
			var n = 4;
			var end = $("#pages_servlet").val();
			for(var m = 1;m <= end;m++,n++){
				$("#pages_ul").append("<li id=li_"+m+" class=><a href=# onclick=fanye("+m+");>"+m+"</a></li>");
			}
			$("#pages_ul").append("<li>"
			      +"<a href=# aria-label=Next>"
			       + "<span aria-hidden=true>&raquo;</span>"
			     + "</a>"
			   + "</li>");
			$("#li_"+page).attr("class","active");
		});
	function tijiao(){
		var code = $("#user_code").val();
		var codes = "";
		var ac = 0;
		for (var i=0;i<code.length;i++){
			if(code.charAt(i) != "0" || ac != 0){
				codes += code.charAt(i);
				ac = 1;
			}
		}
		var acc = 0;
		$(".users").each(function(){
			if($(this).val() == code){
				code = $(this).attr("id");
				codes = "";
				for(var j=0;j<code.length;j++){
					if(acc == 1){
						codes += code.charAt(j);
					}
					if(code.charAt(j) == "_"){
						acc += 1;
					}
				}
			}
		});
		$("#user_code1").val(codes);
		var name = $("#user_"+codes).val();
		$("#user_code").val(name);
		if(name){
			$("#bank_form").submit();
		}else{
			alert("账户不存在");
		}
	}
	function select_time(){
		var time = new Array();
		$(".list_bank_time").each(function(){
			time.push($(this).val());
		});	
		$("#selectform_time").val(time);
		alert($("#selectform_time").val());
	}
	</script>
  </head>
  <body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto" onload="document.getElementById('user_code').focus()" >
  <nav class="navbar navbar-default" style="margin-top:2%;height:auto">
  <div class="container-fluid" style="height:auto">
        <div class="main" style="height:auto">
          <h2 class="sub-header">银行日记账</h2>
          <form id="bank_form" action="<c:url value='List_Bank_Servlet?method=list&pages_num=1'/>" method="post">
          <div class="form-group">
			    <label for="exampleInputEmail1">单位名称</label>
			    <div class="input-group" style="width:30%">
				    <input name="code" class="form-control" id="user_code" placeholder="单位名称或代码" value="${name}">
				    <input name="name"  type="hidden" id="user_code1" value="${code}">
				    <span class="input-group-btn">
	        			<button id="return_button" onclick="tijiao();" class="btn btn-default" style="font-weight:bolder" type="button"><</button>
	      			</span>
      			</div>
			  </div>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>时间</th>
                  <th>编号</th>
                  <th>摘要</th>
                  <th>收入</th>
                  <th>支出</th>
                  <th>结余</th>
                </tr>
              </thead>
              <tbody style="font-size:14px;">
                <c:forEach var="a" items="${list}">
                	<tr>
                		<td>${a.time}</td>
	                    <td>${a.num}</td>
	                    <c:if test="${a.project == 1}">
	                    	<td style="color:red">存入</td>
	                    </c:if>
	                    <c:if test="${a.project == 2}">
	                    	<td style="color:green">抵用</td>
	                    </c:if>
	                    <c:if test="${a.project == 1}">
	                    	<td style="color:red">￥${a.pay_refund_total}</td>
	                    	<td></td>
	                    </c:if>
	                    <c:if test="${a.project == 2}">
	                    	<td></td>
	                    	<td style="color:green">￥${a.pay_refund_total}</td>
	                    </c:if>
	                    <td>${a.surplus}</td>
               	    </tr>
                </c:forEach>
              </tbody>
            </table>
            
            <div class="form-group">
            <nav margin="0px">
			  <ul class="pagination" id="pages_ul" style="">
			    <li>
			      <a href="#" aria-label="Previous" style="">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			  </ul>
			  </nav>
			  <h6 class="sub-header"></h6>
			  <input type="hidden" id="selectform_time" name="selectform_time">
			  <input name="name"  type="hidden" id="user_code1" value="${code}">
			  <input type="hidden" id="begin_year_select" value="${begin_year_select}">
			  <input type="hidden" id="end_year_select" value="${end_year_select}">
			  <select id="select_begin_year" class="form-control list_begin_year" style="width:8%;display:inline" name="begin_year">
		   	    <option id="sb_y_0"></option>
				<option id="sb_y_1"></option>
				<option id="sb_y_2"></option>
				<option id="sb_y_3"></option>
			  </select>
			  年
			  <select id="select_begin_month" class="form-control list_begin_month" style="width:6%;display:inline" name="begin_month">
			   	  <option value=""></option>
			   	  <c:forEach var="month" begin="1" end="12">
				    	<option value="${month}" <c:if test="${month == begin_month_select}">selected="selected"</c:if>>${month}</option>
				    </c:forEach>
			  </select>
			  月
			  <select id="select_begin_day" class="form-control list_bank_time" style="width:6%;display:inline" name="begin_day">
			   	  <option value=""></option><c:forEach var="day" begin="1" end="31">
				    	<option value="${day}" <c:if test="${day == begin_day_select}">selected="selected"</c:if>>${day}</option>
				    </c:forEach>
			  </select>
			  日-
			  <select id="select_end_year" class="form-control list_bank_time" style="width:8%;display:inline" name="end_year">
		   	    <option id="se_y_0"></option>
				<option id="se_y_1"></option>
				<option id="se_y_2"></option>
				<option id="se_y_3"></option>
			  </select>
			  年
			  <select id="select_end_month" class="form-control list_bank_time" style="width:6%;display:inline" name="end_month">
			   	  <option value=""></option><c:forEach var="month" begin="1" end="12">
				    	<option value="${month}" <c:if test="${end_month_select == month}">selected="selected"</c:if>>${month}</option>
				    </c:forEach>
			  </select>
			  月
			  <select id="select_end_day" class="form-control list_bank_time" style="width:6%;display:inline" name="end_day">
			  	<option value=""></option>
			   	  <c:forEach var="day" begin="1" end="31">
				    	<option value="${day}" <c:if test="${end_day_select == day}">selected="selected"</c:if>>${day}</option>
				    </c:forEach>
			  </select>
			  日
			  <button type="button" class="btn btn-default" onclick="viewToExcel(${code},1);">打印该时间段内所有数据</button>
			  <button type="button" class="btn btn-default" onclick="viewToEdit(${code},2);">修改该时间段内所有数据</button>
			</form>
			</div>
          </div>
        </div>
      </div>
	</nav>
	<div>
    <c:forEach var="a" items="${list_user}">
    	<input type="hidden" style="display:none" class="users" id="user_${a.code}" value="${a.name}">
    	<input type="hidden" style="display:none" class="users_surplus" id="user_${a.code}_surplus" value="${a.surplus}">
    </c:forEach>
    <input type="hidden" id="pages_servlet" value="${pages}">
    <input type="hidden" id="page_servlet" value="${pages_num}">
    </div>
  </body>
</html>