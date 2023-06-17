<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
      }

      .container {
  margin: 20px auto;
  padding: 20px;
  max-width: 600px;
  background-color: #fff;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  border-radius: 5px;
  text-align: center; /* 添加此属性 */
}

      .title {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
        text-align: center;
      }

      .message {
  font-size: 18px;
  line-height: 1.6;
  text-align: center; /* 添加此属性 */
}
      .button {
        display: inline-block;
        padding: 10px 20px;
        margin-top: 20px;
        background-color: #007bff;
        border: none;
        color: #fff;
        font-size: 18px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
        border-radius: 5px;
      }

      .button:hover {
        background-color: #0069d9;
      }
    </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container">
      <div class="title">提示信息</div>
      <div class="message">
  意见反馈提交成功<br />
  管理员收到后，将马上为你解决
      </div>
      <a href="center.jsp" class="button">返回</a>
    </div>



</body>
</html>