<%@ page import="main.bean.Products" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: thoai
  Date: 5/01/2023
  Time: 4:02 pm
  To change this template use File | Settings | File Templates.
--%><%@ page import="main.bean.User" %>
<%@ page import="main.bean.UserPemission" %>
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


  <!-- Css Styles -->

  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
  <link rel="stylesheet" href="css/nice-select.css" type="text/css">
  <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
  <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
  <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
  <link rel="stylesheet" href="css/style.css" type="text/css">
  <link rel="stylesheet" href="css/admincss.css">
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
              <a href="DangNhap.html"><i class="fa fa-user"></i> Đăng Nhập</a>
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
            <span>Quản Lý Tài Khoản - Quản Lý Role</span>
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
              <li><a href="DoanhThu.jsp"><i class="fa fa-tachometer" aria-hidden="true"></i> Doanh Thu </a></li>
              <li><a href="SanPham.html"><i class="fa fa-shopping-bag" aria-hidden="true"></i> Sản Phẩm </a></li>
              <li><a href="ThemSanPham.html"><i class="fa fa-plus-square-o" aria-hidden="true"></i> Thêm Mặt Hàng</a></li>
              <li><a href="QuanLyTaiKhoan.html"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Quản Lý Tài Khoản</a></li>
              <li><a href="Truysuatdonhang.jsp"><i class="fa fa-square" aria-hidden="true"></i> Truy Xuất Đơn Hàng</a></li>
              <li><a href="TangVoucher.jsp"><i class="fa fa-gift" aria-hidden="true"></i> Tặng Voucher</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-10 col-md-5">

        <%UserPemission thisper = (UserPemission) session.getAttribute("userper");%>
          <div class="card mb-4">
            <div class="card-body">
              <table class="table user-view-table m-0">
                <tbody>
                <tr>
                  <td>UserID</td>
                  <td><%=thisper.getUID()%></td>
                </tr>
                <tr>
                  <td>Registered:</td>
                  <td>01/23/2017</td>
                </tr>
                <tr>
                  <td>Role:</td>
                  <td><%=thisper.getRoleName()%></td>
                </tr>
                </tbody>
              </table>
            </div>
            <hr class="border-light m-0">
            <div class="table-responsive">
              <table class="table card-table m-0">
                <tbody>
                <tr>
                  <th>Quyền</th>
                  <th>Xem</th>
                  <th>Thêm</th>
                  <th>Sửa</th>
                  <th>Xóa</th>
                </tr>
                <tr>
                  <td>Sản Phẩm</td>
                  <%if (thisper.canWatchproduct()){%>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <%} else {%>
                  <td><span class="fa fa-times"></span></td>
                  <%}%>
                  <%if (thisper.canAdEditproduct()){%>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <%} else {%>
                  <td><span class="fa fa-times"></span></td>
                  <td><span class="fa fa-times"></span></td>
                  <%}%>
                  <%if (thisper.canRemoveproduct()){%>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <%} else {%>
                  <td><span class="fa fa-times"></span></td>
                  <%}%>

                </tr>
                <tr>
                  <td>Account</td>
                  <%if (thisper.canWatchAcc()){%>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <%} else {%>
                  <td><span class="fa fa-times"></span></td>
                  <%}%>
                  <%if (thisper.canEditRole()){%>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <%} else {%>
                  <td><span class="fa fa-times"></span></td>
                  <td><span class="fa fa-times"></span></td>
                  <%}%>
                  <%if (thisper.canRemoveAcc()){%>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <%} else {%>
                  <td><span class="fa fa-times"></span></td>
                  <%}%>

                </tr>
                <tr>
                  <td>Log</td>
                  <%if (thisper.canWatchLog()){%>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <%} else {%>
                  <td><span class="fa fa-times"></span></td>
                  <td><span class="fa fa-times"></span></td>
                  <%}%>
                  +
                  <%if (thisper.canRemoveLog()){%>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <%} else {%>
                  <td><span class="fa fa-times"></span></td>
                  <td><span class="fa fa-times"></span></td>
                  <%}%>
                </tr>
                <tr>
                  <td>Voucher</td>
                  <%if (thisper.canWatchVoucher()){%>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <%} else {%>
                  <td><span class="fa fa-times"></span></td>
                  <%}%>
                  <%if (thisper.canEditAddVoucher()){%>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <%} else {%>
                  <td><span class="fa fa-times"></span></td>
                  <td><span class="fa fa-times"></span></td>
                  <%}%>
                  <%if (thisper.canRemoveVoucher()){%>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <%} else {%>
                  <td><span class="fa fa-times"></span></td>
                  <%}%>
                </tr>
                <tr>
                  <td>Đơn Hàng</td>
                  <%if (thisper.canWatchTran()){%>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <%} else {%>
                  <td><span class="fa fa-times"></span></td>
                  <%}%>
                  <%if (thisper.canEditAddTran()){%>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <%} else {%>
                  <td><span class="fa fa-times"></span></td>
                  <td><span class="fa fa-times"></span></td>
                  <%}%>
                  <%if (thisper.canRemoveTran()){%>
                  <td><span class="fa fa-check text-primary"></span></td>
                  <%} else {%>
                  <td><span class="fa fa-times"></span></td>
                  <%}%>
                </tr>

                </tbody>
              </table>
            </div>
          </div>

        <%
          User user = (User) session.getAttribute("auth");
          UserPemission actor = new UserPemission(user.getUserId());
          if (actor.canEditRole()){%>
          <div class="card">
            <hr class="border-light m-0">
            <div class="card-body">

              <table class="table user-view-table m-0">
                <tbody>
                <form action="ServletEditRole?targetUID=<%=thisper.getUID()%>"  method="post" id="RoleEdit">

                <tr>
                  <select id="Role" name="Role">
                    <option value="0">Người Dùng</option>
                    <option value="1">Quản Lý Sản Phẩm</option>
                    <option value="2">Admin</option>
                    <option value="3">Quản Lý Tài Khoản</option>
                    <option value="4">Quản Lý Voucher</option>
                    <option value="5">Quản Lý Log</option>
                  </select>
                  <label for="Role">Set Role:</label>
                </tr>
                <tr>
                  <input type="submit" value="Submit">
                </tr>
                </form>
                </tbody>
              </table>


            </div>
          </div>
        <%}%>

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
  (function() {
    'use strict';

    var TableFilter = (function() {
      var Arr = Array.prototype;
      var input;

      function onInputEvent(e) {
        input = e.target;
        var table1 = document.getElementsByClassName(input.getAttribute('data-table'));
        Arr.forEach.call(table1, function(table) {
          Arr.forEach.call(table.tBodies, function(tbody) {
            Arr.forEach.call(tbody.rows, filter);
          });
        });
      }

      function filter(row) {
        var text = row.textContent.toLowerCase();
        //console.log(text);
        var val = input.value.toLowerCase();
        //console.log(val);
        row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
      }

      return {
        init: function() {
          var inputs = document.getElementsByClassName('table-filter');
          Arr.forEach.call(inputs, function(input) {
            input.oninput = onInputEvent;
          });
        }
      };

    })();


    TableFilter.init();
  })();
</script>

</body>

</html>