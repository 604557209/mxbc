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

    <title>预付款抵用（退款）凭证</title>
    <link rel="icon" href="<c:url value='/logo/logo.png'/>">
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/dashboard.css'/>">
    <script src="<c:url value='/js/html5shiv.min.js'/>"></script>
    <script src="<c:url value='/js/respond.js'/>"></script>
	<script>
	//¥
	function viewToExcel(){
	if(tijiao()){
		var filepath = "d:\\refund.xls";
    	var xlApp;
    	var xlBook;
    	var xlSheet;
    	try {  
            xlApp = new ActiveXObject("Excel.Application");  
        }  
        catch (e) {  
        	alert("请使用IE浏览器，并检查安全选项");
            return;  
        }
        xlBook = xlApp.Workbooks.Open(filepath);
        var date;
        var month;
        var year;
    	var today = new Date();
    	year = today.getFullYear();
    	month = today.getMonth() + 1;
    	date = today.getDate();
    	var num = $("#refund_num").val();
    	var name = $("#user_code").val();
    	var operator = $("#operator_dayin").val();
    	var china_num = $("#china_num").text();

    	//var order = "";
    	var price = $("#refund_total").val();
    	var allprice = new Array();
    	allprice = price.split(".");
    	var xiaoshu = new Array();
    	var zhengshu = new Array();
    	if(allprice[1] == null){
    		allprice[1] = "00";
    	}
    	xiaoshu = allprice[1];
    	zhengshu = allprice[0];
    	var length = zhengshu.length;
    	if(zhengshu.length < 9){
    		zhengshu = "¥"+zhengshu;
    	}

		if(xiaoshu.length == 1){
			xiaoshu = xiaoshu + "0";
		}else if(xiaoshu.length == 0){
			xiaoshu = "00";
		}
		var order_name = new Array();
		var order_price = new Array();
		$(".refund_order_in").each(function(){
			if($(this).val() != "无"){
				order_name.push($(this).val());
			}
		});
		$(".refund_order_price").each(function(){
			order_price.push($(this).val());
		});


        xlSheet = xlBook.ActiveSheet;
        xlSheet.Cells(7,2).value=name;
        xlSheet.Cells(4,7).value=year;
        xlSheet.Cells(4,9).value=month;
        xlSheet.Cells(4,11).value=date;
        xlSheet.Cells(1,23).value=num;
        xlSheet.Cells(18,18).value=operator;
        xlSheet.Cells(14,3).value=china_num;
        //ORDER
        for(var z = 10,u=0;z <= 13;z++,u++){
        	xlSheet.Cells(z,1).value = order_name[u];//名
        	xlSheet.Cells(z,14).value = order_price[u];//价
        	if(order_price[u] != ""){
        		xlSheet.Cells(z,2).value = "1";
        		xlSheet.Cells(z,5).value = "1";
        		xlSheet.Cells(z,8).value = "1";
        	}
        }
	xlSheet.Cells(15,12).value=zhengshu[length-7];//千万
        xlSheet.Cells(15,13).value=zhengshu[length-6];//百万
        xlSheet.Cells(15,15).value=zhengshu[length-5];//十万
        xlSheet.Cells(15,17).value=zhengshu[length-4];//万
        xlSheet.Cells(15,19).value=zhengshu[length-3];//千
        xlSheet.Cells(15,20).value=zhengshu[length-2];//百-14
        xlSheet.Cells(15,22).value=zhengshu[length-1];//十-16
        xlSheet.Cells(15,24).value=zhengshu[length];//元-17
        xlSheet.Cells(15,25).value=xiaoshu[0];//角
        xlSheet.Cells(15,26).value=xiaoshu[1];//分     

	xlSheet.Cells(18,6).value="余额:"+$("#pay_surplus").val();
      //  xlBook.SaveAs("d:\\refund1.xls");
        xlBook.PrintOut;
        xlBook.Close(false);
	}else{
		alert("打印失败");
	}
    	
    }
	function NoToChinese(num) {
		if (!/^\d*(\.\d*)?$/.test(num)) {
			return "请输入正确格式";
		}
		var AA = new Array("零", "壹", "贰", "叁", "肆", "伍", "陆",
				"柒", "捌", "玖");
		var BB = new Array("", "拾", "佰", "仟", "万", "億", "元", "");
		var a = ("" + num).replace(/(^0*)/g, "").split("."), k = 0, re = "";
		for (var i = a[0].length - 1; i >= 0; i--) {
			switch (k) {
			case 0:
				re = BB[7] + re;
				break;
			case 4:
				if (!new RegExp("0{4}\\d{"
						+ (a[0].length - i - 1) + "}$")
						.test(a[0]))
					re = BB[4] + re;
				break;
			case 8:
				re = BB[5] + re;
				BB[7] = BB[5];
				k = 0;
				break;
			}
			if (k % 4 == 2 && a[0].charAt(i + 2) != 0
					&& a[0].charAt(i + 1) == 0)
				re = AA[0] + re;
			if (a[0].charAt(i) != 0)
				re = AA[a[0].charAt(i)] + BB[k % 4] + re;
			k++;
		}
		if (a.length > 1) //加上小数部分(如果有小数部分) 
		{
			re += BB[6];
			for (var i = 0; i < a[1].length; i++){
				if(i == 0){
					re += AA[a[1].charAt(i)];
					re += "角";
				}else if(i == 1){
					re += AA[a[1].charAt(i)];
					re += "分";	
				}
			}
		}else if(num != ""){
			re+="元整";
		}
		if(num[0] == "0" && num[1] == "."){
			re = "零" + re;
		}
		return re;
	}
	// 遍历所有的条目价格，算出总价格
	// 奖金额转为中文
	// 算出抵用后的账户余额
	function setAll(){
		
		var ac = 0;
		var surplus = $("#user_surplus").val();
		$(".form-control").each(function(){
			if($(this).attr("id") == "refund_one" && $(this).val() != ""){
				ac = parseFloat(ac) + parseFloat($(this).val());
			}else if($(this).attr("id") == "refund_one" && $(this).val() == ""){
				ac += 0;
			}
		});
		if(ac != 0){
			$("#refund_total").val((ac.toFixed(2)));
			if(surplus == ""){
				$("#reduce_price").text("请填写预付款单位或个人");
			}else{
				var sum = parseFloat(surplus) - parseFloat(ac);
				if(sum.toFixed(2) < 0){
					alert("账户余额已不足");
				}
				$("#reduce_price").text("-" + ac.toFixed(2) + "=" + sum.toFixed(2));
				$("#pay_surplus").val(sum.toFixed(2));
			}
			var ab = ""+ac;
			$("#china_num").text(NoToChinese(ab));	
		}else{
			$("#refund_total").val("");
			$("#china_num").text("人民币（大写）");
		}
	}
	$(function() {
		$(".form-control1").click(function(){
			if($(this).attr("id") == "refund_one"){
				setAll();				
			}
		});
		//进入页面后焦点至 预付款单位或个人 输入框
		$("#user_code").focus();
		//进入页面时 或 点击取消自定义时间 后 执行
		printTime();
	});
	//输入"预付款单位或个人"中文或数字
	//转换为中文
	//在"账户余额"中显示此单位或个人的余额
	function return_num(){
		
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
		$("#user_form_code").val(codes);
		var surplus = $("#user_"+codes+"_surplus").val();
		var name = $("#user_"+codes).val();
		$("#user_code").val(name);
		$("#user_surplus").val(surplus);
	}
	//打印并保存
	function tijiao(){
		return_num();
		setAll();
		var order_in = "";
		var order_in_price = new Array();
		var ac = 0;
		var ab = 0;
		$(".refund_order_price").each(function(){
			if($(this).val() != ""){
				order_in_price.push($(this).val());
				ac+=1;
			}
		});
		var order_in_name = new Array();
		var bool = true;
		$(".refund_order_in").each(function(){
			if($(this).val() != "无"){
				order_in_name.push($(this).val());
				ab+=1;
			}
		});
		for(var i = 0;i < order_in_name.length;i++){
			order_in += (order_in_name[i] + ",1,1,1," + order_in_price[i] + ";");
		}
		$("#form_order_in").val(order_in);
		$("#form_refund_total").val($("#refund_total").val());
		if(($("user_code").val == "") || ($("#refund_total").val() == "") || ($("#pay_surplus").val() == "") || (ac != ab)){
			bool = false;
		}
		if(bool){
			if(window.confirm("确认填写")){
				formTime();
				$("#refund_prove_form").submit();
				return true;
			}else{
				return false;
			}
		}else{
			alert("请将凭证填写完整");
		}
	}

	function dayin(){
		var name = $("#user_code").val();
		var date;
       	var month;
		var year;
		var today = new Date();
		year = today.getFullYear();
		month = today.getMonth() + 1;
		date = today.getDate();
		var num = $("#refund_num").val();
		var order_in_name = new Array();
		$(".refund_order_in").each(function() {
			if ($(this).val() != "无") {
				order_in_name.push($(this).val());
			}
		});
		var order_in_price = new Array();
		$(".refund_order_price").each(function() {
			if ($(this).val() != "") {
				order_in_price.push($(this).val());
			}
		});
		var price = $("#refund_total").val();
		var china_price = $("#china_num").text();
		var operator = $("#operator_dayin").val();
		var surplus = $("#pay_surplus").val();
	}
	var isDIYTime = false;
		
		//自定义时间
		function diyTime(){
			isDIYTime = !isDIYTime;
			if(isDIYTime){
				password = prompt("请输入密码：","管理员密码");
		        if(password != "99889"){
		            alert("密码错误！");
		        }else{
		        	$("#diyTimeButton").text("取消自定义时间");
		        	$(".selectvalue").attr("disabled",false);
		        }
			}else{
				printTime();
				$("#diyTimeButton").text("自定义时间");
				$(".selectvalue").attr("disabled",true);
			}
		}
		//提交 form 时 执行此
		function formTime(){
			var time_year = $("#selectYear").val();
			var time_month = $("#selectMonth").val();
			var time_date = $("#selectDate").val();
			var time_hour = $("#selectHour").val();
			var time_minute = $("#selectMinute").val();
			var time_second = $("#selectSecond").val();
			if(time_month.length == 1){
				time_month = "0"+time_month;
			}if(time_date.length == 1){
				time_date = "0"+time_date;
			}if(time_hour.length == 1){
				time_hour = "0"+time_hour;
			}if(time_minute.length == 1){
				time_minute = "0"+time_minute;
			}if(time_second.length == 1){
				time_second = "0"+time_second;
			}
			var ok_time = time_year+"-"+time_month+"-"+time_date+" "+time_hour+":"+time_minute+":"+time_second;
	        $("#addpay_time").val(ok_time);
			$("#pay_time").val(ok_time);
		}
		function printTime(){
			var date;
	        var month;
	        var year;
	        var today = new Date();
	        year = today.getFullYear();
	        month = today.getMonth() + 1;
	        month+="";
	        date = today.getDate()+"";
       		hour = today.getHours()+"";
			minute = today.getMinutes()+"";
			second = today.getSeconds()+"";
			$("#select_year0").text(year-1);
			$("#select_year1").text(year);
			$("#select_year2").text(year+1);
			$("#select_year3").text(year+2);
			$("#date_"+date).attr("selected",true);
			$("#month_"+month).attr("selected",true);
			$("#hour_"+hour).attr("selected",true);
			$("#minute_"+minute).attr("selected",true);
			$("#second_"+second).attr("selected",true);
		}
