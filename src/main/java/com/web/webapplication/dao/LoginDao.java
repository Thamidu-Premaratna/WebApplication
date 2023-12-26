package com.web.webapplication.dao;

import com.web.webapplication.model.Login;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.File;
import java.io.FileNotFoundException;

public class LoginDao {
    private final String filePath; // File path of the xml file
    private final Login login; // Login object created from the entered username and password
    private Login loginUM; // Login object created from the xml file

    public LoginDao(String rootPath, Login login) {

        // relative path of the xml file
        String relativePath = "xml/LoginXML/web-login.xml";
        this.filePath = rootPath + relativePath;
        this.login = login;
    }

    // Get the role of the user if login successful
    public String getLogin() throws JAXBException {
        return convertXMLtoObject();
    }

    // Convert the saved user login data from XML -> java object
    private String convertXMLtoObject() throws JAXBException {
        JAXBContext context = JAXBContext.newInstance(Login.class);
        Unmarshaller um = context.createUnmarshaller();
        loginUM = (Login) um.unmarshal(new File(filePath));
        return validateLogin();
    }

    // validate the user login data with the saved user login data in xml file
    private String validateLogin() {
        if (loginUM.getUsername().equals(login.getUsername()) && loginUM.getPassword().equals(login.getPassword())) {
            System.out.println(loginUM.getUsername()+" "+loginUM.getPassword());
            System.out.println("ok");
            return "ok";
        } else {
            System.out.println("Please enter valid credentials");
            return "Please enter valid credentials";
        }
    }
}
