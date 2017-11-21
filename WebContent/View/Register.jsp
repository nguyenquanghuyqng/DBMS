<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

            <link href="Template/Fontend/css/login.css" rel="stylesheet">
            <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans:600'>
            <script type="text/javascript" src="View/validation.js"></script>

            <title>Login</title>
        </head>

        <body>
            <div class="login-wrap">
                <div class="login-html">
                    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
                    <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
                    <div class="login-form">
                        <div class="sign-in-htm" id="divdangki">
                            <form action="SignInController" method="post" name="frmDangNhap">
                                <h4 style="color: red; visibility: hidden" id="mess">
                                    <%=request.getAttribute("message")%>
                                </h4>
                                <div id="thongbao">
                                    <p id="pthongbao"></p>
                                </div>
                                <div class="group">
                                    <label for="user" class="label">Username</label>
                                    <input id="user" type="text" class="input" name="user">
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">Password</label>
                                    <input id="pass" type="password" class="input" name="pass">

                                </div>
                                <div class="group">
                                    <input id="check" type="checkbox" class="check" checked>
                                    <label for="check"><span class="icon"></span> Keep me Signed in</label>
                                </div>
                                <div class="group">
                                    <input type="submit" class="button" value="Sign In" onclick="return KiemTraHopLe()">
                                </div>
                                <div class="hr"></div>
                                <div class="foot-lnk">
                                    <a href="#forgot">Forgot Password?</a>
                                </div>
                            </form>
                        </div>

                        <div class="sign-up-htm" id="divdangnhap">
                            <form action="SignUpController" method="post" name="frmDangKy">
                                <div id="thongbao">
                                    <p id="pthongbao"></p>
                                </div>
                                <div class="group">
                                    <label for="user" class="label">Username</label>
                                    <input id="user" type="text" class="input" name="username">
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">Password</label>
                                    <input id="pass" type="password" class="input" name="password">
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">Repeat Password</label>
                                    <input id="pass" type="password" class="input" name="repeatpassword">
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">Email Address</label>
                                    <input id="email" type="text" class="input" name="email">
                                </div>
                                <div class="group">
                                    <input type="submit" class="button" value="Sign Up" onclick="return KiemTraHopLeSignUp()">
                                </div>
                                <div class="hr"></div>
                                <div class="foot-lnk">
                                    <label for="tab-1">Already Member?</label>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>
