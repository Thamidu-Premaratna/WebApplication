<%@ page import="com.web.webapplication.model.EmployeeCollection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.web.webapplication.model.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--    meta tags --%>
    <meta name="description"
          content="Employee management system version 1.0"/>
    <meta charset="utf-8"/>
    <title>Employee - View | LMS</title>
    <%--    Bootstrap.css link --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"
          integrity="sha512-b2QcS5SsA8tZodcDtGRELiGv5SaKSk1vDHDaQRda0htPYWZ6046lr3kJ5bAAQdpV2mmA/4v0wQF9MyU6/pDIAg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <%--    Css --%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
          integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

    <%--    Custom css --%>
    <link rel="stylesheet" href="style.css">

    <style>
        .form-control-borderless {
            border: none;
        }

        .form-control-borderless:hover, .form-control-borderless:active, .form-control-borderless:focus {
            border: none;
            outline: none;
            box-shadow: none;
        }
    </style>
</head>
<body class="bg-light">
<nav class="navbar navbar-dark sticky-top navbar-expand-lg bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="employeeview.jsp">EMPLOYEE</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="employeeview.jsp">VIEW</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="employeeadd.jsp">ADD</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="employeeupdate.jsp">UPDATE</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid bg-light">
    <div class="row">
        <div class="col-12">
            <div class="row justify-content-center my-4">
                <div class="col-12 col-md-10 col-lg-8">
                    <form class="card card-sm" action="${pageContext.request.contextPath}/employee-view" method="get">
                        <div class="card-body row no-gutters align-items-center">
                            <div class="col-auto">
                                <i class="fas fa-search h4 text-body"></i>
                            </div>
                            <!--end of col-->
                            <div class="col">
                                <input class="form-control form-control-lg form-control-borderless" name="search"
                                       type="search"
                                       placeholder="Employee Name">
                            </div>
                            <!--end of col-->
                            <div class="col-auto">
                                <button class="btn btn-lg btn-success" type="submit">Search</button>
                            </div>
                            <!--end of col-->
                        </div>
                    </form>
                </div>
                <!--end of col-->
            </div>
        </div>
        <div class="col-12 mt-3">
            <button class="btn btn-primary my-2" type="button"><a class="text-decoration-none text-light" href="${pageContext.request.contextPath}/employee-view?search=default">Refresh Table</a></button>
            <%
                Employee employee = null;
                if(request.getAttribute("employee") != null){
                    System.out.println("Inside view employee object set -----");
                    employee = (Employee) request.getAttribute("employee");
                    System.out.println("View employee object set -----");
                }

                // If there is an employee object then display it
                if(employee != null ){
                    System.out.println("Employee object is not null -----");
                    out.print("<div class=\"table-responsive my-3\">");
                    out.print("<table class=\"table mx-auto caption-top\">");
                    out.print("<caption>List of Employees</caption>");
                    out.print("<thead class=\"table-light\">");
                    out.print("<tr>");
                    out.print("<th scope=\"col\">#</th>");
                    out.print("<th scope=\"col\">Firstname</th>");
                    out.print("<th scope=\"col\">Lastname</th>");
                    out.print("<th scope=\"col\">Address</th>");
                    out.print("<th scope=\"col\">Education</th>");
                    out.print("<th scope=\"col\">Gender</th>");
                    out.print("<th scope=\"col\">DOB</th>");
                    out.print("</tr>");
                    out.print("</thead>");
                    out.print("<tbody>");
                    out.print("<tr>");
                    out.println("<td>" + employee.getEmpID() + "</td>");
                    out.println("<td>" + employee.getEmpFirstName() + "</td>");
                    out.println("<td>" + employee.getEmpLastName() + "</td>");
                    out.println("<td>" + employee.getEmpAddress().getAddressNo() + "," + employee.getEmpAddress().getStreetNo() + "," + employee.getEmpAddress().getCity() + "," + employee.getEmpAddress().getCountry() + "</td>");
                    out.println("<td>" + employee.getEmpEducation() + "</td>");
                    out.println("<td>" + employee.getEmpGender() + "</td>");
                    out.println("<td>" + employee.getEmpBirthDay() + "</td>");
                    out.print("</tr>");
                    out.print("</tbody>");
                    out.print("</table>");
                }else if ((ArrayList<Employee>) request.getAttribute("employees") != null) { // If there is an employee list then display it after checking if a single employee object is not present
                    System.out.println("Employee list is not null -----");
                    out.print("<div class=\"table-responsive my-3\">");
                    out.print("<table class=\"table mx-auto caption-top\">");
                    out.print("<caption>List of Employees</caption>");
                    out.print("<thead class=\"table-light\">");
                    out.print("<tr>");
                    out.print("<th scope=\"col\">#</th>");
                    out.print("<th scope=\"col\">Firstname</th>");
                    out.print("<th scope=\"col\">Lastname</th>");
                    out.print("<th scope=\"col\">Address</th>");
                    out.print("<th scope=\"col\">Education</th>");
                    out.print("<th scope=\"col\">Gender</th>");
                    out.print("<th scope=\"col\">DOB</th>");
                    out.print("</tr>");
                    out.print("</thead>");
                    out.print("<tbody>");
                    for (Employee emp : (ArrayList<Employee>) request.getAttribute("employees")) {
                        out.print("<tr>");
                        out.println("<td>" + emp.getEmpID() + "</td>");
                        out.println("<td>" + emp.getEmpFirstName() + "</td>");
                        out.println("<td>" + emp.getEmpLastName() + "</td>");
                        out.println("<td>" + emp.getEmpAddress().getAddressNo() + "," + emp.getEmpAddress().getStreetNo() + "," + emp.getEmpAddress().getCity() + "," + emp.getEmpAddress().getCountry() + "</td>");
                        out.println("<td>" + emp.getEmpEducation() + "</td>");
                        out.println("<td>" + emp.getEmpGender() + "</td>");
                        out.println("<td>" + emp.getEmpBirthDay() + "</td>");
                        out.print("</tr>");

                    }
                    out.print("</tbody>");
                    out.print("</table>");
                } else {
                    System.out.println("Error message -----");
                    // If there is an error message from the servlet then display it
                    if(request.getParameter("error_msg") != null){
                        out.println("<div class=\"alert alert-danger my-3\" role=\"alert\">\n" +
                                "  " + request.getParameter("error_msg") + "\n" +
                                "</div>");
                    }else{ // If there is no error message from the servlet then display no results
                        System.out.println("No results to show -----");
                        out.println("<div class=\"alert alert-warning my-3\" role=\"alert\">\n" +
                                "  No results to show\n" +
                                "</div>");
                    }
                }
            %>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"
        integrity="sha512-WW8/jxkELe2CAiE4LvQfwm1rajOS8PHasCCx+knHG0gBHt8EXxS6T6tJRTGuDQVnluuAvMxWF4j8SNFDKceLFg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
