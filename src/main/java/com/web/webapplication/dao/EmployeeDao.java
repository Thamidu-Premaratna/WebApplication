package com.web.webapplication.dao;

import com.web.webapplication.model.Employee;
import com.web.webapplication.model.EmployeeCollection;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;

public class EmployeeDao {
    // File path of the web-employee.xml file
    private final String filePath;
    // Employee Collection from the XML file
    private EmployeeCollection employeesUM;
    // Employee object created from the entered employee details
    private Employee employee;
    // Employee object created from the XML file
    private Employee employeeUM;

    public EmployeeDao(String rootPath) {
        // relative path of the xml file
        String relativePath = "xml/EmployeeXML/web-employee.xml";
        this.filePath = rootPath + relativePath;
    }

    // Search employee by ID
    public Employee getEmployeeById(int empID) throws JAXBException, FileNotFoundException {
        // Convert XML to Object to get the Employee Collection
        convertXMLtoObject();
        // return the list of employees
        if (this.employeesUM != null) {
            for (Employee employee : this.employeesUM.getEmployees()) {
                if (employee.getEmpID() == empID) {
                    return employee;
                }
            }
        }
        return null;
    }

    // Search employee by name
    public Employee getEmployeeByName(String empFirstName) throws JAXBException, FileNotFoundException {
        // Convert XML to Object to get the Employee Collection
        convertXMLtoObject();
        // return the list of employees
        if (this.employeesUM != null) {
            for (Employee employee : this.employeesUM.getEmployees()) {
                if (employee.getEmpFirstName().equals(empFirstName)) {
                    return employee;
                }
            }
        }
        return null;
    }

    public void addEmployee(Employee employee) throws JAXBException, FileNotFoundException {
        this.employee = employee;
        // Get the Employee list from existing XML file
        if (checkIfXmlFileExists()) {
            // Add the new employee to the existing list of employees
            updateExistingXMLFile();
        } else { // web-employee.xml file doesn't exist, hence creating a new file and adding the data
            createNewXMLFile();
        }
    }

    public void removeEmployee(Employee employee) throws JAXBException, FileNotFoundException {
        int id = employee.getEmpID(); // Unique Id to identify the employee
        // Convert XML to Object to get the Employee Collection
        convertXMLtoObject();
        // Using iterator to remove the employee from the list
        if (this.employeesUM != null) {
            for (Employee employeeUM : this.employeesUM.getEmployees()) {
                if (employeeUM.getEmpID() == id) {
                    this.employeesUM.getEmployees().remove(employeeUM);
                    break;
                }
            }
        }
    }

    //Update employee list
    public void updateEmployee(Employee employee) throws JAXBException, FileNotFoundException {
        int id = employee.getEmpID(); // Unique Id to identify the employee
        // Convert XML to Object to get the Employee Collection
        convertXMLtoObject();
        // Using iterator to update the employee from the list
        if (this.employeesUM != null) {
            for (Employee employeeUM : this.employeesUM.getEmployees()) {
                if (employeeUM.getEmpID() == id) {
                    //update the employee fields with the new values
                    employeeUM.setEmpFirstName(employee.getEmpFirstName());
                    employeeUM.setEmpLastName(employee.getEmpLastName());
                    employeeUM.setEmpGender(employee.getEmpGender());
                    employeeUM.setEmpEducation(employee.getEmpEducation());
                    employeeUM.setEmpAddress(employee.getEmpAddress());
                    employeeUM.setEmpBirthDay(employee.getEmpBirthDay());
                    this.employee = employeeUM;
                    //remove the old employee object and add the updated employee object
                    this.employeesUM.getEmployees().remove(employeeUM);
                    updateExistingXMLFile();
                    break;
                }
            }
        }

    }

    public ArrayList<Employee> getAllEmployees() throws JAXBException, FileNotFoundException {
        // Convert XML to Object to get the Employee Collection
        convertXMLtoObject();
        // return the list of employees
        return (ArrayList<Employee>) this.employeesUM.getEmployees();

    }

    //Method to check if xml file is empty/exists
    public boolean checkIfXmlFileExists() throws JAXBException, FileNotFoundException {
        File xmlFile = new File(this.filePath);
        return xmlFile.exists();
    }

    //method to convert java -> xml
    public void createNewXMLFile() throws JAXBException, FileNotFoundException {
        // create JAXB context and instantiate marshaller
        JAXBContext context = JAXBContext.newInstance(EmployeeCollection.class);
        Marshaller m = context.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);

        // Create new EmployeeCollection object to make a list of employees since the xml file is empty
        EmployeeCollection employees = new EmployeeCollection();
        // Add the employee object to the list of employees
        employees.addEmployee(this.employee);

        // Write to File
        File file = new File(this.filePath);
        m.marshal(employees, file);
    }

    // Method overloading, to add new employee to the existing list of employees
    public void updateExistingXMLFile() throws JAXBException, FileNotFoundException {
        // Convert XML to Object to get the existing Employee Collection in XML file
        convertXMLtoObject();
        // create JAXB context and instantiate marshaller
        JAXBContext context = JAXBContext.newInstance(EmployeeCollection.class);
        Marshaller m = context.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);

        // retrieve the existing employee list and add the new employee to the list since the xml file is not empty
        if (this.employeesUM != null) {
            this.employeesUM.addEmployee(this.employee);
        } else {
            System.out.println("Employee list is empty");
        }

        // System out the entered employee details
//        m.marshal(employees, System.out);

        // Write to File
        File file = new File(this.filePath);
        m.marshal(this.employeesUM, file);
    }

    //method to convert xml -> java
    public void convertXMLtoObject() throws JAXBException, FileNotFoundException {
        JAXBContext context = JAXBContext.newInstance(EmployeeCollection.class);
        Unmarshaller um = context.createUnmarshaller();
        // Reading XML from the file and unmarshalling. Assigning the unmarshalled data to the employeesUM object
        this.employeesUM = (EmployeeCollection) um.unmarshal(new File(this.filePath));

    }
}
