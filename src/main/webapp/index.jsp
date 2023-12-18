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

<div class="container-fluid">
    <!-- Background image -->
<%--    <div class="bg-image"--%>
<%--         style="background-image: url('https://mdbcdn.b-cdn.net/img/new/standard/city/041.webp'); height: 100vh;">--%>
<%--    </div>--%>
    <!-- Background image -->
    <div class="row">
        <div class="col-6 col-lg-4 offset-3 offset-lg-4 bg-white rounded-2 p-3 mt-3">
            <h1 class="text-red text-center"><%="Sign-in"%>
            </h1>
            <%-- Get User inputs : Form --%>
            <form class="row my-1 needs-validation" action="${pageContext.request.contextPath}/login" method="post">
                <div class="col-12 mb-3">
                    <label for="uname" class="form-label">Username</label>
                    <input name="username" type="text" class="form-control" id="uname" placeholder="Jhon">
                </div>
                <div class="col-12 mb-3">
                    <label for="pwd" class="form-label">Password</label>
                    <input name="password" type="password" class="form-control" id="pwd" placeholder="">
                </div>
                <div class="col-12">
                    <button class="btn btn-success" type="submit">Login</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"
        integrity="sha512-WW8/jxkELe2CAiE4LvQfwm1rajOS8PHasCCx+knHG0gBHt8EXxS6T6tJRTGuDQVnluuAvMxWF4j8SNFDKceLFg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>