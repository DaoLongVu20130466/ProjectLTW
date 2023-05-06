<%@ page import="main.bean.Products" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: thoai
  Date: 5/01/2023
  Time: 4:02 pm
  To change this template use File | Settings | File Templates.
--%><%@ page import="main.bean.User" %>
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
                        <li><a href="getUserInfor"><i class="fa fa-user"></i></a></li>
                        <li><a href="showCart"><i class="fa fa-shopping-bag"></i> <span></span></a></li>
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
                    <h2>Cơm Sà Bì Chưởng</h2>
                    <div class="breadcrumb__option">
                        <a href="">Home</a>
                        <a href="">Cơm gà</a>
                        <span>Cơm gà A Quảng</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <%
                Products pro = (Products) request.getAttribute("product");

            %>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                             src="<%=pro.getPath()%>">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3><%=pro.getFoodName()%></h3>
                    <div class="product__details__price"><%=pro.getLISTED_PRICE()%><p>VND</p></div>
                    <p><%=pro.getDESCRIPTION()%>
                    </p>
                </div>
                    <form action="/web_war/test1" enctype="multipart/form-data" method="get" onSubmit="">
                        <div class='add-input' style="display: none">
                            <input type='text' name='idfood' value="<%=pro.getID_food()%>">
                        </div>
                        <div class="quantity">
                            Số lượng:
                            <div class="pro-qty">
                                <input name="soluong" type="text" value="1">
                            </div>
                        </div>

                    <div>
                        <h4>Size:</h4>
                        <label class="size">Thường
                            <input type="radio" checked="checked" name="radio" value="SIZE1">
                            <span class="checkmark"></span>
                        </label>
                        <label class="size">Đặc biệt
                            <input type="radio" name="radio" value="SIZE2">
                            <span class="checkmark"></span>
                        </label>
                    </div>

                    <ul>
                        <li><b>Tình trạng</b> <span> Còn món ăn</span></li>
                        <li><b>Ghi chú</b> <input type='text' name='ghichu' placeholder="Ghi chu" ></li>

                    </ul>
                    <a href="./addtoCart?id=<%=pro.getID_food()%>">
                    <button class="btn" > Mua món ăn</button></a>

            </form>
            </div>

            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                               aria-selected="true">Mô tả</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                               aria-selected="false">Nhận xét</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>
                                    Thông tin
                                </h6>
                                <p>Cơm gà ở đây được nấu và chế biến thơm ngon và hấp dẫn với
                                    nguyên liệu thịt gà ta được chọn lọc kỹ, là loại gà tơ và
                                    nuôi thả vườn nên đảm bảo thịt mềm mà chắc, vị thơm ngon rất dễ nhận biết.
                                    Cơm gà cũng khá cầu kỳ ở khâu chọn gạo nấu để bên ngoài khô bên trong dẻo thơm.</p>
                                <p>Nên khi chín, hạt cơm vàng ươm, căng tròn và ngọt đượm vị gà. Hạt cơm tơi,
                                    đều và dẻo, ăn cùng gà xé nữa thực sự hết ý. Chắc chắn bạn sẽ phải quay lại khi đã
                                    có cơ hội ăn cơm gà một lần. Điểm cộng đặc biệt của quán đó là có hẳn một đội ngũ shipper
                                    làm việc liên tục, vì vậy dù chỉ đặt có 1 hộp thì vẫn ship bình thường.</p>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="card card-outline-secondary my-4">
                                <div class="card-header">
                                    <h3>Nhận xét</h3>
                                </div>
                                <div class="card-body">
                                    <div class="media mb-3">
                                        <div class="mr-2">
                                            <img class="rounded-circle border p-1" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" alt="Generic placeholder image">
                                        </div>
                                        <div class="media-body">
                                            <p>Cơm gà ở đây được nấu và chế biến thơm ngon và hấp dẫn với
                                                nguyên liệu thịt gà ta được chọn lọc kỹ, là loại gà tơ và
                                                nuôi thả vườn nên đảm bảo thịt mềm mà chắc, vị thơm ngon rất dễ nhận biết.
                                                Cơm gà cũng khá cầu kỳ ở khâu chọn gạo nấu để bên ngoài khô bên trong dẻo thơm.</p>
                                            <small class="text-muted">Đăng bởi QVux ngày 10/11/2022</small>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="media mb-3">
                                        <div class="mr-2">
                                            <img class="rounded-circle border p-1" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" alt="Generic placeholder image">
                                        </div>
                                        <div class="media-body">
                                            <p>Cơm gà xé trộn với rau răm và rau quế, ăn cùng với đu đủ, hành chua, cà rốt ngâm, tương ớt… Nhưng điểm khác biệt lớn nhất, tạo nên sự độc đáo của thương hiệu Nhung Cơm Gà nằm ở những gia vị được dùng để tẩm ướp gà.</p>
                                            <small class="text-muted">Đăng Bởi Hữu Thoại chưa làm nhận xét ngày 30/11/2022 </small>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="media mb-3">
                                        <div class="mr-2">
                                            <img class="rounded-circle border p-1" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" alt="Generic placeholder image">
                                        </div>
                                        <div class="media-body">
                                            <p>Theo cảm nhận của mình thì cơm thơm mùi bơ rất vừa ăn, gà mắm tỏi thì hơi khô nhưng vị vẫn 👌, ko mặn như nhiều người nói
                                                Đặc biệt là lạp xưởng rất rất ngon, mng nên thử nha
                                                Có dịp vẫn sẽ ủng hộ quán   .</p>
                                            <small class="text-muted">Đăng bởi WB God ngày 11/11/2022</small>
                                        </div>
                                    </div>
                                    <hr>
                                    <a href="#" class="btn hvr-hover">Xem Thêm</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="related-product">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>Món Ăn Liên Quan</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <%
                Random g = new Random();
                int j;
                ArrayList<Products> list = (ArrayList<Products>) request.getAttribute("allProductByID");
                for (int i = 0; i < 4 ; i++) {
                    j = g.nextInt(list.size());

            %>

            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="<%=list.get(j).getPath()%>">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text" >
                        <h6><a href="detail?type=<%=list.get(j).getType()%>&fid=<%=list.get(j).getID_food()%> "><%=list.get(j).getFoodName()%></a></h6>
                        <h5><%=list.get(j).getLISTED_PRICE()%> VND</h5>
                    </div>
                </div>
            </div>
        <%
            }%>
        </div>
    </div>
</section>
<!-- Related Product Section End -->
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
</html>
