<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>头部</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comment.css">
		
		 <link rel="stylesheet" href="./css/index.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" ></script>
			<script src="./js/jquery-3.6.0.js" ></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" ></script>
		 <link rel="stylesheet" href="./js/swiper-bundle.min.css">
    	<script src="./js/swiper-bundle.min.js"></script>
<script>


window.addEventListener('load',function(){
    var  mySwiper=new Swiper('.swiper',{
        loop:true,
        pagination:{
            el:'.swiper-pagination',
        },
        autoplay:{
            delay:1000,
         
        }
    })
    var tanchuang = document.querySelector('.tanchuang')
    var xiazai = document.querySelector('.xiazai')
   var timer=setInterval(()=>{
       tanchuang.style.display='block';
   },2000);
   
   xiazai.onclick=(function(){
       tanchuang.style.display='';
       clearInterval(timer)
   })
})


</script>
</head>
<body>
		<!-- 导航栏 -->
					<nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 100%;border-radius: 10px 10px 0 0;">
			 
			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			    
			    	<div class="navbar-header">
					<span class="logo"></span>
					<a class="navbar-brand" href="#" style="font-size: 25px">校园二手交易平台</a>
					</div>
					
			    <ul class="navbar-nav mr-auto">
			       <li class="nav-item active">
			        <a class="nav-link" href="toIndex">首页<span class="sr-only">(current)</span></a>
			      </li>
			       <li class="nav-item active">
			        <a class="nav-link" href="doShowAllTBuyBookByUserId?userId=${user.userId}">我的求购<span class="sr-only">(current)</span></a>
			      </li>
			     
 
			      <li class="nav-item active">
			        <a class="nav-link" href="doShowAllSellBook?userId=${user.userId}">我的出售<span class="sr-only">(current)</span></a>
			      </li>
			      <li class="nav-item active">
			        <a class="nav-link" href="tbuybook"> 全部求购<span class="sr-only">(current)</span></a>
			      </li>
			       <li class="nav-item active">
			        <a class="nav-link" href="CollectDetailByUserId?userId=${user.userId}"> 收藏夹<span class="sr-only">(current)</span></a>
			      </li>
			        <li class="nav-item active">
			       
			        <a class="nav-link" href="selectOrderByUserId?userId=${user.userId}"> 我的订单<span class="sr-only">(current)</span></a>
			       		
			      </li>
			       <%--  <li class="nav-item active">
			        <a class="nav-link" href="selectOverOrderByUserId?userId=${user.userId}">已经完成的订单<span class="sr-only">(current)</span></a>
			      </li> --%>
			       <li class="nav-item active">
			        <a class="nav-link" href="center?userId=${user.userId}"> 个人中心<span class="sr-only">(current)</span></a>
			      <%-- </li>
			        <li class="nav-item active">
			        <a class="nav-link" href="showalltaddressbookByUserID?userId=${user.userId}"> 收货地址管理<span class="sr-only">(current)</span></a>
			      </li> --%>
			       <li class="nav-item active tuichu" >
			        <a class="nav-link" href="login.jsp" > 退出<span class="sr-only">(current)</span></a>
			      </li>
			    </ul>
			    <!-- 搜索栏 -->
			  
			  </div>
			  
		
			</nav>
			<div class="header_nav_two">
  
    <div class="wenhao"><p class="username">${user.userName},</p></br><p class="wenhao2"></p></div>
    <p class="dohua">请开启你的阅读之旅!</p>
  </div>
 

<!-- 轮播图 -->

<div class="box3">
            <div class="box3_left">
                <div class="swiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide"><img src="./imgs/sp1.jpeg" alt="显示不出来"></div>
                        <div class="swiper-slide"><img src="./imgs/sp2.jpeg" alt="显示不出来"></div>
                         <div class="swiper-slide"><img src="./imgs/sp3.jpeg" alt="显示不出来"></div>
                          <div class="swiper-slide"><img src="./imgs/sp4.jpeg" alt="显示不出来"></div>
                             <div class="swiper-slide"><img src="./imgs/sp5.png" alt="显示不出来"></div>
                    </div>
                    <div class="swiper-pagination"></div>
                 </div>
            </div>
          <div class="box3_right">  
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>

        </div>
        </div>
        
        
        

 <div class="tanchuang">
        
    <div class="top_logo"></div>
 
    <p class="nexttime">云端同步，一键下载，更好的收听体验</p>
    <div class="xiazai">下载客户端</div>
</body>
</html>
<style>
.navbar-header{
margin-left:335px;
}
.form-inline{
margin-right:100px;
}
.tuichu{
margin-left:650px!important;
}
.logo{
width:50px;
height:50px;
display:inline-block;
position: absolute;
left:300px;
background: url(./imgs/书本.png) center;
    background-size: 100% 100%;
}
     .top_logo{
        width: 40%;
        height: 40%;
        /* width: 80px;
        height: 80px; */
        background: url(./imgs/书本.png) center;
        box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.2);
        background-size: 100%;
        margin:0 auto;
        margin-left: 77px;
        border-radius: 20px;
        padding:40px auto 0;
    }
     .nexttime{
         width: 60%;
         height: 25%;
         text-align: center;
         margin:0 auto;
         font-family: PingFangSC-Regular,PingFang SC;
         color: #666;
         font-size: 14px;
         margin-top: 10px;
     }
     li{
     list-style:none;
     text-decoration:none;
     }
     .xiazai{
         width: 80%;
         height: 20%;
         
         margin:10px auto;
         border-radius: 30px;
         background-color: #66b6ff;
         text-align: center;
         cursor:pointer;
         color:white;
         padding-top: 10px;
     
     
     }
     .wenhao{
    font-size: 20px;
    width: 200px;
    color: white;
    height: 100px;
    padding: 0;
    margin: 0;
    margin-left: 43%;
    text-align: center;
    margin-bottom: 20px;
    padding-top: 1.5%;
    overflow-y: hidden;

}
@keyframes m{
    0%{
        width: 0;
    }
    100%{
        width: 300px;
    }
}
.nav_menus a{
	text-decoration:none;
	color:#fff;
}
.header_nav_two{
    width: 60%;
    height: 200px;
    background: url(imgs/bookgound.png) center;	
    
    background-size: 100% 100%;
    margin:0 auto;
    position: relative;
}
.header_nav_two .username{
    color:white;
    margin:0 auto;
    position: absolute;
    font-size: 24px;
    left:60%;
    top:30%;
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}
.header_nav_two .dohua{
    color:white;
    margin:0 auto;
    position: absolute;
    font-size: 24px;
    left:64%;
    top:30%;
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}
.header_nav_two span{
    font-size: 36px;
    font-family: 'Courier New', Courier, monospace;
    color: #fff;
    float: right;
}
     
     
</style>