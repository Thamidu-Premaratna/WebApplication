<%@ page import="javax.swing.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%--    meta tags --%>
    <meta name="description"
          content="Library management system version 1.0"/>
    <meta charset="utf-8"/>
    <title><%= "Login | LMS"%>></title>
    <%--    Bootstrap.css link --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"
          integrity="sha512-b2QcS5SsA8tZodcDtGRELiGv5SaKSk1vDHDaQRda0htPYWZ6046lr3kJ5bAAQdpV2mmA/4v0wQF9MyU6/pDIAg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <%--    Custom css --%>
    <link rel="stylesheet" href="style.css">
</head>
<body class="bg-black">
<%-- Creating a container for the page --%>

<div class="container-fluid"
     style="background-image: url(images/bg2.jpg); width: 100%; height: 100vh; background-repeat: no-repeat; background-size: cover;">
    <div style="height:100vh;" class="row align-items-center">
        <div class="col-6 col-lg-4 offset-3 offset-lg-4 rounded-2 p-3">
            <h1 class="text-white text-center"><%="Sign-in"%>
            </h1>
            <%-- Get User inputs : Form --%>
            <form class="row mt-3 needs-validation" action="${pageContext.request.contextPath}/login" method="post">
                <div class="col-12">
                    <div class="form-floating mb-3">
                        <input name="username" type="text" class="form-control" id="uname" placeholder="Username">
                        <label for="uname">Username</label>
                    </div>
                </div>
                <div class="col-12">
                    <div class="form-floating mb-3">
                        <input name="password" type="password" class="form-control" id="pwd" placeholder="Password">
                        <label for="pwd">Password</label>
                    </div>
                </div>
                <div class="col-12">
                    <button class="btn btn-success w-100" type="submit" value="Refresh">Login</button>
                </div>
            </form>
            <span class="badge text-bg-danger mt-2">${error_msg}</span>
            <a href="employee.jsp">Employee</a>
        </div>
    </div>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"
        integrity="sha512-WW8/jxkELe2CAiE4LvQfwm1rajOS8PHasCCx+knHG0gBHt8EXxS6T6tJRTGuDQVnluuAvMxWF4j8SNFDKceLFg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>