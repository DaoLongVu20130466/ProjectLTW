<!DOCTYPE html>
<html lang="zxx">
<%@ page import="main.bean.User" %>
<%@ page import="java.util.ArrayList" %>
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
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/admincss.css">
    <style> .container-form {background-image: url(./img/1.png);}</style>
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
         <div class="form_lg" style="justify-content: space-evenly;    height: 100%;">
        <p1>Nhập mật khẩu mới</p1>
             <form  id="passwordForm"  action="Datlaimk">

                 <input type="password" style="font-size: 13.25px;     height: calc(1.5em + 2.75rem + 1px);
    padding: 1.375rem 0.75rem;" class="input-lg form-control" name="password1" id="password1" placeholder="New Password" autocomplete="off">
                 <div class="row">
                     <div class="col-sm-6">
                         <span id="8char" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span><a style="font-size: 13px"> 8 Characters Long</a>
                              <br>
                         <span id="ucase" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> <a style="font-size: 13px">One Uppercase Letter</a>
                     </div>
                     <div class="col-sm-6">
                         <span id="lcase" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span><a style="font-size: 13px"> One Lowercase Letter</a><br>
                         <span id="num" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span><a style="font-size: 13px"> One Number</a>
                     </div>
                 </div>
                 <input type="password"style="font-size: 13.25px;    height: calc(1.5em + 2.75rem + 1px);
    padding: 1.375rem 0.75rem;" class="input-lg form-control" name="password2" id="password2" placeholder="Repeat Password" autocomplete="off">
                 <div class="row">
                     <div class="col-sm-12">
                         <span id="pwmatch" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> Passwords Match
                     </div>
                 </div>
                 <input type="submit" class="col-xs-12 btn btn-primary btn-load btn-lg" data-loading-text="Changing Password..." value="Change Password">
             </form>
        </div>
    </div>
    
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <script>$("input[type=password]").keyup(function(){
        var ucase = new RegExp("[A-Z]+");
        var lcase = new RegExp("[a-z]+");
        var num = new RegExp("[0-9]+");

        if($("#password1").val().length >= 8){
            $("#8char").removeClass("glyphicon-remove");
            $("#8char").addClass("glyphicon-ok");
            $("#8char").css("color","#00A41E");
        }else{
            $("#8char").removeClass("glyphicon-ok");
            $("#8char").addClass("glyphicon-remove");
            $("#8char").css("color","#FF0004");
        }

        if(ucase.test($("#password1").val())){
            $("#ucase").removeClass("glyphicon-remove");
            $("#ucase").addClass("glyphicon-ok");
            $("#ucase").css("color","#00A41E");
        }else{
            $("#ucase").removeClass("glyphicon-ok");
            $("#ucase").addClass("glyphicon-remove");
            $("#ucase").css("color","#FF0004");
        }

        if(lcase.test($("#password1").val())){
            $("#lcase").removeClass("glyphicon-remove");
            $("#lcase").addClass("glyphicon-ok");
            $("#lcase").css("color","#00A41E");
        }else{
            $("#lcase").removeClass("glyphicon-ok");
            $("#lcase").addClass("glyphicon-remove");
            $("#lcase").css("color","#FF0004");
        }

        if(num.test($("#password1").val())){
            $("#num").removeClass("glyphicon-remove");
            $("#num").addClass("glyphicon-ok");
            $("#num").css("color","#00A41E");
        }else{
            $("#num").removeClass("glyphicon-ok");
            $("#num").addClass("glyphicon-remove");
            $("#num").css("color","#FF0004");
        }

        if($("#password1").val() == $("#password2").val()){
            $("#pwmatch").removeClass("glyphicon-remove");
            $("#pwmatch").addClass("glyphicon-ok");
            $("#pwmatch").css("color","#00A41E");
        }else{
            $("#pwmatch").removeClass("glyphicon-ok");
            $("#pwmatch").addClass("glyphicon-remove");
            $("#pwmatch").css("color","#FF0004");
        }
    });</script>

</body>

</html>