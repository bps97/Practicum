<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AuctionPlatform.Views.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <script type="text/javascript" src="../Scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.js"></script>
    <link href="../Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../Content/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <div class="main">
    <div class="header">
      <a href="/">
        <img src="/public/img/logo3.png" alt="">
      </a>
      <h1>用户登录</h1>
    </div>
    <form id="login_form" runat="server">
      <div class="form-group">
        <label for="">邮箱</label>
           <asp:RequiredFieldValidator ID="emailExist" runat="server" ErrorMessage="请输入邮箱" ControlToValidate="email" CssClass="text-danger"></asp:RequiredFieldValidator>
          <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Email" autofocus ></asp:TextBox>
      </div>
      <div class="form-group">
        <label for="">密码</label>
           <asp:RequiredFieldValidator ID="passwordExist" runat="server" ErrorMessage="必须输入密码!!" ControlToValidate="password" CssClass="text-danger"></asp:RequiredFieldValidator>
        <a class="pull-right" href=""><asp:Label ID="Label1" runat="server" Text="忘记密码？"></asp:Label></a>
          
          <asp:TextBox ID="password" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
      </div>
  
        <asp:Button ID="loginbtn" runat="server" type="submit" CssClass="btn btn-success btn-block" Text="登录" OnClick="Button2_Click1" />
    </form>
    <div class="message">
      <p>没有账号? <a href="./register.html">点击创建</a>.</p>
    </div>
  </div>
</body>
</html>
