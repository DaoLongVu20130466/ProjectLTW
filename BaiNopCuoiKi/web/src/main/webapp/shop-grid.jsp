<%@ page import="main.bean.Products" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
<%@ page import="main.bean.TypeProducts" %><%--
  Created by IntelliJ IDEA.
  User: thoai
  Date: 4/01/2023
  Time: 4:13 pm
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
            <li class="active"><a href="getAllProduct">Gian Hàng</a></li>

            <li><a href="./blog.html">Giới Thiệu</a></li>
            <li><a href="./contact.html">Liên Hệ</a></li>
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


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/ad.jpg">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <div class="breadcrumb__text">
          <h2>SBE Shop</h2>
          <div class="breadcrumb__option">
            <a href="./index.html">Trang chủ</a>
            <span>Gian Hàng</span>
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
      <div class="col-lg-3 col-md-5">
        <div class="sidebar">
          <div class="sidebar__item">
            <h4>Danh Mục</h4>
            <%
              int numberpage = (int) request.getAttribute("numberP");

              ArrayList<TypeProducts> listT = (ArrayList<TypeProducts>) request.getAttribute("alltype");
              for (TypeProducts item: listT) {

            %>
            <ul>
              <li><a href="getAllProductByType?type=<%=item.getIdType()%>" ><%=item.getNameType()%></a></li>
            </ul>
            <%}%>
          </div>
          <div class="sidebar__item">
            <h4>Giá</h4>
            <div class="price-range-wrap">
              <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                   data-min="40000" data-max="500000">
                <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
              </div>
              <div class="range-slider">
                <div class="price-input">
                  <input type="text" id="minamount">
                  <input type="text" id="maxamount">
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
      <div class="col-lg-9 col-md-7">
        <div class="product__discount">
          <div class="section-title product__discount__title">
            <h2>Các Món Đang Giảm Giá</h2>
          </div>
          <div class="row">
            <div class="product__discount__slider owl-carousel">
              <%
                ArrayList<Products> listP = (ArrayList<Products>) request.getAttribute("productBySale");
                for (Products p : listP) {
              %>
              <div class="col-lg-4">
                <div class="product__discount__item">
                  <div class="product__discount__item__pic set-bg"
                       data-setbg="<%=p.getPath()%>">
                    <div class="product__discount__percent">-20%</div>
                    <ul class="product__item__pic__hover">
                      <li><a href="#"><i class="fa fa-heart"></i></a></li>
                      <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                    </ul>
                  </div>
                  <div class="product__discount__item__text">
                    <span><%=p.getType()%></span>
                    <h5><a href="detail?type=<%=p.getType()%>&fid=<%=p.getID_food()%>"><%=p.getFoodName()%></a></h5>
                    <div class="product__item__price"><%=p.getLISTED_PRICE()%>VND <span>60000VND</span></div>
                  </div>
                </div>
              </div>
              <%}%>
            </div>
          </div>
        </div>   <div class="filter__item">
        <div class="row">
          <div class="col-lg-4 col-md-5">
            <div class="filter__sort">
              <span>Lọc</span>
              <select>
                <option value="0">Mặc định</option>
                <option value="0">Tên</option>
                <option value="0">Giá</option>
              </select>
            </div>
          </div>
          <div class="col-lg-4 col-md-4">
            <div class="filter__found">
              <h6><span>12</span> Món</h6>
            </div>
          </div>
          <div class="col-lg-4 col-md-3">
            <div class="filter__option">
              <span class="icon_grid-2x2"></span>
              <span class="icon_ul"></span>
            </div>
          </div>
        </div>
      </div>
      </div>




    </div>

    <div class="row">
      <%
        ArrayList<Products> list = (ArrayList<Products>) request.getAttribute("allproducts");
        for (Products p : list)
        {
      %>
      <div class="col-lg-4 col-md-6 col-sm-6">
        <div class="product__item">
          <div class="product__item__pic set-bg" data-setbg="<%=p.getPath()%>">
            <ul class="product__item__pic__hover">
              <li><a href="#"><i class="fa fa-heart"></i></a></li>

              <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
            </ul>
          </div>
          <div class="product__item__text">
            <h6><a href="detail?type=<%=p.getType()%>&fid=<%=p.getID_food()%>"><%=p.getFoodName()%></a></h6>
            <h5><%=p.getLISTED_PRICE()%> VND</h5>
          </div>
        </div>
      </div>
      <%}%>
      </div>
    </div>

    <div class="product__pagination">
      <%
        String type= (String) request.getAttribute("type");
        for (int i = 1; i <= numberpage ; i++) {
      %>
      <a class href="getAllProduct?type=<%=type%>&page=<%=i%>"><%= i%></a>
      <%}%>
    </div>
  </div>
</section>
<!-- Product Section End -->

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
            <li ><a href="./index.html">Trang Chủ</a></li>
            <li><a href="./shop-grid.html">Gian Hàng</a></li>
            <li><a href="./blog.html">Giới Thiệu</a></li>
            <li><a href="./contact.html">Liên Hệ</a></li>
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
<style>.product__pagination{margin-left: 18%;}</style>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>



</body>

</html>

