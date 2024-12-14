<%@ page import="main.bean.Products" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
<%@ page import="main.bean.User" %>
<%@ page import="main.bean.TypeProducts" %>
<%@ page import="main.services.AddOderService" %>
<%@ page import="main.services.AppService" %><%--
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
                    <a href="getIndex"><img src="img/a.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li ><a href="getIndex">Trang Chủ</a></li>
                        <li class="active"><a href="getAllProduct">Gian Hàng</a></li>

                        <li><a href="blog.jsp">Giới Thiệu</a></li>
                        <li><a href="contact.jsp">Liên Hệ</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>

                        <li><a href="getUser"><i class="fa fa-user"></i> </a></li>

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
<!-- Header Section End -->


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/ad.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>SBE Shop</h2>
                    <div class="breadcrumb__option">
                        <a href="getIndex">Trang chủ</a>
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
                                         data-setbg="<%=p.getIdImg()%>">

                                        <ul class="product__item__pic__hover">
                                            <li><a href="ServletAddFavourite?idf=<%=p.getID_food()%>"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="addtoCart?id=<%=p.getID_food()%>"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span><%=p.getIdType()%></span>
                                        <h5><a href="detail?type=<%=p.getIdType()%>&fid=<%=p.getID_food()%>"><%=p.getFoodName()%></a></h5>
                                        <div class="product__item__price"><%=AppService.intToVND(p.getPrice())%></div>
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
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="<%=p.getIdImg()%>">
                        <ul class="product__item__pic__hover">
                            <%
                                if (a != null) {
                            %>
                            <li><a href="ServletAddFavourite?idf=<%=p.getID_food()%>"><i class="fa fa-heart"></i></a></li>

                            <li><a href="addtoCart?id=<%=p.getID_food()%>"><i class="fa fa-shopping-cart"></i></a></li>
                            <% }else{%>
                            <li><a href="DangNhap.jsp"><i class="fa fa-heart"></i></a></li>

                            <li><a href="DangNhap.jsp"><i class="fa fa-shopping-cart"></i></a></li>
                            <%}%>

                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="detail?type=<%=p.getIdType()%>&fid=<%=p.getID_food()%>"><%=p.getFoodName()%></a></h6>
                        <h5><%=AppService.intToVND(p.getPrice())%></h5>
                    </div>
                </div>
            </div>
            <%}%>



    </div>


    <div class="product__pagination">
        <a class href="getAllProduct?page=<%= left %>"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
        <%if(n >8) {
        %>
        <a class href="getAllProduct?page=<%=0%>"><%=1%> </a>
        <a class href="getAllProduct?page=<%= left+2 %>"><%= left+2%> </a>
        <a class href="getAllProduct?page=<%= left+3 %>"><%= left+3%> </a>
        <a class href="getAllProduct?page=<%= left+4 %>"><%= left+4%> </a>
        <a class href="#">...</a>
        <a class href="getAllProduct?page=<%= left+7 %>"><%= left+7%> </a>

        <%}else{
            for (int i = 1 ; i <= n ; i++) {
        %>
        <a class href="getAllProduct?page=<%= i-1 %>"><%= i%> </a>
        <%} }%>
        <a class href="getAllProduct?page=<%=right%>"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
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
                        <a href="getIndex"><img src="img/a.png" alt=""></a>
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
<style>.product__pagination{margin-left: 18%;}</style>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>



</body>

</html>

