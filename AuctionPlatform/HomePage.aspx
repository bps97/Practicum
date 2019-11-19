<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="AuctionPlatform.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>拍卖平台</title>
    <script type="text/javascript" src="../Scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.js"></script>
    <link href="../Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.bootcss.com/font-awesome/5.10.2/css/all.css" rel="stylesheet">
    <link href="../Content/index.css" rel="stylesheet" type="text/css" />
    <link href="../Content/swiper.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <body>
    <!-- 头部 -->
  <div class="top-header container" id="j-top">
      <img src="./img/4.jpg" alt="" style="width: 80px; margin:0 200px;">
    <div class="top-header-panel">
      <div class="container">
          <div style="margin-left: -100px;">
            <a href="" class="active">网拍</a>
          </div>
          <div>
            <a href="">同步拍</a>
          </div>
          <div style="margin-left:8px;">
            <a href="">商城</a>
          </div>
          <div>
            <a href="">资讯</a>
          </div>
          <div style="margin: 15px 25px; padding: 5px 5px; border-radius: 20px; background-color: #f3f5f9; width: 70%;">
            <i class="fa fa-search fa-lg" style="margin:8px 5px;"></i>
            <input  id="input" type="text" placeholder="搜索拍品" style="border:none; outline:none; background-color:#f3f5f9;width: 80%;"/>
          </div>
          <div style="margin:15px 313px;"> 
            <button class="btn" onclick="" style="border:none;outline:none; background-color: white; font-size: 16px;">登录</button>
          </div>
      </div>  
     
  </div>
  </div>


