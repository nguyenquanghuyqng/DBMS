<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Quiz Page</title>

            <link href="Template/Fontend/css/countdown.css" rel="stylesheet">
            <script type="text/javascript" src="Template/Fontend/js/countdown.js"></script>
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
                <div class="panel-body text-center">
                    <span id="showmns">00</span><span id="showmns">:</span><span id="showscs">00</span> </br><br>
                    <button class="btn btn-primary" id="btnct" onclick="countdownTimer()">
			<i class="fa fa-play" aria-hidden="true"></i> START
		</button>
                </div>
                <form action="QuizController" method="post">
                    <h2>
                        <%=request.getAttribute("msg") != null ? request.getAttribute("msg") : " "%>
                    </h2>
                    <p style="color: red; font-size: 24px">Baì thi TOEIC</p>
                    <br>
                    <p>In this TOEIC practice test there are 10 questions. For each question you will see an incomplete sentence. Four words or phrases, marked A-D are given beneath each sentence. You are to choose the one word or phrase that best completes the sentence. </p>
                    <br>
                    <c:forEach items="${listquiz}" var="list">

                        <p>${list.readnumber}.${list.readcontent}</p>

                        <input type="radio" name="ans[${list.readnumber}]" value="A"> ${list.option1}
                        <br /><br>
                        <input type="radio" name="ans[${list.readnumber}]" value="B"> ${list.option2}
                        <br /><br>
                        <input type="radio" name="ans[${list.readnumber}]" value="C"> ${list.option3}
                        <br /><br>
                        <input type="radio" name="ans[${list.readnumber}]" value="D"> ${list.option4}
                        <br /><br>


                    </c:forEach>
                    <br> <input type="submit" value="Submit">
                </form>
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
