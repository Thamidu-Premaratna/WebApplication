<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">

    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0">

    <title>Employee Details Form</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <link
            rel="stylesheet"
            href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css">
    <style>
        body {
            /*background-image: url('path/to/your/suitable/background.jpg');*/
            /* Replace with your background image path */
            background-size: cover;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background for better readability */
            border-radius: 15px;
            padding: 30px;
            margin: 100px auto; /* Center the form horizontally */
            max-width: 500px;
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
<div class="form-container">
    <h2 class="text-center mb-4">Employee Details Form</h2>
    <form id="employee-form" action="${pageContext.request.contextPath}/employee" method="post">
        <div class="form-group">
            <label for="employeeId">Employee ID:</label>
            <input name="empId" type="text" class="form-control" id="employeeId" required>
        </div>
        <div class="form-group">
            <label for="firstName">First Name:</label>
            <input name="fname" type="text" class="form-control" id="firstName" required>
        </div>
        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <input name="lname" type="text" class="form-control" id="lastName" required>
        </div>
        <div class="form-group">
            <label>Gender:</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="gender" id="male" value="male" required>
                <label class="form-check-label" for="male">Male</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                <label class="form-check-label" for="female">Female</label>
            </div>
        </div>
        <div class="form-group">
            <label for="edu">Education:</label>
            <input name="education" type="text" class="form-control" id="edu" required>
        </div>
        <div class="form-group">
            <label for="addno">Address No:</label>
            <input name="addressNo" type="text" class="form-control" id="addno" required>
        </div>
        <div class="form-group">
            <label for="streetno">Street:</label>
            <input name="streetNo" type="text" class="form-control" id="streetno" required>
        </div>
        <div class="form-group">
            <label for="cityno">City:</label>
            <input name="city" type="text" class="form-control" id="cityno" required>
        </div>
        <div class="form-group">
            <label for="countryno">Country:</label>
            <input name="country" type="text" class="form-control" id="countryno" required>
        </div>
        <div class="form-group">
            <label for="birthday">Birthday:</label>
            <input name="dob" type="date" class="form-control" id="birthday" required>
        </div>
        <button type="submit" class="btn btn-primary mt-4" value="Refresh">Add new Employee</button>
    </form>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"
        integrity="sha512-WW8/jxkELe2CAiE4LvQfwm1rajOS8PHasCCx+knHG0gBHt8EXxS6T6tJRTGuDQVnluuAvMxWF4j8SNFDKceLFg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
