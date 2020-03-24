<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ArtworkControl.ascx.cs" Inherits="AuctionPlatform.ArtworkControl" %>
<li>
    <div class="p-img">
        <a href="javascript:void(0)" class="artCode">
            <asp:Label ID="ArtCode" runat="server" Style="display: none" />
            <asp:Image runat="server" ID="ArtImg" Style="display: inline" />
        </a>
    </div>
    <div class="info-bottom">
        <div class="info-bottom-row">
            <div class="info-right f1">
                <h2 class="one-line">
                    <span class="self-support">自营</span>
                    <asp:Label ID="ArtworkInfo" runat="server"></asp:Label>
                </h2>
                <div class="eyethor-container f-s-16">
                    <span class="eye-left"><b>4919</b>人围观</span>
                    <span class="thor-right"><b>3</b>次出价</span>
                </div>
                <div class="status-container">
                    <asp:Label ID="ArtStatus" Text="正在拍" runat="server" CssClass="status status-red" />
                    <asp:Label ID="EndTimeDif" Text="距结束时分秒" runat="server" CssClass="red f-s-16" />
                </div>
                <div class="headimg-container">

                    <span style="margin-left: 5px;">出品方</span>
                    <asp:Label ID="Provider" runat="server" CssClass="f-s-14" />
                    <div class="no-attention fr"
                        style="margin-left: 45%; text-align: center; background-color: #fff; border-radius: 10px; border: 1px solid #ccc;">
                        <a href="#" style="color: black;">+关注</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</li>