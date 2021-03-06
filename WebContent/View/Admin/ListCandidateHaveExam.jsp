<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>List of candidates with exam</title>

            <meta name="description" content="overview &amp; stats" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

            <!-- bootstrap & fontawesome -->
            <link rel="stylesheet" href="Style/css/bootstrap.min.css" />
            <link rel="stylesheet" href="Style/css/font-awesome.min.css" />


            <!-- page specific plugin styles -->
            <link rel="stylesheet" href="Style/js/jquery-ui.custom.min.css" />
            <link rel="stylesheet" href="Style/css/fullcalendar.min.css" />


            <!-- text fonts -->
            <link rel="stylesheet" href="Style/css/fonts.googleapis.com.css" />

            <!-- ace styles -->
            <link rel="stylesheet" href="Style/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

            <link rel="stylesheet" href="Style/css/ace-skins.min.css" />
            <link rel="stylesheet" href="Style/css/ace-rtl.min.css" />

            <!-- ace settings handler -->
            <script src="Style/js/ace-extra.min.js"></script>

            <link rel="stylesheet " href="Style/css/template.css" type="text/css ">

            <script src="Style/js/jquery-2.1.4.min.js"></script>

            <script src="Style/js/bootstrap.min.js"></script>

            <!-- ace scripts -->
            <script src="Style/js/ace-elements.min.js"></script>
            <script src="Style/js/ace.min.js"></script>

            <!-- Show thông báo ra màn hình -->
            <script type="text/javascript">
                function show_comfirm() {
                    var comfirmBox;
                    comfirmBox = confirm("Bạn có chắc chắn muốn xóa kết quả?");
                    if (comfirmBox == true) {
                        return true;
                    } else {
                        return false;
                    }
                }

            </script>

            <!-- Search -->
            <script>
                $(document).ready(function() {
                    $("#myInput").on("keyup", function() {
                        var value = $(this).val().toLowerCase();
                        $("#myTable tr").filter(function() {
                            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                        });
                    });
                });

            </script>


        </head>

        <body class="no-skin" style="font-size: 14px;">
            <div id="navbar" class="navbar navbar-default          ace-save-state">
                <div class="navbar-container ace-save-state" id="navbar-container">
                    <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
				<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

                    <div class="navbar-header pull-left">
                        <a href="HomeAdminForWard" class="navbar-brand"> <small>
						<i class="fa fa-leaf"></i> HCMUTE
				</small>
				</a>
                    </div>

                    <div class="navbar-buttons navbar-header pull-right" role="navigation">
                        <ul class="nav ace-nav">
                            <li class="purple dropdown-modal"><a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
							class="ace-icon fa fa-bell icon-animated-bell"></i> <span
							class="badge badge-important">8</span>
					</a>

                                <ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
                                    <li class="dropdown-header"><i class="ace-icon fa fa-exclamation-triangle"></i> 8 Notifications
                                    </li>

                                    <li class="dropdown-content">
                                        <ul class="dropdown-menu dropdown-navbar navbar-pink">
                                            <li>
                                                <a href="#">
                                                    <div class="clearfix">
                                                        <span class="pull-left"> <i
													class="btn btn-xs no-hover btn-pink fa fa-comment"></i> New
													Comments
												</span> <span class="pull-right badge badge-info">+12</span>
                                                    </div>
                                                </a>
                                            </li>

                                            <li><a href="#"> <i
											class="btn btn-xs btn-primary fa fa-user"></i> Bob just
											signed up as an editor ...
									</a></li>

                                            <li>
                                                <a href="#">
                                                    <div class="clearfix">
                                                        <span class="pull-left"> <i
													class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
													New Orders
												</span> <span class="pull-right badge badge-success">+8</span>
                                                    </div>
                                                </a>
                                            </li>

                                            <li>
                                                <a href="#">
                                                    <div class="clearfix">
                                                        <span class="pull-left"> <i
													class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
													Followers
												</span> <span class="pull-right badge badge-info">+11</span>
                                                    </div>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li class="dropdown-footer"><a href="#"> See all
									notifications <i class="ace-icon fa fa-arrow-right"></i>
							</a></li>
                                </ul>
                            </li>

                            <li class="green dropdown-modal"><a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
							class="ace-icon fa fa-envelope icon-animated-vertical"></i> <span
							class="badge badge-success">5</span>
					</a>

                                <ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
                                    <li class="dropdown-header"><i class="ace-icon fa fa-envelope-o"></i> 5 Messages</li>

                                    <li class="dropdown-content">
                                        <ul class="dropdown-menu dropdown-navbar">
                                            <li><a href="#" class="clearfix"> <img
											src="Style/images/avatar.png" class="msg-photo"
											alt="Alex's Avatar" /> <span class="msg-body"> <span
												class="msg-title"> <span class="blue">Alex:</span>
													Ciao sociis natoque penatibus et auctor ...
											</span> <span class="msg-time"> <i
													class="ace-icon fa fa-clock-o"></i> <span>a moment
														ago</span>
											</span>
										</span>
									</a></li>

                                            <li><a href="#" class="clearfix"> <img
											src="Style/images/avatar3.png" class="msg-photo"
											alt="Susan's Avatar" /> <span class="msg-body"> <span
												class="msg-title"> <span class="blue">Susan:</span>
													Vestibulum id ligula porta felis euismod ...
											</span> <span class="msg-time"> <i
													class="ace-icon fa fa-clock-o"></i> <span>20 minutes
														ago</span>
											</span>
										</span>
									</a></li>

                                            <li><a href="#" class="clearfix"> <img
											src="Style/images/avatar4.png" class="msg-photo"
											alt="Bob's Avatar" /> <span class="msg-body"> <span
												class="msg-title"> <span class="blue">Bob:</span>
													Nullam quis risus eget urna mollis ornare ...
											</span> <span class="msg-time"> <i
													class="ace-icon fa fa-clock-o"></i> <span>3:15 pm</span>
											</span>
										</span>
									</a></li>

                                            <li><a href="#" class="clearfix"> <img
											src="Style/images/avatar2.png" class="msg-photo"
											alt="Kate's Avatar" /> <span class="msg-body"> <span
												class="msg-title"> <span class="blue">Kate:</span>
													Ciao sociis natoque eget urna mollis ornare ...
											</span> <span class="msg-time"> <i
													class="ace-icon fa fa-clock-o"></i> <span>1:33 pm</span>
											</span>
										</span>
									</a></li>

                                            <li><a href="#" class="clearfix"> <img
											src="Style/images/avatar5.png" class="msg-photo"
											alt="Fred's Avatar" /> <span class="msg-body"> <span
												class="msg-title"> <span class="blue">Fred:</span>
													Vestibulum id penatibus et auctor ...
											</span> <span class="msg-time"> <i
													class="ace-icon fa fa-clock-o"></i> <span>10:09 am</span>
											</span>
										</span>
									</a></li>
                                        </ul>
                                    </li>

                                    <li class="dropdown-footer"><a href="inbox.html"> See
									all messages <i class="ace-icon fa fa-arrow-right"></i>
							</a></li>
                                </ul>
                            </li>

                            <li class="light-blue dropdown-modal"><a data-toggle="dropdown" href="#" class="dropdown-toggle"> <img
							class="nav-user-photo" src="Style/images/user.jpg"
							alt="Jason's Photo" /> <span class="user-info"> <small>Welcome,</small>
								Jason
						</span> <i class="ace-icon fa fa-caret-down"></i>
					</a>

                                <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                                    <li><a href="#"> <i class="ace-icon fa fa-cog"></i>
									Settings
							</a></li>

                                    <li><a href="#"> <i class="ace-icon fa fa-user"></i>
									Profile
							</a></li>

                                    <li class="divider"></li>

                                    <li><a href="HomePage"> <i
									class="ace-icon fa fa-power-off"></i> Logout
							</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /.navbar-container -->
            </div>

            <div class="main-container ace-save-state" id="main-container">
                <script type="text/javascript">
                    try {
                        ace.settings.loadState('main-container')
                    } catch (e) {}

                </script>

                <div id="sidebar" class="sidebar responsive ace-save-state">
                    <script type="text/javascript">
                        try {
                            ace.settings.loadState('sidebar')
                        } catch (e) {}

                    </script>

                    <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                            <button class="btn btn-success">
						<i class="ace-icon fa fa-signal"></i>
					</button>

                            <button class="btn btn-info">
						<i class="ace-icon fa fa-pencil"></i>
					</button>

                            <button class="btn btn-warning">
						<i class="ace-icon fa fa-users"></i>
					</button>

                            <button class="btn btn-danger">
						<i class="ace-icon fa fa-cogs"></i>
					</button>
                        </div>

                        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                            <span class="btn btn-success"></span> <span class="btn btn-info"></span>

                            <span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
                        </div>
                    </div>
