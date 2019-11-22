<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavigationControl.ascx.cs" Inherits="AuctionPlatform.NavigationControl" %>


<div class="top-header container" id="j-top">
        <asp:Image ID="HeadImage" runat="server" Style="margin: 0 200px;" ImageUrl="~/Content/img/4.jpg" Width="92px" />
        <div class="top-header-panel">
            <div class="container">
                <div style="margin-left: -100px;">
                    <a href="javascript:void(0);" class="active">网拍</a>
                </div>
                <div>
                    <a href="javascript:void(0);">同步拍</a>
                </div>
                <div style="margin-left: 8px;">
                    <a href="javascript:void(0);">商城</a>
                </div>
                <div>
                    <a href="javascript:void(0);">资讯</a>
                </div>
                <div style="margin: 15px 25px; padding: 5px 5px; border-radius: 20px; background-color: #f3f5f9; width: 70%;">
                    <i class="fa fa-search fa-lg" style="margin: 8px 5px;"></i>
                    <input id="input" type="text" placeholder="搜索拍品" style="border: none; outline: none; background-color: #f3f5f9; width: 80%;" />
                </div>
                <div class="login" style="margin:15px 313px;"> 
                    <asp:HyperLink ID="Login" runat="server" CssClass="btn" Text="登录" style="background-color:#ffffff" role="button"></asp:HyperLink>
                </div>
            </div>
        </div>
    </div>