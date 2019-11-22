<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="AuctionPlatform.Product" %>

<%@ Register Src="~/NavigationControl.ascx" TagPrefix="uc1" TagName="NavigationControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
    <script type="text/javascript" src="/Scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/Scripts/bootstrap.js"></script>

    <link href="/Content/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.bootcss.com/font-awesome/5.10.2/css/all.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/Content/login.css"/>
    <link rel="stylesheet" href="/Content/product.css"/>


</head>
    
<body>
    <!-- 头部 -->
    <uc1:NavigationControl runat="server" ID="NavigationControl" />

    <form runat="server">
        <div id="j-content" class="w auction-detail ms-controller" ms-controller="YdAuctionDetailCtrl">
            <div class="breadcrumb" style="padding: 0;">
                <a href="./index.html" style="color: #666">艺典网拍</a>
                <span class="mark">></span>
                <span>杨静荣老师推荐双十一官窑瓷器专场</span>
            </div>
            <div class="primary" id="j-auction-info">
                <div class="p-img fl">
                    <asp:Image ID="ArtImg" ImageUrl="imageurl" runat="server" CssClass="j-lazyload" />
                    <div>
                        <div id="j-video-play" class="video-play">
                            <a href="javascript:;"></a>
                        </div>
                        <div class="video-container active" id="j-video-container">
                            <i class='icon-close'></i>
                        </div>
                    </div>
                </div>

               <div class="primary-info" style="height: 400px">
                    <div class="two-line" style="-webkit-box-orient: vertical;">
                        <asp:Label Text="正在拍" runat="server" ID="Status" CssClass="badge" />
                        <asp:Label ID="ArtInfo" Text="杨静荣老师推荐双十一官窑瓷器专场" runat="server" CssClass="info=name" style="font-size: x-large" />
                    </div>

                    <div class="f-s-20 info">
                        <span class="bit-count">出价数 <b>
                            <asp:Label Text="2" ID="PlayerCount" runat="server" /></b></span>
                        <span class="watch-num">围观数<b>
                            <asp:Label Text="465465" ID="WatcherCount" runat="server" /></b>
                        </span>
                    </div>



                    <div class="status">

                        <div class="status-text">
                            <asp:Label Text="0s" runat="server" ID="EndTime" CssClass="f-s-16" />
                        </div>

                    </div>
                    <div class="price">
                        <div class="two" style="background-color: #fafafa;">
                            <div class="price-name" style="padding: 0;">当前价格</div>
                            <asp:Label ID="CurrentPrice" Text="2000" Style="font-size: 36px; padding: 0; color: #c51e3a;" runat="server" CssClass="price-value" />
                        </div>
                        <div class="option">
                            <div class="f1">
                                竞价阶梯：
                        <asp:Label Text="1000" runat="server" ID="DiffPrice" />
                            </div>
                        </div>
                    </div>
                    <div class="number">
                        <span class="minus">
                            <img src="Content/img/01.png" alt="" style="width: 100%; height: 100%;" />
                        </span>
                        <asp:TextBox ID="BidPrice" runat="server">1</asp:TextBox>
                        <span class="plus">
                            <img src="Content/img/02.png" alt="" style="width: 100%; height: 100%;" />
                        </span>
                    </div>

                    <asp:Button Text="立刻投拍" ID="BidBtn" runat="server" CssClass="button-submit red" OnClick="BidBtn_Click" />
                    <div class="prices">
                        <span value="1000" class="badge">1k</span>
                        <span value="5000" class="badge">5k</span>
                        <span value="10000" class="badge">10k</span>
                    </div>
                </div>
                <%--1213456--%>
            </div>



            <div class="clear"></div>

            <div class="about-action" style="padding: 60px 0; border-bottom: 1px solid #dedede;">
                <h2 class="f-s-30" style="text-align: center;">关于本场拍卖</h2>
                <div class="f-s-16 content">
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本场甄选10件清代官窑精品，来源清晰，全部为北京文物商店旧藏，品类涵盖清代各时期的青花、粉彩、斗彩等瓷器。</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每件官窑瓷器均有杨静荣老师讲解推荐视频。杨静荣老师为北京故宫博物院研究员，1979年调入故宫博物院研究陶瓷史至今。</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;瓷器为古董器物板块的中坚力量，官窑瓷器也已经被国际市场认可，竞买人不仅仅是内地藏家行家，港台、欧美、日本藏家行家也频频出手。清代是中国制瓷史上的集大成时期，其制瓷水平达到了前所未有的高峰。清代官窑瓷器无疑是其中最重要的部分，藏家们请把握最后出价良机！</p>
                </div>
            </div>
        </div>

    </form>


</body>
<script>

    $(document).ready(function () {



        $('.container div a').on('click', function () {
            $('.container div a').removeClass('active ')
            $(this).addClass('active')
        })


        $('.button-submit').on('click', function () {
            $('.xui-dialog').removeClass('hide')
            $('#j-bid-confirm-pop-masking').removeClass('hide')
        })
        $('#j-bid-confirm-pop-close').on('click', function () {
            $('.xui-dialog').addClass('hide')
            $('#j-bid-confirm-pop-masking').addClass('hide')
        })

        //  按钮计算
        var res1 = parseInt($('.price-value').text())
        var reg = /[0-9]+/g
        var res2 = parseInt(reg.exec($('.f1').text()))
        var res = parseInt($('#BidPrice').val())
        var diff = eval($('#DiffPrice').text());


        $('#BidPrice').val(eval($('#CurrentPrice').text()) + diff);


        $('.prices span').on('click', function () {
            res = res + parseInt($(this).attr('value'))
            $('#BidPrice').val(eval(res))
        })
        $('.minus').on('click', function () {
            res = eval($('#CurrentPrice').text()) + diff;
            $('#BidPrice').val(res);
        })

        $('.plus').on('click', function () {

            res = res + diff;
            $('#BidPrice').val(eval(res))
        })

    })

</script>
</html>
