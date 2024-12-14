<%@ page import="main.bean.User" %>
<%@ page import="java.util.ArrayList" %>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <!-- Css Styles -->
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/stylle.css" type="text/css">
    <link rel="stylesheet" href="css/admincss.css">
    <style> .container-form {background-image: url(./img/1.png);}</style>
    <script src="https://cdn.ckeditor.com/ckeditor5/35.3.0/classic/ckeditor.js"></script>
</head>

<body style="height: 1200px">
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
                            </ul>
                        </div>
                        <div class="header__top__right__auth">
                            <a href="Documents/GitHub/ProjectLTW/BaiNopCuoiKi/web/src/main/webapp/DangNhap.jsp"><i class="fa fa-user"></i> Đăng Nhập</a>
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
                    <a href="Documents/GitHub/ProjectLTW/BaiNopCuoiKi/web/src/main/webapp/index.jsp"><img src="img/a.png" alt=""></a>
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
    <div class="form_lg">
        <p1>Đăng ký</p1>

        <form action="registry" class="main-form" id ="main-formm"onSubmit="return checkPw(this)">

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

            <div class='login-input'>
                Tài khoản:
                <input type='text' name='username' placeholder="Sđt hoặc Tên người dùng "value="<%= request.getParameter("username")!=null?request.getParameter("username"):"" %>" required>
            </div>
            <div class='login-input'style=" position: relative;">
                Mật khẩu:
                <input placeholder="Mật khẩu "oncopy="return false;"style="  padding-right: 40px;" type="password" name="password" id="passwordInput" class="form-control">
                <span class="toggle-icon"  style=" position: absolute;
      top: 50%;
      right: 10px;
      transform: translateY(-50%);
      cursor: pointer;" onclick="togglePassword()">
                <i class="far fa-eye"></i>
                </span>
            </div>
            <div class='login-input'style=" position: relative;">
                Mật khẩu:
                <input placeholder=" Nhập lại mật khẩu " style="  padding-right: 40px;" type="password" id="passwordInputCF" name="passwordag" class="form-control">
                <span class="toggle-icon"  style=" position: absolute;
      top: 50%;
      right: 10px;
      transform: translateY(-50%);
      cursor: pointer;" onclick="togglePasswordCF()">
                <i class="far fa-eye"></i>
                </span>
            </div>
            <div class='login-input'>
                Email:
                <input type='email' name='email' placeholder="Email của bạn"value="<%= request.getParameter("email")!=null?request.getParameter("email"):"" %>" required>
            </div>
            <div class='login-input'>
                SDT:
                <input type='text' name='phone' placeholder="SDT của bạn"value="<%= request.getParameter("phone")!=null?request.getParameter("phone"):"" %>" required>
            </div>
            <input type="submit" name="Đăng ký" class="btn" style="height: 45px;" value="Đăng ký">

            <div class="input-and-icon">
                <div class="input-and-icon">
                    <div>
                        <i class="fa fa-commenting-o" aria-hidden="true"> Cảm ơn đã tin tưởng</i>
                    </div>
                </div>
                <a>Nếu đã chưa có tài khoản hay ấn vào đây: </a> <i> <a href="DangNhap.jsp">Đăng nhập</a></i>
            </div>


        </form>
    </div>
</div>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<SCRIPT LANGUAGE="JavaScript">
    function togglePassword() {
        var passwordInput = document.getElementById("passwordInput");
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
        } else {
            passwordInput.type = "password";
        }
    }
    function togglePasswordCF() {
        var passwordInput = document.getElementById("passwordInputCF");
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
        } else {
            passwordInput.type = "password";
        }
    }
    function checkPw(form) {
        pw1 = form.password.value;
        pw2 = form.passwordag.value;

        if (pw1 != pw2) {
            alert ("\nMật Khẩu nhập lại không khớp vui lòng nhập lại")
            return false;
        }
        else return true;
    }

</script>
<script>
    var passwordInput = document.getElementById("passwordInput");

    passwordInput.addEventListener("copy", function(event) {
        event.preventDefault(); // Ngăn chặn hành vi copy mặc định
        alert("Sao chép mật khẩu đã bị chặn.");
    });
</script>

</body>

</html>