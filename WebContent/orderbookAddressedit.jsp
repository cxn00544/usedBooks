<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pojo.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>修改地址信息</title>
<link rel="stylesheet"
	href="<c:url value="/css/bootstrap.css"/>">
<link rel="stylesheet" href="css/ncss_style.css" type="text/css" />
<script type="text/javascript" language="javascript">
function addAddress(){
	var name = form1.name.value;
	if ((name==null)||(name=="")){
		alert("请填写用户姓名！");
		return false;		
	}
	var phoneNum = form1.phoneNum.value;
	if ((phoneNum==null)||(phoneNum=="")){
		alert("请填写收货人联系方式！");
		return false;		
	}
	var address = form1.address.value;
	if ((address==null)||(address=="")){
		alert("请填写收货地址！");
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
</head>
<body>

<div class="big_div">
<div class="change_address">修改收货地址</div>
<div class="edit_address">编辑收货地址</div>

<form method="post" name="form1" action="${pageContext.request.contextPath}/orderbookAddressedit" onsubmit="javascript: return addAddress();">
  
  
  <table>
    <tr>
      <input type="hidden" name="userId" value="${orderbook1.userId}">
  	<input type="hidden" name="orderId" value="${orderbook1.orderId}">
      <td>收货人姓名:</td>
      <td><input type="text" name="name" size="35" value="${ orderbook1.getName()}"/></td>
    </tr>
    <tr>
      <td>收货人联系方式:</td>
      <td><input type="text" name="phoneNum" size="35" value="${ orderbook1.getPhoneNum()}"/></td>
    </tr>
    <tr>
       <td>地&nbsp;&nbsp;址&nbsp;&nbsp;信&nbsp;&nbsp;息&nbsp;&nbsp;:</td>
      <td><input type="text" name="address" size="35" value="${ orderbook1.getAddress()}"/></td>
    </tr>
     <tr>
     <td>详&nbsp;&nbsp;细&nbsp;&nbsp;地&nbsp;&nbsp;址&nbsp;&nbsp;:</td>
      <td> <textarea rows="2" cols="34" placeholder="请输入详细地址信息，如道路、门牌号、小区、楼栋号、单元等信息" name="detail"value="${ orderbook1.getDetail()}" ></textarea></td>
    </tr>
    
    <tr>
          <input type="hidden" name="orderId" value="${ orderbook1.orderId }" />	
     <td><input type="submit" value="提交" name="submit" class="btn_ok" /></td>
      <td><input type="reset" value="重置" name="reset" class="reset_btn"/></td>
    </tr>
  </table>
</form>
</div>
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
.btn_ok{
	    border-style: solid;
    background-color: #5584ff;
    border-color: transparent;
    color:white;
    border-radius: 3px;
}
textarea{
border-radius: 8px;
    box-shadow: inset 0 2px 5px #eee;
    padding: 10px;
    border: 1px solid #D4D4D4;
    color: #333333;
    margin-top: 5px;
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
    height: 80px;
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
	width:100%;
	height:100%;
 
    z-index: 1001;
    background: #fff;

 
    text-align: left;
    overflow: hidden;
    animation-duration: .3s;
    animation-timing-function: ease-in-out;
    
  
  
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
    font-size: 16px!important;
    line-height: 2.428571!important;
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

</body>
</html>
