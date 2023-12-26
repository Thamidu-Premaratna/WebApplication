package com.web.webapplication.model;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

//XML root element mapping
@XmlRootElement
public class Login {
    //    Private variables for the model
    private String username, password, role;

    public String getUsername() {
        return this.username;
    }

    @XmlElement
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    @XmlElement
    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    @XmlElement
    public void setRole(String role) {
        this.role = role;
    }

}
