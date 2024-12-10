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
            <title>Story Swap | Thanh toán</title>

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
            <jsp:include page="../layout/hero-select-another.jsp" />
            <!-- Hero Section End -->

            <!-- Breadcrumb Section Begin -->
            <section class="breadcrumb-section set-bg" data-setbg="/client/img/breadcrumb.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="breadcrumb__text">
                                <h2>Thanh toán</h2>
                                <div class="breadcrumb__option">
                                    <a href="/">Trang chủ</a>
                                    <span>Thanh toán</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Breadcrumb Section End -->

            <!-- Checkout Section Begin -->
            <section class="checkout spad">
                <div class="container">
                    <div class="checkout__form">
                        <h4>Thông Tin Đơn Hàng</h4>
                        <form id="checkoutForm">
                            <div class="row">
                                <div class="col-lg-7 col-md-6">
                                    <div class="checkout__input">
                                        <p>Tên người nhận hàng<span>*</span></p>
                                        <input type="text" value="${currentUser.fullName}" style="color: #7fad39;"
                                            id="receiverName" name="receiverName" class="required">
                                    </div>
                                    <div class="checkout__input">
                                        <p>Địa chỉ nhận hàng<span>*</span></p>
                                        <input type="text" value="${currentUser.address}" style="color: #7fad39;"
                                            id="shippingAddress" name="shippingAddress" class="required">
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="checkout__input">
                                                <p>Điện thoại nhận hàng<span>*</span></p>
                                                <input type="text" value="${currentUser.phoneNumber}"
                                                    style="color: #7fad39;" id="phoneNumber" name="phoneNumber"
                                                    class="required">
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="checkout__input">
                                                <p>Email<span>*</span></p>
                                                <input type="text" value="${currentUser.email}" style="color: #7fad39;"
                                                    id="receiverEmail" name="receiverEmail" class="required">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="checkout__input">
                                        <p>Ghi chú<span>*</span></p>
                                        <input type="text" style="color: #7fad39;" id="note" name="note">
                                    </div>
                                    <div class="checkout__input">
                                        <c:if test="${not empty bookId}">
                                            <a href="/shop/${bookId}" class="btn btn-secondary">QUAY LẠI</a>
                                        </c:if>
                                        <c:if test="${empty bookId}">
                                            <a href="/cart-detail" class="btn btn-secondary">QUAY LẠI</a>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-lg-5 col-md-6">
                                    <div class="checkout__order">
                                        <h4>Sản Phẩm</h4>
                                        <div class="checkout__order__products">Tên <span>Số tiền</span></div>
                                        <ul>
                                            <c:forEach var="cartItem" items="${cartItems}">
                                                <li>
                                                    <c:choose>
                                                        <c:when test="${fn:length(cartItem.book.title) > 30}">
                                                            <a href="/shop/${cartItem.book.id}" style="color: #7fad39;">
                                                                ${fn:substring(cartItem.book.title, 0, 30)}...
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${cartItem.book.title}
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <span class="quantity" data-quantity="${cartItem.quantity}">
                                                        <fmt:formatNumber type="number"
                                                            value="${cartItem.book.price}" /> đ x
                                                        ${cartItem.quantity}
                                                    </span>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                        <div class="checkout__order__total">Tổng thanh toán
                                            <span id="totalPayment">
                                                <c:if test="${empty totalPrice}">
                                                    <fmt:formatNumber type="number"
                                                        value="${sessionScope.totalCartPrice}" /> đ
                                                </c:if>
                                                <c:if test="${not empty totalPrice}">
                                                    <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                </c:if>
                                            </span>
                                        </div>
                                        <div class="checkout__input__checkbox">
                                            <label for="payment">
                                                Thanh toán khi nhận hàng
                                                <input type="checkbox" id="payment" name="payment">
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                        <div class="checkout__input__checkbox">
                                            <label for="paypal">
                                                Thanh toán qua VNPAY
                                                <input type="checkbox" id="paypal" name="paypal">
                                                <span class="checkmark paypal required"></span>
                                                <div class="invalid-feedback">
                                                    Bạn chưa chọn phương thức thanh toán.
                                                </div>
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-success" id="btnChecout">ĐẶT HÀNG</button>
                                        <input type="hidden" value="${bookId}" id="bookId" name="bookId" />
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
            <!-- Checkout Section End -->

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
            <script src="/client/js/checkout.js"></script>
            <!--Jquery Toast Plugin-->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
        </body>

        </html>