<!-- /.sidebar-shortcuts -->

                   <ul class="nav nav-list">
                        <li class="active">
                            <a href="HomeAdminForWard">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text">Home Admin</span>
						</a>

                            <b class="arrow"></b>
                        </li>

                        <!-- fa-desktop: là sử dụng font-awesome để lấy các icon -->
                        <li class="">
                            <a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">
								Manager Account
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

                            <b class="arrow"></b>

                            <ul class="submenu">
                                <li class="">
                                    <a href="InsertAccount">
									<i class="menu-icon fa fa-caret-right"></i>

									Insert Account
									<b class="arrow"></b>
								</a>

                                    <b class="arrow"></b>

                                    <li class="">
                                        <a href="UpdateandDeleteAccount?pageid=1">
									<i class="menu-icon fa fa-caret-right"></i>
									Update and Delete Account
								</a>

                                        <b class="arrow"></b>
                                    </li>

                                </li>
                        </li>
                        </ul>
                        </li>
                        <li class="">
                            <a href="#QuestionManager" class="dropdown-toggle">
							<i class="menu-icon fa fa-list"></i>
							<span class="menu-text"> Questions </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

                            <b class="arrow"></b>

                            <ul class="submenu">
                           		<li class="">
                                    <a href="InsertOneQuestion">
									<i class="menu-icon fa fa-caret-right"></i>
									Insert One Question
								</a>

                                    <b class="arrow"></b>
                                </li>
                            
                                <li class="">
                                    <a href="InsertQuestion">
									<i class="menu-icon fa fa-caret-right"></i>
									Insert List Question
								</a>

                                    <b class="arrow"></b>
                                </li>

                                <li class="">
                                    <a href="UpdateDeleteQuestion?pageid=1">
									<i class="menu-icon fa fa-caret-right"></i>
									Update & Delete Question
								</a>

                                    <b class="arrow"></b>
                                </li>
                            </ul>
                        </li>

                        <li class="">
                            <a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-pencil-square-o"></i>
							<span class="menu-text"> Manager Result </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

                            <b class="arrow"></b>

                            <ul class="submenu">
                                <li class="">
                                    <a href="#" class="dropdown-toggle"> <i
							class="menu-icon fa fa-caret-right"></i> View Result
							</a> <b class="arrow"></b>
                                    <ul class="submenu">
                                        <li class="">
                                            <a href="CandidateHaveExam">
											<i class="menu-icon fa fa-caret-right"></i>
											List of candidates with exam
										</a>

                                            <b class="arrow"></b>
                                        </li>

                                        <li class="">
                                            <a href="CandidateDontHaveExam">
											<i class="menu-icon fa fa-caret-right"></i>
											List of candidates did not contest
										</a>

                                            <b class="arrow"></b>
                                        </li>
                                        
                                        <li class="">
                                            <a href="HighPoint">
											<i class="menu-icon fa fa-caret-right"></i>
											Top account have high point
										</a>

                                            <b class="arrow"></b>
                                        </li>
                                        
                                    </ul>
                                </li>

                                <li class="">
                                    <a href="EditResult?pageid=1">
									<i class="menu-icon fa fa-caret-right"></i>
									Edit Result
								</a>

                                    <b class="arrow"></b>
                                </li>
                            </ul>
                        </li>

                        <li class="">
                            <a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-list-alt"></i>
							<span class="menu-text"> Manage Test Sheet </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

                            <b class="arrow"></b>

                            <ul class="submenu">
                                <li class="">
                                    <a href="InsertQuestion">
									<i class="menu-icon fa fa-caret-right"></i>
									Insert TestSheet
								</a>

                                    <b class="arrow"></b>
                                </li>

                                <li class="">
                                    <a href="UpdateDeleteTest">
									<i class="menu-icon fa fa-caret-right"></i>
									Update & Delete TestSheet
								</a>

                                    <b class="arrow"></b>
                                </li>
                            </ul>
                        </li>
                        
                        <li class="">
                            <a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-tag"></i>
							<span class="menu-text"> Statistical </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

                            <b class="arrow"></b>

                            <ul class="submenu">
                                <li class="">
                                    <a href="#">
									<i class="menu-icon fa fa-caret-right"></i>
									Counting
								</a>

                                    <b class="arrow"></b>
                                </li>

                                <li class="">
                                    <a href="#">
									<i class="menu-icon fa fa-caret-right"></i>
									Check 
								</a>

                                    <b class="arrow"></b>
                                </li>
                            </ul>
                        </li>

                        <li class="">
                            <a href="Calendar">
							<i class="menu-icon fa fa-calendar"></i>

							<span class="menu-text">
								Calendar

								<span class="badge badge-transparent tooltip-error" title="2 Important Events">
									<i class="ace-icon "></i>
								</span>
							</span>
						</a>

                            <b class="arrow"></b>
                        </li>
                    </ul>
                    <!-- /.nav-list -->

                    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
                        <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
                    </div>
                </div>

                <div class="main-content">

                    <div class="main-content-inner">
                        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                            <ul class="breadcrumb">
                                <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
                                </li>

                                <li><a href="#">Manager Result</a></li>
                                <li class="active">View Result</li>
                            </ul>
                            <!-- /.breadcrumb -->

                            <div class="nav-search" id="nav-search">
                                <form class="form-search">
                                    <span class="input-icon"> <input type="text"
								placeholder="Search ..." class="nav-search-input"
								id="nav-search-input" autocomplete="off" /> <i
								class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
                                </form>
                            </div>
                            <!-- /.nav-search -->
                        </div>

                        <div class="page-content">
                            <!-- /.ace-settings-container -->


                            <div class="page-header">
                                <h1>
                                    View Result <small> <i
								class="ace-icon fa fa-angle-double-right"></i> overview &amp;
								stats
							</small>
                                </h1>
                            </div>

                            <div class="ViewResult">
                                <h2>View Result have exam</h2>
                                <br>
                                <table border='1' style="width: 100%" class="table table-hover table-bordered table-striped">
                                    <tr>
                                        <th>userid</th>
                                        <th>username</th>
                                        <th>email</th>
                                        <th>point</th>
                                    </tr>
                                    <tbody id="myTable">
                                        <c:forEach items="${candidate}" var="list">

                                            <tr>
                                                <td>${list.userid}</td>
                                                <td>${list.username}</td>
                                                <td>${list.email}</td>
                                                <td>${list.point}</td>
                                            </tr>

                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>


                        </div>
                    </div>
                    <!-- /.page-header -->
                </div>
                <!-- /.page-content -->
            </div>


            <!-- /.main-content -->

            <jsp:include page="Footer.jsp" />

            <!-- /.main-container -->

        </body>

        </html>
