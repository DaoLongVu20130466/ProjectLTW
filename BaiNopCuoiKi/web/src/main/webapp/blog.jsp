<%@ page import="main.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: thoai
  Date: 10/01/2023
  Time: 8:21 pm
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
  <title>Ogani | Template</title>

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

  <link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
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
            <li><a href="getAllProduct">Gian Hàng</a></li>
            <li class="active"><a href="blog.jsp">Giới Thiệu</a></li>
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
<!-- Header Section End -->

<!-- Hero Section Begin -->
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/ad.jpg">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <div class="breadcrumb__text">
          <h2>Giới Thiệu</h2>
          <div class="breadcrumb__option">
            <a href="getIndex">Trang Chủ</a>
            <span>Giới Thiệu</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Blog Section Begin -->
<section class="blog spad">
  <div class="container">
    <div class="row">
      <div id="welcome" class="container">
        <div class="title">
          <h2>Xin Chào Đến SBE SHOP</h2>
        </div>
        <p>Đây Là <strong>SBE Shop</strong>
          Chúng tôi cung cấp thực phẩm buổi trưa, Giúp bạn luôn tràn đầy năng lượng và sức khỏe để tiêps tục công việc hằng ngày của mình
        </p>
      </div>
      <div id="three-column" class="container">
        <div><span class="arrow-down"></span></div>
        <div id="tbox1">
          <div class="title">
            <h2>Đồ ăn sạch</h2>
          </div>
          <p>Ở đây, chúng tôi nói không với thực phẩm bẩn, không rõ nguồn gốc, tất cả đồ ăn bán ở đây luôn được tuyển chọn và đảm bảo quy trin
            vệ sinh an toàn thực phẩm, đảm bảo xuất ăn tốt nhất dành cho bạn, mọi đồ ăn đều sạch</p>
          <a href="getAllProduct" class="button">Ăn Ngay</a> </div>
        <div id="tbox2">
          <div class="title">
            <h2>Giao Hàng Nhanh</h2>
          </div>
          <p>Tất cả đơn hàng của baạn sẽ được sử lý một cách nhanh nhất, đảm bảo xuất ăn của bạn sẽ đến kịp lúc, chúng tôi luôn đề cao sự tiện dụng và trải nghiệm của kha hàng, niềm vui của bạn là vinh hạnh với chúng tôi</p>
          <a href="showCart" class="button"> Đặt Ngay</a> </div>
        <div id="tbox3">
          <div class="title">
            <h2>Đồ Ăn Rẻ</h2>
          </div>
          <p>Chúng tôi luôn muốn đem đến cho bạn xuất ăn ngon nhất với giá phải chăng nhất, đảm bảo xuất ăn luôn ngon và rẻ, cho nên chúng tôi thường xuyên tặng voucher cho những khách hàng đăng kí tài khoản</p>
          <%
            if( user == null) {
          %>
          <a href="DangNhap.jsp" class="button">Đăng Kí Ngay</a>
          <%}else if (user.getRole()>=1) {
          %>
         <a href="GetVoucherUser" class="button">Đăng Kí Ngay</a>
          <% }else{
          %>
        <a href="GetVoucherUser" class="button">Đăng Kí Ngay</a>
          <%}%>

        </div>
      </div>

    </div>
  </div>
  </div>
</section>
<!-- Blog Section End -->

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
