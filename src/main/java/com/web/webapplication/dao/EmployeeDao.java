package com.web.webapplication.dao;

import com.web.webapplication.model.Employee;
import com.web.webapplication.model.EmployeeCollection;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import java.io.File;
import java.io.FileNotFoundException;

public class EmployeeDao {
    // Employee Collection from the XML file
    private EmployeeCollection employeesUM;

    // Employee object created from the entered employee details
    private Employee employee;

    // Employee object created from the XML file
    private Employee employeeUM;

    // File path of the web-employee.xml file
    private String filePath;

    public EmployeeDao(String rootPath) {
        // relative path of the xml file
        String relativePath = "xml/EmployeeXML/web-employee.xml";
        this.filePath = rootPath + relativePath;
    }

    public void addEmployee(Employee employee) throws JAXBException, FileNotFoundException {
        this.employee = employee;
        // Get the Employee list from existing XML file
        if (checkIfXmlFileExists()) {
            System.out.println("Updating the xml file ------");
        } else { // web-employee.xml file doesn't exist, hence creating a new file and adding the data
            createXmlNewFile();
        }
    }

    public void removeEmployee(Employee employee) throws JAXBException, FileNotFoundException {
        this.employee = employee;
    }

    //Update employee list
    public void updateEmployee(Employee employee) throws JAXBException, FileNotFoundException {
        this.employee = employee;
        convertXMLtoObject();
    }

    //Method to check if xml file is empty/exists
    public boolean checkIfXmlFileExists() throws JAXBException, FileNotFoundException {
        System.out.println("Checking if file exists ----------------");
        JAXBContext context = JAXBContext.newInstance(EmployeeCollection.class);
        Unmarshaller um = context.createUnmarshaller();
        employeesUM = (EmployeeCollection) um.unmarshal(new File(filePath));
        if (employeesUM.getEmployees().isEmpty()) {
            System.out.println("File is empty");
            return false;
        } else {
            System.out.println("File is not empty");
            return true;
        }
    }

    //Method to create new web-employee.xml file
    public void createXmlNewFile() throws JAXBException, FileNotFoundException {
        convertObjectToXML();
    }

    //method to convert java -> xml
    public void convertObjectToXML() throws JAXBException, FileNotFoundException {
        // create JAXB context and instantiate marshaller
        JAXBContext context = JAXBContext.newInstance(EmployeeCollection.class);
        Marshaller m = context.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);

        // Create new EmployeeCollection object to make a list of employees
        EmployeeCollection employees = new EmployeeCollection();
        // Add the employee object to the list of employees
        employees.addEmployee(employee);

        // System out the entered employee details
        m.marshal(employees, System.out);

        System.out.println("Converting from Object to XML ----------------");
        // Write to File
        File file = new File(filePath);
        System.out.println("Saved!");
        m.marshal(employee, file);
        System.out.println("Employee File created!");
    }

    //method to convert xml -> java
    public void convertXMLtoObject() throws JAXBException, FileNotFoundException {
        System.out.println("Converting from XML to Object -----------------");
        JAXBContext context = JAXBContext.newInstance(Employee.class);
        Unmarshaller um = context.createUnmarshaller();
        Employee employeeUM = (Employee) um.unmarshal(new File(filePath));
        System.out.println(employeeUM.getEmpID() + " : " + employeeUM.getEmpFirstName());
    }
}
