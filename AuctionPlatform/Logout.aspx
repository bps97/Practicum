<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="AuctionPlatform.Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body{
            background-repeat: no-repeat;
            color: #000;
            font:9pt/200% Verdana;
        }
        a{text-decoration: none;color:#659B28}
        a:hover{text-decoration: underline;}
    </style>
</head>
<body>
<center>
    <div style='padding:30px;padding:36px 80px;border:1px solid #a9a9a9;background:#ffffff ; text-align:center; margin:20% auto; background-repeat: no-repeat; width:55%;'>
        成功退出登录！
        <br /><a href='Login.aspx'>如果你的浏览器没反应，请点击这里...</a>
        <script>
            var pgo = 0;
            function JumpUrl(){
                if(pgo == 0){
                    location = 'Login.aspx';
                    pgo = 1;
                }
            }
            setTimeout('JumpUrl()',2000);
            document.write("<scr"+"ipt type='text/javascript' src='~/Login.aspx'></scri"+"pt>");
        </script>
    </div>
</center>
</body>
</html>
