package com.web.webapplication.dao;

import com.web.webapplication.model.Employee;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import java.io.File;
import java.io.FileNotFoundException;

public class EmployeeDao {
    private String filePath;
    public EmployeeDao(String rootPath){
        // relative path of the xml file
        String relativePath = "xml/EmployeeXML/web-employee.xml";
        this.filePath = rootPath + relativePath;
    }

    //method to convert java -> xml
    public void convertObjectToXML() throws JAXBException, FileNotFoundException {
        // create JAXB context and instantiate marshaller
        JAXBContext context = JAXBContext.newInstance(Employee.class);
        Marshaller m = context.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);

        // Write to System.out
        Employee employee = new Employee();
        m.marshal(employee, System.out);
        System.out.println("Converting from Object to XML ----------------");
        // Write to File
        File file = new File(filePath);
        System.out.println("Saved!");
        System.out.println("Absolute Path: " + file.getAbsolutePath());
        m.marshal(employee,file);
        System.out.println("File created!");
    }

    //method to convert xml -> java
//    public boolean convertXMLtoObject() throws JAXBException, FileNotFoundException {
//        System.out.println("Converting from XML to Object -----------------");
//        JAXBContext context = JAXBContext.newInstance(Employee.class);
//        Unmarshaller um = context.createUnmarshaller();
//        Employee employeeUM = (Employee) um.unmarshal(new File(filePath));
//        System.out.println(employeeUM.getUsername()+" "+employeeUM.getPassword());
//        return employeeUM.validate();
//    }
}
