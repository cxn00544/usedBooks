<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>sp</title>
<script language ="JavaScript">
  
function spSubmit(){
	

	    var telephone = document.getElementById("telephone").value;
	     
	     	   
	      
if (validatemobile(telephone)) {
	    
	      } else {
	        alert("请输入有效的电话号码！");
	        return false;
	      }
const titleInput = document.getElementsByName('sptittle')[0];
const contentInput = document.getElementsByName('sp')[0];

// 标题验证
if (!/^.{1,30}$/.test(titleInput.value.trim())) {
  alert('标题不能超过30个字');
  titleInput.focus();
  return false;
}

// 内容验证
if (!/^.{1,255}$/.test(contentInput.value.trim())) {
  alert('内容不能超过255个字');
  contentInput.focus();
  return false;
}
return true;


}

function validatemobile(telephone) {
	   var phoneRegex = /^1\d{10}$/;
	   return phoneRegex.test(telephone);
	 }

</script>   
</head>
<body>
<br>
<br>
<div class="wrapper">
	<form id="form" method="post" name="form" action="addsp">
 <table>
 			<tr><td>标题:</td><td><input type="text" name="sptittle" size="35"  placeholder="请勿超过30个字"></td></tr>
<tr>
	<td>问题描述:</td>
	<td><textarea style="resize:none" type="text" name="sp" cols="60" rows="6" placeholder="请勿超过255个字"></textarea></td>
</tr>
	</textarea></td></tr>
	<tr><td>联系方式:</td><td><input type="text" name="telephone" id="telephone" size="35"placeholder="请正确输入手机号"></td></tr>

			<input type="hidden" name="userId" value="${user.userId}" />
		
	<tr><td><input type="submit" value="提交" name="submit" onclick="return spSubmit();"></td>

		<td> <input type="reset" value="重置" name="reset"></td>
	</tr>
	</table>
 	</form>
 	</div>

  <div class="footer">&copy; 2023-06-11</div>
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