</div>
  <!-- 轮播 -->
  <div class="swiper-container">
      <div class="swiper-wrapper">
          <div class="swiper-slide"><img src="./img/1.jpg" alt=""></div>
          <div class="swiper-slide"><img src="./img/2.jpg" alt=""></div>
          <div class="swiper-slide"><img src="./img/3.jpg" alt=""></div>
      </div>
      <!-- 如果需要分页器 -->
      <div class="swiper-pagination"></div>
      
      <!-- 如果需要导航按钮 -->
      <div class="swiper-button-prev" style="color: aliceblue;"></div>
      <div class="swiper-button-next" style="color: aliceblue;"></div>
      
      <!-- 如果需要滚动条 -->
      <div class="swiper-scrollbar"></div>
  </div>

  <!-- 列表名称栏 -->
  <div class="row-container" style="margin-left: 160px;">
    <ul>
      <li>
       <a href="" class="select-active">全部</a>
      </li>
      <li>
        <a href="">正在拍</a>
      </li>
      <li>
        <a href="">预展中</a>
      </li>
      <li>
       <a href="">已结拍</a>
      </li>
    </ul>
  </div>  

  <!-- 拍品列表 -->
  <div class="info" style="margin-left: 145px;">
   <ul class="info-container">
    <li>
      <div class="p-img">
       <img src="./img/5.jpg" alt="" style="display:inline">
      </div>
      <div class="info-bottom">
         <div class="info-bottom-row">
           <div class="info-right f1">
             <h2 class="one-line">
              <span class="self-support">自营</span> 
              《中国研究》出版作品专场
            </h2>
           <div class="eyethor-container f-s-16">
             <span class="eye-left"><b>4919</b>人围观</span>
             <span class="thor-right"><b>3</b>次出价</span>
           </div> 
           <div class="status-container">
            <span class="status status-red">正在拍</span>
            <span class="red f-s-16">
              距结束
              <b></b>
               时
              <b></b>
               分
              <b></b>
               秒
            </span>
           </div>
           <div class="headimg-container">
            <div class="p-img f1">
             <img src="./img/6.png" alt="" >
           </div>
           <span style="margin-left: 5px;">出品方</span>
           <span class="f-s-14">至.秦</span>
           <div class="no-attention fr" style="margin-left: 200px; text-align: center; background-color: #fff;border-radius: 10px;border: 1px solid #ccc;">
            <a href="" style="color: black;">+关注</a>
           </div>
           </div>
           </div>
         </div>
      </div>
    </li>
    <li>
      <div class="p-img">
       <img src="./img/5.jpg" alt="" style="display:inline">
      </div>
      <div class="info-bottom">
         <div class="info-bottom-row">
           <div class="info-right f1">
             <h2 class="one-line">
              <span class="self-support">自营</span> 
              《中国研究》出版作品专场
            </h2>
           <div class="eyethor-container f-s-16">
             <span class="eye-left"><b>4919</b>人围观</span>
             <span class="thor-right"><b>3</b>次出价</span>
           </div> 
           <div class="status-container">
            <span class="status status-red">正在拍</span>
            <span class="red f-s-16">
              距结束
              <b></b>
               时
              <b></b>
               分
              <b></b>
               秒
            </span>
           </div>
           <div class="headimg-container">
            <div class="p-img f1">
             <img src="./img/6.png" alt="" >
           </div>
           <span style="margin-left: 5px;">出品方</span>
           <span class="f-s-14">至.秦</span>
           <div class="no-attention fr" style="margin-left: 200px; text-align: center; background-color: #fff;border-radius: 10px;border: 1px solid #ccc;">
            <a href="" style="color: black;">+关注</a>
           </div>
           </div>
           </div>
         </div>
      </div>
    </li>
    <li>
      <div class="p-img">
       <img src="./img/5.jpg" alt="" style="display:inline">
      </div>
      <div class="info-bottom">
         <div class="info-bottom-row">
           <div class="info-right f1">
             <h2 class="one-line">
              <span class="self-support">自营</span> 
              《中国研究》出版作品专场
            </h2>
           <div class="eyethor-container f-s-16">
             <span class="eye-left"><b>4919</b>人围观</span>
             <span class="thor-right"><b>3</b>次出价</span>
           </div> 
           <div class="status-container">
            <span class="status status-red">正在拍</span>
            <span class="red f-s-16">
              距结束
              <b></b>
               时
              <b></b>
               分
              <b></b>
               秒
            </span>
           </div>
           <div class="headimg-container">
            <div class="p-img f1">
             <img src="./img/6.png" alt="" >
           </div>
           <span style="margin-left: 5px;">出品方</span>
           <span class="f-s-14">至.秦</span>
           <div class="no-attention fr" style="margin-left: 200px; text-align: center; background-color: #fff;border-radius: 10px;border: 1px solid #ccc;">
            <a href="" style="color: black;">+关注</a>
           </div>
           </div>
           </div>
         </div>
      </div>
    </li>
    <li>
      <div class="p-img">
       <img src="./img/5.jpg" alt="" style="display:inline">
      </div>
      <div class="info-bottom">
         <div class="info-bottom-row">
           <div class="info-right f1">
             <h2 class="one-line">
              <span class="self-support">自营</span> 
              《中国研究》出版作品专场
            </h2>
           <div class="eyethor-container f-s-16">
             <span class="eye-left"><b>4919</b>人围观</span>
             <span class="thor-right"><b>3</b>次出价</span>
           </div> 
           <div class="status-container">
            <span class="status status-red">正在拍</span>
            <span class="red f-s-16">
              距结束
              <b></b>
               时
              <b></b>
               分
              <b></b>
               秒
            </span>
           </div>
           <div class="headimg-container">
            <div class="p-img f1">
             <img src="./img/6.png" alt="" >
           </div>
           <span style="margin-left: 5px;">出品方</span>
           <span class="f-s-14">至.秦</span>
           <div class="no-attention fr" style="margin-left: 200px; text-align: center; background-color: #fff;border-radius: 10px;border: 1px solid #ccc;">
            <a href="" style="color: black;">+关注</a>
           </div>
           </div>
           </div>
         </div>
      </div>
    </li>
    <li>
      <div class="p-img">
       <img src="./img/5.jpg" alt="" style="display:inline">
      </div>
      <div class="info-bottom">
         <div class="info-bottom-row">
           <div class="info-right f1">
             <h2 class="one-line">
              <span class="self-support">自营</span> 
              《中国研究》出版作品专场
            </h2>
           <div class="eyethor-container f-s-16">
             <span class="eye-left"><b>4919</b>人围观</span>
             <span class="thor-right"><b>3</b>次出价</span>
           </div> 
           <div class="status-container">
            <span class="status status-red">正在拍</span>
            <span class="red f-s-16">
              距结束
              <b></b>
               时
              <b></b>
               分
              <b></b>
               秒
            </span>
           </div>
           <div class="headimg-container">
            <div class="p-img f1">
             <img src="./img/6.png" alt="" >
           </div>
           <span style="margin-left: 5px;">出品方</span>
           <span class="f-s-14">至.秦</span>
           <div class="no-attention fr" style="margin-left: 200px; text-align: center; background-color: #fff;border-radius: 10px;border: 1px solid #ccc;">
            <a href="" style="color: black;">+关注</a>
           </div>
           </div>
           </div>
         </div>
      </div>
    </li>
   </ul>
  </div>
  <script>
    var mySwiper = new Swiper ('.swiper-container', {
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

$(function(){
    $(".row-container li a").on("mouseover",function(){
        $('.row-container li a').removeClass('select-active')
        $(this).addClass('select-active')
    })
    $(".row-container li a").on("mouseout",function(){
         $('.row-container li a').removeClass('select-active')
       
    })

    $('.container div a').on('mouseover',function () {
         $('.container div a').removeClass('active')
         $(this).addClass('active')
    })

    $('.container div a').on('mouseout',function () {
       $('.container div a').removeClass('active')
    })

})
  </script>
</body>
</html>
