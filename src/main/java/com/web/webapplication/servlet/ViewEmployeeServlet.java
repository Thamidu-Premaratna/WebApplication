package com.web.webapplication.servlet;

import com.web.webapplication.dao.EmployeeDao;
import com.web.webapplication.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.xml.bind.JAXBException;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "viewEmployeeServlet", value = "/employee-view")
public class ViewEmployeeServlet extends HttpServlet {
    private final long serialVersionUID = 1L;
    private ArrayList<Employee> employees;
    private Employee employee;

    public void init() {

    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String searchInput = req.getParameter("search");
        EmployeeDao employeeDao = new EmployeeDao(getServletContext().getRealPath("/"));

        if (searchInput.equals("default")) {
            try {
                System.out.println("View Employee Servlet default ------");
                // Get all employees as an array list
                employees = employeeDao.getAllEmployees();
                System.out.println(employees.size());
                // Send the employee list to the view-employee.jsp
                req.setAttribute("employees", employees);
                req.getRequestDispatcher("employeeview.jsp").forward(req, resp);
                System.out.println("View Employee Servlet redirected ------");
            } catch (JAXBException | FileNotFoundException e) {
                e.printStackTrace();
            } catch (ServletException e) {
                e.printStackTrace();
            }
        } else if (!searchInput.isEmpty()) { // Search by employee ID
            try {

                // Check if search is a number or string
                if (searchInput.matches("[0-9]+")) {
                    // Search by employee ID
                    employee = employeeDao.getEmployeeById(Integer.parseInt(searchInput));
                } else {
                    // Search by employee name
                    employee = employeeDao.getEmployeeByName(searchInput);
                }
                if (employee != null) {
                    System.out.println("Employee found ------");
                    // Display the employee details
                    req.setAttribute("employee", employee);
                    req.getRequestDispatcher("employeeview.jsp").forward(req, resp);
                } else {
                    System.out.println("Employee not found ------");
                    // Display error message
                    req.setAttribute("error_msg", "Employee not found");
                    req.getRequestDispatcher("employeeview.jsp").forward(req, resp);
                    System.out.println("redirected ------");
                }
            } catch (JAXBException | FileNotFoundException e) {
                e.printStackTrace();
            }

        }

    }

    public void destroy() {
    }
}
