<%@ page import="main.bean.Cart" %>
<%@ page import="main.bean.Products" %>
<%@ page import="java.util.Collection" %>
<%@ page import="main.services.AppService" %>
<%@ page import="main.bean.User" %>
<!DOCTYPE html>
<html lang="zxx">
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SBE</title>

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
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
  
    
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
                            <li><a href="getIndex">Trang Chủ</a></li>
                            <li ><a href="getAllProduct">Gian Hàng</a></li>
<!--                            <li><a href="#">Pages</a>-->
<!--                                <ul class="header__menu__dropdown">-->
<!--                                    <li><a href="./shop-details.html">Shop Details</a></li>-->
<!--                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>-->
<!--                                    <li><a href="./checkout.html">Check Out</a></li>-->
<!--                                    <li><a href="./blog-details.html">Blog Details</a></li>-->
<!--                                </ul>-->
<!--                            </li>-->

                            <li><a href="./blog.html">Giới Thiệu</a></li>
                            <li><a href="./contact.html">Liên Hệ</a></li>
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
                            <li> <a href="ServletGetInforDB"> <i class="fas fa-user-edit"></i> </a></li>
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

    <!-- Header Section End -->
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
                        <ul>
                            <li><a href="Comsuon.html">Cơm Sườn</a></li>
                            <li><a href="ComChien.html">Cơm Chiên</a></li>
                            <li><a href="ComMon.html">Cơm Món</a></li>
                            <li><a href="Haisan.html">Hải sản</a></li>
                            <li><a href="ComBo.html">Cơm Bò</a></li>
                            <li><a href="ComGa.html">Cơm Gà</a></li>
                            <li><a href="Bun_Pho.html">Các món Bún, Phở</a></li>
                            <li><a href="ThucUong.html">Thức uống</a></li>
                            <li><a href="MonCanh.html">Món canh</a></li>
             
             
                        </ul>
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
                        <h2>Thanh toán</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Thanh toán</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
          
            <div class="checkout__form">
                <h4>Chi tiết thanh toán</h4>
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Tên<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Ngày sinh<span>*</span></p>
                                        <input type="date">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Địa chỉ<span>*</span></p>
                                <input type="text">
                            </div>
                
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Số điện thoại<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="email">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input__checkbox">
                                
                            </div>
                            
                            <div class="checkout__input">
                                <p>Xác nhận mật khẩu<span>*</span></p>
                                <input type="text">
                            </div>
                            <!-- <div class="checkout__input__checkbox">
                                <label for="diff-acc">
                                
                                    <input type="checkbox" id="diff-acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div> -->
                            <div class="checkout__input">
                                <p>Ghi chú<span>*</span></p>
                                <textarea id="textarea" placeholder="Your Messenger Here..." name="textarea" style="width:100% ; height: 100px;"></textarea>
                             
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Đơn hàng của bạn</h4>
                                <div class="checkout__order__products">Món ăn <span>Tổng</span></div>
                                <ul>
                                   <%
                                       Cart cart = (Cart)session.getAttribute("cart");
                                       Collection<Products> list = cart.getListProduct();
                                       for (Products p : list) {


                                       %>
                                </ul>

                                <div class="checkout__order__total">Thành tiền <span>200000 VND</span></div>

                                <%}%>
                                <p>Cảm ơn bạn đã đã đặt hàng, món ăn của bạn sẽ sớm được giao.</p>
                               
                             
                                <button type="submit" class="site-btn">Thanh toán</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

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

 

</body>

</html>