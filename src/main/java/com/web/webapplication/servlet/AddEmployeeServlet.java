package com.web.webapplication.servlet;

import com.web.webapplication.dao.EmployeeDao;
import com.web.webapplication.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "addEmployeeServlet", value = "/employee-add")

public class AddEmployeeServlet extends HttpServlet {
    private final long serialVersionUID = 1L;
    private Employee employee;
    public void init() {

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        System.out.println("Got data");
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

    private void addEmployee(Employee employee) {
        // Creating a new EmployeeDao object
        EmployeeDao employeeDao = new EmployeeDao(getServletContext().getRealPath("/"));
        try {
            employeeDao.addEmployee(employee);
        } catch (JAXBException e) {
            System.out.println("Error adding employee - jaxb");;
        }catch (Exception e){
            System.out.println("Error adding employee - other");
        }
    }
    public void destroy() {
    }
}
