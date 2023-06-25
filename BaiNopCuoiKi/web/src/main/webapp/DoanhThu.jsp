
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="main.bean.DashBoard" %><%@ page import="main.bean.User" %>
<%@ page import="main.bean.Order" %>
<%@ page import="main.services.AppService" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx">

<head>

    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SBE-Cơm trưa</title>
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/admincss.css">
    <link rel="stylesheet" href="css/dashboard.css">
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
    <%
        DashBoard db = (DashBoard) request.getAttribute("dashBoard");
    %>
    <div  class="header__top">
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
                            <div>Việt Nam</div>
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
                    <h2>Trang Admin</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Admin</a>
                        <span>Doanh Thu</span>
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
            <div class="align-self-start">
                <div class="sidebar">
                    <div class="sidebar__item">
                        <h4>Quản Lý</h4>
                        <ul>
                            <li><a href="ServletGetInforDB"><i class="fa fa-tachometer" aria-hidden="true"></i> Doanh Thu </a></li>
                            <li><a href="getAllProductByAdmin"><i class="fa fa-shopping-bag" aria-hidden="true"></i> Sản Phẩm </a></li>
                            <li><a href="ServletAddNewProduct"><i class="fa fa-plus-square-o" aria-hidden="true"></i> Thêm Mặt Hàng</a></li>
                            <li><a href="getUserControl"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Quản Lý Tài Khoản</a></li>
                            <li><a href="ServletGetAllOder"><i class="fa fa-square" aria-hidden="true"></i> Truy Xuất Đơn Hàng</a></li>
                            <li><a href="ServletVoucher"><i class="fa fa-gift" aria-hidden="true"></i> Tặng Voucher</a></li>
                            <li><a href="getActivate"><i class="fa fa-file-text" aria-hidden="true"></i> Log</a></li>
                            <li><a href="ServletGetAllOderAPI"><i class="fa fa-train" aria-hidden="true"></i> Xem đơn vận chuyển</a></li>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-10 col-md-5">
                <div class="menuctner2">
                    <div class="more1">
                        <p>Doanh Thu Theo Tháng</p>
                        <form id="getinput" action="/web_war/ServletGetInForDBbyM" method="post">
                            <select name="dbmo" id="cars">
                                <option value="01">Tháng 1</option>
                                <option value="02">Tháng 2</option>
                                <option value="03">Tháng 3</option>
                                <option value="04">Tháng 4</option>
                                <option value="05">Tháng 5</option>
                                <option value="06">Tháng 6</option>
                                <option value="07">Tháng 7</option>
                                <option value="08">Tháng 8</option>
                                <option value="09">Tháng 9</option>
                                <option value="10">Tháng 10</option>
                                <option value="11">Tháng 11</option>
                                <option value="12">Tháng 12</option>
                            </select>
                            <input class="btnsummit" type="submit">
                        </form>
                    </div>
                </div>

                <div>

                    <%
                        if(request.getAttribute("dbm").equals("all"))
                        {
                    %>
                    <div class="doanhthu">

                    <div class="doanhthuitem">
                        <div class="doanhthuctn">
                            <i class="fa fa-money fa-4x" aria-hidden="true"></i>
                            <div>
                                <strong>Doanh Số</strong>
                                <p><%=AppService.intToVND(db.getTotal())%></p>
                            </div>
                        </div>
                    </div>
                    <div class="doanhthuitem">
                        <div class="doanhthuctn">
                            <i class="fa fa-file fa-5x" aria-hidden="true"></i>

                            <div>
                                <strong>Đơn Bán</strong>
                                <p><%=db.getTotalODer()%>Đơn</p>
                            </div>
                        </div>
                    </div>
                    <div class="doanhthuitem">
                        <div class="doanhthuctn">
                            <i class="fa fa-archive fa-5x" aria-hidden="true"></i>

                            <div>
                                <strong>Đã Giao</strong>
                                <p><%=db.getTotalOderComplete()%> Đơn</p>
                            </div>
                        </div>
                    </div>
                    </div>

                    <%}else
                    {%>


                    <div class="doanhthu">

                        <div class="doanhthuitem">
                            <div class="doanhthuctn">
                                <i class="fa fa-money fa-4x" aria-hidden="true"></i>
                                <div>
                                    <strong>Doanh Số</strong>
                                    <p><%=AppService.intToVND(db.getTotalByMouth((String)request.getAttribute("dbm")))%></p>
                                </div>
                            </div>
                        </div>
                        <div class="doanhthuitem">
                            <div class="doanhthuctn">
                                <i class="fa fa-file fa-5x" aria-hidden="true"></i>

                                <div>
                                    <strong>Đơn Bán</strong>
                                    <p><%=db.getTotalODerBuyMouth((String)request.getAttribute("dbm"))%>Đơn</p>
                                </div>
                            </div>
                        </div>
                        <div class="doanhthuitem">
                            <div class="doanhthuctn">
                                <i class="fa fa-archive fa-5x" aria-hidden="true"></i>

                                <div>
                                    <strong>Đã Giao</strong>
                                    <p><%=db.getTotalOderCompleteByMouth((String)request.getAttribute("dbm"))%> Đơn</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>

                    <div class="menuctner">
                        <canvas id="myChart" style="width:100%"></canvas>
                    </div>

                    <canvas id="myChart1" style="width:100%"></canvas>
                </div>
            </div>
        </div>

    </div>
    </div>
</section>
<!-- Product Section End -->

<!-- Footer Section Begin -->
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

<!--    <table class="table table-striped">-->
<!--        <thead>-->
<!--        <tr>-->
<!--            <th scope="col">#</th>-->
<!--            <th scope="col">First</th>-->
<!--            <th scope="col">Last</th>-->
<!--            <th scope="col">Handle</th>-->
<!--        </tr>-->
<!--        </thead>-->
<!--        <tbody>-->
<!--        <tr>-->
<!--            <th scope="row">1</th>-->
<!--            <td>Mark</td>-->
<!--            <td>Otto</td>-->
<!--            <td>@mdo</td>-->
<!--        </tr>-->
<!--        <tr>-->
<!--            <th scope="row">2</th>-->
<!--            <td>Jacob</td>-->
<!--            <td>Thornton</td>-->
<!--            <td>@fat</td>-->
<!--        </tr>-->
<!--        <tr>-->
<!--            <th scope="row">3</th>-->
<!--            <td>Larry</td>-->
<!--            <td>the Bird</td>-->
<!--            <td>@twitter</td>-->
<!--        </tr>-->
<!--        </tbody>-->
<!--    </table>-->

<script>
    var xValues = [1,2,3,4,5,6,7,8,9,10,11,12];
    var yValues = [<%=db.getTotalODerBuyMouth("01")%>,<%=db.getTotalODerBuyMouth("02")%>,<%=db.getTotalODerBuyMouth("03")%>,
        <%=db.getTotalODerBuyMouth("04")%>,<%=db.getTotalODerBuyMouth("05")%>,<%=db.getTotalODerBuyMouth("06")%>,<%=db.getTotalODerBuyMouth("07")%>,
        <%=db.getTotalODerBuyMouth("08")%>,<%=db.getTotalODerBuyMouth("09")%>,<%=db.getTotalODerBuyMouth("10")%>,<%=db.getTotalODerBuyMouth("11")%>,
        <%=db.getTotalODerBuyMouth("12")%>];

    new Chart("myChart1", {
        type: "line",
        data: {
            labels: xValues,
            datasets: [{
                fill: false,
                lineTension: 0,
                backgroundColor: "rgba(0,0,255,1.0)",
                borderColor: "rgba(0,0,255,0.1)",
                data: yValues
            }]
        },
        options: {
            legend: {display: false},
            scales: {
                yAxes: [{ticks: {min: 0, max: 50}}],
            }
        }
    });
</script>
<script>
    var xValues = ["Cơm gà", "Cơm bò", "Cơm Món", "Cơm chiên", "Hải sản","Bún phở", "Cơm Sườn"];
    <%
    HashMap<String, Integer> rs =new HashMap<>();
     if(request.getAttribute("dbm").equals("all"))
     {
         rs = db.getttype(); %>
    var yValues = [<%=rs.get("Cơm gà")%>, <%=rs.get("Cơm bò")%>, <%=rs.get("Cơm Món")%>, <%=rs.get("Cơm chiên")%>, <%=rs.get("Hải sản")%>,<%=rs.get("Bún phở")%>, <%=rs.get("Cơm Sườn")%>];

    <%}else {
         rs = db.getotalTypeBym((String) request.getAttribute("dbm")); %>
    var yValues = [<%=rs.get("Cơm gà")%>, <%=rs.get("Cơm bò")%>, <%=rs.get("Cơm Món")%>, <%=rs.get("Cơm chiên")%>, <%=rs.get("Hải sản")%>,<%=rs.get("Bún phở")%>, <%=rs.get("Cơm Sườn")%>];

    <%}%>

    var barColors = [
        "#b91d47",
        "#00aba9",
        "#2b5797",
        "#e8c3b9",
        "#1e7145",
        "#c4647e",
        "#259d9c"
    ];

    new Chart("myChart", {
        type: "pie",
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor: barColors,
                data: yValues
            }]
        },
        options: {
            title: {
                display: true,
                text: "Số Lượng Sản Phẩm Bán Được"
            }
        }
    });
</script>
</body>

</html>