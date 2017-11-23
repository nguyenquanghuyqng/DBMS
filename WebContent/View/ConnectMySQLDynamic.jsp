<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Connect to the MySQL Dynamic</title>
        
    </head>

    <body>
    <br>
    <br>
        <center>
        <h2 style="color:red">Connect to the Mysql database dynamic</h2>
        <br>
            <form action="HomeForward" method="post">
                <table>
                    <tr>
                        <td>Username :</td>
                        <td><input type="text" name="tendangnhap" /></td>
                    </tr>

                    <tr>
                        <td>Password :</td>
                        <td><input type="password" name="matkhau" /></td>
                    </tr>
                    <tr>
                        <td>IP</td>
<!--                         <td><select name="dropdown"> -->
<!-- 							<option>192.168.192.1</option> -->
<!-- 							<option>192.168.1.3</option> -->
<!-- 							<option>172.16.84.224</option> -->
<!-- 							<option>172.16.87.152</option> -->
<!-- 					</select></td> -->
					<td><input type="text" name="dropdown" /></td>
                    </tr>
                    <tr>
                        <td>Database</td>
                        <td><select name="dropdownData">
							<option>Student</option>
							<option>Eclipse</option>
							<option>webtoeic</option>
					</select></td>
                    </tr>

                </table>
                <input type="submit" value="Connect">
            </form>
        </center>
    </body>

    </html>
