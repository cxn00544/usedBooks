<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  errorPage="error.jsp"%>
<%@ page import="com.pojo.*, java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>修改出售图书信息</title>
    <link rel="stylesheet" href="css/ncss_style.css" type="text/css" />
    <script type="text/javascript" language="javascript">
    function checkTBuyBook() {
    	  // 获取表单元素
    	  var bookIdInput = document.form1.bookId;
    	  var isbnInput = document.form1.isbn;
    	  var priceInput = document.form1.price;
    	  var introductionInput = document.form1.introduction;

    	  // 如果出售编号、ISBN 和图书介绍均为空，则提示用户输入
    	  if (bookIdInput.value.trim() === "" || isbnInput.value.trim() === "" || introductionInput.value.trim() === "") {
    	    alert("出售编号、ISBN 和图书介绍不能为空！");
    	    return false;
    	  }

    	  // 验证价格是否为两位小数的数字
    	  var pricePattern = /^\d+(\.\d{1,2})?$/;
    	  if (!pricePattern.test(priceInput.value)) {
    	    alert("请输入正确的价格，格式为数字且最多有两位小数！");
    	    priceInput.focus();
    	    return false;
    	  }

    	  // 如果验证通过，则返回 true
    	  return true;
    	}
    </script>
</head>
<body>
	<div>
			<jsp:include page="header2.jsp" />
	</div>

<c:set var="tbook" value="${requestScope.tbook}" />

<br /></br>
<br /></br>
<br></br>
<div class="form-div">

<form method="post" name="form1" action="<c:url value='/doUpdateSellBook?userId=${user.userId}'/>" onsubmit="javascript: return checkTBuyBook(); ">
    <table>
        <tr>
        	<input type="hidden" name="userId" value="${user.userId}" />
            <td>出售编号:</td>
            <td><input type="text" name="bookId" size="35" value="${sellBook.bookId}" readonly/></td>
        </tr>
        <tr>
            <td>ISBN:</td>
            <td><input type="text" name="isbn" size="35" value="${sellBook.isbn}" readonly/></td>
            <%--   未整合前默认给同一个用户执行添加操作     --%>
            <input type="hidden" name="userId" value="20001">
        </tr>
        <tr>
            <td>图书价格:</td>
            <td><input type="text" name="price" size="35" value="${sellBook.price}"/></td>
        </tr>


        <tr>
            <td>图书介绍:</td>
        
     <td><textarea style="resize:none" type="text" name="introduction" cols="25" rows="9" >${sellBook.introduction}</textarea></td>
        </tr>

        <tr>
            <td><input type="submit" value="提交" name="submit" /></td>
            <td><input type="reset" value="重置" name="reset"/></td>
        </tr>
    </table>
</form>
	</div>
</body>
</html>
<style>* {
    margin: 0;
    padding: 0;
    list-style-type: none;
}
.reg-content{
    padding: 30px;
    margin: 3px;
}
a, img {
    border: 0;
}

body {
    background-image: url("") ;
    text-align: center;
}

table {
    border-collapse: collapse;
    border-spacing: 0;
}
   input[type="text"], textarea {
        width: 100%;
        margin-bottom: 10px;
        padding: 10px;
        border-radius: 8px;
        box-shadow: inset 0 2px 5px #eee;
        border: 1px solid #D4D4D4;
        color: #333333;
        font-size: 16px;
        resize: none;
    }
        textarea {
    width: 100%;
    margin-bottom: 10px;
    padding: 10px;
    border-radius: 8px;
    box-shadow: inset 0 2px 5px #eee;
    border: 1px solid #D4D4D4;
    color: #333333;
    font-size: 16px;
    resize: none;
    text-indent: 0; /* 取消首行缩进 */
    text-align: left; /* 始终左对齐，避免出现不必要的对齐问题 */
}
    

td, th {
    padding: 0;
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
    background-color: #3c6db0;
    text-align: center;
    border-radius: 5px;
    overflow: hidden;
    min-width: 80px;
    border: none;
    color: #FFF;
    box-shadow: 1px 1px 1px rgba(75, 75, 75, 0.3);
}

input[type="button"]:hover, input[type="submit"]:hover {
    background-color: #5a88c8;
}

input[type="button"]:active, input[type="submit"]:active {
    background-color: #5a88c8;
}
.err_msg{
    color: red;
    padding-right: 170px;
}
#password_err,#tel_err{
    padding-right: 195px;
}

#reg_btn{
    margin-right:50px; width: 285px; height: 45px; margin-top:20px;
}

#checkCode{
    width: 100px;
}

#changeImg{
    color: aqua;
}</style>
