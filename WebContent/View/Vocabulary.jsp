<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Vocabulary</title>

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
                        <div class="span3">
                            <a class="brand" href="#"><img
						src="Template/Fontend/img/slide/logo5.png" /></a>
                        </div>
                        <!-- /LOGO -->

                        <!-- MAIN NAVIGATION -->
                        <div class="span9">
                            <div class="navbar  pull-right">
                                <div class="navbar-inner">
                                    <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar"> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span></a>
                                    <div class="nav-collapse collapse navbar-responsive-collapse">
                                        <ul class="nav">

                                            <li><a href="#"> Welcome: Student</a></li>
                                            <li><a href="HomeForward">Logout</a></li>

                                        </ul>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- MAIN NAVIGATION -->
                    </div>
                </div>
            </div>

            <br>

            <div class="container">

                <p style="color:red">Một số từ vựng TOEIC cơ bản</p>

                <c:forEach items="${vocabulary}" var="list">

                    <p>${list.vocabularyname} : ${list.vocabularymean}</p>

                </c:forEach>

            </div>

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

        </body>

        </html>
