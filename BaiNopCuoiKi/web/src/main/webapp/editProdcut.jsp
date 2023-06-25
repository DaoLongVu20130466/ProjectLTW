<%@ page import="main.bean.TypeProducts" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.bean.User" %>
<%@ page import="main.bean.Products" %>
<%@ page import="main.bean.Image" %><%--
  Created by IntelliJ IDEA.
  User: thoai
  Date: 8/01/2023
  Time: 5:57 pm
  To change this template use File | Settings | File Templates.
--%>
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
  <!-- Css Styles -->
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
  <link rel="stylesheet" href="css/nice-select.css" type="text/css">
  <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
  <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
  <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
  <link rel="stylesheet" href="css/style.css" type="text/css">
  <link rel="stylesheet" href="css/admincss.css" type="text/css">
  <link rel="stylesheet" href="css/addpro.css" type="text/css">

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
            <li><a href="getAllProduct">Gian Hàng</a></li>

            <li><a href="blog.jsp">Giới Thiệu</a></li>
            <li><a href="contact.jsp">Liên Hệ</a></li>
          </ul>
        </nav>
      </div>
      <div class="col-lg-3">
        <div class="header__cart">
          <ul>
            <%
              if (user.getRole()>=1) {
            %>
            <li> <a href="getUserInfor"> <i class="fa fa-user"></i> </a></li>
            <li> <a href="getPageAD"> <i class="	fas fa-user-edit"></i> </a></li>
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
            <a href="ServletGetInforDB">Admin</a>
            <span>Quản lí tài khoản_Thêm Sản Phẩm</span>
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
            </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-10 col-md-5">
        <%
          ArrayList<TypeProducts> listType = (ArrayList<TypeProducts>) request.getAttribute("alltype");
          ArrayList<Image> listImg = (ArrayList<Image>) request.getAttribute("img");
          String ab = (String) request.getAttribute("1");
          Products pro = (Products) request.getAttribute("pro");
        %>

        <h2>Cập nhật, thêm mới nội dung sản phẩm: </h2>
        <%
          if(ab==null){ }else {%>
        <h2>Cập nhật thành công</h2>
        <%}%>


        <form action="updateEditProduct"  enctype="multipart/form-data" onSubmit="return submitForm(this);" method="post" onSubmit="">

          <div class='add-input' style="display: none">
            ID món ăn
            <input type='text' name='idmonan' placeholder="ID món ăn" value="<%=pro.getID_food()%>" >
          </div>

          <div class='add-input'>
            Tên món ăn <span>*</span>
            <input type='text' name='tenmonan' placeholder="Tên món ăn" value="<%=pro.getFoodName()%>" required>
          </div>

          <div class='add-input'>
            Size:<span>*</span>
            <select name="optionSize" >
              <option value="SIZE1"> SIZE1 </option>
              <option value="SIZE2"> SIZE2 </option>
            </select>
          </div>
          <div class='add-input'>
            Giá niêm yết
            <input type='text' name='niemyet' placeholder="Giá niêm yết" value="<%=pro.getBasePrice()%>" required>
          </div>
          <div class='add-input'>
            Giá bán<span>*</span>
            <input type='text' name='giaban' placeholder="Giá bán"  value="<%=pro.getPrice()%>"required>
          </div>


          <div class='add-input'>
            Loại món ăn: <span>*</span>


              <select name="optionType"  value="<%=pro.getIdType()%>">
                <%
                  for ( TypeProducts t : listType
                  ) {
                %>
                <option value="<%=t.getIdType()%>"> <%=t.getNameType()%>  </option>
                <%}%>
              </select>
          </div>


          <div class='add-input'>
            Món ăn Combo:<span></span>
            <select name="optionCombo" >

              <% if (pro.isCombo() == true){%>
              <option value="1"> COMBO </option>
              <option value="0"> KHÔNG </option>
              <%}else {%>
              <option value="0"> KHÔNG </option>
              <option value="1"> COMBO </option>
              <%}%>
            </select>
          </div>
          <div class='add-input'>
            Món ăn Sale:<span></span>
            <select name="optionSale" >
              <% if (pro.isIdSale() == true){%>
              <option value="1"> SALE </option>
              <option value="0"> KHÔNG SALE </option>
              <%}else {%>
              <option value="0"> KHÔNG SALE </option>
              <option value="1"> SALE </option>
              <%}%>
            </select>
          </div>

          <div class='add-input'>
            Món ăn hot:<span>*</span>
            <select name="optionHot" >
              <% if (pro.isHot() == true){%>
              <option value="1"> HOT </option>
              <option value="0"> NORMAL </option>
              <%}else {%>
              <option value="0"> NORMAL </option>
              <option value="1"> HOT </option>
              <%}%>
            </select>
          <div class='add-input'>
            Mô tả<span>*</span>
            <input type='text' name='Mota' placeholder="Mô tả"value="<%=pro.getIdDes()%>" required>
          </div>

          <div class='add-input'>
            Hình ảnh:<span>*</span>
            <%--            <input type="file" id="myfile" name="myfile" required><br><br>--%>
            <%--            <input type="file" id="myfile2" name="myfile2" required><br><br>--%>
            <%--            <input type="file" id="myfile3" name="myfile3" required><br><br>--%>
            <%--            <input type="file" id="myfile4" name="myfile4" required><br><br>--%>
            <div class='add-input' style="display: none">

              <input type='text' name='idimg1'  value="<%=listImg.get(0).getId()%>">
            </div>
            <div class='add-input' style="display: none">
              <input type='text' name='idimg2'value="<%=listImg.get(1).getId()%>">
            </div>
            <div class='add-input' style="display: none">
              <input type='text' name='idimg3' value="<%=listImg.get(2).getId()%>">
            </div>
            <div class='add-input' style="display: none">
              <input type='text' name='idimg4'  value="<%=listImg.get(3).getId()%>">
            </div>

            <div class='add-input' style="display: none">

              <input type='text' name='src1'  value="<%=listImg.get(0).getSrc()%>">
            </div>
            <div class='add-input' style="display: none">
              <input type='text' name='src2'value="<%=listImg.get(1).getSrc()%>">
            </div>
            <div class='add-input' style="display: none">
              <input type='text' name='src3' value="<%=listImg.get(2).getSrc()%>">
            </div>
            <div class='add-input' style="display: none">
              <input type='text' name='src4'  value="<%=listImg.get(3).getSrc()%>">
            </div>
            <div class="img-list">
              <div class="file-upload">
                <button class="file-upload-btn"  type="button" onclick="$('.file-upload-input').trigger( 'click' )">Add Image</button>

                <div class="image-upload-wrap" style="display: none;">
                  <input class="file-upload-input" id="myfile" name="myfile" type='file' onchange="readURL(this);" accept="image/*" />
                  <div class="drag-text">
                    <h3>Drag and drop a file or select add Image</h3>
                  </div>
                </div>
                <div class="file-upload-content" style="display: block;">
                  <img class="file-upload-image"  src="<%=listImg.get(0).getSrc()%>" alt="ảnh 1" />
                  <div class="image-title-wrap">
                    <button type="button" onclick="removeUpload()" class="remove-image">Remove <span class="image-title">Uploaded Image</span></button>
                  </div>
                </div>
              </div>


              <div class="file-upload">
                <button class="file-upload-btn" type="button" onclick="$('.file-upload-input2').trigger( 'click' )">Add Image</button>

                <div class="image-upload-wrap2" style="display: none;">
                  <input class="file-upload-input2"  id="myfile2" name="myfile2" type='file' onchange="readURL2(this);" accept="image/*" />
                  <div class="drag-text">
                    <h3>Drag and drop a file or select add Image</h3>
                  </div>
                </div>
                <div class="file-upload-content2" style="display: block;">
                  <img class="file-upload-image2" src="<%=listImg.get(1).getSrc()%>" alt="ảnh 2" />
                  <div class="image-title-wrap">
                    <button type="button" onclick="removeUpload2()" class="remove-image">Remove <span class="image-title2">Uploaded Image</span></button>
                  </div>
                </div>
              </div>




              <div class="file-upload">
                <button class="file-upload-btn" type="button" onclick="$('.file-upload-input3').trigger( 'click' )">Add Image</button>

                <div class="image-upload-wrap3" style="display: none;">
                  <input class="file-upload-input3" id="myfile3" name="myfile3" type='file' onchange="readURL3(this);" accept="image/*" />
                  <div class="drag-text">
                    <h3>Drag and drop a file or select add Image</h3>
                  </div>
                </div>
                <div class="file-upload-content3" style="display: block;">
                  <img class="file-upload-image3" src="<%=listImg.get(2).getSrc()%>" alt="ảnh 3" />
                  <div class="image-title-wrap">
                    <button type="button" onclick="removeUpload3()" class="remove-image">Remove <span class="image-title3">Uploaded Image</span></button>
                  </div>
                </div>
              </div>


              <div class="file-upload">
                <button class="file-upload-btn" type="button" onclick="$('.file-upload-input4').trigger( 'click' )">Add Image</button>

                <div class="image-upload-wrap4" style="display: none;">
                  <input class="file-upload-input4" id="myfile4"  name="myfile4"  type='file' onchange="readURL4(this);" accept="image/*" />
                  <div class="drag-text">
                    <h3>Drag and drop a file or select add Image</h3>
                  </div>
                </div>
                <div class="file-upload-content4" style="display: block;">
                  <img class="file-upload-image4" src="<%=listImg.get(3).getSrc()%>" alt="ảnh 4"/>
                  <div class="image-title-wrap">
                    <button type="button" onclick="removeUpload4()" class="remove-image">Remove <span class="image-title4">Uploaded Image</span></button>
                  </div>
                </div>
              </div>

            </div>

          </div>
      <input class="btn" type="submit" value="Submit">

      </form>

    </div>
  </div></div>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
  function submitForm(form) {
    swal({
      title: "Bạn chắc chắn chứ?",
      text: "Hãy chắc là bạn sẽ thay đổi những thông tin này",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    }).then(function (isOkay) {
      if (isOkay) {
        form.submit();
      }
    });
    return false;
  }
</script>


</body>

</html>
</html>
