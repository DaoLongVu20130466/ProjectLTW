<%@ page import="main.bean.Products" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: thoai
  Date: 5/01/2023
  Time: 7:42 pm
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
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
  <script src="https://cdn.ckeditor.com/ckeditor5/35.3.0/classic/ckeditor.js"></script>
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
              <a href="DangNhap.html"><i class="fa fa-user"></i> Đăng Nhập</a>
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
            <li ><a href="./index.html">Trang Chủ</a></li>
            <li ><a href="./shop-grid.html">Gian Hàng</a></li>

            <li><a href="./blog.html">Giới Thiệu</a></li>
            <li><a href="./contact.html">Liên Hệ</a></li>
          </ul>
        </nav>
      </div>
      <div class="col-lg-3">
        <div class="header__cart">
          <ul>
            <li><a href="./user.html"><i class="fa fa-user"></i></a></li>
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
            <span>Sản Phẩm</span>
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
              <li><a href="DoanhThu.html"><i class="fa fa-tachometer" aria-hidden="true"></i> Doanh Thu </a></li>
              <li><a href="SanPham.html"><i class="fa fa-shopping-bag" aria-hidden="true"></i> Sản Phẩm </a></li>
              <li><a href="ThemSanPham.html"><i class="fa fa-plus-square-o" aria-hidden="true"></i> Thêm Mặt Hàng</a></li>
              <li><a href="QuanLyTaiKhoan.html"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Quản Lý Tài Khoản</a></li>
              <li><a href="Truysuatdonhang.html"><i class="fa fa-square" aria-hidden="true"></i> Truy Xuất Đơn Hàng</a></li>
              <li><a href="TangVoucher.html"><i class="fa fa-gift" aria-hidden="true"></i> Tặng Voucher</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-10 col-md-5">
        <h2>Toàn bộ sản phẩm:</h2>
        <div class="TaiKhoan">
          <input type="text" class="cd-search table-filter" data-table="order-table" placeholder="Item to filter.." />
          <table class="cd-table order-table table">
            <thead>
            <tr>
              <th>Tên Món Ăn</th>
              <th>Giá Món Ăn (VND)</th>
              <th>ID Món Ăn</th>
              <th>Loại Món Ăn</th>
              <th>Trạng Thái</th>
              <th>Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <%
              ArrayList<Products> list = (ArrayList<Products>) request.getAttribute("allproducts");
              for (Products p : list)
              {
            %>
            <tr>
              <td><%=p.getFoodName()%></td>
              <td><%=p.getLISTED_PRICE()%></td>
              <td><%=p.getID_food()%></td>
              <td><%=p.getType()%></td>

              <td><a href=""><i class="fa fa-eye" aria-hidden="true"></i>Hiển thị</a><br>
                <a href=""><i class="fa fa-eye-slash" aria-hidden="true"></i>Ẩn</a></td>

              <td><a href=""><i class="fa fa-lock" aria-hidden="true"></i>Chỉnh sửa</a><br>
                <a href=""> <i class="fa fa-trash-o" aria-hidden="true"></i> Xóa</a><br>
                <a href="detail?type=<%=p.getType()%>&fid=<%=p.getID_food()%>"> <i class="fa fa-home" aria-hidden="true"></i>Xem trực tiếp</a></td>
            </tr>
              <%}%>
            </tbody>
          </table>
        </div>
        <div class="product__pagination">
          <%
            list = (ArrayList<Products>) request.getAttribute("allproducts2");
            int n ;
            if( list.size() % 12 == 0 ){
              n = list.size()/12;
            } else {
              n = list.size()/12 + 1;
            }

            for (int i = 1 ; i <= n ; i++) {
          %>
          <a class href="getPageAD?page=<%= i %>"><%= i%></a>
          <%}%>
        </div>
      </div>



    </div>


  </div>
  </div>

  </div>
  </div>
</section>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>.product__pagination{margin-left: 0%;}</style>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>


</body>

</html>

</html>