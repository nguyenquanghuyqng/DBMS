<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Web Toeic</title>

            <!-- Bootstrap -->
            <link href="Template/Fontend/css/bootstrap.css" rel="stylesheet">
            <link href="Template/Fontend/css/bootstrap-responsive.css" rel="stylesheet">
            <link href="Template/Fontend/css/style.css" rel="stylesheet">

            <!--Font-->
            <link href="Template/Fontend/font/font.css" rel="stylesheet">

            <!-- SCRIPT 
    ============================================================-->
            <script src="Template/Fontend/js/jquery1.js"></script>
            <script src="Template/Fontend/js/bootstrap.min.js"></script>

        </head>

        <body>
            <!--HEADER ROW-->
            <div id="header-row">
                <div class="container">
                    <div class="row">
                        <!--LOGO-->
                        <div class="span3"><a class="brand" href="#"><img src="Template/Fontend/img/slide/logo5.png"/></a></div>
                        <!-- /LOGO -->

                        <!-- MAIN NAVIGATION -->
                        <div class="span9">
                            <div class="navbar  pull-right">
                                <div class="navbar-inner">
                                    <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span></a>
                                    <div class="nav-collapse collapse navbar-responsive-collapse">
                                        <ul class="nav">

                                            <li><a href="SignInController">Login</a></li>
                                            <li><a href="SignInController">Create Account</a></li>

                                        </ul>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- MAIN NAVIGATION -->
                    </div>
                </div>
            </div>
            <!-- /HEADER ROW -->


            <div class="container">

                <!--Carousel
  ==================================================-->
                <br>
                <div id="myCarousel" class="carousel slide">
                    <div class="carousel-inner">

                        <div class="active item">
                            <div class="container">
                                <div class="row">

                                    <div class="span6">

                                        <div class="carousel-caption">
                                            <h1>Study English Every day</h1>
                                            <p class="lead">Are you bored with life? Then throw yourself into some work you believe in with all your heart, live for it, die for it, and you will find happiness that you had thought could never be yours.</p>
                                            <a class="btn btn-large btn-primary" href="SignInController">Sign up today</a>
                                        </div>

                                    </div>

                                    <div class="span6"> <img src="Template/Fontend/img/slide/good.jpg" height="400px"></div>

                                </div>
                            </div>

                        </div>


                        <c:forEach items="${listslidebanner}" var="list">
                            <div class="item">

                                <div class="container">
                                    <div class="row">

                                        <div class="span6">

                                            <div class="carousel-caption">
                                                <h1>${list.slidebannername}</h1>
                                                <p class="lead">${list.slidebannercontent}</p>
                                                <a class="btn btn-large btn-primary" href="SignInController">Sign up today</a>
                                            </div>

                                        </div>

                                        <div class="span6"> <img src="Template/Fontend/img/slide/${list.slidebannerimage}" height="400px"></div>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                    <!-- Carousel nav -->
                    <a class="carousel-control left " href="#myCarousel" data-slide="prev"><i class="icon-chevron-left"></i></a>
                    <a class="carousel-control right" href="#myCarousel" data-slide="next"><i class="icon-chevron-right"></i></a>
                    <!-- /.Carousel nav -->

                </div>

                <!-- /Carousel -->



                <!-- Feature 
  ==============================================-->

                <div class="row feature-box">
                    <div class="span12 cnt-title">
                        <h1>Chúng tôi cung cấp cho các bạn giao diện học và thi thân thiện với người dùng</h1>
                        <span>(--Thi thử, Học từ vựng, Nghe nghạc tiếng anh --)</span>
                    </div>

                    <div class="span4">
                        <a href="SignInController">
        <img src="Template/Fontend/img/test_1.png">
        </a>
                        <h2>Thi thử TOEIC</h2>
                        <p>
                            Các bạn học viên có thể đăng ký vào hệ thống và được thi thử TOEIC
                        </p>

                    </div>

                    <div class="span4">
                        <a href="SignInController">
        <img src="Template/Fontend/img/vocabulary.JPG">
        </a>
                        <h2>Một số từ vựng cơ bản</h2>
                        <p>
                            Một số từ vựng của TOEIC thông dụng
                        </p>
                    </div>

                    <div class="span4">
                        <a href="SignInController">
        <img src="Template/Fontend/img/music.png">
        </a>
                        <h2>Nhạc tiếng anh</h2>
                        <p>
                            Những bài nhạc tiếng anh hay nhất mọi thời đại.
                        </p>
                    </div>
                </div>

                <!-- /.Feature -->

                <div class="hr-divider"></div>


                <!-- Row View -->


                <div class="row">
                    <div class="span6"><img src="Template/Fontend/img/background.jpg"></div>

                    <div class="span6">
                        <img class="hidden-phone" src="Template/Fontend/img/icon4.png" alt="">
                        <h1>TOEIC Online</h1>
                        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                    </div>
                </div>

            </div>


            <!-- /.Row View -->


            <!--Footer
==========================-->

            <footer>
                <div class="container">
                    <div class="row">
                        <div class="span6" style="color: red;">
                            Nguyen Quang Huy _ Nguyen Dinh Thai <br> <small>Thi TOEIC online</small>
                        </div>
                        <div class="span6">
                            <div class="social pull-right">
                                <a href="#"><img
						src="Template/Fontend/img/social/googleplus.png" alt=""></a> <a href="#"><img src="Template/Fontend/img/social/dribbble.png"
						alt=""></a> <a href="#"><img
						src="Template/Fontend/img/social/twitter.png" alt=""></a> <a href="#"><img src="Template/Fontend/img/social/dribbble.png"
						alt=""></a> <a href="#"><img
						src="Template/Fontend/img/social/rss.png" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!--/.Footer-->

        </body>

        </html>
