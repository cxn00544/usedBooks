
 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>用户注册</title>
   <script language ="JavaScript">   
   function zcSubmit(){
	    var email = document.getElementById("email").value; 
	    var telephone = document.getElementById("telephone").value;
	    var userName = document.getElementById("userName").value;
	    var password = document.getElementById("password").value;
	    const isMatched = validatePassword();
	    if (isMatched) {
	     
	    } else {
	      // 两次输入的密码不一致，中止操作
	         alert("两次密码输入不一致！");
	    	 return false;
	    }
	    
	    if (validateName(userName)) {
	   	 
	      } else {
	        alert("请输入有效的用户名！");
	        return false;
	      }
	     
	    if (validatePwd(password)) {
		    
	    } else {
	      alert("请输入有效的密码！");
	      return false;
	    }    
if(form1.sex.value ==null || form1.sex.value==""){
		      alert("请选择性别!");
		      return false;
		   }	   	     
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
   
   function validatePwd(password) {
	      var rr = /^[0-9]{6}$/;
	      return rr.test(password);
	    }

   function validateName(userName) {
	      var r = /^[a-zA-Z0-9]{1,6}$/;
	      return r.test(userName);
	    }
       
   function validatePassword() {
	   const  pw1 = document.getElementById("repassword").value;
	   const  pw2 = document.getElementById("password").value;
	   
       if(pw2 == pw1) {	
        
     return true;
                 }
       else{
  
    	   alert("两次密码输入不一致！");
       	return false;
       }
   
   }
</script>   

  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

  </head>
<body>

    <div class="container right-panel-active">
        <!-- 注册 -->
        <div class="container_form container--signup">
  
  <form class="form"  action="personaladd"  method="post" name="form1" >

             <h2 >注册</h2>

	<input type="hidden" name="check" id="check"  value="1"/>
	                <p><label for="sex">性别：</label>
<input type="radio" name="sex" value="男" >男
<input type="radio" name="sex" value="女" >女</p>
                <input type="text" placeholder="请输入用户名" name="userName" size="35" class="input" id="userName" required="required" required oninvalid="setCustomValidity('请输入您的用户名，不要超过6位');" oninput="setCustomValidity('');"  >

                <input  class="input" placeholder="请输入邮箱" type="text" name="email" size="35" required="required" id="email" required oninvalid="setCustomValidity('请输入您的电子邮箱');" oninput="setCustomValidity('');" >
                <input  class="input" type="password" name="userPassword" size="35" placeholder="请输入密码" id="password" required="required" required oninvalid="setCustomValidity('请输入您的密码');" oninput="setCustomValidity('');">
                <input class="input" type="password" name="userPassword2"  placeholder="请再次输入密码" size="35" id="repassword" >
                <input class="input" type="text" id="telephone" placeholder="请输入联系号码" name="telephone" size="35" >
           
                <input  type="hidden" name="check" id="check"  value="1"/>	
 
                    <input type="submit" class="btn" value="提交" name="submit" onclick="return zcSubmit()"  >
                        <input type="reset" class="btn" value="重置" name="reset">


     
    </form>
</div>
      <div class="container_overlay">
                <div class="overlay">
                    
                 <div class="overlay_panel overlay--left">
              
                        <a href="login.jsp" class="btn" id="zhuce">登录</a>
                    </div>
              
                </div>
            </div>
            </div>

</body>
</html>
<style >
:root {
	/* 颜色 */
	--white:#e9e9e9;
	--gray:#333;
	--blue:#095c91;
	--blue-r:#315a7491;
	--lightblue:#0393a3;
	/* 圆角 */
	--button-radius:0.7rem;
	/* 大小 */
	--max-width:650px;
	--max-height:700px;
	font-size:16px;
	font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Oxygen,Ubuntu,Cantarell,"Open Sans","Helvetica Neue",sans-serif;
}
body {
	align-items:center;
	background-color:var(--white);
	background-attachment:fixed;
	background-position:center;
	background-repeat:no-repeat;
	background-size:cover;
	display:grid;
	height:100vh;
	place-items:center;
}
.form_title {
	font-weight:300;
	margin:0;
	margin-bottom:1.25rem;
	color: #000000;
	font-weight: 600;
}
.link {
	text-decoration:none;
	color:var(--gray);
	font-size:0.9rem;
	margin:1.5rem 0;
	text-decoration:none;
}
.container {
	background-color:black;
	border-radius:var(--button-radius);
	box-shadow:0 0.9rem 1.7rem rgba(0,0,0,0.25),0 0.7rem 0.7rem rgba(0,0,0,0.22);
	height:var(--max-height);
	max-width:var(--max-width);
	overflow:hidden;
	position:relative;
	width:100%;
}
.container_form {
	height:100%;
	position:absolute;
	top:0;
	transition:all 0.6s ease-in-out;
}
.container--signin {
	left:0;
	width:50%;
	z-index:5;
}
.container.right-panel-active .container--signin {
	transform:translateX(100%);
}
.container--signup {
	left:0;
	opacity:0;
	width:50%;
	z-index:4;
}
.container.right-panel-active .container--signup {
	-webkit-animation:show 0.6s;
	animation:show 0.6s;
	opacity:1;
	transform:translateX(100%);
	z-index:8;
}
.container_overlay {
	height:100%;
	left:50%;
	overflow:hidden;
	position:absolute;
	top:0;
	transition:transform 0.6s ease-in-out;
	width:50%;
	z-index:100;
}
.container.right-panel-active .container_overlay {
	transform:translateX(-100%);
}
.overlay {
	background-color:#ffffff;
	background-attachment:fixed;
	background-position:center;
	background-repeat:no-repeat;
	background-size:cover;
	height:100%;
	left:-100%;
	position:relative;
	transform:translateX(0);
	transition:transform 0.6s ease-in-out;
	width:200%;
}
.container.right-panel-active .overlay {
	transform:translateX(50%);
}
.overlay_panel {
	align-items:center;
	display:flex;
	flex-direction:column;
	height:100%;
	justify-content:center;
	position:absolute;
	text-align:center;
	top:0;
	transform:translateX(0);
	transition:transform 0.6s ease-in-out;
	width:50%;
	
}
.overlay--left {
	transform:translateX(-20%);
	
}
.container.right-panel-active .overlay--left {
	transform:translateX(0);
}
.overlay--right {
	right:0;
	transform:translateX(0);
}
.container.right-panel-active .overlay--right {
	transform:translateX(20%);
}
.btn {
	text-decoration:none;
	/* background-color:var(--blue); */
	/* background-image:linear-gradient(90deg,var(--blue) 0%,var(--lightblue) 74%); */
	background-color: #ffffff;
	background-image:none; 
	border-radius:20px;
	border:0.2px solid var(--blue-r);
	color:rgb(0, 0, 0);
	cursor:pointer;
	font-size:0.8rem;
	font-weight:bold;
	letter-spacing:0.1rem;
	padding:0.5rem 2rem;
	text-transform:uppercase;
	transition:transform 80ms ease-in;
	display: inline-block;
  margin: 0 10px; /* 可选：设置按钮之间的间距 */
}
.form > .btn {
	margin-top:1.5rem;
}
.btn:active {
	transform:scale(0.95);
}
.btn:focus {
	outline:none;
}
.form {
background-color: #ffffff;
	display:flex;
	align-items:center;
	justify-content:center;
	flex-direction:column;
	padding:0 3rem;
	height:100%;
	text-align:center;
}
.input {
	background-color:#fff;
	border-style: solid;
	border-radius: 0.7rem;
	/* border:none; */
	border-color: rgb(168, 160, 160);
	padding:0.9rem 0.9rem;
	margin:0.5rem 0;
	width:100%;
}



</style>
