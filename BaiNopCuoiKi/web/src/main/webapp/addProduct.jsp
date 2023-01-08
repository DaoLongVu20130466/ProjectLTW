<%@ page import="main.bean.TypeProducts" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: thoai
  Date: 8/01/2023
  Time: 5:57 pm
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
  <link rel="stylesheet" href="css/admincss.css" type="text/css">
  <link rel="stylesheet" href="css/addpro.css" type="text/css">

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
            <span>Quản lí tài khoản_Thêm Sản Phẩm</span>
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
        <%
          ArrayList<TypeProducts> listType = (ArrayList<TypeProducts>) request.getAttribute("alltype");
        %>

        <h2>Cập nhật, thêm mới nội dung sản phẩm: </h2>

        <form action="/web_war/AddNewProduct" class="" onSubmit="">
          <div class='add-input'>
            Tên món ăn <span>*</span>
            <input type='text' name='tenmonan' placeholder="Tên món ăn"value=" ">
          </div>
          <div class='add-input'>
            Giá niêm yết
            <input type='text' name='niemyet' placeholder="Giá niêm yết"value=" ">
          </div>
          <div class='add-input'>
            Giá bán<span>*</span>
            <input type='text' name='giaban' placeholder="Giá bán"value=" ">
          </div>
          <div class='add-input'>
            Số lượng<span>*</span>
            <input type='text' name='soluong' placeholder="Số lượng"value=" ">
          </div>
          <div class='add-input'>
            Mô tả<span>*</span>
            <input type='text' name='Mota' placeholder="Mô tả"value=" ">
          </div>

          <div class='add-input'>
            Món ăn hot:<span>*</span>
            <input type='text' name='optionHot' placeholder=" HOT || NORMAL"value=" ">
          </div>

          <div class='add-input'>
            Loại món ăn: <span>*</span>

            <form action="" class="typeAdd">
              <select name="optionType" id="type">
              <%
                for ( TypeProducts t : listType
                     ) {
              %>
                <option value="<%=t.getNameType()%>"> <%=t.getNameType()%>  </option>
                <%}%>
              </select>


          </div>

          <div class='add-input'>
            Món ăn Combo:<span>*</span>
            <input type='text' name='optionCombo' placeholder=" "value=" ">
          </div>

          <div class='add-input'>
              Món ăn Sale:<span>*</span>
              <input type='text' name='optionSale' placeholder=" "value=" ">
            </div>

          <div class='add-input'>
            Size:<span>*</span>
            <input type='text' name='optionSize' placeholder=" "value=" ">
          </div>

            <div class='add-input'>
              Trạng thái: <span>*</span>
              <input type='text' name='optionStatus' placeholder=" "value=" ">
            </div>

          <div class='add-input'>
           Hình ảnh:<span>*</span>
            <input type="file" id="myfile" name="myfile"><br><br>
          </div>




      </div>

      <input class="btn" type="submit" value="Submit">

        </form>
<%--        <div class="item">--%>
<%--          <label for="fname">Tên món ăn<span>*</span></label>--%>
<%--          <input id="fname" type="text" name="tenmonan" />--%>
<%--        </div>--%>
<%--        <div class="item">--%>
<%--          <label for="fname"> Giá niêm yết<span>*</span></label>--%>
<%--          <input id="fname" type="text" name="niemyet" />--%>
<%--        </div>--%>
<%--        <div class="item">--%>
<%--          <label for="fname"> Giá bán<span>*</span></label>--%>
<%--          <input id="fname" type="text" name="giaban" />--%>
<%--        </div>--%>
<%--        <div class="item">--%>
<%--          <label for="fname"> Số lượng<span>*</span></label>--%>
<%--          <input id="fname" type="text" name="soluong" />--%>
<%--        </div>--%>
<%--        <div class="item">--%>
<%--          <label for="fname"> Mô tả<span>*</span></label>--%>
<%--          <input id="fname" rows="4" type="text" name="Mota" />--%>
<%--        </div>--%>

<%--        <div class="question">--%>
<%--          <label>Món ăn hot:</label>--%>
<%--          <div class="question-answer">--%>
<%--            <div>--%>
<%--              <input type="radio" value="HOT" id="radio_3" name="optionHot"/>--%>
<%--              <label for="radio_3" class="radio"><span>HOT</span></label>--%>
<%--            </div>--%>
<%--            <div>--%>
<%--              <input  type="radio" value="NORMAL" id="radio_4" name="participants"/>--%>
<%--              <label for="radio_4" class="radio"><span>NORMAL</span></label>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>

<%--        <div class="question-2">--%>
<%--          <label>Loại món ăn:</label>--%>
<%--          <div class="question-answer">--%>
<%--            <select id="food" name="optionType">--%>
<%--              <%--%>
<%--                for (TypeProducts t : listType--%>
<%--                     ) {--%>
<%--              %>--%>
<%--              <option value="<%=t.getNameType()%>"><%=t.getNameType()%></option>--%>
<%--             <%}%>--%>
<%--            </select>--%>


<%--          </div>--%>
<%--        </div>--%>
<%--        <div class="question-3">--%>
<%--          <label>Giảm giá:</label>--%>
<%--          <div class="question-answer">--%>
<%--            <select id="food" name="optionSale">--%>
<%--              <option value="SALE1">GIẢM GIÁ</option>--%>
<%--              <option value="SALE2">KHÔNG GIẢM</option>--%>

<%--            </select>--%>


<%--          </div>--%>
<%--        </div>--%>
<%--        <div class="question-3">--%>
<%--          <label>Giảm giá:</label>--%>
<%--          <div class="question-answer">--%>
<%--            <select id="food" name="optionStatus">--%>
<%--                <option value="CÒNHÀNG">CÒN HÀNG</option>--%>
<%--            </select>--%>
<%--          </div>--%>
<%--        </div>--%>

<%--        <div class="question-3">--%>
<%--          <label>Combo:</label>--%>
<%--          <div class="question-answer">--%>
<%--            <select id="food" name="optionCombo">--%>
<%--              <option value="0">NoCombo</option>--%>
<%--              <option value="1">Combo</option>--%>
<%--            </select>--%>
<%--          </div>--%>
<%--        </div>--%>

<%--        <div class="question-3">--%>
<%--          <label>Combo:</label>--%>
<%--          <div class="question-answer">--%>
<%--            <select id="food" name="optionSize">--%>
<%--              <option value="SIZE1">SIZE1</option>--%>
<%--              <option value="SIZE2">SIZE2</option>--%>
<%--            </select>--%>
<%--          </div>--%>
<%--        </div>--%>


<%--        <div action="" class="question-4">--%>
<%--          <label for="myfile" id="text">Chọn Hình Ảnh : </label><br><br>--%>
<%--          <input type="file" id="myfile" name="myfile"><br><br>--%>
<%--        </div>--%>
<%--        <button class="btn" >Cập Nhật</button>--%>
<%--        <button class="btn">Xóa</button>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>

<%--  </div>--%>
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
</html>
