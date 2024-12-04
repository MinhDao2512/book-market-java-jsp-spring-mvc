<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="/resources/taglib.jsp" %>
        <!DOCTYPE html>
        <html lang="zxx">

        <head>
            <meta charset="UTF-8">
            <meta name="description" content="Ogani Template">
            <meta name="keywords" content="Ogani, unica, creative, html">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>Story Swap | Giỏ hàng</title>

            <!-- Google Font -->
            <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
                rel="stylesheet">

            <!--Jquery Toast Plugin-->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                rel="stylesheet">
            <!--Bootstrap 4.4.1-->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
                integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
                crossorigin="anonymous"></script>


            <!-- Css Styles -->
            <link rel="stylesheet" href="/client/css/bootstrap.min.css" type="text/css">
            <link rel="stylesheet" href="/client/css/font-awesome.min.css" type="text/css">
            <link rel="stylesheet" href="/client/css/elegant-icons.css" type="text/css">
            <link rel="stylesheet" href="/client/css/nice-select.css" type="text/css">
            <link rel="stylesheet" href="/client/css/jquery-ui.min.css" type="text/css">
            <link rel="stylesheet" href="/client/css/owl.carousel.min.css" type="text/css">
            <link rel="stylesheet" href="/client/css/slicknav.min.css" type="text/css">
            <link rel="stylesheet" href="/client/css/style.css" type="text/css">
        </head>

        <body>
            <!-- Header Section Begin -->
            <jsp:include page="../layout/header.jsp" />
            <!-- Header Section End -->

            <!-- Hero Section Begin -->
            <section class="hero hero-normal">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="hero__categories">
                                <div class="hero__categories__all">
                                    <i class="fa fa-bars"></i>
                                    <span>Danh mục</span>
                                </div>
                                <ul>
                                    <li><a href="#">English Books</a></li>
                                    <li><a href="#">Sách tiếng Việt</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <div class="hero__search">
                                <div class="hero__search__form">
                                    <form action="#">
                                        <div class="hero__search__categories">
                                            Tất cả danh mục
                                            <span class="arrow_carrot-down"></span>
                                        </div>
                                        <input type="text" placeholder="Bạn cần tìm sản phẩm gì?">
                                        <button type="submit" class="site-btn">TÌM
                                            KIẾM</button>
                                    </form>
                                </div>
                                <div class="hero__search__phone">
                                    <div class="hero__search__phone__icon">
                                        <i class="fa fa-phone"></i>
                                    </div>
                                    <div class="hero__search__phone__text">
                                        <h5>(+84) 942 236 357</h5>
                                        <span>Hỗ trợ 24/7</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Hero Section End -->

            <!-- Breadcrumb Section Begin -->
            <section class="breadcrumb-section set-bg" data-setbg="/client/img/breadcrumb.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="breadcrumb__text">
                                <h2>Giỏ hàng</h2>
                                <div class="breadcrumb__option">
                                    <a href="/">Trang chủ</a>
                                    <span>Giỏ hàng</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Breadcrumb Section End -->

            <!-- Shoping Cart Section Begin -->
            <section class="shoping-cart spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="shoping__cart__table">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Hình ảnh</th>
                                            <th>Sản phẩm</th>
                                            <th>Giá tiền</th>
                                            <th>Số lượng</th>
                                            <th>Tổng tiền</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="cartItem" items="${cartItems}">
                                            <tr>
                                                <td>
                                                    <a href="/shop/${cartItem.book.id}">
                                                        <img src="/images/book/${cartItem.book.bookImages[0].name}"
                                                            style="width: 100px;">
                                                    </a>
                                                </td>
                                                <td class="col-md-6"
                                                    style="white-space: normal; word-wrap: break-word; overflow: visible;">
                                                    <h5>
                                                        <a href="/shop/${cartItem.book.id}"
                                                            style="background-color: white; color: black; text-decoration: none; display: inline-block;">${cartItem.book.title}</a>
                                                    </h5>
                                                </td>
                                                <td class="shoping__cart__price">
                                                    <fmt:formatNumber type="number" value="${cartItem.book.price}" />
                                                </td>
                                                <td class="shoping__cart__quantity">
                                                    <div class="quantity">
                                                        <div class="pro-qty" data-book-price="${cartItem.book.price}"
                                                            data-cart-item-id="${cartItem.id}">
                                                            <input type="text" value="${cartItem.quantity}"
                                                                class="input-quantity">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="shoping__cart__total">
                                                    <fmt:formatNumber type="number" value="${cartItem.totalPrice}" /> đ
                                                </td>
                                                <td class="shoping__cart__item__close">
                                                    <span class="icon_close"></span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <c:if test="${sessionScope.cartCount == 0}">
                                    <h6 class="mt-3" style="color: red; text-align: center">
                                        Bạn chưa có sản phẩm nào trong giỏ hàng !
                                    </h6>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class=" row">
                        <div class="col-lg-12">
                            <div class="shoping__cart__btns">
                                <a href="/shop" class="primary-btn cart-btn">THÊM SẢN PHẨM KHÁC</a>
                                <!-- <a href="#" class="primary-btn cart-btn cart-btn-right"><span
                                        class="icon_loading"></span>
                                    CẬP NHẬT GIỎ HÀNG</a> -->
                            </div>
                        </div>
                        <div class="col-lg-6">
                        </div>
                        <div class="col-lg-6">
                            <div class="shoping__checkout">
                                <h5>Giỏ Hàng</h5>
                                <ul>
                                    <li>Tổng:
                                        <span class="total-cart-price">
                                            <fmt:formatNumber type="number" value="${sessionScope.totalCartPrice}" /> đ
                                        </span>
                                    </li>
                                </ul>
                                <c:if test="${sessionScope.cartCount != 0}">
                                    <a href="#" class="primary-btn">TIẾN HÀNH THANH TOÁN</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Shoping Cart Section End -->

            <!-- Footer Section Begin -->
            <jsp:include page="../layout/footer.jsp" />
            <!-- Footer Section End -->

            <!-- Js Plugins -->
            <script src="/client/js/jquery-3.3.1.min.js"></script>
            <script src="/client/js/bootstrap.min.js"></script>
            <script src="/client/js/jquery.nice-select.min.js"></script>
            <script src="/client/js/jquery-ui.min.js"></script>
            <script src="/client/js/jquery.slicknav.js"></script>
            <script src="/client/js/mixitup.min.js"></script>
            <script src="/client/js/owl.carousel.min.js"></script>
            <script src="/client/js/main.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
        </body>

        </html>