<%@ page import="java.util.Collection" %>
<%@ page import="main.services.AppService" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.bean.*" %>
<!DOCTYPE html>
<html lang="zxx">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="css/formoder.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="getIndex">Home</a></li>
                <li><a href="getAllProduct">Shop</a></li>
                <!--  <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul> -->
                </li> -->
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i>  2013046*@st.hcmuaf.edu.vn</li>
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
                            <li><a href="./blog.html">Giới Thiệu</a></li>
                            <li><a href="./contact.html">Liên Hệ</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="getUserInfor"><i class="fa fa-user"></i></a></li>
                            <li><a href="./shoping-cart.html"><i class="fa fa-shopping-bag"></i> <span></span></a></li>
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
    <section class="hero hero-normal">
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
                                <h5>+86 985034347</h5>
                                <span>Hỗ trợ  24/7 </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/ad.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Giỏ Hàng</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Giỏ Hàng</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Món</th>
                                    <th>Giá</th>
                                    <th>Số Lượng</th>
                                    <th>Thành Tiền</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
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
                                        String c = "0";
                                        String b = (String) session.getAttribute("total");

                                        if(b!=null){

                                        }
                                        Cart cart = (Cart)session.getAttribute("cart");

                                        if (cart != null) {

                                            Collection<Products> list = cart.getListProduct();
                                            for (Products p : list) {
                                    %>
                                    <tr>
                                    <td class="shoping__cart__item">
                                        <img src=" <%=p.getPath()%>" alt=""style="    max-width: 20%;">
                                        <h5>    <%=p.getFoodName()%></h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        <%=AppService.intToVND(p.getLISTED_PRICE2())%>

                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">


                                                <span>
                                                     <%=p.getQuantity()%>
                                                </span>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        <%=AppService.intToVND(p.getLISTED_PRICE2() * p.getQuantity())%>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <a href="removeInCart?id=<%=p.getID_food()%>"><span  class="icon_close"></span></a>
                                    </td>
                                </tr>

                                    <%
                                        }
                                    } else {
                                    %>
                                    <tr>
                                        <td class="shoping__cart__item">

                                        </td>
                                        <td class="shoping__cart__price">

                                        </td>
                                        <td class="shoping__cart__quantity">
                                            <div class="quantity">

                                            </div>
                                        </td>
                                        <td class="shoping__cart__total">

                                        </td>
                                        <td class="shoping__cart__item__close">

                                        </td>
                                    </tr>
                                    <%

                                        }

                                    %>
                            <%

                            %>



                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="getAllProduct" class="primary-btn cart-btn">Tiếp tục</a>
                        <a href="showCart" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>Cập nhật</a>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <%int stage = (int) request.getAttribute("stage");
                        System.out.println(stage);
                        %>
                        <form id="form1" method="post" action="ServletResetFormoder">
                            <input type="hidden" id="stage" name="stage" value=<%=request.getAttribute("stage")%>>
                        <h5>Tổng Đơn Hàng</h5>
                        <ul>
                            <%
                            if(b==null){
                            b=c;
                            }
                            %>
                            <li>Tổng Tiền <span><%= b%></span></li>
                            <select name="diachi1" id="diachi1">
                                <option value="999" disabled selected="selected" >Mời nhập địa chỉ của bạn</option>
                                <% ArrayList<APIDistrictRespone.data> rs = (ArrayList<APIDistrictRespone.data>) request.getAttribute("listdiachi1");
                                    for ( APIDistrictRespone.data az:rs) {
                                %>
                                <option value=<%=az.getDistrictID()%> ><%=az.getDistrictName()%></option>
                                <%};%>
                            </select>
                                <%if (stage==0){%>
                            <ul>
                                <button type="submit" form="form1" value="Submit">Chọn</button>
                            </ul>
                                <%}%>
                            <%
                            if(stage==1){%>
                                <select name="diachi2" id="diachi2">
                                    <option value="999" disabled selected="selected" >Mời nhập địa chỉ của bạn</option>
                                    <% ArrayList<APIwardRespone.data> rs1 = (ArrayList<APIwardRespone.data>) request.getAttribute("listdiachi2");
                                        for ( APIwardRespone.data az1:rs1) {
                                    %>
                                    <option value=<%=az1.getWardCode()%> ><%=az1.getWardName()%></option>
                                    <%};%>
                                </select>
                                <ul>
                                    <button type="submit style="
                                            margin-top: 5%;
                                            width: 100% form="form1" value="Submit">Xác nhận</button>
                                </ul>
                            <%}%>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

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
                            <li ><a href="getAllProduct">Gian Hàng</a></li>
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
    <!-- Footer Section End -->>

    <script>

    </script>
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