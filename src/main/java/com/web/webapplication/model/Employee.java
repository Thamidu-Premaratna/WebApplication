package com.web.webapplication.model;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.Date;

@XmlRootElement(name = "employee")
public class Employee {

    @XmlAttribute(name = "emp-id")
    private int empID;
    @XmlElement(name = "first-name")
    private String empFirstName;
    @XmlElement(name = "last-name")
    private String empLastName;
    @XmlElement(name = "gender")
    private String empGender;
    @XmlElement(name = "education")
    private String empEducation;
    @XmlElement(name = "address")
    private Address empAddress;
    @XmlElement(name = "birth-day")
    private Date empBirthDay;

    public Employee() {
        empAddress = new Address();
    }

    public int getEmpID() {
        return empID;
    }

    public void setEmpID(int empID) {
        if (empID > 0 ) {
//            JOptionPane.showMessageDialog(null, "Please enter a valid Employee ID", "Incorrect Entry", JOptionPane.WARNING_MESSAGE);
        } else {
            this.empID = empID;
        }
    }

    public String getEmpFirstName() {
        return empFirstName;
    }

    public void setEmpFirstName(String empFirstName) {
        if (empFirstName.isBlank() || empFirstName.length() <= 0 || empFirstName.length() > 10) {
//            JOptionPane.showMessageDialog(null, "Please enter a valid Employee Name", "Incorrect Entry", JOptionPane.WARNING_MESSAGE);
            System.out.println("Please enter a valid Employee Name");
        } else {
            this.empFirstName = empFirstName;
        }

    }

    public String getEmpLastName() {
        return empLastName;
    }

    public void setEmpLastName(String empLastName) {
        if (empLastName.isBlank() || empLastName.length() <= 0 || empLastName.length() > 10) {
//            JOptionPane.showMessageDialog(null, "Please enter a valid Employee Name", "Incorrect Entry", JOptionPane.WARNING_MESSAGE);
            System.out.println("Please enter a valid Employee Last Name");

        } else {
            this.empLastName = empLastName;
        }
    }

    public Address getEmpAddress() {
        return empAddress;
    }

    public void setEmpAddress(Address empAddress) {
        this.empAddress = empAddress;
    }

    public String getEmpGender() {
        return empGender;
    }

    public void setEmpGender(String empGender) {
        this.empGender = empGender;
    }

    public String getEmpEducation() {
        return empEducation;
    }

    public void setEmpEducation(String empEducation) {
        this.empEducation = empEducation;
    }

    public Date getEmpBirthDay() {
        return empBirthDay;
    }

    public void setEmpBirthDay(Date empBirthDay) {
        this.empBirthDay = empBirthDay;
    }
}
