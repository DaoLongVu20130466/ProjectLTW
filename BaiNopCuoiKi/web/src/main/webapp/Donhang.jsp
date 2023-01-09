<%@ page import="main.bean.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.bean.User" %>
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
    <title>SBE-Cơm Trưa</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/index.css"type="text/css">
    <link rel="stylesheet" href="css/User.css"type="text/css">

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
                                User userID = (User) request.getAttribute("userID");
                                String tag2 = (String) request.getAttribute("tag2");

                            %>
                            <%
                                if (a == null) {
                            %>
                            <a href="DangNhap.jsp"><i class="fa fa-user"></i> Đăng Nhập</a>
                            <%
                            }else{
                            %>
                            <div class="fa fa-user" role="alert">
                                <%= a+user.getName() %>
                            </div>
                            <%
                                }
                            %>
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


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/ad.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>SBE Shop</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Trang chủ</a>
                        <span>User</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->
<section class="product spad">
    <div class="userr">
        <div class="container">
            <div class="row">


                <div class="align-self-start">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <ul>
                                <li ><a href="getUserInfor"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Thông Tin </a></li>
                                <li><a href="getUIFOder"><i class="fa fa-shopping-bag" aria-hidden="true"></i> Đơn Hàng </a></li>
                                <li><a href="getAllFavourite"><i class="fa fa-heart" aria-hidden="true"></i> Yêu Thích </a></li>
                                <li><a href="DoiMatKhau.html"><i class="fa fa-refresh" aria-hidden="true"></i>Đổi Mật Khẩu</a></li>

                                <li><a href="GetVoucherUser"><i class="fa fa-gift" aria-hidden="true"></i>Voucher</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-lg-10 col-md-5" style="height: 340px;">
                    <!-- Thong tin -->
                    <!-- Thong tin -->
                    <!-- Thong tin -->
                    <div class="wrapper">
                        <div class="left">
                            <img src="<%=userID.getAvatar()%>" alt="user" width="100">
                            <h4><%=userID.getUserName()%></h4>
                            <p></p>
                        </div>
                        <div class="right">
                            <div class="info">

                                <div class="chinhsuainfo"> <h3>Thông tin</h3>    <a href="Chinhsuathongtin.html" style="background-color: #2ec791;margin-left: 23%;height: 40px;width: 100px;color: #000000;border-radius: 3px;padding: 8px 0px 5px 15px;">Chỉnh sửa</a></div>

                                <div class="info_data"> <div class="data">
                                    <h4> Ngày sinh</h4>
                                    <p> 24/12/2002</p>
                                </div>
                                    <div class="data">
                                        <h4>Địa CHỉ</h4>
                                        <p><%=userID.getProvine()%></p>
                                    </div>
                                </div>
                                <div class="projects_data">
                                    <div class="data">
                                        <h4>Email</h4>
                                        <p><%=userID.getEmail()%>></p>
                                    </div>
                                    <div class="data">
                                        <h4>Phone</h4>
                                        <p><%=userID.getPhoneNumber()%></p>
                                    </div>
                                </div>
                                <div class="projects_data">
                                    <div class="data">
                                        <h4>Số Đơn Đã Ủng Hộ</h4>
                                        <p>25</p>
                                    </div>
                                    <div class="data">
                                        <h4>Trạng thoái</h4>
                                        <p><%=userID.getStatus()%>></p>
                                    </div>


                                </div>

                            </div>
                        </div>

                    </div>

                    <!--  End -->


                </div>


    <div class="userr">
        <div class="TaiKhoan">
            <h2 style="margin-left: 42%;margin-bottom: 20px;">Đơn Hàng</h2>
          <table class="cd-table order-table table">
            <thead>
            <tr>
              <th>Mã Đơn</th>
              <th>Địa Chỉ</th>
              <th>Số Tiền</th>
              <th>Trạng Thái</th>
              <th>Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Order> list = (ArrayList<Order>) request.getAttribute("alloder");
                for (Order item: list) {
            %>
            <tr>
              <td><%=item.getIdOder()%>></td>
              <td><%=item.getAddress().getProvine()%></td>
              <td><%=item.getUserTotalCost()%></td>
              <td><%=item.getStatus()%>></td>
              <td><a href="/web_war/ServletUIFOder?isuser=<%="ddd"%>&&idoder=<%=item.getIdOder()%>"><i class="fa fa-file" aria-hidden="true"></i> Chi Tiết  </a>
                  <a href="/web_war/ServletUDeleteOder?isuser=<%="ddd"%>&&idoder=<%=item.getIdOder()%>" style="color: red;"><i class="fa fa-trash-o" aria-hidden="true"></i>  Hủy</a></td>
            </tr>

            <%}%>
              </tr>
            </tbody>
          </table>

        </div>
      </div>
     
    </div>
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



</body>

</html>