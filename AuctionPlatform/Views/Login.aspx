<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AuctionPlatform.Views.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="@Url.Content("~/Scripts/jquery-3.3.1.min.js")"></script>
    <script src="@Url.Content("~/Scripts/bootstrap.min.js")"></script>
    <link href="@Url.Content("~/Content/bootstrap.css")" rel="stylesheet">
    <link rel="stylesheet" href="@Url.Content("~/Content/login.css")">
</head>
<body>
    <div class="main">
    <div class="header">
      <a href="/">
        <img src="/public/img/logo3.png" alt="">
      </a>
      <h1>用户登录</h1>
    </div>
    <form id="login_form">
      <div class="form-group">
        <label for="">邮箱</label>
        <input type="email" class="form-control" id="" name="email" placeholder="Email" autofocus>
      </div>
      <div class="form-group">
        <label for="">密码</label>
        <a class="pull-right" href="">忘记密码？</a>
        <input type="password" class="form-control" id="" name="password" placeholder="Password">
      </div>
      <div class="checkbox">
        <label>
          <input type="checkbox">记住我
        </label>
      </div>
      <button type="submit" class="btn btn-success btn-block">登录</button>
    </form>
    <div class="message">
      <p>没有账号? <a href="./register.html">点击创建</a>.</p>
    </div>
  </div>
</body>
</html>
