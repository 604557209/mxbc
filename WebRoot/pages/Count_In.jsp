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
    	$(function() {
    		//获得当前年份
			var today = new Date();
	        year1 = today.getFullYear();
	        year2 = year1 + 1;
	        year3 = year2 + 1;
	        year0 = year1 - 1;
	        $("#select_begin_year0").text(year0);
			$("#select_begin_year1").text(year1);
			$("#select_begin_year2").text(year2);
			$("#select_begin_year3").text(year3);
			$("#select_end_year0").text(year0);
			$("#select_end_year1").text(year1);
			$("#select_end_year2").text(year2);
			$("#select_end_year3").text(year3);
    	});
    	function ac(){
		   	var begin_year = $("#select_begin_year").val();
		   	var begin_month = $("#select_begin_month").val();
		   	if(begin_month.length == 1){
		   		begin_month = "0"+begin_month;
		   	}
		   	var begin_day = $("#select_begin_day").val();
		   	if(begin_day.length == 1){
		   		begin_day = "0"+begin_day;
		   	}
		   	var end_year = $("#select_end_year").val();
		   	var end_month = $("#select_end_month").val();
		   	if(end_month.length == 1){
		   		end_month = "0"+end_month;
		   	}
		   	var end_day = $("#select_end_day").val();
		   	if(end_day.length == 1){
		   		end_day = "0"+end_day;
		   	}
		   	var begin_time = begin_year+"-"+begin_month+"-"+begin_day;
		   	var end_time = end_year+"-"+end_month+"-"+end_day;
		   	
		   	$("#time_values").text(begin_time+" 至 "+end_time);
		   	var values = "";
		   	$("#pay_times_td").text("正在查询..");
		   	$("#refund_times_td").text("正在查询..");
		   	$.ajax({
				type:"post",//请求方式
			    url:"Test_Ajax",//发送请求地址
			   	data:{//发送给数据库的数据
				   	begin_time:begin_time,
				   	end_time:end_time
			   	},
			   	//请求成功后的回调函数有两个参数
			   	success:function(date){
			    	values = date;
			   	}
			});
			setTimeout(function(){
				var vals = values.split(",");
				$("#pay_times_td").text(vals[4]+"-"+vals[5]+" 共:"+Math.round(vals[2])+"单:"+vals[0]+"元");
				$("#refund_times_td").text(vals[6]+"-"+vals[7]+" 共:"+Math.round(vals[3])+"单:"+vals[1]+"元");
			}, 5000);
		}
</script>
  </head>
  <body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto" >
  
  <nav class="navbar navbar-default" style="margin-top:2%;height:auto">
  <div class="container-fluid" style="height:auto">
        <div class="main" style="height:auto">
          <h2 class="sub-header">统计信息</h2>
          <div class="table-responsive">
          	<table class="table table-hover">
          		<tr>
          			<td style="font-weight:bold">#</td>
          			<td style="font-weight:bold">今日出单</td>
          			<td style="font-weight:bold">历史出单</td>
          			<td style="font-weight:bold">今日总额</td>
          			<td style="font-weight:bold">历史总额</td>
          			<td id="time_values" style="font-weight:bold">
          				请选择查询日期..
          				<!-- 2015-10-19 至 2015-11-19 -->
          			</td>
          		</tr>
          		<tr>
          			<td style="font-weight:bold">存入</td>
          			<td style="color:red">${pay_first_num}-${pay_end_num} 共${count_pay_today}单</td>
          			<td style="color:red">${count_pay_history}</td>
          			<td style="color:red">￥${sum_pay_today}</td>
          			<td style="color:red">￥${sum_pay_history}</td>
          			<td style="color:red" id="pay_times_td">
          				请选择查询日期..
          			</td>
          		</tr>
          		<tr>
          			<td style="font-weight:bold">抵用</td>
          			<td style="color:green">${refund_first_num}-${refund_end_num} 共${count_refund_today}单</td>
          			<td style="color:green">${count_refund_history}</td>
          			<td style="color:green">￥${sum_refund_today}</td>
          			<td style="color:green">￥${sum_refund_history}</td>
          			<td style="color:green" id="refund_times_td">
          				请选择查询日期..
          			</td>
          		</tr>
          	</table>
          	<select id="select_begin_year" class="form-control list_begin_year" style="width:8%;display:inline" name="begin_year">
				<option id="select_begin_year0"></option>
				<option id="select_begin_year1" selected></option>
				<option id="select_begin_year2"></option>
				<option id="select_begin_year3"></option>
			</select> 年
			<select id="select_begin_month" class="form-control list_begin_month" style="width:6%;display:inline" name="begin_month">
				<c:forEach var="month" begin="1" end="12">
					<option id="s_b_${month}">
						${month}					
					</option>
				</c:forEach>
			</select> 月
			<select id="select_begin_day" class="form-control list_bank_time" style="width:6%;display:inline" name="begin_day">
				<c:forEach var="day" begin="1" end="31">
					<option id="s_b_${day}">${day}</option>
				</c:forEach>
			</select> 日- 
			<select id="select_end_year" class="form-control list_bank_time" style="width:8%;display:inline" name="end_year">
					<option id="select_end_year0"></option>
					<option id="select_end_year1" selected></option>
					<option id="select_end_year2"></option>
					<option id="select_end_year3"></option>
			</select> 年 
			<select id="select_end_month" class="form-control list_bank_time" style="width:6%;display:inline" name="end_month">
				<c:forEach var="month" begin="1" end="12">
					<option id="s_e_${month}">${month}</option>
				</c:forEach>
			</select> 月 
			<select id="select_end_day" class="form-control list_bank_time" style="width:6%;display:inline" name="end_day">
				<c:forEach var="day" begin="1" end="31">
					<option id="s_e_${day}">${day}</option>
				</c:forEach>
			</select> 日 
			<input type="hidden" id="select_begin_time" name="begin_time">
			<input type="hidden" id="select_end_time" name="end_time">
			<input type="button" class="btn btn-default" onclick="ac();" value="查询" />
          </div>
        </div>
      </div>
    </div>
	</nav>
  </body>
</html>