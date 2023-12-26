<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Library management system version 1.0"/>

    <title>Employee | LMS </title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css">
    <style>

        .form-container {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background for better readability */
            border-radius: 15px;
            padding: 30px;
            margin: 100px auto; /* Center the form horizontally */
        }

        .valid {
            border-color: green;
        }

        .invalid {
            border-color: red;
        }
    </style>
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
                    <a class="nav-link active" href="employeeadd.jsp">Employee Add</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="employeeupdate.jsp">Employee Update</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid bg-light">
    <div class="row">
        <div class="col-12">
            <div class="row form-container">
                <h2 class="col-12 text-center mb-4">Employee Details Form</h2>
                <form class="col-12 col-md-6 offset-md-3" id="employee-form"
                      action="${pageContext.request.contextPath}/employee-add" method="post">
                    <div class="row">
                        <div class="col-12 col-md-4 mb-3">
                            <label for="employeeId">Employee ID:</label>
                            <input name="empId" type="text" class="form-control" id="employeeId" required>
                        </div>
                        <div class="col-12">
                            <div class="row">
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="firstName">First Name:</label>
                                    <input name="fname" type="text" class="form-control" id="firstName" required>
                                </div>
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="lastName">Last Name:</label>
                                    <input name="lname" type="text" class="form-control" id="lastName" required>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <label>Gender:</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="male" value="male"
                                       required>
                                <label class="form-check-label" for="male">Male</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                                <label class="form-check-label" for="female">Female</label>
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="edu">Education:</label>
                            <input name="education" type="text" class="form-control" id="edu" required>
                        </div>
                        <div class="col-4 col-md-3 mb-3">
                            <label for="addno">Address No:</label>
                            <input name="addressNo" type="text" class="form-control" id="addno" required>
                        </div>
                        <div class="col-8 col-md-9 mb-3">
                            <label for="streetno">Street:</label>
                            <input name="streetNo" type="text" class="form-control" id="streetno" required>
                        </div>
                        <div class="col-6 mb-3">
                            <label for="cityno">City:</label>
                            <input name="city" type="text" class="form-control" id="cityno" required>
                        </div>
                        <div class="col-6 mb-3">
                            <label for="countryno">Country:</label>
                            <input name="country" type="text" class="form-control" id="countryno" required>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="birthday">Birthday:</label>
                            <input name="dob" type="date" class="form-control" id="birthday" required>
                        </div>
                    </div>
                    <button type="submit" class="col-12 w-100 btn btn-primary mt-4" value="Refresh">Add new Employee
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"
        integrity="sha512-WW8/jxkELe2CAiE4LvQfwm1rajOS8PHasCCx+knHG0gBHt8EXxS6T6tJRTGuDQVnluuAvMxWF4j8SNFDKceLFg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
