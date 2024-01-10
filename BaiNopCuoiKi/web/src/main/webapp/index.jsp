<%@ page import="main.bean.TypeProducts" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.bean.Products" %>
<%@ page import="main.bean.User" %>
<%@ page import="main.services.AppService" %><%--
  Created by IntelliJ IDEA.
  User: thoai
  Date: 5/01/2023
  Time: 7:10 pm
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <link rel="stylesheet" href="css/stylle.css" type="text/css">
    <link rel="stylesheet" href="css/index.css">
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

                            <a href="getUserInfor"><i class="fa fa-user" ></i> <%= a +  user.getName()%></a>
                            <a href="getLogOut"><i class="fa fa-sign-out" ></i> Thoát</a>

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
                        <li class = "active"><a href="getIndex">Trang Chủ</a></li>
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
                            if( user!=null){

                        %>
                        <%
                            if (user.getRole()>=1  ) {
                        %>
                        <li> <a href="getUserInfor"> <i class="fa fa-user"></i> </a></li>
                        <li> <a href="ServletGetInforDB"> <i class="	fas fa-user-edit"></i> </a></li>
                        <% }else{
                        %>
                        <li> <a href="getUserInfor"> <i class="fa fa-user"></i> </a></li>
                        <%}%>
                        <%}else{ %>
                        <li> <a href="DangNhap.jsp"> <i class="fa fa-user"></i> </a></li>
                        <%}%>
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

<!-- Hero Section Begin -->
<section class="hero">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Danh Mục</span>
                    </div>
                    <%
                        String error = (String) request.getAttribute("error");
                    %>
                    <%
                        if (error != null) {
                    %>
                    <SCRIPT >
                        alert ("<%=error %>")
                    </script>
                    <%
                        }
                    %>
                    <%
                        ArrayList<TypeProducts> listT = (ArrayList<TypeProducts>) request.getAttribute("alltype");
                        for (TypeProducts item: listT) {
                    %>
                    <ul>
                        <li><a href="getAllProductByType?type=<%=item.getIdType()%>" ><%=item.getNameType()%></a></li>
                    </ul>
                    <%}%>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="SearchControl">
                            <input type="text" placeholder="Bạn Muốn Ăn Gì ?" name="txt">
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
                <div class="hero__item set-bg" data-setbg="img/1.png">
                    <div class="hero__text">
                        <span>SBE </span>
                        <h2>Rẻ như bèo <br />nghèo cũng có tiền mua</h2>
                        <p>Ăn là sẽ nhớ - nhớ rồi sẽ mua </p>
                        <a href="getAllProduct" class="primary-btn">MUA NGAY</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!--Hàng Xịn-->

<!-- Categories Section Begin -->

<section class="categories">
    <div class="container">
        <div class="col-lg-12">
            <div class="section-title">
                <h2>Món Giảm Giá</h2>
            </div>
        </div>
        <div class="row">
            <div class="categories__slider owl-carousel">
                <%
                    ArrayList<Products> listP = (ArrayList<Products>) request.getAttribute("productBySale");
                    for (Products p : listP) {
                %>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="<%=p.getIdImg()%>">
                        <label>-20%</label>
                        <h5><a href="detail?type=<%=p.getIdType()%>&fid=<%=p.getID_food()%>"><%=p.getFoodName()%></a></h5>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->
<div class="banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">   <img src="img/banner/banner-2.jpg" alt="">

                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="img/banner/BANNER1.png" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Featured Section Begin -->
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Món Hot Hòn Họt</h2>
                </div>
            </div>
        </div>
        <a href="getAllProduct" class="more">Xem Thêm <i class="fa fa-bars" aria-hidden="true"></i> </a>
        <div class="row featured__filter">
            <%
                ArrayList<Products> listH = (ArrayList<Products>) request.getAttribute("productByHot");
                for (Products p : listH) {

            %>
            <div class="col-lg-3 col-md-4 col-sm-6 ">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="<%=p.getIdImg()%>">
                        <ul class="product__item__pic__hover">
                            <li><a href="ServletAddFavourite?idf=<%=p.getID_food()%>"><i class="fa fa-heart"></i></a></li>
                            <li><a href="addtoCart?id=<%=p.getID_food()%>"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="detail?type=<%=p.getIdType()%>&fid=<%=p.getID_food()%>"><%=p.getFoodName()%></a></h6>
                        <h5><%=AppService.intToVND(p.getPrice())%></h5>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</section>
<section class="Banner">
    <div class="container">
        <div class="bannerctn">
            <img class="imgbnr" src="img/22-222655_fast-delivery-vector-png-transparent-png.png">

            <div><a href="">Đặt Ngay Nào</a></div>
        </div>
    </div>
</section>
<!-- Featured Section End -->
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>ComBo </h2>
                </div>
            </div>
        </div>
        <a href="getAllProduct" class="more">Xem Thêm <i class="fa fa-bars" aria-hidden="true"></i> </a>
        <div class="row featured__filter">
            <%
                ArrayList<Products> listCb = (ArrayList<Products>) request.getAttribute("productByCombo");
                for (Products p : listCb) {

            %>

            <div class="col-lg-3 col-md-4 col-sm-6 mix ">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="<%=p.getIdImg() %>">
                        <ul class="product__item__pic__hover">
                            <li><a href="ServletAddFavourite?idf=<%=p.getID_food()%>"><i class="fa fa-heart"></i></a></li>
                            <li><a href="addtoCart?id=<%=p.getID_food()%>"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="detail?type=<%=p.getIdType()%>&fid=<%=p.getID_food()%>"><%=p.getFoodName()%></a></h6>
                        <h5><%=AppService.intToVND(p.getPrice())%></h5>
                    </div>
                </div>
            </div>
            <%}%>

        </div>
    </div>
</section>

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
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>

<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>

</body>

</html>
</html>
