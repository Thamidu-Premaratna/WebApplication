package com.web.webapplication.model;

import javax.swing.*;
import java.util.Date;

public class Employee {
    private String empID,empFirstName,empLastName,empGender,empEducation,empAddressNo,empStreetNo,empCity,empCountry;
    private Date empBirthDay;

    public String getEmpID() {
        return empID;
    }

    public void setEmpID(String empID) {
        if(empID.isBlank() || empID.length() <= 0 || empID.length() > 5){
            JOptionPane.showMessageDialog(null,"Please enter a valid Employee ID","Incorrect Entry",JOptionPane.WARNING_MESSAGE);
        }else{
            empID = "emp_"+empID;
            this.empID = empID;
        }
    }

    public String getEmpFirstName() {
        return empFirstName;
    }

    public void setEmpFirstName(String empFirstName) {
        if(empFirstName.isBlank() || empFirstName.length() <= 0 || empFirstName.length() > 10){
            JOptionPane.showMessageDialog(null,"Please enter a valid Employee Name","Incorrect Entry",JOptionPane.WARNING_MESSAGE);
        }else{
            this.empFirstName = empFirstName;
        }

    }

    public String getEmpLastName() {
        return empLastName;
    }

    public void setEmpLastName(String empLastName) {
        if(empLastName.isBlank() || empLastName.length() <= 0 || empLastName.length() > 10){
            JOptionPane.showMessageDialog(null,"Please enter a valid Employee Name","Incorrect Entry",JOptionPane.WARNING_MESSAGE);
        }else{
            this.empLastName = empLastName;
        }
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

    public String getEmpAddressNo() {
        return empAddressNo;
    }

    public void setEmpAddressNo(String empAddressNo) {
        this.empAddressNo = empAddressNo;
    }

    public String getEmpStreetNo() {
        return empStreetNo;
    }

    public void setEmpStreetNo(String empStreetNo) {
        this.empStreetNo = empStreetNo;
    }

    public String getEmpCity() {
        return empCity;
    }

    public void setEmpCity(String empCity) {
        this.empCity = empCity;
    }

    public String getEmpCountry() {
        return empCountry;
    }

    public void setEmpCountry(String empCountry) {
        this.empCountry = empCountry;
    }

    public Date getEmpBirthDay() {
        return empBirthDay;
    }

    public void setEmpBirthDay(Date empBirthDay) {
        this.empBirthDay = empBirthDay;
    }
}
