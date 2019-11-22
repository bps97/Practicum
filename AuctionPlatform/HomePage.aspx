<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="AuctionPlatform.HomePage" %>

<%@ Register src="ArtworkControl.ascx" tagname="ArtworkControl" tagprefix="uc1" %>
<%@ Register Src="~/NavigationControl.ascx" TagPrefix="uc1" TagName="NavigationControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>拍卖平台</title>
    <script type="text/javascript" src="/Scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/Scripts/bootstrap.js"></script>
    <link href="/Content/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.bootcss.com/font-awesome/5.10.2/css/all.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/Content/swiper.css"/>
    <script src="/Scripts/swiper.js"></script>
    <link href="/Content/index.css" rel="stylesheet" type="text/css"/>
    <link href="/Content/swiper.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <!-- 头部 -->
    <uc1:NavigationControl runat="server" ID="NavigationControl" />

    <!-- 轮播 -->
      <div class="swiper-container">
          <div class="swiper-wrapper">
              <div class="swiper-slide"><img src="/Content/img/1.jpg" alt=""/></div>
              <div class="swiper-slide"><img src="/Content/img/2.jpg" alt=""/></div>
              <div class="swiper-slide"><img src="/Content/img/3.jpg" alt=""/></div>
          </div>
          <!-- 如果需要分页器 -->
          <div class="swiper-pagination"></div>
      
          <!-- 如果需要导航按钮 -->
          <div class="swiper-button-prev" style="color: aliceblue;"></div>
          <div class="swiper-button-next" style="color: aliceblue;"></div>
      
          <!-- 如果需要滚动条 -->
          <div class="swiper-scrollbar"></div>
      </div>

    <form runat="server" ID="SelectForm">
        <asp:HiddenField ID="SelectBtn" runat="server" Value="LinkButton1" />
    <!-- 列表名称栏 -->
    <div class="row-container" style="margin-left: 160px;">
        <ul>
            <li>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="select-active" OnClick="LinkButton1_Click">全部</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">正在拍</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">预展中</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">已结拍</asp:LinkButton>
            </li>
        </ul>
    </div>
    </form>
    <!-- 拍品列表 -->
    <div class="info" style="margin-left: 145px;">
        <ul class="info-container" runat ="server" id="control">

            <%--<uc1:ArtworkControl ID="ArtworkControl1" runat="server" />--%>

        </ul>
    </div>


</body>

<script>
    var mySwiper = new Swiper('.swiper-container', {
        direction: 'horizontal', // 水平切换选项
        loop: true, // 循环模式选项

        // 如果需要分页器
        pagination: {
            el: '.swiper-pagination',
            type: 'bullets',
        },

        //淡入淡出效果

        coverflowEffect: {
            rotate: 30,
            slideShadows: true,
        },

        // 如果需要前进后退按钮
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },

        //自动播放

        autoplay: {
            delay: 3000,
        },

        //淡入淡出效果
        fadeEffect: {
            crossFade: true
        },

    })

    $(function () {
        $(".row-container li a").on("click", function () {
            $('.row-container li a').removeClass('select-active')
            $(this).addClass('select-active')
            console.log($(this).attr('id'));
            $('#SelectBtn').val($(this).attr('id'));
        })

        $('a.artCode').on('click', function () {
            var code = $(this).children().first().text()
            
            $(location).attr('href', "Product?ArtCode=" + code);
        })

        $('.container div a').on('click', function () {
            $('.container div a').removeClass('active ')
            $(this).addClass('active')
        })
       
    })
</script>
</html>
