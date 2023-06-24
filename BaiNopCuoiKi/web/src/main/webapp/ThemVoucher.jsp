<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="main.bean.User" %>
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
  <link rel="stylesheet" href="css/admincss.css">
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
  <div class="loader"></div>
</div>

<!-- Humberger Begin -->

<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
  <div class="header__top">
      <div class="container">
          <div class="row">
              <div class="col-lg-6 col-md-6">
                  <div class="header__top__left">
                      <ul>
                          <li><i class="fa fa-envelope"></i> Email: 201*046*</li>
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
                      <div class="header__top__right__auth">
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
  </div>
  <div class="container">
      <div class="row">
          <div class="col-lg-3">
              <div class="header__logo">
                  <a href="./index.html"><img src="img/a.png" alt=""></a>
              </div>
          </div>
          <div class="col-lg-6">
              <nav class="header__menu">
                  <ul>
                      <li ><a href="getIndex">Trang Chủ</a></li>
                      <li ><a href="getAllProduct">Gian Hàng</a></li>

                      <li><a href="blog.jsp">Giới Thiệu</a></li>
                      <li><a href="contact.jsp">Liên Hệ</a></li>
                  </ul>
              </nav>
          </div>
          <div class="col-lg-3">
              <div class="header__cart">
                  <ul>
                      <li><a href="./user.html"><i class="fa fa-user"></i> </a></li>
                      <li><a href="./GioHang.html"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
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
<!-- Header Section End -->

<!-- Hero Section Begin -->

<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/ad.jpg">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <div class="breadcrumb__text">
          <h2>Trang Admin</h2>
          <div class="breadcrumb__option">
            <a href="./index.html">Admin</a>
            <span>Quản Lý Tài Khoản</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="product spad">
  <div class="container">
    <div class="row">

      <div class="align-self-start">
        <div class="sidebar">
          <div class="sidebar__item">
            <h4>Quản Lý</h4>
            <ul>
                <li><a href="ServletGetInforDB"><i class="fa fa-tachometer" aria-hidden="true"></i> Doanh Thu </a></li>
                <li><a href="getAllProductByAdmin"><i class="fa fa-shopping-bag" aria-hidden="true"></i> Sản Phẩm </a></li>
                <li><a href="ServletAddNewProduct"><i class="fa fa-plus-square-o" aria-hidden="true"></i> Thêm Mặt Hàng</a></li>
                <li><a href="getUserControl"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Quản Lý Tài Khoản</a></li>
                <li><a href="ServletGetAllOder"><i class="fa fa-square" aria-hidden="true"></i> Truy Xuất Đơn Hàng</a></li>
                <li><a href="ServletVoucher"><i class="fa fa-gift" aria-hidden="true"></i> Tặng Voucher</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-10 col-md-5" id="themvoucher">
        <div>


          <div class="boderform">
          <label class="head2">Thêm Voucher Mới</label>
          <form action="/web_war/ServletAddVoucher"  method="post" id="voucher">
            <div>
            <label>Tên Voucher:</label>
              <input name="Names" type="text">
            </div>
            <div>
            <label>Mã Voucher:</label>
            <input name="Idcode" type="text">
            </div>
            <div class="c3">
            <label>Số Tiền Giảm:</label>
            <input name="discount" class="stg" type="text">
              <p class="dd">đ</p>
             </div>
            <div>
            <label for="loaigiam">Loại Giảm :</label>
            <select name="type" id="loaigiam">
              <option value="2">Giảm Phí Ship</option>
              <option value="1">Giảm Phần Trăm Tiền</option>
              <option value="0">Giảm Tiền</option>
            </select>
            </div>
            <div class="day1">
            <label>Ngày Bắt Đầu : </label>
            <input name="dateStart" type="date">
            </div>
            <div class="day2">
            <label>Ngày Kết Thúc : </label>
            <input name="dayEnd" type="date">
        </div>
            <input class="btnacc" type="submit" value="Xác Nhận">
          </form>
          </div>


      </div>
    </div>

  </div>
  </div>
</section>
<!-- Product Section End -->

<!-- Footer Section Begin -->
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