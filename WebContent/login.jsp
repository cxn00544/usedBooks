<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.pojo.*,java.util.*"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户登录</title>
<script language ="JavaScript">
function loginSubmit(){
   if(form.userName.value ==null || form.userName.value==""){
      alert("请填写账号!");
      return false;
   }
   if(form.userPassword.value ==null || form.userPassword.value==""){
      alert("请填写密码!");
      return false;
   }
      return true;
}
</script>
</head>
<body> 
    <div class="container right-panel-active">
        <!-- 注册 -->
        <div class="container_form container--signup">
  
  <form class="form"  action="userlogin"  method="post" name="form" id="form">

        <h1 id="loginMsg" class="form_title">用户登录</h1>
      
   <input id="userId" name="userName" placeholder="用户名" class="input" type="text" >
<input id="userPassword" class="input" name="userPassword" placeholder="密码" type="password" >
          <input type="submit" class="btn"  value="登录" name="submit" onclick="return loginSubmit();">    
          <a href="adminLogin.jsp" class="btn">管理员登录</a>
     
    </form>
</div>
      <div class="container_overlay">
                <div class="overlay">
                    
                 <div class="overlay_panel overlay--left">
              
                        <a href="zc.jsp" class="btn" id="zhuce">注册</a>
                    </div>
              
                </div>
            </div>
            </div>
 <c:if test="${loginMsg!=null}">
    <script type="text/javascript">alert("${loginMsg}")</script>
    <c:remove var="loginMsg"/>
</c:if>
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
