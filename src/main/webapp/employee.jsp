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
        body
        {
            /*background-image: url('path/to/your/suitable/background.jpg');*/
            /* Replace with your background image path */
            background-size: cover;
        }

        .form-container
        {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background for better readability */
            border-radius: 15px;
            padding: 30px;
            margin: 100px auto; /* Center the form horizontally */
            max-width: 500px;
        }

        .valid
        {
            border-color: green;
        }

        .invalid
        {
            border-color: red;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2 class="text-center mb-4">Employee Details Form</h2>
    <form id="employee-form">
        <div class="form-group">
            <label for="employeeId">Employee ID:</label>
            <input
                    type="text"
                    class="form-control"
                    id="employeeId"
                    required>
        </div>
        <div
                class="form-group">
            <label
                    for="firstName">First Name:</label>
            <input
                    type="text"
                    class="form-control"
                    id="firstName"
                    required>
        </div>
        <div
                class="form-group">
            <label
                    for="lastName">Last Name:</label>
            <input
                    type="text"
                    class="form-control"
                    id="lastName"
                    required>
        </div>
        <div
                class="form-group">
            <label>Gender:</label>
            <div
                    class="form-check">
                <input
                        class="form-check-input"
                        type="radio"
                        name="gender"
                        id="male"
                        value="male"
                        required>
                <label
                        class="form-check-label"
                        for="male">Male</label>
            </div>
            <div
                    class="form-check">
                <input class="form-check-input"
                       type="radio"
                       name="gender"
                       id="female"
                       value="female">
                <label
                        class="form-check-label"
                        for="female">Female</label>
            </div>
        </div>
        <div class="form-group">
            <label
                    for="education">Education:</label>
            <input
                    type="text" class="form-control" id="education" required>
        </div>
        <div class="form-group">
            <label
                    for="address">Address:</label>

            <textarea
                    class="form-control"
                    id="address"
                    rows="3"
                    required></textarea>

        </div>
        <div
                class="form-group">
            <label
                    for="country">Country:</label>
            <select
                    class="form-select" id="country" required>
            </select>
        </div>
        <div class="form-group">
            <label for="birthday">Birthday:</label>
            <input
                    type="date"
                    class="form-control"
                    id="birthday"
                    required>
        </div>
        <button
                type="submit"
                class="btn btn-primary mt-4">Submit
        </button>
    </form>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"
        integrity="sha512-WW8/jxkELe2CAiE4LvQfwm1rajOS8PHasCCx+knHG0gBHt8EXxS6T6tJRTGuDQVnluuAvMxWF4j8SNFDKceLFg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
