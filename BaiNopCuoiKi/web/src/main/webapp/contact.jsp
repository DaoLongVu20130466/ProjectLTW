<%@ page import="main.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: thoai
  Date: 10/01/2023
  Time: 8:38 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!DOCTYPE html>
<html lang="zxx">

<head>
  <meta charset="UTF-8">
  <meta name="description" content="Ogani Template">
  <meta name="keywords" content="Ogani, unica, creative, html">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>SBE-Cơm trưa</title>

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

  <!-- Css Styles -->
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
  <link rel="stylesheet" href="css/nice-select.css" type="text/css">
  <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
  <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
  <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
  <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
  <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<header class="header">
  <div class="header__top">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 col-md-6">
          <div class="header__top__left">
            <ul>
              <li><i class="fa fa-envelope"></i> vn.edu.hcmuaf.fit</li>
              <li>Miễn phí giao hàng trong ngày 20-11</li>
            </ul>
          </div>
        </div>
        <div class="col-lg-6 col-md-6">
          <div class="header__top__right">
            <div class="header__top__right__social">
              <a href="#"><i class="fa fa-facebook"></i></a>
              <a href="#"><i class="fa fa-twitter"></i></a>
              <a href="#"><i class="fa fa-instagram"></i></a>
              <a href="#"><i class="fa fa-youtube-play"></i></a>
            </div>
            <div class="header__top__right__language">
              <img src="img/language.png" alt="">
              <div>Việt Nam </div>
            </div>
            <%
              String a = (String) session.getAttribute("login");
              User user = (User) session.getAttribute("auth");
            %>
            <%
              if (a == null) {
            %>
            <a href="DangNhap.jsp"><i class="fa fa-user" ></i> Đăng Nhập</a>
            <% }else{%>
            <div   class="fa" role="alert">

              <a href="getUserInfor"><i class="fa fa-user" ></i> <%= a+  user.getName()%></a>

            </div>
            <%}%>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <div class="col-lg-3">
        <div class="header__logo">
          <a href="getIndex"><img src="img/a.png" alt=""></a>
        </div>
      </div>
      <div class="col-lg-6">
        <nav class="header__menu">
          <ul>
            <li ><a href="getIndex">Trang Chủ</a></li>
            <li ><a href="getAllProduct">Gian Hàng</a></li>

            <li class = "active"><a href="blog.jsp">Giới Thiệu</a></li>
            <li><a href="contact.jsp">Liên Hệ</a></li>
          </ul>
        </nav>
      </div>
      <div class="col-lg-3">
        <div class="header__cart">
          <ul>
            <%
              if( user == null) {
            %>
            <li> <a href="getUserInfor"> <i class="fa fa-user"></i> </a></li>
            <%}else if (user.getRole()>=1) {
            %>
            <li> <a href="getUserInfor"> <i class="fa fa-user"></i> </a></li>
            <li> <a href="getPageAD"> <i class="fas fa-user-edit"></i> </a></li>
            <% }else{
            %>
            <li> <a href="getUserInfor"> <i class="fa fa-user"></i> </a></li>
            <%}%>

            <li><a href="showCart"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
          </ul>
          <div class="header__cart__price"></div>
        </div>
      </div>
    </div>
    <div class="humberger__open">
      <i class="fa fa-bars"></i>
    </div>
  </div>
</header>
<!-- Hero Section End -->
<section class="hero">
  <div class="container">
    <div class="row">
      <div class="col-lg-3">
        <div class="hero__categories">
          <div class="hero__categories__all">
            <i class="fa fa-bars"></i>
            <span>Danh Mục</span>
          </div>

        </div>
      </div>
      <div class="col-lg-9">
        <div class="hero__search">
          <div class="hero__search__form">
            <form action="#">
              <input type="text" placeholder="Bạn Muốn Ăn Gì ?">
              <button type="submit" class="site-btn">TÌM</button>
            </form>
          </div>
          <div class="hero__search__phone">
            <div class="hero__search__phone__icon">
              <i class="fa fa-phone"></i>
            </div>
            <div class="hero__search__phone__text">
              <h5>0337376582</h5>
              <span>Hỗ trợ  24/7 </span>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/ad.jpg">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <div class="breadcrumb__text">
          <h2>Liên Hệ</h2>
          <div class="breadcrumb__option">
            <a href="./index.html">Trang chủ</a>
            <span>Liên hệ</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Contact Section Begin -->
