<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--    meta tags --%>
    <meta name="description"
          content="Library management system version 1.0"/>
    <meta charset="utf-8"/>
    <title><%= "Home | LMS"%>></title>
    <%--    Bootstrap.css link --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"
          integrity="sha512-b2QcS5SsA8tZodcDtGRELiGv5SaKSk1vDHDaQRda0htPYWZ6046lr3kJ5bAAQdpV2mmA/4v0wQF9MyU6/pDIAg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <%--    Custom css --%>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12 text-center mt-custom">
            <h1>Library Management System</h1>
        </div>
        <div class="col-10 offset-1 col-lg-4 offset-lg-4">
            <button class="btn-custom-main p-3" type="button">Employee</button>
            <button class="btn-custom-main p-3" type="button">Bookstore</button>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"
        integrity="sha512-WW8/jxkELe2CAiE4LvQfwm1rajOS8PHasCCx+knHG0gBHt8EXxS6T6tJRTGuDQVnluuAvMxWF4j8SNFDKceLFg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
