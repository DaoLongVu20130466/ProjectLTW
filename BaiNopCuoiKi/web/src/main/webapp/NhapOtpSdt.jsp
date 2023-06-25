<%@ page import="main.bean.Products" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
<%@ page import="main.bean.User" %>
<%@ page import="main.bean.UserPemission" %>
<%@ page import="main.services.SendPhoneOTP" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">

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
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <script src="sweetalert2.min.js"></script>
    <link rel="stylesheet" href="sweetalert2.min.css">
    >
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="css/admincss.css">
    <style> .container-form {
        background-image: url(./img/1.png);
    }</style>
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
                <div class="col-lg-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> vn.edu.hcmuaf.fit</li>
                            <li>Miễn phí giao hàng ngày 20/10</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-pinterest-p"></i></a>
                        </div>
                        <div class="header__top__right__language">
                            <img src="img/language.png" alt="">
                            <div>Tiếng Việt</div>
                            <span class="arrow_carrot-down"></span>
                            <ul>
                                <li><a href="#">Tiếng Việt</a></li>
                                <li><a href="#">English</a></li>
                            </ul>
                        </div>
                        <div class="header__top__right__auth">
                            <a href="#"><i class="fa fa-user"></i>...</a>
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


                        <li><a href="#">Bạn cần giúp đỡ gì?</a>
                            <ul class="header__menu__dropdown">
                                <li><a href="https://www.facebook.com/thoaihuu291">Về việc đăng nhập</a></li>
                                <li><a href="https://www.facebook.com/thoaihuu291">Về việc đăng ký</a></li>
                                <li><a href="https://www.facebook.com/thoaihuu291">Về việc quên mật khẩu</a></li>
                            </ul>
                        </li>
                        <li><a href="./blog.html">Liên hệ</a></li>

                    </ul>
                </nav>
            </div>

        </div>

    </div>
</header>
<div class="container-form">
    <div class="card text-center" style="width: 300px;">
        <div class="card-header h5 text-white bg-primary">Đổi mật khẩu</div>
        <div class="card-body px-5">
            <p class="card-text py-2">
                Xin mời nhập mã otp
            </p>
            <%
                SendPhoneOTP newotp = (SendPhoneOTP) request.getAttribute("otp");
                User user = (User) session.getAttribute("auth");
            %>
            <form onsubmit="return cheking()" name="formreset" id="formreset" method="post" action="ServletCheckOTP">
                <div class="form-outline">
                    <input name="name1" type="text"/>
                    <input id="xacnhanreset" type="submit" value="Xác nhận">
                </div>

            </form>
            <%
                if (request.getAttribute("arlert") != null && request.getAttribute("arlertw") != null) {
                    SendPhoneOTP otp = (SendPhoneOTP) request.getAttribute("arlert");
                    String arlert = request.getAttribute("arlertw").toString();
                    if (arlert.equals("wrong")) {%>
            <p class="card-text py-2" style="color:red;">
                Bạn đã nhập sai, vui lòng nhập lại !
            </p>
                    <%} else if (arlert.equals("lock")) {%>
            <p class="card-text py-2" style="color:red;">
                Tài khoản của bạn đã bị khóa !
            </p>



            %>
            <% }
            }%>


            <div class="d-flex justify-content-between mt-4">
                <a class="" href="#">Login</a>
                <a class="" href="#">Register</a>
            </div>
        </div>
    </div>
</div>

<script>
    function cheking() {
        var a = document.forms["formreset"]["name1"].value;
        if (a == null || a == "") {
            showdiaLog('Vui lòng nhập đầy đủ thông tin !');
            return false;
        } else return true;
    }

    function showdiaLog(string) {
        Swal.fire({
            icon: 'error',
            text: string,
        })
    }
</script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>


</body>

</html>