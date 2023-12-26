package com.web.webapplication.model;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;
import java.util.Date;

// Specifying the order of the elements in the XML file
@XmlType(propOrder = {"empFirstName", "empLastName", "empGender", "empEducation", "empAddress", "empBirthDay"})
public class Employee {

    private int empID;
    private String empFirstName;
    private String empLastName;
    private String empGender;
    private String empEducation;
    private Address empAddress;
    private Date empBirthDay;

    public Employee() {
        empAddress = new Address();
    }

    @XmlAttribute(name = "emp-id")
    public int getEmpID() {
        return empID;
    }

    public void setEmpID(int empID) {
        this.empID = empID;
    }

    @XmlElement(name = "first-name")
    public String getEmpFirstName() {
        return empFirstName;
    }

    public void setEmpFirstName(String empFirstName) {
        this.empFirstName = empFirstName;
    }

    @XmlElement(name = "last-name")
    public String getEmpLastName() {
        return empLastName;
    }

    public void setEmpLastName(String empLastName) {
        this.empLastName = empLastName;
    }

    @XmlElement(name = "gender")
    public String getEmpGender() {
        return empGender;
    }

    public void setEmpGender(String empGender) {
        this.empGender = empGender;
    }
    @XmlElement(name = "address")
    public Address getEmpAddress() {
        return empAddress;
    }

    public void setEmpAddress(Address empAddress) {
        this.empAddress = empAddress;
    }
    @XmlElement(name = "education")
    public String getEmpEducation() {
        return empEducation;
    }

    public void setEmpEducation(String empEducation) {
        this.empEducation = empEducation;
    }
    @XmlElement(name = "birth-day")
    public Date getEmpBirthDay() {
        return empBirthDay;
    }

    public void setEmpBirthDay(Date empBirthDay) {
        this.empBirthDay = empBirthDay;
    }
}
