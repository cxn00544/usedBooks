<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  errorPage="error.jsp"%>
<%@ page import="com.pojo.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>出售商品添加界面</title>
    <link rel="stylesheet" href="css/ncss_style.css" type="text/css" />
    <script type="text/javascript" language="javascript">
        function checkSellBook(){
            var isbn = form2.isbn.value;
            if ((isbn==null)||(isbn=="")){
                alert("请填写ISBN！");
                return false;
            }
            var price = form2.price.value;
            if ((price==null)||(price=="")){
                alert("请填写预购金额！");
                return false;
            }
            var introduction = form2.introduction.value;
            if ((introduction==null)||(introduction=="")){
                alert("请填写图书介绍！");
                return false;
            }
            
    	    var price = document.getElementById("price").value;  	   
  	      
    	    if (validateprice(price)) {
    	    	    
    	    	      } else {
    	    	        alert("请输入有效的价格！");
    	    	        return false;
    	    	      }

            return true;
        }

        function validateprice(price) {
     	   var phoneRegex = /^\d+(\.\d{1,2})?$/;
     	   return phoneRegex.test(price);
     	 }
             
    </script>
</head>
<body>
<br>
<br>
<div class="wrapper">
<form method="post" name="form2" action="<c:url value='/doAddSellBook?userId=${user.userId}'/>" onsubmit="javascript: return checkSellBook();">
    <table>
<h2 style="text-align: center;">添加出售商品</h2>

        <tr>
            <td>ISBN:</td>
            <td><input type="text" name="isbn" size="35" value=""/></td>
            <%--   未整合前默认给同一个用户执行添加操作     --%>
            <input type="hidden" name="userId" value="20001">
        </tr>
        <tr>
            <td>图书价格:</td>
            <td><input type="text" name="price" size="35" value="" id="price"/></td>
        </tr>
	<input type="hidden" name="userId" value="${user.userId}" />
        <tr>
            <td>图书介绍:</td>
            <td><textarea name="introduction" cols="30" rows="10"></textarea></td>
        </tr>

        <tr>
            <td><input type="submit" value="提交" name="submit" onclick="return checkSellBook();"/></td>
            <td><input type="reset" value="重置" name="reset"/></td>
        </tr>
    </table>
</form>
 	</div>

</body>
</html>
<style>
  body {
        background-image: url("");
        text-align: center;
        
    }

.wrapper {
    display: flex;
    justify-content: center;
    align-items: flex-start; /* 或者 align-items: flex-end; */
    min-height: 100vh;
}
    
    form {
        width: 100%;
        max-width: 800px;
        margin: 50px;
        padding: 30px;
        background-color: rgba(255, 255, 255, 0.27);
        border-radius: 10px;
        border: 1px solid #aaa;
        box-shadow: inset 0px 0px 10px rgba(255, 255, 255, 0.5), 0px 0px 15px rgba(75, 75, 75, 0.3);
        text-align: left;
    }

    table {
        border-collapse: collapse;
        border-spacing: 0;
        width: 100%;
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

    input[type="submit"], input[type="reset"] {
        padding: 7px 15px;
        background-color: #3c6db0;
        text-align: center;
        border-radius: 5px;
        overflow: hidden;
        min-width: 80px;
        border: none;
        color: #FFF;
        box-shadow: 1px 1px 1px rgba(75, 75, 75, 0.3);
        margin-right: 10px;
    }

    input[type="submit"]:hover, input[type="reset"]:hover {
        background-color: #5a88c8;
    }

    input[type="submit"]:active, input[type="reset"]:active {
        background-color: #5a88c8;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-size: 16px;
    }

    .err_msg{
        color: red;
        padding-right: 170px;
    }

    .footer {
        color: rgba(64, 64, 64, 1.00);
        font-size: 12px;
        margin-top: 30px;
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

</style>