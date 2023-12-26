<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--    meta tags --%>
    <meta name="description"
          content="Library management system version 1.0"/>
    <meta charset="utf-8"/>
    <title>Employee Update | LMS</title>
    <%--    Bootstrap.css link --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"
          integrity="sha512-b2QcS5SsA8tZodcDtGRELiGv5SaKSk1vDHDaQRda0htPYWZ6046lr3kJ5bAAQdpV2mmA/4v0wQF9MyU6/pDIAg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <%--    Custom css --%>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<nav class="navbar navbar-dark sticky-top navbar-expand-lg bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="home.jsp">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="employeeview.jsp">Employee View</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="employeeadd.jsp">Employee Add</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="employeeupdate.jsp">Employee Update</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-12">

        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"
        integrity="sha512-WW8/jxkELe2CAiE4LvQfwm1rajOS8PHasCCx+knHG0gBHt8EXxS6T6tJRTGuDQVnluuAvMxWF4j8SNFDKceLFg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
