<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单头部</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" ></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" ></script>
</head>
</head>
<body>
<header class="mt-header" data-spm="a210b">
  <article>
    <div class="mt-logo" style="margin-left: 0px;">
      <a title="我的订单" style="background-image: url(https://img.alicdn.com/imgextra/i2/O1CN015xANTA1iq6KMo02E5_!!6000000004463-2-tps-140-34.png);background-image: -webkit-image-set(url(https://img.alicdn.com/imgextra/i2/O1CN015xANTA1iq6KMo02E5_!!6000000004463-2-tps-140-34.png) 1x,url(https://img.alicdn.com/imgextra/i1/O1CN01sCCscO1CKtdpqHDyv_!!6000000000063-2-tps-280-62.png) 2x);" href="//i.taobao.com/my_taobao.htm?nekot=1470211439696&amp;tracelog=newmytb_logodianji" class="mt-tblogo" data-spm="d1000351"></a>
    </div>
    <nav class="mt-nav">
      <div>
			<ul class="nav nav-pills" align="center">
	
		<li class="nav-item">
			<a class="nav-link a_style" href="selectallcancelOrder?userId=${user.userId}">所有退货订单</a>
		</li>
		<li class="nav-item">
			<a class="nav-link a_style"  href="selectOrderByUserId?userId=${user.userId}">所有订单</a>
			
		</li>
		<li class="nav-item">
			<a class="nav-link a_style" href="showallwaitorder?userId=${user.userId}">待收货</a>
		</li>
		<li class="nav-item">
			<a class="nav-link a_style"  href="selectallevaluatedOrder?userId=${user.userId}">已完成</a>
			
		</li>
</ul>
			
	</div>
     
  
    </nav>

  </article>
  
</header>


</body>
<style>

.jianxi{
width:100%;
height:50px;
}
.a_style{
color:white!important;
}

</style>
</html>