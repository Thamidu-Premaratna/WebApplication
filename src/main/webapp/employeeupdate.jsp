<%@ page import="com.web.webapplication.model.Employee" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--    meta tags --%>
    <meta name="description"
          content="Employee management system version 1.0"/>
    <meta charset="utf-8"/>
    <title>Employee Update | EMS</title>
    <%--    Bootstrap.css link --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"
          integrity="sha512-b2QcS5SsA8tZodcDtGRELiGv5SaKSk1vDHDaQRda0htPYWZ6046lr3kJ5bAAQdpV2mmA/4v0wQF9MyU6/pDIAg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <%--    Custom css --%>
    <link rel="stylesheet" href="style.css">
</head>
<body class="bg-light">
<nav class="navbar navbar-dark sticky-top navbar-expand-lg bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="employeeview.jsp">EMS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="employeeview.jsp">VIEW</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="employeeadd.jsp">ADD</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="employeeupdate.jsp">UPDATE</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid bg-light">
    <div class="row mt-4">
        <div class="col-12">
            <div class="row form-container bg-light">
                <h2 class="col-12 text-center mb-4">Employee Update Form</h2>
                <%
                    boolean isEmployeeSelected = false; // check whether employee is selected or not
                    Employee employee = null; // employee object
                    String error_msg = ""; // error message
                    if (request.getAttribute("employee") != null) {
                        employee = (Employee) request.getAttribute("employee");
                        isEmployeeSelected = true;
                    }
                %>
                <div class="col-12 col-md-6 offset-md-3">
                    <form action="${pageContext.request.contextPath}/employee-update" method="get">
                        <div class="row">
                            <div class="col-12 col-md-4 mb-3">
                                <label for="employeeId">Employee ID:</label>
                                <input name="empId" type="number" class="form-control" id="employeeId">
                            </div>
                            <div class="col-12 col-md-3">
                                <button type="submit" class="col-12 w-100 btn btn-primary mt-4" value="Refresh">Search
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <form class="col-12 col-md-6 offset-md-3" id="employee-form"
                      action="${pageContext.request.contextPath}/employee-update" method="post">
                    <div class="row">
                        <div class="col-12">
                            <%
                                if (request.getAttribute("error_msg") != null) {
                                    error_msg = (String) request.getAttribute("error_msg");
                                }
                            %>
                            <div class=" <% if(!Objects.equals(error_msg, "")){out.print("alert alert-danger");}%>"
                                 role="alert">
                                ${error_msg}
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="row">
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="firstName">First Name:</label>
                                    <input name="fname" type="text" class="form-control" id="firstName"
                                           value="${employee.getEmpFirstName()}" <% if(!isEmployeeSelected){out.print("disabled");} %>>
                                </div>
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="lastName">Last Name:</label>
                                    <input name="lname" type="text" class="form-control" id="lastName"
                                           value="${employee.getEmpLastName()}" <% if(!isEmployeeSelected){out.print("disabled");} %>>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <label>Gender:</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="male"
                                       value="male" <% if(employee!=null&&employee.getEmpGender().equals("male")){out.print("checked");} if(!isEmployeeSelected){out.print("disabled");} %>>
                                <label class="form-check-label" for="male">Male</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="female"
                                       value="female" <% if(employee!=null&&employee.getEmpGender().equals("female")){out.print("checked");} if(!isEmployeeSelected){out.print("disabled");} %>>
                                <label class="form-check-label" for="female">Female</label>
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="edu">Education:</label>
                            <input name="education" type="text" class="form-control" id="edu"
                                   value="${employee.getEmpEducation()}" <% if(!isEmployeeSelected){out.print("disabled");} %>>
                        </div>
                        <div class="col-4 col-md-3 mb-3">
                            <label for="addno">Address No:</label>
                            <input name="addressNo" type="text" class="form-control" id="addno"
                                   value="${employee.getEmpAddress().getAddressNo()}" <% if(!isEmployeeSelected){out.print("disabled");} %>>
                        </div>
                        <div class="col-8 col-md-9 mb-3">
                            <label for="streetno">Street:</label>
                            <input name="streetNo" type="text" class="form-control" id="streetno"
                                   value="${employee.getEmpAddress().getStreetNo()}" <% if(!isEmployeeSelected){out.print("disabled");} %>>
                        </div>
                        <div class="col-6 mb-3">
                            <label for="cityno">City:</label>
                            <input name="city" type="text" class="form-control" id="cityno"
                                   value="${employee.getEmpAddress().getCity()}" <% if(!isEmployeeSelected){out.print("disabled");} %>>
                        </div>
                        <div class="col-6 mb-3">
                            <label for="countryno">Country:</label>
                            <input name="country" type="text" class="form-control" id="countryno"
                                   value="${employee.getEmpAddress().getCountry()}" <% if(!isEmployeeSelected){out.print("disabled");} %>>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="birthday">Birthday:</label>
                            <input name="dob" type="date" class="form-control" id="birthday"
                                   value="${employee.getEmpBirthDay()}" <% if(!isEmployeeSelected){out.print("disabled");} %>>
                        </div>
                    </div>
                    <button type="submit" class="col-12 w-100 btn btn-outline-danger mt-4"
                            value="Refresh" <% if (!isEmployeeSelected) {
                        out.print("disabled");
                    } %>>Update Employee
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
