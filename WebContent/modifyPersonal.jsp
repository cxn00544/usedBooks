<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.pojo.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>个人信息修改页面</title>
    <script language ="JavaScript">   
   function addsSubmit(){
	    var email = document.getElementById("email").value; 
	    var telephone = document.getElementById("telephone").value;
	     
	     	     
if (validateEmail(email)) {
	 
	      } else {
	        alert("请输入有效的邮箱！");
	        return false;
	      }
	     
	      
 if (validatemobile(telephone)) {
	    
	      } else {
	        alert("请输入有效的电话号码！");
	        return false;
	      }

 
   }
   function validateEmail(email) {
	      var re = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	      return re.test(email);
	    }
   function validatemobile(telephone) {
	   var phoneRegex = /^1\d{10}$/;
	   return phoneRegex.test(telephone);
	 }

</script>   
    
  </head>
<body>


<br /></br>
<br /></br>
<br></br>
<div class="form-div">

	<form method="post" name="form1" action="updatepersonal" >	
	<table>

<tr><td>用户名:</td><td><input type="text"  name="userName" size="35" value="${personal1.getUserName()}" readonly/></td></tr>
	<tr><td>联系方式</td><td><input type="text" id="telephone" name="telephone" size="35" value="${personal1.getTelephone()}"/></td></tr>
	<tr><td>电子邮箱:</td><td><input type="text" id="email" name="email" size="35" value="${personal1.getEmail()}"/></td></tr>

	<tr><td><input type="hidden" name="method"  />
		<input type="hidden" name="userId" value="${ personal1.userId}" />
			<input type="submit" value="提交" name="submit" onclick="return addsSubmit();"/></td>
		<td> <input type="reset" value="重置" name="reset"/>	
			</td></tr>
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