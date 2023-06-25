<%@ page import="main.bean.Products" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.bean.User" %><%--
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
  <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
        rel="stylesheet"  type='text/css'>
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
            <%
              if (user.getRole()>=1) {
            %>
            <li> <a href="getUserInfor"> <i class="fa fa-user"></i> </a></li>
            <li> <a href="getPageAD"> <i class="	fas fa-user-edit"></i> </a></li>
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
              <li><a href="ServletGetInforDB"><i class="fa fa-tachometer" aria-hidden="true"></i> Doanh Thu </a></li>
              <li><a href="getAllProductByAdmin"><i class="fa fa-shopping-bag" aria-hidden="true"></i> Sản Phẩm </a></li>
              <li><a href="ServletAddNewProduct"><i class="fa fa-plus-square-o" aria-hidden="true"></i> Thêm Mặt Hàng</a></li>
              <li><a href="getUserControl"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Quản Lý Tài Khoản</a></li>
              <li><a href="ServletGetAllOder"><i class="fa fa-square" aria-hidden="true"></i> Truy Xuất Đơn Hàng</a></li>
              <li><a href="ServletVoucher"><i class="fa fa-gift" aria-hidden="true"></i> Tặng Voucher</a></li>
              <li><a href="getActivate"><i class="fa fa-gift" aria-hidden="true"></i> Hoạt Động</a></li>

            </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-10 col-md-5">
        <h2>Toàn bộ sản phẩm:</h2>
        <div class="TaiKhoan">
          <form action="ServletSearchInAd">
          <input type="text" class="cd-search table-filter" data-table="order-table" placeholder="Item to filter.." name="txt" />
            <button type="submit" class="site-btn">TÌM</button>
          </form>
          <table class="cd-table order-table table">
            <thead>
            <tr>
              <th>Tên Món Ăn</th>
              <th>Giá Món Ăn (VND)</th>
              <th>ID Món Ăn</th>
              <th>Loại Món Ăn</th>

              <th>Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <%
              int left = (int) request.getAttribute("left");
              int right = (int) request.getAttribute("right");
              int n =(int) request.getAttribute("page");
              if( n % 12 == 0 )
              {n = n/12;}
              else {n = n/12 + 1;}
              ArrayList<Products> list = (ArrayList<Products>) request.getAttribute("allproducts");
              for (Products p : list)
              {
            %>
            <tr>
              <td><%=p.getFoodName()%></td>
              <td><%=p.getBasePrice()%></td>
              <td><%=p.getID_food()%></td>
              <td><%=p.getIdType()%></td>

              <td><a href="editProduct?fid=<%=p.getID_food()%>&size=<%=p.getIdSize()%>"><i class="fa fa-lock" aria-hidden="true"></i>Chỉnh sửa</a><br>
                <a href="deleteF?fid=<%=p.getID_food()%>"> <i class="fa fa-trash-o "aria-hidden=true"></i> Xóa</a><br>
                <a href="detail?type=<%=p.getIdType()%>&fid=<%=p.getID_food()%>"> <i class="fa fa-home" aria-hidden="true"></i>Xem trực tiếp</a></td>
            </tr>
              <%}%>
            </tbody>
          </table>
        </div>
        <div class="product__pagination">
          <a class href="getAllProductByAdmin?page=<%= left %>"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
          <%if(n >8) {
          %>
          <a class href="getAllProductByAdmin?page=<%=0%>"><%=1%> </a>
          <a class href="getAllProductByAdmin?page=<%= left+2 %>"><%= left+2%> </a>
          <a class href="getAllProductByAdmin?page=<%= left+3 %>"><%= left+3%> </a>
          <a class href="getAllProductByAdmin?page=<%= left+4 %>"><%= left+4%> </a>
          <a class href="#">...</a>
          <a class href="getAllProductByAdmin?page=<%= left+7 %>"><%= left+7%> </a>

        <%}else{
            for (int i = 1 ; i <= n ; i++) {
          %>
          <a class href="getAllProductByAdmin?page=<%= i-1 %>"><%= i%> </a>
          <%} }%>
          <a class href="getAllProductByAdmin?page=<%=right%>"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
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