</script>
  </head>
  <body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto">
  <nav class="navbar navbar-default" style="margin-top:2%;height:auto">
  <div class="container-fluid" style="height:auto">
        <div class="main" style="height:auto">
          <h2 class="sub-header">预付款抵用（退款）凭证</h2>
          <div class="table-responsive">
            <form id="refund_prove_form" action="<c:url value='Add_Refund_Prove_Servlet?method=add'/>" method="post">
			  <div class="form-group">
			  	<label for="exampleInputEmail1">
			  		编号:${refund_num}
			  	</label>
			  	<input type="hidden" value="${refund_num}" id="refund_num">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputEmail1">预付款单位或个人</label>
			     <div class="input-group" style="width:30%">
			    	<input name="refund_form_name" class="form-control" id="user_code" placeholder="预付款单位或个人代码">
			    	<input name="refund_form_code" type="hidden" id="user_form_code">
			    	<span class="input-group-btn">
	        			<button id="return_button" onclick="return_num();" class="btn btn-default" style="font-weight:bolder" type="button"><</button>
	      			</span>
			     </div>
			  </div>
			  <div class="form-group">
				   <select id="select" class="form-control refund_order_in" style="width:20%;display:inline">
				   	  <option>无</option>
				   	  <c:forEach var="bill" items="${list_bill}">
				   	  	<option>${bill.name}</option>
				   	  </c:forEach>
				  </select>
				  <input class="form-control refund_order_price" id="refund_one" placeholder="数字格式" style="display:inline;width:20%">
				   <select id="select" class="form-control refund_order_in" style="width:20%;display:inline">
				      <option>无</option>
					  <c:forEach var="bill" items="${list_bill}">
				   	  	<option>${bill.name}</option>
				   	  </c:forEach>
				  </select>
				  <input class="form-control refund_order_price" id="refund_one" placeholder="数字格式" style="display:inline;width:20%">
				   <select id="select" class="form-control refund_order_in" style="width:20%;display:inline">
				      <option>无</option>
					  <c:forEach var="bill" items="${list_bill}">
				   	  	<option>${bill.name}</option>
				   	  </c:forEach>>
				  </select>
				  <input class="form-control refund_order_price" id="refund_one" placeholder="数字格式" style="display:inline;width:20%">
				  <select id="select" class="form-control refund_order_in" style="width:20%;display:inline">
				      <option>无</option>
					  <c:forEach var="bill" items="${list_bill}">
				   	  	<option>${bill.name}</option>
				   	  </c:forEach>
				  </select>
				  <input class="form-control refund_order_price" id="refund_one" placeholder="数字格式" style="display:inline;width:20%">
			  </div>
			  <div class="form-group">
			  	<div class="input-group" style="50%">
			  		<input type="button" id="refund_one" onClick="setAll();" value="合计" class="btn btn-default form-control1">
			  	</div>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">抵用（退还）金额</label>
			    <div class="input-group" style="width:50%">
		    		<div class="input-group-addon" >￥</div>
		       		<input class="form-control" id="refund_total" placeholder="请输入数字格式" disabled>
		       		<input type="hidden" name="refund_form_refund_total" id="form_refund_total">
		       		<div class="input-group-addon" id="china_num">人民币（大写）</div>
			    </div>
			  </div>
			  <div class="form-group" style="width:50%">
			   		<label for="exampleInputPassword1">账户余额</label>
			   	 <div class="input-group">
			   		<div class="input-group-addon" >￥</div>
			   			<input class="form-control" id="user_surplus" placeholder="账户余额" disabled>
			   			<input type="hidden" name="refund_form_order_in" id="form_order_in">
			   		<div class="input-group-addon" id="reduce_price">抵后余额</div>
			   		<input type="hidden" name="refund_form_surplus" id="pay_surplus">
			   	 </div>
			   	 </div>
			   	 <div class="form-group">
					<label for="recipient-name" class="control-label" id="label_address">时间：</label>
					<br/>
					<select id="selectYear" class="selectvalue form-control" style="width:20%;display:inline" disabled>
		   	  			<option id="select_year0"></option>
		   	  			<option id="select_year1" selected></option>
		   	  			<option id="select_year2"></option>
		   	  			<option id="select_year3"></option>
		  			</select>年
		  			<select id="selectMonth" class="selectvalue form-control" style="width:10%;display:inline" disabled>
		   	  			<c:forEach var="month"  begin="1" end="12">
					   	  	<option id="month_${month}">${month}</option>
					   	</c:forEach>
		  			</select>月
		  			<select id="selectDate" class="selectvalue form-control" style="width:10%;display:inline" disabled>
		   	  			<c:forEach var="date"  begin="1" end="31">
					   	  	<option id="date_${date}">${date}</option>
					   	</c:forEach>
		  			</select>日
		  			<select id="selectHour" class="selectvalue form-control" style="width:10%;display:inline" disabled>
	  				    <c:forEach var="hour"  begin="0" end="23">
				   	  	   <option id="hour_${hour}">${hour}</option>
				   	    </c:forEach>
		  			</select>时
		  			<select id="selectMinute" class="selectvalue form-control" style="width:10%;display:inline" disabled>
	  				    <c:forEach var="minute"  begin="0" end="59">
				   	  	   <option id="minute_${minute}">${minute}</option>
				   	    </c:forEach>
		  			</select>分
		  			<select id="selectSecond" class="selectvalue form-control" style="width:10%;display:inline" disabled>
	  				    <c:forEach var="second"  begin="0" end="59">
				   	  	   <option id="second_${second}">${second}</option>
				   	    </c:forEach>
		  			</select>秒
		  			<button id="diyTimeButton" type="button" class="btn btn-primary btn-danger" onclick="diyTime();">自定义时间</button>
				<input type="hidden" name="pay_form_time" id="pay_time">
			   </div>
			   	 <div class="form-group">
					<label for="exampleInputPassword1">经办人:${sessionScope.username}</label>
					<input type="hidden" value="${sessionScope.username}" name="form_operator" id="operator_dayin">
			   </div>
			  
			  <button type="button" class="btn btn-default" onclick="viewToExcel();">打印并保存</button>
			  <button type="button" class="btn btn-default" onclick="tijiao();">仅保存</button>
			</form>
          </div>
        </div>
      </div>
    </div>
	</nav>
	<div hidden>
    <c:forEach var="a" items="${list_user}">
    	<input type="hidden" style="display:none" class="users" id="user_${a.code}" value="${a.name}">
    	<input type="hidden" style="display:none" class="users_surplus" id="user_${a.code}_surplus" value="${a.surplus}">
    </c:forEach>
    </div>
  </body>
</html>