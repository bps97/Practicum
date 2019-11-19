<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AuctionPlatform.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <script type="text/javascript" src="/Scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/Scripts/bootstrap.js"></script>
    <link href="/Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="/Content/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <div class="main">
    <div class="header">
      <a href="/">
        <img src="/public/img/logo3.png" alt="">
      </a>
      <h1>用户登录</h1>
    </div>
    <form id="LoginForm" runat="server">
      <div class="form-group">
        <label for="Email">邮箱</label>
           <asp:RequiredFieldValidator ID="EmailEmpty" runat="server" ErrorMessage="请输入邮箱" ControlToValidate="Email" CssClass="text-danger"></asp:RequiredFieldValidator>
          <asp:TextBox ID="Email" runat="server" CssClass="form-control" placeholder="Email" autofocus ></asp:TextBox>
      </div>
      <div class="form-group">
        <label for="Pwd">密码</label>
           <asp:RequiredFieldValidator ID="PwdEmpty" runat="server" ErrorMessage="请输入密码" ControlToValidate="Pwd" CssClass="text-danger"></asp:RequiredFieldValidator>
           <asp:CustomValidator ID="PwdCorrect" runat="server" ErrorMessage="账户和密码不匹配" ControlToValidate="Pwd" CssClass="text-danger" OnServerValidate="PwdCorrect_ServerValidate" ></asp:CustomValidator>
        <a class="pull-right" href=""><asp:Label ID="Label1" runat="server" Text="忘记密码？"></asp:Label></a>
          
          <asp:TextBox ID="Pwd" type="password" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
      </div>
  
        <asp:Button ID="LoginBtn" runat="server" type="submit" CssClass="btn btn-success btn-block" Text="登录" OnClick="LoginBtn_Click" />
    </form>
    <div class="message">
      <p>没有账号? <a href="reg.aspx">点击注册</a>.</p>
    </div>
  </div>
</body>
</html>
