<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Result Page</title>
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
            <!-- /HEADER ROW -->
            <%! int point=0; %>
                <div class="container">
                    <h2>Result</h2>
                    <form action="QuizForward" method="post">
                        <c:forEach items="${listcorrectanswer}" var="listcorrectanswer">
                            <c:forEach items="${listansweruser}" var="listansweruser">

                                <c:if test="${listcorrectanswer.readnumber == listansweruser.number}">
                                    <c:if test="${listcorrectanswer.correctanswer == 'A'}">
                                        <c:if test="${listansweruser.answer == 'A'}">
                                            <%point++; %>
                                                <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                                </p>
                                                <img alt="" src="Image/correct.png"> ${listcorrectanswer.option1}
                                                <br> ${listcorrectanswer.option2}
                                                <br> ${listcorrectanswer.option3}
                                                <br> ${listcorrectanswer.option4}
                                                <br>
                                        </c:if>

                                        <c:if test="${listansweruser.answer == 'B'}">
                                            <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                            </p>
                                            <img alt="" src="Image/correct.png">${listcorrectanswer.option1}
                                            <br>
                                            <img alt="" src="Image/incorrect.png">${listcorrectanswer.option2}
                                            <br> ${listcorrectanswer.option3}
                                            <br> ${listcorrectanswer.option4}
                                            <br>
                                        </c:if>

                                        <c:if test="${listansweruser.answer == 'C'}">
                                            <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                            </p>
                                            <img alt="" src="Image/correct.png">${listcorrectanswer.option1}
                                            <br> ${listcorrectanswer.option2}
                                            <br>
                                            <img alt="" src="Image/incorrect.png">${listcorrectanswer.option3}
                                            <br> ${listcorrectanswer.option4}
                                            <br>
                                        </c:if>

                                        <c:if test="${listansweruser.answer == 'D'}">
                                            <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                            </p>
                                            <img alt="" src="Image/correct.png">${listcorrectanswer.option1}
                                            <br> ${listcorrectanswer.option2}
                                            <br> ${listcorrectanswer.option3}
                                            <br>
                                            <img alt="" src="Image/incorrect.png">${listcorrectanswer.option4}
                                            <br>
                                        </c:if>

                                    </c:if>

                                    <c:if test="${listcorrectanswer.correctanswer == 'B'}">

                                        <c:if test="${listansweruser.answer == 'A'}">
                                            <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                            </p>
                                            <img alt="" src="Image/incorrect.png">${listcorrectanswer.option1}
                                            <br>
                                            <img alt="" src="Image/correct.png"> ${listcorrectanswer.option2}
                                            <br> ${listcorrectanswer.option3}
                                            <br> ${listcorrectanswer.option4}
                                            <br>
                                        </c:if>

                                        <c:if test="${listansweruser.answer == 'B'}">
                                            <%point++; %>
                                                <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                                </p>
                                                ${listcorrectanswer.option1}
                                                <br>
                                                <img alt="" src="Image/correct.png">${listcorrectanswer.option2}
                                                <br> ${listcorrectanswer.option3}
                                                <br> ${listcorrectanswer.option4}
                                                <br>
                                        </c:if>

                                        <c:if test="${listansweruser.answer == 'C'}">
                                            <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                            </p>
                                            ${listcorrectanswer.option1}
                                            <br>
                                            <img alt="" src="Image/correct.png">${listcorrectanswer.option2}
                                            <br>
                                            <img alt="" src="Image/incorrect.png">${listcorrectanswer.option3}
                                            <br> ${listcorrectanswer.option4}
                                            <br>
                                        </c:if>

                                        <c:if test="${listansweruser.answer == 'D'}">
                                            <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                            </p>
                                            ${listcorrectanswer.option1}
                                            <br>
                                            <img alt="" src="Image/correct.png">${listcorrectanswer.option2}
                                            <br> ${listcorrectanswer.option3}
                                            <br>
                                            <img alt="" src="Image/incorrect.png">${listcorrectanswer.option4}
                                            <br>
                                        </c:if>


                                    </c:if>
                                    <c:if test="${listcorrectanswer.correctanswer == 'C'}">

                                        <c:if test="${listansweruser.answer == 'A'}">
                                            <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                            </p>
                                            <img alt="" src="Image/incorrect.png">${listcorrectanswer.option1}
                                            <br> ${listcorrectanswer.option2}
                                            <br>
                                            <img alt="" src="Image/correct.png">${listcorrectanswer.option3}
                                            <br> ${listcorrectanswer.option4}
                                            <br>
                                        </c:if>

                                        <c:if test="${listansweruser.answer == 'B'}">
                                            <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                            </p>
                                            ${listcorrectanswer.option1}
                                            <br>
                                            <img alt="" src="Image/incorrect.png">${listcorrectanswer.option2}
                                            <br>
                                            <img alt="" src="Image/correct.png">${listcorrectanswer.option3}
                                            <br> ${listcorrectanswer.option4}
                                            <br>
                                        </c:if>

                                        <c:if test="${listansweruser.answer == 'C'}">
                                            <%point++; %>
                                                <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                                </p>
                                                ${listcorrectanswer.option1}
                                                <br> ${listcorrectanswer.option2}
                                                <br>
                                                <img alt="" src="Image/correct.png">${listcorrectanswer.option3}
                                                <br> ${listcorrectanswer.option4}
                                                <br>
                                        </c:if>

                                        <c:if test="${listansweruser.answer == 'D'}">
                                            <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                            </p>
                                            ${listcorrectanswer.option1}
                                            <br> ${listcorrectanswer.option2}
                                            <br>
                                            <img alt="" src="Image/correct.png">${listcorrectanswer.option3}
                                            <br>
                                            <img alt="" src="Image/incorrect.png">${listcorrectanswer.option4}
                                            <br>
                                        </c:if>


                                    </c:if>
                                    <c:if test="${listcorrectanswer.correctanswer == 'D'}">

                                        <c:if test="${listansweruser.answer == 'A'}">
                                            <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                            </p>
                                            <img alt="" src="Image/incorrect.png">${listcorrectanswer.option1}
                                            <br> ${listcorrectanswer.option2}
                                            <br> ${listcorrectanswer.option3}
                                            <br>
                                            <img alt="" src="Image/correct.png">${listcorrectanswer.option4}
                                            <br>
                                        </c:if>

                                        <c:if test="${listansweruser.answer == 'B'}">
                                            <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                            </p>
                                            ${listcorrectanswer.option1}
                                            <br>
                                            <img alt="" src="Image/incorrect.png">${listcorrectanswer.option2}
                                            <br> ${listcorrectanswer.option3}
                                            <br>
                                            <img alt="" src="Image/correct.png">${listcorrectanswer.option4}
                                            <br>
                                        </c:if>

                                        <c:if test="${listansweruser.answer == 'C'}">
                                            <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                            </p>
                                            ${listcorrectanswer.option1}
                                            <br> ${listcorrectanswer.option2}
                                            <br>
                                            <img alt="" src="Image/incorrect.png">${listcorrectanswer.option3}
                                            <br>
                                            <img alt="" src="Image/correct.png">${listcorrectanswer.option4}
                                            <br>
                                        </c:if>

                                        <c:if test="${listansweruser.answer == 'D'}">
                                            <%point++; %>
                                                <p>${listcorrectanswer.readnumber}. ${listcorrectanswer.readcontent}
                                                </p>
                                                ${listcorrectanswer.option1}
                                                <br> ${listcorrectanswer.option2}
                                                <br> ${listcorrectanswer.option3}
                                                <br>
                                                <img alt="" src="Image/correct.png">${listcorrectanswer.option4}
                                                <br>
                                        </c:if>

                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                        <br /> <input type="submit" value="Again" />
                    </form>
                    <p style="color:red">Point:
                        <%= point %>
                    </p>
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
