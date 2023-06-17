<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ page import="java.util.*,com.pojo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加地址</title>

<script type="text/javascript" language="javascript">
	function addAddress(){
		 var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;; //手机号码的格式：第一位只能为1，第二位可以是3，4，5，7，8，第三位到第十一位可以为0-9中任意一个数字
		 var date = new Date();
		var name = form1.name.value;
		if ((name==null)||(name=="")){
			alert("请填写收货人姓名！");
			return false;		
		}
		var phoneNum = form1.phoneNum.value;
		if ((!myreg.test(phoneNum))){
		
			alert("请输入正确的电话号码格式");
			
			return false;		
		}
		
		var address = form1.address.value;
		
		if ((address==null)||(address=="")){
			alert("请填写收货人地址！");
			return false;		
		}
		var detail = form1.detail.value;
		if ((detail==null)||(detail=="")){
			alert("请填写详细的收货地址！");
			return false;		
		}
		return true;
		
	
	}
	 
</script>
<link rel="stylesheet"
	href="<c:url value="/css/bootstrap.css"/>">
</head>
<body>
<div class="big_div">
<div class="change_address">新增收货地址</div>
<div class="edit_address">编辑收货地址</div>
<form method="post" name="form1" action="${pageContext.request.contextPath}/addone?userId=${user.userId}" onsubmit="javascript: return addAddress();">
  <table>
    <tr>
  <%-- 	<td><input type="hidden" name="userId" value="${user.userId}"></td> --%>
  	<input type="hidden" name="userId" value="${user.userId}">
      <td>收货人姓名:</td>
      <td><input type="text" name="name" size="35" value="" placeholder="请输入用户名"/></td>
    </tr>
    <tr>
      <td>收货人联系方式:</td>
      <td><input type="text" name="phoneNum" size="35" value="" placeholder="请输入有效的电话号码"/></td>
    </tr>

    <tr>
      <td>地&nbsp;&nbsp;址&nbsp;&nbsp;信&nbsp;&nbsp;息&nbsp;&nbsp;:</td>
      <td><input type="text" name="address" size="35" value="" placeholder="请输入省/市/区/街道"/></td>
    </tr>
    <tr>
      <td>详&nbsp;&nbsp;细&nbsp;&nbsp;地&nbsp;&nbsp;址&nbsp;&nbsp;:</td>
      <td>
    <textarea rows="2" cols="34" placeholder="请输入详细地址信息，如道路、门牌号、小区、楼栋号、单元等信息" name="detail"></textarea>
	</td>
    </tr>
      <tr>
       <input type="hidden" name="method" value="date" />
      
    </tr>
    <tr class="btn_tijiao">
     <input type="hidden" name="method" value="addOrderBook" />	
      <td><input type="submit" value="提交" name="submit" class="btn_ok" /></td>
      <td><input type="reset" value="重置" name="reset" class="reset_btn"/></td>
    </tr>
   
  </table> 
</form>
</div>
<br>

</body>


<style>

 
 * {
    margin: 0;
    padding: 0;
    list-style-type: none;
}


body {
    background-image: url("") ;
    text-align: center;
   
}
.btn_tijiao{

margin-top:50px;
}
.btn_ok{
	    border-style: solid;
    background-color: #5584ff;
    border-color: transparent;
    color:white;
    border-radius: 3px;
}

.reset_btn{
    border-style: solid;
    color: #5584ff;
    background-color: #white;
    border-radius: 3px;
	border:1px solid #5584ff;
	padding: 7px 15px;
}
.edit_address{
display: inline-block;
    width: 50%;
    height: 26px;
    line-height: 26px;
    text-align: center;
    margin-right: 5px;
    color: #ff5000;
}
form{
	width:50%;
	height:50%;
	margin:0 auto;
	margin-top:30px;
}
.change_address{
	padding: 12px 20px;
    border-bottom: 0 solid transparent;
    font-size: 16px;
    background: transparent;
    color: #333;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
.big_div{
	
    position: relative;
    z-index: 1001;
    background: #fff;
    border-radius: 3px;
 
    text-align: left;
    overflow: hidden;
    animation-duration: .3s;
    animation-timing-function: ease-in-out;
    
  left: 50%;
  transform: translate(-50%, 10%);
  
}

td, th {
    padding-left:20px;
    height: 70px;

}
.inputs{
    vertical-align: top;
}

.clear {
    clear: both;
}

.clear:before, .clear:after {
    content: "";
    display: table;
}

.clear:after {
    clear: both;
}

.form-div {
    background-color: rgba(255, 255, 255, 0.27);
    border-radius: 10px;
    border: 1px solid #aaa;
    width: 550px;
 
  margin: 0 auto; /* 左右外边距设置为 auto，使表单水平居中 */
    padding: 30px 0 20px 0px;
    font-size: 16px;
    box-shadow: inset 0px 0px 10px rgba(255, 255, 255, 0.5), 0px 0px 15px rgba(75, 75, 75, 0.3);
    text-align: left;
}

.form-div input[type="text"], .form-div input[type="password"], .form-div input[type="email"] {
    width: 268px;
    margin: 10px;
    line-height: 20px;
    font-size: 16px;
}
textarea{
border-radius: 8px;
    box-shadow: inset 0 2px 5px #eee;
    padding: 10px;
    border: 1px solid #D4D4D4;
    color: #333333;
    margin-top: 5px;
}


.form-div input[type="checkbox"] {
    margin: 20px 0 20px 10px;
}

.form-div input[type="button"], .form-div input[type="submit"] {
    margin: 10px 20px 0 0;
}

.form-div table {
    margin: 0 auto;
    text-align: right;
    color: rgba(64, 64, 64, 1.00);
}

.form-div table img {
    vertical-align: middle;
    margin: 0 0 5px 0;
}

.footer {
    color: rgba(64, 64, 64, 1.00);
    font-size: 12px;
    margin-top: 30px;
}

.form-div .buttons {
    float: right;
}

input[type="text"], input[type="password"], input[type="email"] {
    border-radius: 8px;
    box-shadow: inset 0 2px 5px #eee;
    padding: 10px;
    border: 1px solid #D4D4D4;
    color: #333333;
    margin-top: 5px;
}

input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus {
    border: 1px solid #50afeb;
    outline: none;
}

input[type="button"], input[type="submit"] {
    padding: 7px 15px;
    border：1px solid blue;
   margin-left:60px;
   }
   .tijiao_btn{
   	margin-left:30px;
   }
   input[type="reset"]{
   
   margin-left:250px;
   }
</style>
</style>

</html>