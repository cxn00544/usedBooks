<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>校园二手书交易系统</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comment.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" ></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" ></script>
</head>


<title>展示全部求购界面</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comment.css">
	<script type="text/javascript">
		function del(demandId){
			var a = window.confirm("您确定要删除吗？");
			if(a==true){
				location.href="${pageContext.request.contextPath}/doDeleteTBuyBook?demandId="+demandId;
			}
		}
	</script>
</head>
<body>
	<div>
			<jsp:include page="header2.jsp" />
	</div>
	<br ><br />
		
<div class="comment-table">
	<div class="comment-header">
		<h2>全部求购</h2>
		<div>
			<a href="<c:url value='/add?userId=${userId}'/>">添加求购信息</a>
		</div>
	</div>
	<c:if test="${not empty list}">
		<table>
			<thead>
			<tr>
				<th>求购书名(点击查看详情)&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th>联系电话</th>
			</tr>
			</thead>
			<tbody>

			<c:forEach items="${list}" var="tbook">
				<tr>
					<td>
						<a href="<c:url value="/doShowTBuyBookDetail?demandId=${tbook.demandId}"/>" target="showTBuyBook">${tbook.bookName}</a>
					</td>
					<td>
						${tbook.telephone}
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</c:if>
	<c:if test="${empty list}">
		没有记录
	</c:if>

</div>
</body>
</html>
 <style>
	*{
    margin:0px;
    padding:0px;
    box-sizing: border-box;
}
.box3{
	width:60%;
	height:300px;
	margin:0 auto;
	display:flex;
	flex-direction:column;
	padding:10px;
	
}

.box3_div{
	width:100%;
	height:50px;
	clean:both;
	text-align:center;
	padding-top:10px; 
}
.box3 div{
		width:100%;
		height:60px;
		clean:both;
		margin-top:10px;
		background:url(imgs/ncss_side_column_divider.jpeg);
		padding-top:20px;
		padding-left:10px;
		 
}
.box3 a{
	text-decoration:none!important;
}

li{
    list-style: none;
}
.header_nav{
    width: 100%;
    height: auto;
    height: 100px;
   
    background-color:#699fc1;
    
   font-size: 24px;


}
.nav_menus{
    width: 75%;
    margin:0 auto;
    display: flex;
   height:100%;
    justify-content: space-around;

    
}
.left_menus{
    width: 30%;
    height: 100%;
    position: relative;
    left:0px;
}
.serach_nav{
   width: 13%;
    height: 90%;
   margin-top:2px;
    background-color:white;
    margin-right:-300px;
    color: #6c6c6c;
    border-radius: 32px;
    text-align: center;
    padding-top:8px;
    font-size: 12px;
    display:flex;
    position: relative;
    

}
input{
    border:0;
    outline: none;
}
.serach_nav span{
    display: block;
    width: 30px;
    height: 30px;
    position:absolute;
    right:10px;
    top:8px;
    background:url(../images/icon/serach.png);
    background-size: 100% 100%;

}
#search_text{
    display: inline;
    transition: .5s;
    box-sizing: border-box;
    width: 230px;
    height: 100%;
    border-radius: 24px;
    padding:5px 10px 10px 5px;
    background-color: #fff;
    color: #000;
    line-height: 29px;
    

}
.right_menus{
    width: 240px;
    height: 100%;
    position: relative;
    right:0px;
   
}
.xaunzedenglu{
    width: 300px;
    height: 100%;
    position: relative;
    right:0px;
    top:10px;
    display: none;
}
.nav_menus_ul{
    width: 100%;
    display: flex;
    height:100%;
}
.nav_menus_ul li{
	width: 400px;
	position:relative;
	padding:25px;
	text-align: center;

}
.nav_menus_ul ul{
	position:absolute;
	left: 0;
	top: 100%;
	margin:0;
	padding:0;
	display: none; 
	 z-index:999;
	background-color: black;
}
.nav_menus_ul ul li{
	width: 240px;
    text-align: center;

}
.nav_menus_ul li:hover{
	background-color: #B0C4DE;
 
}

.nav_menus_ul li:hover>ul{
	display: block;
}
.nav_menus_ul ul a{
    /* display: inline-block; */
    display: flex;
    width: 100%;
    height: 100%;
}
.nav_menus_ul span{
    display:inline-block;
    width: 25%;
    height: 20px;
    margin-right:3px;
}


.header_nav_two{
    width: 60%;
    height: 200px;
    background: url(imgs/bookgound.png) center;	
    
    background-size: 100% 100%;
    margin:0 auto;
    position: relative;
}
.header_nav_two p{
    color:white;
    margin:0 auto;
    position: absolute;
    font-size: 24px;
    left:60%;
    top:30%;
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}
.header_nav_two span{
    font-size: 36px;
    font-family: 'Courier New', Courier, monospace;
    color: #fff;
    float: right;
}
.view {
    opacity: 0;
    transform: scale(0, 0);
  }
.box2{
    width: 100%;
    height: 60px;
    border: 2px solid #87CEFA;
    text-align: left;
    
}   
.box2 p{
	position:absolute;
	left:20%;
	margin-top:20px;
}
.box2_ul{
    display: flex;
    width: 50%;
    height: 100%;
    margin:0 auto;
    justify-content: left;
    text-align: center;
}

.box2_ul li{
   width: 100px;
    height: 100%;
    padding: 6px 0;
    text-align: center;
}
.header_nav_two p{
    font-size:20px;
    width: 0;
   
    overflow:hidden;
    height: 28px;
    padding:0;
    margin:0;
    text-align:center;
    box-sizing:border-box;
    animation:m 4s steps(10) forwards;
    
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
</style>
 