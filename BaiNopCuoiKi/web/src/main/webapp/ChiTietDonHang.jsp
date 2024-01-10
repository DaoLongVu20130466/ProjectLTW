<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.bean.Voucher" %>
<%@ page import="main.bean.OderCart" %>
<%@ page import="main.bean.Order" %>
<%@ page import="main.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                          <li><a href="getUser"><i class="fa fa-user"></i></a></li>
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

  
  <!-- Breadcrumb Section Begin -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/ad.jpg">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <div class="breadcrumb__text">
          <h2>Trang Admin</h2>
          <div class="breadcrumb__option">
            <a href="ServletGetInforDB">Admin</a>
            <span>Truy Suất Đơn Hàng</span>
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
            </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-10 col-md-5">
        <div>
          <div class="ChiTietDonHangs">
            <div class="infor">
              <div class="hed"> <p>Tất Cả Sản Phẩm Được Giao</p>
              </div>
              <hr>
              <div>
                <table class="table table-borderless">
                  <thead>
                  <tr>
                    <th> Sản Phẩm </th>
                    <th> Số Lượng </th>
                    <th> Giá(đ) </th>
                    <th> Thành Tiền(đ)</th>
                  </tr>
                  </thead>

                  <tbody>
                  <%
                      Order oder = (Order) request.getAttribute("inforOder");
                      ArrayList<OderCart> list = oder.getAllOderCart();
                      for (OderCart item: list) {
                  %>
                  <tr>
                    <td>
                      <div class="itin4">
                        <img src="<%=item.getItem().getPath2()%>" alt="" >
                        <div class="ittabp">
                        <p class="itemi4"> <%=item.getItem().getFoodName()%></p>
                        <p class="mahang"> <%=item.getItem().getID_food()%></p>
                        </div>
                    </div>
                    </td>
                    <td> <%=item.getValue()%></td>
                    <td><%=item.getItem().getLISTED_PRICE()%></td>
                    <td><%=item.getItem().getLISTED_PRICE()%></td>
                  </tr>
                  <%}%>
                  </tbody>
                </table>
              </div>
              <hr>
              <div class="chitietdonhang">
                <div class="chitietdonhang-cl1">
                  <div>
                    <label class="lbin4"><%=oder.getIdOder()%></label>
                    <label class="lbdt">Mã Đơn Hàng</label>
                  </div>
                  <div>
                    <label class="lbin4"><%=oder.getPbuyName()%></label>
                    <label class="lbdt">Tên Người Đặt</label>
                  </div>
                  <div>
                    <label class="lbin4"><%=oder.getAddress().toString()%></label>
                    <label class="lbdt">Địa Chỉ</label>
                  </div>
                </div>
                <div class="chitietdonhang-cl1">
                  <div>
                    <label class="Statusdon"><%=oder.getStatus()%></label>
                    <label class="lbdt">Tình Trạng</label>
                  </div>
                  <div>
                    <label class="lbin4"><%=oder.getPhoneNumber()%></label>
                    <label class="lbdt">Số Điện Thoại</label>
                  </div>
                </div>
              </div>
              <hr>
          </div>

            <div class="ChiTiet">

              <div class="chitietdonhang">
                <div class="chitietdonhang-cl1">
                  <div>
                    <label class="lbin4"><%=oder.getNote()%></label>
                    <label class="lbdt">Ghi Chú</label>
                  </div>
                  <div>
                      <%if (oder.getVoucher().getVoucherName()!= null){%>
                      <label class="lbin4"><%=oder.getVoucher().getVoucherName()%></label>
                      <%}else {%>
                      <label class="lbin4">Không có voucher được áp dụng</label>
                      <%}%>
                    <label class="lbdt">Voucher</label>
                  </div>

                </div>
                <div class="chitietdonhang-cl1">
                  <div>
                    <label class="lbin41"><%=oder.getAllTotal()%></label>
                    <label class="lbdt">Số Lượng Sản Phẩm</label>
                  </div>
                  <div>
                    <label class="lbin41"><%=oder.getTotalValue()%></label>
                    <label class="lbdt">Tổng Tiền Hàng</label>
                  </div>
                  <div>
                    <label class="lbin41"><%=oder.getDiscount()%></label>
                    <label class="lbdt">Giảm Giá</label>
                  </div>
                  <div>
                    <label class="lbin41"><%=oder.getNewShip()%></label>
                    <label class="lbdt">Vận Chuyển</label>
                  </div>
                  <div>
                    <label class="lbin42"><%=oder.getTotalAfterVoucher()%></label>
                    <label class="lbdt">Tổng Giá Trị Đơn</label>
                  </div>
                  <div>
                    <label class="lbin41"><%=oder.revice()%></label>
                    <label class="lbdt">Đã Nhận</label>
                  </div>
                </div>
              </div>

            </div>
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




</body>

</html>