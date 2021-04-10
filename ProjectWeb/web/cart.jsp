<%@page import="object.Item"%>
<%@page import="object.Cart"%>
<%@page import="object.Product"%>
<%@page import="dal.ProductDAO"%>
<%@page import="object.Order"%>
<%@page import="object.Account"%>
<!doctype html>
<html lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Watch shop | eCommers</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>

    <body>
        <header>
            <!-- Header Start -->
            <header>
                <!-- Header Start -->
                <div class="header-area">
                    <div class="main-header header-sticky">
                        <div class="container-fluid">
                            <div class="menu-wrapper">
                                <!-- Logo -->
                                <div class="logo">
                                    <a href="home.jsp"><img src="assets/img/logo/logo.png" alt=""></a>
                                </div>
                                <!-- Main-menu -->
                                <div class="main-menu d-none d-lg-block">
                                    <nav>                                                
                                        <ul id="navigation">  
                                            <li><a href="home.jsp">Home</a></li>
                                            <li class="hot" ><a href="shopServlet">Shop</a></li>
                                            <li><a href="">Account</a></li>
                                            <li><a href="login.jsp">Login</a></li>

                                        </ul>
                                    </nav>
                                </div>
                                <!-- Header Right -->
                                <div class="header-right">
                                    <ul>
                                        <li>
                                            <div class="nav-search search-switch">
                                                <span class="flaticon-search"></span>
                                            </div>
                                        </li>
                                        <%
                                            if (session.isNew()) {
                                        %>
                                        <li><a href="login.jsp"><span class="flaticon-user"></span></a></li>
                                                <%
                                                } else {
                                                    if (session.getAttribute("a") != null) {
                                                        Account a = (Account) session.getAttribute("a");
                                                %>
                                        <li><a href="login.jsp"><span class="flaticon-user"><%=a.getUsername()%></span></a></li>

                                        <%} else {
                                        %>
                                        <li><a href="login.jsp"><span class="flaticon-user"></span></a></li>
                                                <%                                            }
                                                    }
                                                %>
                                        <li><a href="cart.html"><span class="flaticon-shopping-cart"></span></a> </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Header End -->
            </header>
            <!-- Header End -->
        </header>
        <main>
            <!-- Hero Area Start-->
            <div class="slider-area ">
                <div class="single-slider slider-height2 d-flex align-items-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="hero-cap text-center">
                                    <h2>Cart List</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--================Cart Area =================-->
            <section class="cart_area section_padding">
                <div class="container">
                    <div class="cart_inner">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Product</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        double subtotal = 0;
                                        ProductDAO pd = new ProductDAO();
                                        if (session.getAttribute("c") != null) {
                                            Cart c = (Cart) session.getAttribute("c");
                                            for (Item i : c.getListItem()) {


                                    %>
                                    <tr>
                                        <td>
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img src="images/<%=i.getProduct().getProduct_images()%>" alt="" />
                                                </div>
                                                <div class="media-body">
                                                    <p><%= i.getProduct().getProduct_name()%></p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <h5><%= i.getProduct().getProduct_price()%></h5>
                                        </td>
                                        <td>
                                            <div class="product_count">
                                                <span class="input-number-decrement"> <i class="ti-minus"></i></span>
                                                <input class="input-number" type="text" value="<%= i.getQuantity()%>" >
                                                <span class="input-number-increment"> <i class="ti-plus"></i></span>
                                            </div>
                                        </td>
                                        <td>
                                            <h3>$<%=(i.getProduct().getProduct_price() * i.getQuantity())%></h3>
                                        </td>
                                    </tr>
                                    <%             subtotal += (i.getQuantity() * i.getProduct().getProduct_price());
                                            }
                                        }

                                    %>

                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <h5>Subtotal</h5>
                                        </td>
                                        <td>
                                            <h5>$<%=subtotal%></h5>
                                        </td>
                                    </tr>
                                <p>Test</p>
                                <tr class="shipping_area">
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="checkout_btn_inner float-right">
                                <a class="btn_1" href="shopServlet">Continue Shopping</a>
                                <a class="btn_1 checkout_btn_1" href="checkout.jsp">Proceed to checkout</a>
                            </div>
                        </div>
                    </div>
            </section>
            <!--================End Cart Area =================-->
        </main>>
        <footer>
            <!-- Footer Start-->
            <div class="footer-area footer-padding">
                <div class="container">
                    <div class="row d-flex justify-content-between">
                        <div class="col-xl-3 col-lg-3 col-md-5 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="single-footer-caption mb-30">
                                    <!-- logo -->
                                    <div class="footer-logo">
                                        <a href="index.html"><img src="assets/img/logo/logo2_footer.png" alt=""></a>
                                    </div>
                                    <div class="footer-tittle">
                                        <div class="footer-pera">
                                            <p>Asorem ipsum adipolor sdit amet, consectetur adipisicing elitcf sed do eiusmod tem.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-3 col-sm-5">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>Quick Links</h4>
                                    <ul>
                                        <li><a href="#">About</a></li>
                                        <li><a href="#"> Offers & Discounts</a></li>
                                        <li><a href="#"> Get Coupon</a></li>
                                        <li><a href="#">  Contact Us</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>New Products</h4>
                                    <ul>
                                        <li><a href="#">Woman Cloth</a></li>
                                        <li><a href="#">Fashion Accessories</a></li>
                                        <li><a href="#"> Man Accessories</a></li>
                                        <li><a href="#"> Rubber made Toys</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-5 col-sm-7">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>Support</h4>
                                    <ul>
                                        <li><a href="#">Frequently Asked Questions</a></li>
                                        <li><a href="#">Terms & Conditions</a></li>
                                        <li><a href="#">Privacy Policy</a></li>
                                        <li><a href="#">Report a Payment Issue</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Footer bottom -->
                    <div class="row align-items-center">
                        <div class="col-xl-7 col-lg-8 col-md-7">
                            <div class="footer-copy-right">
                                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>                 
                            </div>
                        </div>
                        <div class="col-xl-5 col-lg-4 col-md-5">
                            <div class="footer-copy-right f-right">
                                <!-- social -->
                                <div class="footer-social">
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="https://www.facebook.com/sai4ull"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-behance"></i></a>
                                    <a href="#"><i class="fas fa-globe"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End-->
        </footer>
        <!--? Search model Begin -->
        <div class="search-model-box">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-btn">+</div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Searching key.....">
                </form>
            </div>
        </div>
        <!-- Search model end -->

        <!-- JS here -->

        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
        <!-- Jquery, Popper, Bootstrap -->
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

        <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>

        <!-- One Page, Animated-HeadLin -->
        <script src="./assets/js/wow.min.js"></script>
        <script src="./assets/js/animated.headline.js"></script>

        <!-- Scrollup, nice-select, sticky -->
        <script src="./assets/js/jquery.scrollUp.min.js"></script>
        <script src="./assets/js/jquery.nice-select.min.js"></script>
        <script src="./assets/js/jquery.sticky.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

        <!-- Jquery Plugins, main Jquery -->	
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>

    </body>
</html>