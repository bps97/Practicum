<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reg.aspx.cs" Inherits="AuctionPlatform.Reg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Reg</title>
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
      <h1>用户注册</h1>
    </div>
    <form id="RegForm" runat="server">
      <div class="form-group">
        <label for="Email">邮箱</label>
          <asp:RequiredFieldValidator ID="EmailEmpty" runat="server" ErrorMessage="请输入邮箱" ControlToValidate="Email" CssClass="text-danger"></asp:RequiredFieldValidator>
          <asp:CustomValidator ID="EmialExist" runat="server" ErrorMessage="邮箱已被他人注册" ControlToValidate="Email" CssClass="text-danger" OnServerValidate="EmialExist_ServerValidate"></asp:CustomValidator>
          <asp:TextBox ID="Email" runat="server" CssClass="form-control" placeholder="Email" autofocus ></asp:TextBox>
      </div>
      <div class="form-group">
        <label for="Nickname">昵称</label>
          <asp:RequiredFieldValidator ID="NicknameEmpty" runat="server" ErrorMessage="请输入昵称" ControlToValidate="NickName" CssClass="text-danger"></asp:RequiredFieldValidator>
          <asp:TextBox ID="Nickname" runat="server" CssClass="form-control" placeholder="Nickname"></asp:TextBox>
      </div>
      <div class="form-group">
        <label for="Pwd">密码</label>
           <asp:RequiredFieldValidator ID="PwdExist" runat="server" ErrorMessage="请输入密码" ControlToValidate="Pwd" CssClass="text-danger"></asp:RequiredFieldValidator>

          <asp:TextBox ID="Pwd" TextMode="Password" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
      </div>
  
        <asp:Button ID="RegBtn" runat="server" type="submit" CssClass="btn btn-success btn-block" Text="注册" OnClick="RegBtn_Click" />
    <div class="message">
      <p>已有账号? 
          <asp:HyperLink runat="server" NavigateUrl="~/Login.aspx">点击登录</asp:HyperLink>.</p>
    </div>
    </form>
  </div>
</body>
</html>
