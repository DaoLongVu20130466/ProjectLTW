<%@ page import="main.bean.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.bean.Log" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <li ><a href="getIndex">Trang Chủ</a></li>
            <li ><a href="/getAllProduct">Gian Hàng</a></li>

            <li><a href="./blog.html">Giới Thiệu</a></li>
            <li><a href="./contact.html">Liên Hệ</a></li>
          </ul>
        </nav>
      </div>
      <div class="col-lg-3">
        <div class="header__cart">
          <ul>
            <li><a href="./user.html"><i class="fa fa-user"></i></a></li>
            <li><a href="showCart"><i class="fa fa-shopping-bag"></i></a></li>
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
            <span>Quản Lý Log</span>
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
              <li><a href="DoanhThu.jsp"><i class="fa fa-tachometer" aria-hidden="true"></i> Doanh Thu </a></li>
              <li><a href="SanPham.html"><i class="fa fa-shopping-bag" aria-hidden="true"></i> Sản Phẩm </a></li>
              <li><a href="ThemSanPham.html"><i class="fa fa-plus-square-o" aria-hidden="true"></i> Thêm Mặt Hàng</a></li>
              <li><a href="QuanLyTaiKhoan.html"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Quản Lý Tài Khoản</a></li>
              <li><a href="Truysuatdonhang.jsp"><i class="fa fa-square" aria-hidden="true"></i> Truy Xuất Đơn Hàng</a></li>
              <li><a href="TangVoucher.jsp"><i class="fa fa-gift" aria-hidden="true"></i> Tặng Voucher</a></li>
              <li><a href="TangVoucher.jsp"><i class="fa fa-file" aria-hidden="true"></i> Log</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-10 col-md-5">
        <div>
          <div class="TaiKhoan">
            <input type="text" class="cd-search table-filter" data-table="order-table" placeholder="Item to filter.." />
            <table class="cd-table order-table table">
              <thead>
              <tr>
                <th>ID</th>
                <th>Id User</th>
                <th>Mức độ</th>
                <th>Src</th>
                <th>Content</th>
                <th>Thời điểm</th>
                <th>Status</th>
                <th>Hành Động</th>
              </tr>
              </thead>
              <tbody>
              <%
                ArrayList<Log> list = (ArrayList<Log>) request.getAttribute("alllog");
                for (Log item: list) {
              %>
              <tr>
                <td><%=item.getId()%></td>
                <td><%=item.getId_User()%></td>
                <td><%=item.getLevel()%></td>
                <td><%=item.getSrc()%></td>
                <td><%=item.getContent()%></td>
                <td><%=item.getDate()%></td>
                <td><a href=""> <i class="fa fa-trash-o" aria-hidden="true"></i> Xóa</a></td>

              </tr>

              </tbody>
            </table>
            <div class="product__pagination">
              <a href="#">1</a>
              <a href="#">2</a>
              <a href="#">3</a>
              <a href="#"><i class="fa fa-long-arrow-right"></i></a>
            </div>
          </div>
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

<!--    <table class="table table-striped">-->
<!--        <thead>-->
<!--        <tr>-->
<!--            <th scope="col">#</th>-->
<!--            <th scope="col">First</th>-->
<!--            <th scope="col">Last</th>-->
<!--            <th scope="col">Handle</th>-->
<!--        </tr>-->
<!--        </thead>-->
<!--        <tbody>-->
<!--        <tr>-->
<!--            <th scope="row">1</th>-->
<!--            <td>Mark</td>-->
<!--            <td>Otto</td>-->
<!--            <td>@mdo</td>-->
<!--        </tr>-->
<!--        <tr>-->
<!--            <th scope="row">2</th>-->
<!--            <td>Jacob</td>-->
<!--            <td>Thornton</td>-->
<!--            <td>@fat</td>-->
<!--        </tr>-->
<!--        <tr>-->
<!--            <th scope="row">3</th>-->
<!--            <td>Larry</td>-->
<!--            <td>the Bird</td>-->
<!--            <td>@twitter</td>-->
<!--        </tr>-->
<!--        </tbody>-->
<!--    </table>-->


<script>
  (function() {
    'use strict';

    var TableFilter = (function() {
      var Arr = Array.prototype;
      var input;

      function onInputEvent(e) {
        input = e.target;
        var table1 = document.getElementsByClassName(input.getAttribute('data-table'));
        Arr.forEach.call(table1, function(table) {
          Arr.forEach.call(table.tBodies, function(tbody) {
            Arr.forEach.call(tbody.rows, filter);
          });
        });
      }

      function filter(row) {
        var text = row.textContent.toLowerCase();
        //console.log(text);
        var val = input.value.toLowerCase();
        //console.log(val);
        row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
      }

      return {
        init: function() {
          var inputs = document.getElementsByClassName('table-filter');
          Arr.forEach.call(inputs, function(input) {
            input.oninput = onInputEvent;
          });
        }
      };

    })();


    TableFilter.init();
  })();
</script>

</body>

</html>