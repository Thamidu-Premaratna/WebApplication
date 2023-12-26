package com.web.webapplication.servlet;

import com.web.webapplication.dao.EmployeeDao;
import com.web.webapplication.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.math.NumberUtils;

import javax.xml.bind.JAXBException;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Objects;

@WebServlet(name = "addEmployeeServlet", value = "/employee-add")

public class AddEmployeeServlet extends HttpServlet {
    private final long serialVersionUID = 1L;
    private Employee employee;

    public void init() {

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        // Storing the parameters as variables
        String empID = req.getParameter("empId");
        String empFirstName = req.getParameter("fname");
        String empLastName = req.getParameter("lname");
        String gender = req.getParameter("gender");
        String education = req.getParameter("education");
        String addressNo = req.getParameter("addressNo");
        String streetNo = req.getParameter("streetNo");
        String city = req.getParameter("city");
        String country = req.getParameter("country");
        String birthDay = req.getParameter("dob");

        // Validate the user inputs
        String error_msg = "";
        if (empID == null || empID.isEmpty()) {
            error_msg += "Employee ID is required<br>";
        }
        if(!NumberUtils.isParsable(empID)){
            error_msg += "Employee ID must be a number<br>";
        }else if (Integer.parseInt(empID)<=0){
            error_msg += "Employee ID must be greater than 0<br>";
        }
        if (empFirstName == null || empFirstName.isEmpty()) {
            error_msg += "First name is required<br>";
        }
        if (empLastName == null || empLastName.isEmpty()) {
            error_msg += "Last name is required<br>";
        }
        if(Objects.requireNonNull(empFirstName).length()<5 || Objects.requireNonNull(empLastName).length()<5){
            error_msg += "Names must be greater than 5 characters<br>";
        }
        if(Objects.requireNonNull(empFirstName).length()>50 || Objects.requireNonNull(empLastName).length()>50){
            error_msg += "Names must be less than 20 characters<br>";
        }
        if (gender.isEmpty()) {
            error_msg += "Gender is required<br>";
        }
        if (education.isEmpty()) {
            error_msg += "Education is required<br>";
        }
        if (addressNo == null || addressNo.isEmpty()) {
            error_msg += "Address No is required<br>";
        }
        if (streetNo == null || streetNo.isEmpty()) {
            error_msg += "Street No is required<br>";
        }
        if (city == null || city.isEmpty()) {
            error_msg += "City is required<br>";
        }
        if (country == null || country.isEmpty()) {
            error_msg += "Country is required<br>";
        }
        if (birthDay == null || birthDay.isEmpty()) {
            error_msg += "Date of birth is required<br>";
        }

        if (!error_msg.isEmpty()) { // If validation fails then move to employeeadd.jsp with the error message
            req.setAttribute("error_msg", error_msg);
            req.getRequestDispatcher("employeeadd.jsp").forward(req, resp);
        } else { // If validation is successful then add the employee

            //Creating a new Employee object
            Employee employee = new Employee();
            employee.setEmpID(Integer.parseInt(empID));
            employee.setEmpFirstName(empFirstName);
            employee.setEmpLastName(empLastName);
            try {
                employee.setEmpBirthDay(new SimpleDateFormat("yyyy-MM-dd").parse(birthDay));
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
            employee.setEmpGender(gender);
            employee.setEmpEducation(education);

            // Setting the address of the employee
            employee.getEmpAddress().setAddressNo(addressNo);
            employee.getEmpAddress().setStreetNo(streetNo);
            employee.getEmpAddress().setCity(city);
            employee.getEmpAddress().setCountry(country);

            // add employee data
            addEmployee(employee);

        }
    }

    private void addEmployee(Employee employee) {
        // Creating a new EmployeeDao object
        EmployeeDao employeeDao = new EmployeeDao(getServletContext().getRealPath("/"));
        try {
            employeeDao.addEmployee(employee);
        } catch (JAXBException e) {
            System.out.println("Error adding employee - jaxb");
            ;
        } catch (Exception e) {
            System.out.println("Error adding employee - other");
        }
    }

    public void destroy() {
    }
}