<section class="contact spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-3 col-md-3 col-sm-6 text-center">
        <div class="contact__widget">
          <span class="icon_phone"></span>
          <h4>Số điện thoại</h4>
          <p>0985034347</p>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6 text-center">
        <div class="contact__widget">
          <span class="icon_pin_alt"></span>
          <h4>Địa chỉ</h4>
          <p>KP6, phường Linh Trung, Thủ Đức, TP HCM</p>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6 text-center">
        <div class="contact__widget">
          <span class="icon_clock_alt"></span>
          <h4>Thời gian mở cửa</h4>
          <p>9:00 tới 23:00 pm</p>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6 text-center">
        <div class="contact__widget">
          <span class="icon_mail_alt"></span>
          <h4>Email</h4>
          <p>sbe_comtrua@gmail.com</p>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Contact Section End -->

<!-- Map Begin -->
<div class="map">
  <iframe
          src="https://www.google.com/maps/place/Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+N%C3%B4ng+L%C3%A2m+Tp.+H%E1%BB%93+Ch%C3%AD+Minh/@10.8712764,106.789573,17z/data=!3m1!4b1!4m5!3m4!1s0x3175276398969f7b:0x9672b7efd0893fc4!8m2!3d10.8712764!4d106.7917617?hl=vi"
          height="500" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
  <div class="map-inside">
    <i class="icon_pin"></i>
    <div class="inside-widget">
      <h4>SBE Cơm Trưa</h4>
      <ul>
        <li>Sdt: 0337376582</li>
        <li>Địa chỉa: KP6, Phường Linh Trung, Thủ Đức, TP HCM</li>
      </ul>
    </div>
  </div>
</div>
<!-- Map End -->

<!-- Contact Form Begin -->
<div class="contact-form spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="contact__form__title">
          <h2>Để lại lời nhắn</h2>
        </div>
      </div>
    </div>
    <form action="#">
      <div class="row">
        <div class="col-lg-6 col-md-6">
          <input type="text" placeholder="Tên của bạn">
        </div>
        <div class="col-lg-6 col-md-6">
          <input type="text" placeholder="Email của bạn">
        </div>
        <div class="col-lg-12 text-center">
          <textarea placeholder="Lời nhắn của bạn"></textarea>
          <button type="submit" class="site-btn">Gửi lời nhắn</button>
        </div>
      </div>
    </form>
  </div>
</div>
<!-- Contact Form End -->

<!-- Footer Section Begin -->
<footer class="footer spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="footer__about">
          <div class="footer__about__logo">
            <a href="./index.html"><img src="img/a.png" alt=""></a>
          </div>
          <ul>
            <li>Địa chỉ: Khu Phố 6, Thủ Đức, Thành phố Hồ Chí Minh</li>
            <li>Số điện thoại: +*********</li>
            <li>Email: 201*046*</li>
          </ul>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
        <div class="footer__widget">
          <h6>Liên kết hữu ích</h6>
          <ul>
            <li ><a href="getIndex">Trang Chủ</a></li>
            <li><a href="getAllProduct">Gian Hàng</a></li>
            <li><a href="blog.jsp">Giới Thiệu</a></li>
            <li><a href="contact.jsp">Liên Hệ</a></li>
          </ul>

        </div>
      </div>
      <div class="col-lg-4 col-md-12">
        <div class="footer__widget">
          <h6>Cập Nhật Thông Tin</h6>
          <p>Nhận thông tin cập nhật e-mail về cửa hàng mới nhất của chúng tôi và các ưu đãi đặc biệt của chúng tôi.</p>
          <form action="#">
            <input type="text" placeholder="Nhập Email">
            <button type="submit" class="site-btn">Xác Nhận</button>
          </form>
          <div class="footer__widget__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-pinterest"></i></a>
          </div>
        </div>
      </div>
    </div>

  </div>
</footer>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>



</body>

</html>
</html>
