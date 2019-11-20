<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="AuctionPlatform.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/Scripts/bootstrap.js"></script>
    <link type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet"/>


    <link href="/Content/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.bootcss.com/font-awesome/5.10.2/css/all.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/Content/login.css"/>
    <link rel="stylesheet" href="/Content/product.css"/>

</head>
<body>
   <!-- 头部 -->
 <div class="top-header container" id="j-top">
  <img src="./img/4.jpg" alt="" style="width: 80px; margin:0 200px;">
<div class="top-header-panel">
  <div class="container">
      <div style="margin-left: -100px;">
        <a href="javascript:void(0);" rel="external nofollow" class="active">网拍</a>
      </div>
      <div>
        <a href="javascript:void(0);" rel="external nofollow">同步拍</a>
      </div>
      <div style="margin-left:8px;">
        <a href="javascript:void(0);" rel="external nofollow">商城</a>
      </div>
      <div>
        <a href="javascript:void(0);" rel="external nofollow">资讯</a>
      </div>
      <div style="margin: 15px 25px; padding: 5px 5px; border-radius: 20px; background-color: #f3f5f9; width: 70%;">
        <i class="fa fa-search fa-lg" style="margin:8px 5px;"></i>
        <input  id="input" type="text" placeholder="搜索拍品" style="border:none; outline:none; background-color:#f3f5f9;width: 80%;"/>
      </div>
      <div style="margin:15px 313px;" class="session"> 
        <button class="btn" style="border:none;outline:none; background-color: white; font-size: 16px; -webkit-tap-highlight-color: rgba(0,0,0,0);">登录</button>
      </div>
  </div>  
 
</div>
</div>

<div id="j-content" class="w auction-detail ms-controller" ms-controller="YdAuctionDetailCtrl">
  <div class="breadcrumb" style="padding: 0;">
    <a href="" style="color:#666">艺典网拍</a>
    <span class="mark">></span>
    <span>杨静荣老师推荐双十一官窑瓷器专场</span>
  </div>
  <div class="primary" id="j-auction-info">
    <div class="p-img fl">
      <img class="j-lazyload" src="./img/6.jpg" alt="" />
      <div>
        <div id="j-video-play" class="video-play">
          <a href="javascript:;"></a>
        </div>
        <div class="video-container active" id="j-video-container">
          <i class='icon-close'></i>
        </div>
      </div>  
    </div>
    <div class="primary-info" style="height:400px">
      <h2 class="two-line" style="-webkit-box-orient: vertical;">
        <span class="info-name">杨静荣老师推荐双十一官窑瓷器专场</span>
        <div class="self-support-box">
          <!-- <span class="self-support">自营</span> -->
        </div>
      </h2>

      <div class="f-s-20 info">
        <span class="product-num">拍品数 <b>10</b></span>
        <span class="bit-count">出价数 <b >1</b></span>
        <span class="watch-num">围观数<b>465465</b></span>
      </div>
      <div class="status">
        <div class="status-text">
          <span class="f-s-16">
            距结束:
            <b></b>
            时
            <b></b>
            分
            <b></b>
            秒
          </span>
        </div>
    </div>
    </div>  
    <div class="publisher-and-expert">
      <div class="fl expert">
        <div class="p-img fl" style="overflow: hidden;width: 64px;height: 64px;margin-right: 10px;border-radius: 50%;">
          <img class="j-lazyload-loaded" src="./img/7.jpg" alt="" />
        </div>
        <div class="fl expert-name">
          <div class="people one-line"><b>主理人：谷洪雷</b></div>
          <div class="job">高级业务经理</div>
        </div>
      </div>
      <div class="fl publisher">
        <div class="p-img lazyload fl" style="overflow: hidden;width: 64px;height: 64px;margin-right: 10px;border-radius: 50%;">
          <img class="j-lazyload-loaded" src="./img/7.jpg" alt=""/>
        </div>
        <div class="fl publisher-name">
          <div class="people one-line"><b>出品方：中鞠堂文物商店<span></span></b>
          </div>
          <div class="percent">好评率<b>100%</b>
          </div>
        </div>
        <div class="no-attention fr" style="border-radius: 15px;border: 1px solid #cccccc; text-align: center;">
            <a href="">+关注</a>
        </div>
      </div>
    </div>
  </div>
  <div class="clear"></div>

  <div class="about-action" style="padding: 60px 0;border-bottom: 1px solid #dedede;">
    <h2 class="f-s-30" style=" text-align: center;">关于本场拍卖</h2>
    <div class="f-s-16 content">
      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本场甄选10件清代官窑精品，来源清晰，全部为北京文物商店旧藏，品类涵盖清代各时期的青花、粉彩、斗彩等瓷器。</p>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每件官窑瓷器均有杨静荣老师讲解推荐视频。杨静荣老师为北京故宫博物院研究员，1979年调入故宫博物院研究陶瓷史至今。</p>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;瓷器为古董器物板块的中坚力量，官窑瓷器也已经被国际市场认可，竞买人不仅仅是内地藏家行家，港台、欧美、日本藏家行家也频频出手。清代是中国制瓷史上的集大成时期，其制瓷水平达到了前所未有的高峰。清代官窑瓷器无疑是其中最重要的部分，藏家们请把握最后出价良机！</p>
    </div>
  </div>
</div>
<script>

$(document).ready(function () {

  $('.container div a').on('click',function () {
         $('.container div a').removeClass('active ')
         $(this).addClass('active')
    })

$(".btn").on('click',function () {
      var username = "{$Think.session.user_info.username}";
      if (username=="") {
        layui.use(['layer'], function () {
          layer.confirm('您需要登录后才能发表话题，是否前往登录？', {
              btn: ['确定', '取消'], //按钮
              cancel: function(index){
                  layer.close(index);
              },title:'发表提示',
          }, function () {
              window.location.href = "{:url('index/login/index')}";
          }, function (index) {
              layer.close(index);
          });
        })
      }
  });

})
</script>
</body>
</html>
